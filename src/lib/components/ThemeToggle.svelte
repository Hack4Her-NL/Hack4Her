<script lang="ts">
  import { onMount } from 'svelte';

  // Initialize theme from localStorage or system preference
  let darkMode = false;

  onMount(() => {
    // Check localStorage first
    const storedTheme = localStorage.getItem('theme');
    
    if (storedTheme === 'dark') {
      darkMode = true;
      document.body.classList.add('dark-mode');
    } else if (storedTheme === 'light') {
      darkMode = false;
      document.body.classList.remove('dark-mode');
    } else {
      // Use system preference as fallback
      const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
      darkMode = prefersDark;
      if (prefersDark) {
        document.body.classList.add('dark-mode');
      }
    }
  });

  function toggleTheme() {
    darkMode = !darkMode;
    
    if (darkMode) {
      document.body.classList.add('dark-mode');
      localStorage.setItem('theme', 'dark');
    } else {
      document.body.classList.remove('dark-mode');
      localStorage.setItem('theme', 'light');
    }
  }
</script>

<button 
  on:click={toggleTheme}
  class="theme-toggle"
  aria-label={darkMode ? "Switch to light mode" : "Switch to dark mode"}
>
  {#if darkMode}
    <svg class="icon" viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
      <circle cx="12" cy="12" r="5"></circle>
      <line x1="12" y1="1" x2="12" y2="3"></line>
      <line x1="12" y1="21" x2="12" y2="23"></line>
      <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line>
      <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line>
      <line x1="1" y1="12" x2="3" y2="12"></line>
      <line x1="21" y1="12" x2="23" y2="12"></line>
      <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line>
      <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line>
    </svg>
  {:else}
    <svg class="icon" viewBox="0 0 24 24" width="24" height="24" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round">
      <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
    </svg>
  {/if}
</button>

<style>
  .theme-toggle {
    background: none;
    border: none;
    color: var(--color-text);
    padding: var(--spacing-small);
    margin-left: var(--spacing-medium);
    cursor: pointer;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background-color 0.2s;
  }
  
  /* Override color for nav context to always be white */
  :global(nav) .theme-toggle {
    color: white !important;
  }
  
  .theme-toggle:hover {
    background-color: rgba(0, 0, 0, 0.05);
  }
  
  :global(body.dark-mode) .theme-toggle:hover {
    background-color: rgba(255, 255, 255, 0.1);
  }
  
  .icon {
    width: 24px;
    height: 24px;
  }
</style> 