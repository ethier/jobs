import Model from 'ember-data/model';
import attr from 'ember-data/attr';
import DS from 'ember-data';

export default Model.extend({
  title: attr('string'),
  shortDescription: attr('text'),
  description: attr('text'),
  startsAt: attr('datetime'),
  endsAt: attr('datetime'),
  slug: attr('string'),
  user: DS.belongsTo('user', { async: true }),
  organization: DS.belongsTo('organization', { async: true })
});
