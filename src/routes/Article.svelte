<script>
	import { getField, getNode, hexDigest } from './lint';
	import User from './User.svelte';
	export let digest = '';
</script>

<div>ARTICLE</div>

<button class="btn">Button</button>

{#await getNode(digest)}
	<p>loading...</p>
{:then node}
	<h1>Article title</h1>
	Authors
	<ul class="list-disc">
		{#each getField(node, 2) as item}
			<li>
				<User digest={hexDigest(item)} />
			</li>
		{/each}
	</ul>
{:catch error}
	<p style="color: red">{error.message}</p>
{/await}
