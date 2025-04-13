<script lang="ts">
	import '../app.css';
	import Navigation from '$lib/components/Navigation.svelte';
	import Footer from '$lib/components/Footer.svelte';
</script>

<Navigation />

<main>
	<slot />
</main>

<Footer />

<style>
	main {
		max-width: 1200px;
		margin: 0 auto;
		padding: var(--spacing-large) var(--spacing-medium);
		min-height: calc(100vh - 300px); /* Ensure footer stays at bottom */
	}
</style>
