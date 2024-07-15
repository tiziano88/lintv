<script>
	import { asString, getField, getNode, hexDigest } from './lint';
	export let digest = '';
</script>

{#await getNode(digest)}
	<p>loading...</p>
{:then node}
	{#await asString(node) then value}
		<p>{value}</p>
	{:catch error}
		<p style="color: red">{error.message}</p>
	{/await}
{:catch error}
	<p style="color: red">{error.message}</p>
{/await}
