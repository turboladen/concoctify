var Recipe = React.createClass({
    render: function() {
        var { created_at, updated_at, title, ...otherAttribs } = this.props.attributes;
        return (
            <div class="row">
                <RecipeTitle title={ title } />

                <RecipeUserstamps
                    createdAt={ created_at }
                    updatedAt={ updated_at }
                />

                <RecipeAttributes
                    attributes={ otherAttribs }
                    relationships={ this.props.relationships }
                />
            </div>
        );
    }
});
