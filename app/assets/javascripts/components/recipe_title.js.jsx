var RecipeTitle = React.createClass({
    propTypes: {
        title: React.PropTypes.string
    },

    render: function() {
        return (
            <h1>{ this.props.title }</h1>
        );
    }
});
