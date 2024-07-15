<script>
	import { asString, getField, getNode, hexDigest } from './lint';
	import String from './String.svelte';
	import User from './User.svelte';
	export let digest = '';
</script>

{#await getNode(digest)}
	<p>loading...</p>
{:then node}
	<div>
		<String digest={hexDigest(getField(node, 0)[0])} />
	</div>
{:catch error}
	<p style="color: red">{error.message}</p>
{/await}
