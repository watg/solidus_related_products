class CreateRelation
  constructor: (@addRelationSelector) ->
    @relatedToInputSelector = '#add_related_to_name'
    @relationTypeInputSelector = '#add_type'
    @discountInputSelector = '#add_discount'

    @setupListeners()

  setupListeners: ->
    $(document).on 'click', @addRelationSelector, (event) =>
      event.preventDefault()
      @sendCreateAction(event.target)

  sendCreateAction: (target) ->
    if $(@relatedToInputSelector).val()
      update_target = $(target).data('update');
      $.ajax({
        dataType: 'script',
        url: $(target).attr('href'),
        type: 'POST',
        data: {
          'relation[related_to_id]': $(@relatedToInputSelector).val(),
          'relation[relation_type_id]': $(@relationTypeInputSelector).val(),
          'relation[discount_amount]' : $(@discountInputSelector).val()
        }
      })

Spree.ready ($) ->
  addRelationSelector = '#add_related_product'

  if $(addRelationSelector).is('*')
    new CreateRelation(addRelationSelector)
