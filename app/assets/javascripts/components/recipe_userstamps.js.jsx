var RecipeUserstamps = React.createClass({
    propTypes: {
        created_at: React.PropTypes.string,
        updated_at: React.PropTypes.string
    },

    render: function() {
        return (
            <p>
                { 'Created at: ' }<time>{ this.props.createdAt }</time>
                <br />
                { 'Updated at: ' }<time>{ this.props.updatedAt }</time>
            </p>
        );
    }
});
