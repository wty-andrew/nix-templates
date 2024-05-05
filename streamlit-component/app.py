import streamlit as st

from st_component import my_component

# Create a second instance of our component whose `name` arg will vary
# based on a text_input widget.
#
# We use the special "key" argument to assign a fixed identity to this
# component instance. By default, when a component's arguments change,
# it is considered a new instance and will be re-mounted on the frontend
# and lose its current state. In this case, we want to vary the component's
# "name" argument without having it get recreated.
name_input = st.text_input("Enter a name", value="Streamlit")
num_clicks = my_component(name_input, key="foo")
st.markdown("You've clicked %s times!" % int(num_clicks))
