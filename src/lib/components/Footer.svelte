<script lang="ts">
  const currentYear = new Date().getFullYear();
  
  const sponsors = {
    platinum: [
      { name: 'ServiceNow', logo: '/images/sponsors/Servicenow.jpg', url: 'https://www.servicenow.com/' },
      { name: 'Randstad Digital', logo: '/images/sponsors/randstad.png', url:'https://www.randstaddigital.nl/nl/'},
      { name: 'VU CS Department', logo: '/images/sponsors/VU.png', url: 'https://vu.nl/en/about-vu/faculties/faculty-of-science/departments/computer-science' }
    ],
    gold: [
      { name: 'DuckDB', logo: '/images/sponsors/duckdb.svg', url: 'https://duckdb.org/' },
      { name: 'Network Institute', logo: '/images/sponsors/Network_institute.png', url: 'https://networkinstitute.org/' },
      { name: 'Postcode Loterij', logo: '/images/sponsors/postcode_loterij.png', url: 'https://www.postcodeloterij.nl/' },
      { name: 'Tilburg university', logo: '/images/sponsors/tilburg.png', url: 'https://www.tilburguniversity.edu/' }
    ]  
  }
  
  const partners = [];
</script>

<footer class="gradient-background">
  <div class="container">
    <!-- Company Section -->
    <!--
    <div class="footer-section-title">Company</div>
    <div class="footer-links">
      <a href="/about">About Us</a>
      <a href="/contact">Contact</a>
      <a href="/privacy">Privacy Policy</a>
    </div>
    -->
    
    <!-- Connect Section -->
    <div class="footer-section-title">Connect with us</div>
    <div class="footer-links">
      <a href="mailto:info.hack4her@gmail.com">Email Us</a>
      <a href="https://www.linkedin.com/company/hack4her/" target="_blank" rel="noopener noreferrer">LinkedIn</a>
      <a href="https://www.instagram.com/hack4herofficial/" target="_blank" rel="noopener noreferrer">Instagram</a>
      
      <!--
      <a href="#" target="_blank" rel="noopener noreferrer">Facebook</a>
      <a href="#" target="_blank" rel="noopener noreferrer">Twitter</a>
      <a href="#" target="_blank" rel="noopener noreferrer">GitHub</a>
      -->
    </div>
    
    <!-- Community Section -->
    <!--
    <div class="footer-section-title">Join the Community</div>
    <div class="footer-links">
      <a href="#">Newsletter</a>
      <a href="#">Discord</a>
    </div>
    -->
    
    <!-- Sponsors Section -->
    <div class="footer-section-title">Sponsors</div>
    <div class="sponsors-container">
      <!-- Platinum sponsors (top row, larger) -->
      <div class="logo-grid platinum-grid">
        {#each sponsors.platinum as sponsor}
          <div class="logo-card platinum-card">
            <a href={sponsor.url} target="_blank" rel="noopener noreferrer">
              <img src={sponsor.logo} alt="{sponsor.name} logo" />
            </a>
          </div>
        {/each}
      </div>
      
      <!-- Gold sponsors (bottom row, smaller) -->
      <div class="logo-grid gold-grid">
        {#each sponsors.gold as sponsor}
          <div class="logo-card gold-card">
            <a href={sponsor.url} target="_blank" rel="noopener noreferrer">
              <img src={sponsor.logo} alt="{sponsor.name} logo" />
            </a>
          </div>
        {/each}
      </div>
    </div>
    
    <!-- Partners Section - only show if there are partners -->
    {#if partners.length > 0}
    <div class="footer-section-title">Partners</div>
    <div class="partners-container">
      <div class="logo-grid partners-grid">
        {#each partners as partner}
          <div class="logo-card partner-card">
            <img src={partner.logo} alt="{partner.name} logo" />
          </div>
        {/each}
      </div>
    </div>
    {/if}
    
    <!-- Copyright -->
    <div class="footer-bottom">
      <p>Made with love by Hack4Her Team</p>
    </div>
  </div>
</footer>

<style>
  footer {
    color: white;
    padding: var(--spacing-large) 0;
    text-align: center;
  }
  
  .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 var(--spacing-medium);
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  
  .footer-section-title {
    font-size: 1.5rem;
    font-weight: bold;
    margin: 2rem 0 1rem;
  }
  
  .footer-links {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 2rem;
    margin-bottom: 1rem;
  }
  
  .footer-links a {
    color: white;
    text-decoration: none;
    transition: opacity 0.2s;
  }
  
  .footer-links a:hover {
    opacity: 0.8;
  }
  
  /* Logo grids and cards for sponsors/partners */
  .sponsors-container, .partners-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 2rem;
  }
  
  .logo-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 1rem;
    margin: 0.5rem 0;
    max-width: 800px;
  }
  
  .platinum-grid {
    margin-bottom: 1.5rem;
  }
  
  .partners-grid {
    margin-bottom: 1rem;
  }
  
  .logo-card {
    background-color: white;
    border-radius: 8px;
    padding: 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    position: relative;
  }
  
  .platinum-card {
    width: 220px;
    height: 130px;
  }
  
  .gold-card {
    width: 160px;
    height: 100px;
  }
  
  .partner-card {
    width: 180px;
    height: 110px;
  }
  
  .logo-card img {
    max-width: 90%;
    max-height: 90%;
    object-fit: contain;
    display: block;
    margin: 0 auto;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  
  .footer-bottom {
    margin-top: 2rem;
  }
  
  .footer-bottom p {
    margin: 0;
    font-size: 1rem;
  }
  
  @media (max-width: 768px) {
    .footer-links {
      gap: 1.5rem;
    }
    
    .platinum-card {
      width: 180px;
      height: 110px;
    }
    
    .gold-card {
      width: 140px;
      height: 90px;
    }
    
    .partner-card {
      width: 150px;
      height: 90px;
    }
  }
  
  @media (max-width: 480px) {
    .footer-links {
      gap: 1rem;
      flex-direction: column;
    }
    
    .platinum-card {
      width: 160px;
      height: 100px;
      padding: 0.8rem;
    }
    
    .gold-card {
      width: 120px;
      height: 80px;
      padding: 0.6rem;
    }
    
    .partner-card {
      width: 120px;
      height: 80px;
      padding: 0.6rem;
    }
    
    .logo-grid {
      gap: 0.8rem;
    }
  }
</style> 