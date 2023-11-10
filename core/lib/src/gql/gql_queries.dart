part of core;

class GqlQuery {
  String charactersQuery = '''
  query (\$page: Int!){
    characters(page: \$page){
      results{
        id
        name
      }
    }
  }
  ''';

  String singleCharacterQuery = '''
  query (\$id: ID!){
    character(id: \$id){
      name
      image
      species
      gender
      status
    }   
  }
  ''';
}
