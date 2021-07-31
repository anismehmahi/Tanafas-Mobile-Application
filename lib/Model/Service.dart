class Service{
  String nom;
  String prix;
  Service({String nom , String prix}){
    this.nom=nom;
    this.prix=prix;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => nom.hashCode;

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    Service o =other as Service;
    return this.nom==o.nom;
  }
}