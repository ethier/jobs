import Model from 'ember-data/model';
import attr from 'ember-data/attr';

export default Model.extend({
  email: attr('string'),
  username: attr('string'),
  password: attr('string'),
  given_name: attr('string'),
  family_name: attr('string'),
  alternate_name: attr('string')
});
