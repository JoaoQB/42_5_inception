async function fetchGithubProfile() {
	const url = "https://api.github.com/users/${GITHUB_USERNAME}"
	try {
		const profileResponse = await fetch(url);
		if (!profileResponse.ok) {
			throw new Error(`Response Status: ${profileResponse.status}`);
		}
		console.log(profileResponse);

		const profileResult = await profileResponse.json();
		console.log(profileResult);
	} catch (error) {
		console.error(error.message);
	}
}
