from flask import Flask, jsonify, request
import requests
from bs4 import BeautifulSoup
from langchain_community.document_loaders import PyPDFLoader
from langchain_openai import OpenAIEmbeddings
from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import Chroma
from langchain.chains import RetrievalQA
from langchain_openai import ChatOpenAI
import json


app = Flask(__name__)


@app.route("/generate-onboarding", methods=["POST"])
def add_book():
    parameters = request.json
    companyResources = parameters["companyResources"]
    employeeResources = parameters["employeeResources"]
    requirements = parameters["requirements"]

    openai_api_key = "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"

    extracted_content = []

    urls = companyResources + employeeResources

    # urls = [
    #     "https://www.uni-mannheim.de/en/about/working-at-the-university-of-mannheim/infos-fuer-neue-mitarbeitende/",
    #     "https://www.uni-mannheim.de/en/campus/mannheim/",
    #     "https://www.uni-mannheim.de/en/about/map-and-directions/",
    #     "https://www.uni-mannheim.de/en/about/profile/",
    #     "https://www.uni-mannheim.de/en/gender-equality-and-equal-opportunity/equal-opportunity-commissioners/department-of-equal-opportunity-and-social-diversity/",
    #     "https://www.uni-mannheim.de/en/representative-for-employees-with-a-disability/",
    #     "https://www.uni-mannheim.de/en/gender-equality-and-equal-opportunity/equal-opportunity-commissioners/equal-opportunity-commissioner/",
    #     "https://www.uni-mannheim.de/en/about/working-at-the-university-of-mannheim/workplace-health-promotion/",
    #     "https://www.uni-mannheim.de/en/campus/music-theater-and-art/",
    #     "https://www.uni-mannheim.de/en/about/working-at-the-university-of-mannheim/continuing-education-and-training/",
    #     "https://www.uni-mannheim.de/en/about/working-at-the-university-of-mannheim/benefits/",
    # ]

    for url in urls:
        # Step 1: Fetch HTML Content
        response = requests.get(url)
        html_content = response.text

        # Step 2: Parse HTML Content
        soup = BeautifulSoup(html_content, "html.parser")

        # Step 3: Extract Content from <div id="page-content">
        page_content_div = soup.find("div", id="page-content")

        if page_content_div:
            # Extract the text from inside the div
            content_inside_div = page_content_div.get_text()
            extracted_content.append(content_inside_div)
        # else:
        #     extracted_content.append("Div with id 'page-content' not found.")

    directory = "../documents/job_post.pdf"

    loader = PyPDFLoader(directory)
    pdf_data = loader.load()

    pdf_text = []
    for text in pdf_data:
        pdf_text.append(text.page_content)

    cleaned_pdfs = []
    for text in pdf_text:
        cleaned_pdf = (
            text.replace("\n", "")
            .replace("\t", "")
            .replace("\xa0", "")
            .replace("\xad", "")
        )
        cleaned_pdfs.append(cleaned_pdf)

    cleaned_texts = []
    for text in extracted_content:
        cleaned_text = (
            text.replace("\n", "")
            .replace("\t", "")
            .replace("\xa0", "")
            .replace("\xad", "")
        )
        cleaned_texts.append(cleaned_text)

    cleaned_texts.append(cleaned_pdfs[0])

    splitter = RecursiveCharacterTextSplitter(
        chunk_size=200, chunk_overlap=50, separators=["."]
    )

    docs = []
    for text in cleaned_texts:
        doc = splitter.split_text(text)
        docs.append(doc)

    all_docs = sum(docs, [])

    # Embed the documents and store them in a Chroma DB
    embedding_model = OpenAIEmbeddings(openai_api_key=openai_api_key)
    docstorage = Chroma.from_texts(all_docs, embedding_model)

    qa = RetrievalQA.from_chain_type(
        ChatOpenAI(
            model_name="gpt-3.5-turbo-16k",
            temperature=0,
            openai_api_key=openai_api_key,
        ),
        chain_type="stuff",
        retriever=docstorage.as_retriever(),
    )

    employee_name = "Peter"
    position = "Data Scientist"
    department = "Data Science department"

    query = f"""Generate personalized onboarding material for {employee_name}, who is starting as a {position} in the {department}. 
    Return the result in form of a JSON file. The structure of the JSON file should follow multiple steps of the following format. Please include valid links from the to useful resources for every step: 
    "step": "1",
    "title": "",
    "description": "",
    "links": [""],
    "tasks": [
    "",
    "",
    ]
    Here are some additional requirements: {requirements}
    """

    output = qa.run(query)

    # Remove newline characters
    json_string = output.replace("\n", "")

    # Now you can parse the JSON string
    json_data = json.loads(json_string)

    return json_data, 201


if __name__ == "__main__":
    app.run(debug=True)
