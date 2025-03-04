from fastapi import FastAPI, HTTPException
import smtplib
import os
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from pydantic import BaseModel

app = FastAPI()

class EmailRequest(BaseModel):
    recipient: str
    subject: str
    message: str

SMTP_SERVER = "smtp.gmail.com"
SMTP_PORT = 587
SMTP_USERNAME = os.getenv("SMTP_USERNAME")
SMTP_PASSWORD = os.getenv("SMTP_PASSWORD")

@app.post("/send-email")
def send_email(request: EmailRequest):
    try:
        # Tworzenie wiadomości e-mail
        msg = MIMEMultipart()
        msg["From"] = SMTP_USERNAME
        msg["To"] = request.recipient
        msg["Subject"] = request.subject
        msg.attach(MIMEText(request.message, "plain"))

        # Wysyłanie wiadomości przez SMTP
        with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
            server.starttls()
            server.login(SMTP_USERNAME, SMTP_PASSWORD)
            server.sendmail(SMTP_USERNAME, request.recipient, msg.as_string())

        return {"message": "Email sent successfully"}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
