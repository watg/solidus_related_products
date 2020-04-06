class RelatedToAutocomplete
  constructor: (@relationTypeSelector, @relatedToSelector) ->
    @initializeSelect(@relationTypeSelector)
    @setupListeners()

  setupListeners: ->
    $(document).on 'change', @relationTypeSelector, (event) =>
      @initializeSelect(event.target)

  initializeSelect: (target) ->
    @selectedType = $(target).find(":selected").data("relationType");
    if @selectedType == 'Spree::Variant'
      @initializeVariantSelect()
    else if @selectedType == 'Spree::Product'
      @initializeProductSelect()
    $(@relatedToSelector).css('display', 'block')

  initializeProductSelect: ->
    $(@relatedToSelector).productAutocomplete({ multiple: false });

  initializeVariantSelect: ->
    $(@relatedToSelector).variantAutocomplete();

Spree.ready ($) ->
  relationTypeSelector = '.relation_type'
  relatedToSelector = '.related_to_autocomplete'

  if $(relationTypeSelector).is('*')
    new RelatedToAutocomplete(relationTypeSelector, relatedToSelector)
