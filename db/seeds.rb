# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.create!([
  {
    url: 'http://www.resultados.gob.ar/bltgetelegr/01/001/0001/010010001_0001.htm',
    code: '4f06b25303a3099a32e473f149de5f13'
  },
  {
    url: 'http://www.resultados.gob.ar/bltgetelegr/01/001/0001/010010001_0002.htm',
    code: '2cbef42e707fec877093013c3d79b3b4'
  },
  {
    url: 'http://www.resultados.gob.ar/bltgetelegr/01/001/0001/010010001_0003.htm',
    code: '454aef1f2161124e8d51a87efab70384'
  }
])
