import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model() {
    return this.store.findAll('user');
  },
  actions: {
    deleteUser(user) {
      const username = user.get('username');
      if (confirm(`This will delete ${username}! Do you want to proceed?`)) {
        user.destroyRecord();
      }
    }
  }
});
