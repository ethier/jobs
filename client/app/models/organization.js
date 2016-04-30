import Model from 'ember-data/model';
import attr from 'ember-data/attr';

export default Model.extend({
  legalName: attr('string'),
  alternateName: attr('string'),
  slug: attr('string')
});
