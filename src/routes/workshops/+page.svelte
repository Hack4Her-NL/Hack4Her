<script lang="ts">
  import { pageSeo } from '$lib/utils/seo';

  // Set page-specific SEO metadata
  export const metadata = pageSeo.workshops;
</script>

<svelte:head>
  <title>{metadata.title}</title>
  <meta name="description" content={metadata.description} />
  {#if metadata.keywords && metadata.keywords.length > 0}
    <meta name="keywords" content={metadata.keywords.join(', ')} />
  {/if}
  <meta property="og:title" content={metadata.title} />
  <meta property="og:description" content={metadata.description} />
  <meta property="og:type" content={metadata.ogType || 'website'} />
  {#if metadata.ogImage}
    <meta property="og:image" content={metadata.ogImage} />
  {/if}
  <meta name="twitter:card" content={metadata.twitterCard || 'summary'} />
  <meta name="twitter:title" content={metadata.title} />
  <meta name="twitter:description" content={metadata.description} />
  {#if metadata.ogImage}
    <meta name="twitter:image" content={metadata.ogImage} />
  {/if}
  {#if metadata.canonicalUrl}
    <link rel="canonical" href={metadata.canonicalUrl} />
  {/if}
</svelte:head>

<!-- Header -->
<div class="page-header gradient-background">
  <div class="header-content">
    <h1>Workshops</h1>
    <p>Expand your skills with our interactive workshops</p>
  </div>
</div>

<section class="section">
  <div class="section-container">
    <p class="section-text">
      Our workshops offer a unique opportunity to learn new skills, get hands-on experience, and connect with industry experts. 
      The workshop page is currently under construction! 
    </p>
  </div>
</section>

<section class="section gradient-background">
  <div class="section-container schedule-container">
    <h2 class="section-title text-white">Workshop Schedule</h2>
    
    <div class="workshop-schedule">
      <p class="schedule-placeholder">To be determined</p>
    </div>
  </div>
</section>

<style>
  /* Header styles */
  .page-header {
    padding: 80px 20px;
    text-align: center;
    color: white;
  }
  
  .header-content {
    max-width: 800px;
    margin: 0 auto;
  }
  
  .header-content h1 {
    margin-bottom: var(--spacing-small);
  }
  
  .header-content p {
    font-size: 1.2rem;
  }
  
  /* Section styles */
  .section {
    padding: var(--spacing-large) var(--spacing-medium);
  }
  
  .section-container {
    max-width: 1200px;
    margin: 0 auto;
    text-align: center;
  }
  
  .schedule-container {
    max-width: 1400px;
    overflow-x: auto;
  }
  
  .section-title {
    margin-bottom: var(--spacing-large);
  }
  
  .text-white {
    color: white;
  }
  
  .section-text {
    max-width: 700px;
    margin: 0 auto var(--spacing-large);
    line-height: 1.6;
  }
  
  /* Schedule placeholder */
  .workshop-schedule {
    width: 100%;
    overflow-x: auto;
  }

  .schedule-placeholder {
    text-align: center;
    color: white;
    font-size: 1.3rem;
    margin: 0;
    font-weight: bold;
  }

  /* Schedule table styles kept for when the workshop schedule is filled in again */
  .schedule-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 8px;
    margin: 0 auto;
    color: white;
  }
  
  .time-header {
    width: 120px;
    padding: 15px;
    text-align: center;
    font-weight: bold;
    color: white;
  }
  
  .room-header {
    padding: 15px;
    text-align: center;
    width: calc((100% - 120px) / 5);
    min-width: 150px;
    background-color: rgba(0, 0, 0, 0.1);
    border-radius: var(--border-radius-section);
  }
  
  .room-name {
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 5px;
  }
  
  .room-capacity {
    font-size: 16px;
    font-weight: 500;
  }
  
  .room-size {
    font-size: 14px;
    opacity: 0.8;
  }
  
  .time-cell {
    padding: 10px;
    text-align: center;
    font-weight: bold;
    color: white;
    white-space: nowrap;
  }
  
  .workshop-cell {
    padding: 0;
    text-align: center;
    height: 120px;
    background-color: rgba(255, 255, 255, 0.07);
    border-radius: var(--border-radius-section);
    transition: all 0.3s ease;
    vertical-align: middle;
  }

  .workshop-cell.unconfirmed {
    position: relative;
    overflow: hidden;
    background-image: repeating-linear-gradient(
      45deg,
      #d1b3ff 0px,
      #d1b3ff 4px,
      transparent 4px,
      transparent 16px
    );
  }
  
  .has-workshop {
    background-color: rgba(var(--color-primary-rgb), 0.8);
    cursor: pointer;
  }
  
  .has-workshop:hover {
    background-color: rgba(var(--color-secondary-rgb), 0.6);
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
  }
  
  .cell-content {
    padding: 15px;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }
  
  .workshop-title {
    font-size: 16px;
    font-weight: bold;
    margin: 0 0 10px;
    color: white;
  }
  
  .workshop-presenter {
    font-size: 14px;
  }
  
  .empty-cell {
    background-color: rgba(255, 255, 255, 0.05);
  }

  @media (max-width: 1000px) {
    .schedule-container {
      padding: 0 5px;
    }
    
    .schedule-table {
      border-spacing: 5px;
    }
    
    .time-header {
      width: 60px;
      padding: 10px 5px;
    }
    
    .time-cell {
      width: 60px;
      padding: 5px 2px;
      font-size: 13px;
    }
    
    .room-header {
      padding: 10px 5px;
      min-width: 120px;
      width: calc((100% - 60px) / 5);
    }
    
    .room-name {
      font-size: 16px;
    }
    
    .room-capacity, .room-size {
      font-size: 12px;
    }
    
    .workshop-title {
      font-size: 14px;
    }
    
    .workshop-presenter {
      font-size: 12px;
    }
  }
  
  @media (max-width: 480px) {
    .time-header {
      width: 45px;
      padding: 8px 2px;
    }
    
    .time-cell {
      width: 45px;
      padding: 4px 2px;
      font-size: 12px;
    }
    
    .room-header {
      width: calc((100% - 45px) / 5);
      min-width: 100px;
    }
    
    .workshop-cell {
      height: 100px;
    }
  }
</style>
