BackboneTwitterBootstrap.Views.Common ||= {}

class BackboneTwitterBootstrap.Views.Common.ErrorView extends Backbone.View

  cleanErrors: ->
    @form.find(".error").removeClass("error")
    @form.find(".help-block").remove()


  markErrorField: (name, error) ->
    field = @form.find(":input[name=" + name + "]")
    field.parent().append("<div class='help-block'>" + error + "</div>")
    field.parent().parent().addClass("error")

  renderErrors: ->
    @errors = @model.get('errors')
    @form = this.$el.find("form")
    @cleanErrors()
    if @errors?
      if @errors.error?
        $(JST["backbone/templates/common/error"](@errors)).insertBefore(@form)
      @markErrorField(name, error) for name, error of @errors
    return this
