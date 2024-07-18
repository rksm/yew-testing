use yew::prelude::*;

#[function_component(App)]
pub fn app() -> Html {
    html! {
        <main>
            <img class="logo" src="https://yew.rs/img/logo.png" alt="Yew logo" />
            <h1>{ "Foo bar xxx?" }</h1>
            <span class="subtitle">{ "from Yew with " }<i class="heart" /></span>
            <button onclick={Callback::from(|_| println!("hello"))}>
            { "Click me!" }
            </button>
        </main>
    }
}
