# # In this file we define the methods to help filter out candidates
# # This way, we keep these methods separated from other potential parts of the program
# require './candidates'

def find(id)
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end
  return nil
end
  
def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    return true
  else
    return false
  end
end

# Function to check if user has 100 or more github points
def hundo_github(candidate)
  return candidate[:github_points] >= 100
end

def knows_python_ruby(candidate)
  return candidate[:languages].include?('Python') || candidate[:languages].include?('Ruby')
end

def recent_applicant(candidate)
  return candidate[:date_applied] >= 15.days.ago.to_date
end

def is_adult(candidate)
  return candidate[:age] > 17
end

def qualified_candidates(candidates)
  qualified_candidates_list = []
  candidates.each do |candidate|
    if experienced?(candidate) && hundo_github(candidate) && knows_python_ruby(candidate) && recent_applicant(candidate) && is_adult(candidate)
      qualified_candidates_list << candidate
    end
  end
  return qualified_candidates_list
end

# # More methods will go below

def ordered_by_qualifications(candidates)
  candidates.select { |candidate| experienced?(candidate) && hundo_github(candidate) && knows_python_ruby(candidate) && recent_applicant(candidate) && is_adult(candidate) }
  .sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
end