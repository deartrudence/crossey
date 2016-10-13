json.extract! question, :id, :subsection, :job_type, :question_text, :question_type, :section_id, :created_at, :updated_at
json.url question_url(question, format: :json)