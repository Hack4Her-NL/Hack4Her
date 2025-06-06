<script lang="ts">
  import { page } from '$app/stores';
  import { navigationItems } from '$lib/utils/routes';
  import ThemeToggle from './ThemeToggle.svelte';
  
  let mobileMenuOpen = false;
  
  function toggleMobileMenu() {
    mobileMenuOpen = !mobileMenuOpen;
  }
  
  function closeMobileMenu() {
    mobileMenuOpen = false;
  }

  $: currentPath = $page.url.pathname;
</script>

<header class="navigation">
  <div class="nav-container">
    <div class="logo">
      <a href="/" aria-label="Home">
        <img 
          src="/images/logos/Hack4Her_logo_black.png"
          alt="Hack4Her"
          class="logo-img light-logo"
        />
        <img 
          src="/images/logos/Hack4Her_logo_white.png"
          alt="Hack4Her"
          class="logo-img dark-logo"
        />
      </a>
    </div>
    
    <!-- Mobile menu toggle -->
    <button 
      class="mobile-toggle" 
      on:click={toggleMobileMenu}
      aria-expanded={mobileMenuOpen}
      aria-controls="mobile-menu"
      aria-label={mobileMenuOpen ? "Close menu" : "Open menu"}
    >
      <span class="sr-only">{mobileMenuOpen ? "Close menu" : "Open menu"}</span>
      <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        {#if mobileMenuOpen}
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        {:else}
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
        {/if}
      </svg>
    </button>
    
    <!-- Desktop navigation -->
    <nav class="desktop-nav">
      <ul>
        {#each navigationItems as item}
          <li class={currentPath === item.route ? 'active' : ''}>
            <a href={item.route}>{item.title}</a>
          </li>
        {/each}
      </ul>
      <ThemeToggle />
    </nav>
  </div>
  
  <!-- Mobile navigation -->
  {#if mobileMenuOpen}
    <nav class="mobile-nav" id="mobile-menu">
      <ul>
        {#each navigationItems as item}
          <li class={currentPath === item.route ? 'active' : ''}>
            <a href={item.route} on:click={closeMobileMenu}>{item.title}</a>
          </li>
        {/each}
        <li class="theme-toggle-mobile">
          <ThemeToggle />
        </li>
      </ul>
    </nav>
  {/if}
</header>

<style>
  .navigation {
    position: sticky;
    top: 0;
    z-index: 100;
    background: var(--gradient-nav);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }
  
  .nav-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 1rem var(--spacing-medium);
  }
  
  .logo {
    margin: 0;
    display: flex;
    align-items: center;
    height: 45px;
    max-width: 162px;
  }
  
  .logo-img {
    width: 90%;
    height: 90%;
    object-fit: contain;
  }
  
  .light-logo {
    display: var(--display-light-mode);
  }
  
  .dark-logo {
    display: var(--display-dark-mode);
  }
  
  .desktop-nav {
    display: flex;
    align-items: center;
    background: transparent;
  }
  
  .desktop-nav ul {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
    background: transparent;
  }
  
  .desktop-nav li {
    margin-left: var(--spacing-medium);
  }
  
  .desktop-nav a, .mobile-nav a {
    text-decoration: none;
    color: white;
    font-weight: 500;
    transition: color 0.2s;
  }
  
  .desktop-nav a:hover, .mobile-nav a:hover {
    color: rgba(255, 255, 255, 0.8);
  }
  
  li.active a {
    color: white;
    font-weight: 700;
    text-decoration: underline;
  }
  
  .mobile-toggle {
    display: none;
    background: none;
    border: none;
    color: var(--color-text);
    padding: 0;
  }

  .mobile-toggle:hover {
    background: none;
    color: var(--color-primary);
  }
  
  .mobile-nav {
    display: none;
    padding: 1rem var(--spacing-medium);
    border-top: 1px solid rgba(255, 255, 255, 0.2);
  }
  
  .mobile-nav ul {
    list-style: none;
    margin: 0;
    padding: 0;
  }
  
  .mobile-nav li {
    margin-bottom: var(--spacing-medium);
  }
  
  .sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border-width: 0;
  }
  
  .theme-toggle-mobile {
    margin-top: var(--spacing-large);
  }
  
  /* Mobile styles */
  @media (max-width: 768px) {
    .desktop-nav {
      display: none;
    }
    
    .mobile-toggle {
      display: block;
    }
    
    .mobile-nav {
      display: block;
    }
  }
</style> 
