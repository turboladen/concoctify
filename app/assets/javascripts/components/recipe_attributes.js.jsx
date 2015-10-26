var RecipeAttributes = React.createClass({
    propTypes: {
        attributes: React.PropTypes.object,
        relationships: React.PropTypes.object
    },

    _ingredientCount: function(ingredients) {
        return (ingredients.data.length + ' Ingredient(s)');
    },

    render: function() {
        return (
            <dl class="dl-horizontal six columns">
                  <dt><strong>Concoction Type</strong></dt>
                  <dd>{ this.props.attributes.concoction_type }</dd>

                  <dt><strong>Description</strong></dt>
                  <dd>{ this.props.attributes.description }</dd>

                  <dt>
                      <strong>{ this._ingredientCount(this.props.relationships.ingredients) }</strong>
                  </dt>
                  <dd>
                      <ol>
                          { this.props.relationships.ingredients.data.map(function(ingredientData) {
                              return <ListItemWrapper key={ ingredientData.ingredient.id } text={ ingredientData.ingredient.name } />
                          })}
                      </ol>
                  </dd>

                  <dt><strong>Yield</strong></dt>
                  <dd>{ this.props.attributes.yields } { this.props.attributes.yields_unit }</dd>

                  <dt><strong>Directions</strong></dt>
                  <dd>{ this.props.attributes.directions }</dd>
            </dl>
        );
    }
});
