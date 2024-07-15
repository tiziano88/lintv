const baseUrl = 'https://api.static.space';
export async function getNode(digest: string): Promise<Node> {
	const local = window.localStorage.getItem(digest);
	if (local) {
		return JSON.parse(local);
	}
	const response = await fetch(`${baseUrl}/v1/raw/${digest}`);
	console.log(response);
	const data = await response.json();
	console.log(data);
	window.localStorage.setItem(digest, JSON.stringify(data));
	return data;
}

interface Digest {
	sha2_256: Array<number>;
}

interface Object {
	fields: { [key: number]: Array<Digest> };
}

interface Node {
	value: {
		String: string;
		Object: Object;
	};
}

export function getField(node: Node, field: number): Array<Digest> {
	return node.value.Object.fields[field] || [];
}

export function hexDigest(digest: Digest): string {
	const bytes: Array<number> = digest.sha2_256;
	const hex = bytes.map((b) => b.toString(16).padStart(2, '0')).join('');
	return `sha2-256:${hex}`;
}

export function asString(node: Node): string {
	return node.value.String;
}

export function asObject(node: Node): Object {
	return node.value.Object;
}
