<script lang="ts">
  const currentYear = new Date().getFullYear();
</script>

<footer>
  <div class="container">
    <div class="footer-content">
      <div class="footer-section">
        <h3>Hack4Her</h3>
        <p>Empowering women and non-binary individuals in technology through hackathons and workshops.</p>
      </div>
      
      <div class="footer-section">
        <h3>Links</h3>
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/about">About Us</a></li>
          <li><a href="/information">Information</a></li>
          <li><a href="/registration">Registration</a></li>
        </ul>
      </div>
      
      <div class="footer-section">
        <h3>Connect</h3>
        <ul>
          <li><a href="https://github.com" target="_blank" rel="noopener noreferrer">GitHub</a></li>
          <li><a href="https://twitter.com" target="_blank" rel="noopener noreferrer">Twitter</a></li>
          <li><a href="https://linkedin.com" target="_blank" rel="noopener noreferrer">LinkedIn</a></li>
          <li><a href="mailto:info@hack4her.com">Email Us</a></li>
        </ul>
      </div>
    </div>
    
    <div class="footer-bottom">
      <p>&copy; {currentYear} Hack4Her. All rights reserved.</p>
    </div>
  </div>
</footer>

<style>
  footer {
    background-color: var(--color-surface);
    border-top: 1px solid rgba(0, 0, 0, 0.1);
    padding: var(--spacing-large) 0;
    margin-top: var(--spacing-large);
  }
  
  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 var(--spacing-medium);
  }
  
  .footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: var(--spacing-large);
    margin-bottom: var(--spacing-large);
  }
  
  .footer-section h3 {
    color: var(--color-primary);
    margin-bottom: var(--spacing-medium);
    font-size: 1.2rem;
  }
  
  .footer-section p {
    margin-bottom: var(--spacing-medium);
    line-height: 1.6;
  }
  
  .footer-section ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }
  
  .footer-section ul li {
    margin-bottom: var(--spacing-small);
  }
  
  .footer-section ul li a {
    text-decoration: none;
    color: var(--color-text);
    transition: color 0.2s;
  }
  
  .footer-section ul li a:hover {
    color: var(--color-primary);
  }
  
  .footer-bottom {
    text-align: center;
    padding-top: var(--spacing-medium);
    border-top: 1px solid rgba(0, 0, 0, 0.1);
  }
  
  .footer-bottom p {
    margin: 0;
    font-size: 0.9rem;
  }
  
  /* Dark mode adjustment */
  :global(body.dark-mode) footer {
    border-top-color: rgba(255, 255, 255, 0.1);
  }
  
  :global(body.dark-mode) .footer-bottom {
    border-top-color: rgba(255, 255, 255, 0.1);
  }
</style> 