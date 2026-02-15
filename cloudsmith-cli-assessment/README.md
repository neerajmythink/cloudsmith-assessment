# Steps to install and run the Cloudsmith CLI

1. Install the Cloudsmith CLI using pip:
   ```
   pip install cloudsmith-cli
   ```
2. Verify the installation by running:

   ```cloudsmith --version

   ```

3. Log in to your Cloudsmith account (SAML) using the CLI:
   ```
   cloudsmith auth
   ```
4. Follow the prompts to complete the authentication process using your SAML credentials. This may involve opening a browser window to authenticate with your identity provider.
5. Once authenticated, you can start using the Cloudsmith CLI to manage your repositories, packages, and more. For example, to list your repositories:
   ```
   cloudsmith list repos
   ```
