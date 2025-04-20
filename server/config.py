# cd server 
# pip install python-dotenv

from dotenv import load_dotenv
from pydantic_settings import BaseSettings
 
load_dotenv()      # loaded the .env file using the python .env file

class Settings(BaseSettings):
    TAVILY_API_KEY : str = ""     # pull and store the api key

# Sentence Transformers compatibility versions 
# sentence-transformers : 2.2.2
# transformers : 4.28.0
# huggingface_hub : 0.14.0
    GEMINI_API_KEY : str = ""

    PIXABAY_API_KEY : str = ""

