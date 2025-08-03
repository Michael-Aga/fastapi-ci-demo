# ---- Base image ----
FROM python:3.12-slim

# ---- Set work-dir inside the container ----
WORKDIR /app

# ---- Install deps early (better cache) ----
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- Copy the rest of the source code ----
COPY . .

# ---- Expose & launch ----
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
