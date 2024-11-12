import os
import openai
openai.organization = "org-v0R8UPHMxTDWzwpbMPJWTsXh"
openai.api_key = os.getenv("OPENAI_API_KEY")
openai.Model.list()
