from langchain.llms import OpenAI
import dotenv

dotenv.load_dotenv()

llm = OpenAI()
result = llm("What is devops?")
print(result)
