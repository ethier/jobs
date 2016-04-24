import Ember from 'ember';

export default Ember.Controller.extend({
  errorMessage: '',
  actions: {
    saveUser: function(model) {
      model.save().then(() => {
        this.transitionToRoute('users');
      }).catch((reason) => {
        this.set('errorMessage', reason.error || reason);
      });
    }
  }
});
