part of data;

class SingleLocationModel extends domain.SingleLocationEntity {
  const SingleLocationModel({
    required final String name,
    required final String id,
  }) : super(name: name, id: id);

  factory SingleLocationModel.fromMap({required map}) => SingleLocationModel(
        name: map['name'],
        id: map['id'],
      );
}
