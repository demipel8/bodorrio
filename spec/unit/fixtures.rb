# frozen_string_literal: true

module FIXTURES
  def lunch_list
    JSON.parse(lunch_list_json, symbolize_names: true)
  end

  def party_list
    JSON.parse(party_list_json, symbolize_names: true)
  end

  def lunch_list_json
    <<-JSON
    [
      {
        "id": "5a8c43dec68829d07g6ea6e",
        "checkItems": [
          {
            "idChecklist": "5ad4bd5dec63729d0736e16e",
            "id": "5a8c90000068829d1956ea6f",
            "name": "a_familiar"
          },
          {
            "idChecklist": "5ad6bd5dec73729d07361234",
            "id": "5a8c9d5dt5b8g29d07364321",
            "name": "another_familiar"
          }
        ]
      },
      {
        "id": "45679d77f1275cdaf15y5672",
        "checkItems": [
          {
            "idChecklist": "d3f40d77f1275cdaf3815472",
            "id": "7e8c9d7ght575cdafgdj54rt",
            "name": "a_familiar_from_another_list"
          }
        ]
      }
    ]
    JSON
  end

  def party_list_json
    <<-JSON
    [
      {
        "id": "5a8c43dec68829d07g6ea6e",
        "checkItems": [
          {
            "idChecklist": "5ad4bd5dec63729d0736e16e",
            "id": "5a8c90000068829d1956ea6f",
            "name": "a_friend"
          },
          {
            "idChecklist": "5ad6bd5dec73729d07361234",
            "id": "5a8c9d5dt5b8g29d07364321",
            "name": "another_friend"
          }
        ]
      }
    ]
    JSON
  end

  module_function :lunch_list, :party_list, :lunch_list_json, :party_list_json
end
