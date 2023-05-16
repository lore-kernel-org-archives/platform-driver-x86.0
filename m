Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B0EC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 May 2023 08:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjEPIU5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 May 2023 04:20:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjEPIU4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 May 2023 04:20:56 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A2CD1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 May 2023 01:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684225255; x=1715761255;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=2qoVs46ShU+DMdvADw3k4q6vRub/R1BBwj/63tffaFE=;
  b=T3IWm9rT/fvoXJIllEQH4ebpVnMXPjtd9h9lmQHqT5YxT9K/jqKMexsX
   BPl2eM+vtHqwTfE0ucjuAnAcfG82dyv2X99G0P7zk7c1tqLE4nT2mJIB+
   yyiU/yvGkZJ+XXKBd8aNju/zFhAQ1hVkg8B5PTa0lViP9mPm552RHgWXh
   x6KXRw/7gj/cPQ5D2KX4gs6is2ffGyWhLithKLds8Yilujq/Iuw7JR4y+
   JpBHMlshklmdI6PYybp7LRInuA70TzLcPDk9hK5SN9QPXjQNlVuLgaEcc
   iXJIY23pSDsVOtTFwqgYNRt7kEmRbC3BSHjGPVTimWCsI4iyBQ3hobNd7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="331778773"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="331778773"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 01:20:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="875526920"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="875526920"
Received: from eharan-mobl.ger.corp.intel.com ([10.252.43.111])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 01:20:52 -0700
Date:   Tue, 16 May 2023 11:20:47 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix compiler warnings in static
 slider
In-Reply-To: <20230516074531.2885235-1-Shyam-sundar.S-k@amd.com>
Message-ID: <27c54140-0db-4527-4b4a-65a3e3fe14@linux.intel.com>
References: <20230516074531.2885235-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-763475302-1684225214=:1682"
Content-ID: <be6fae27-2855-4eee-978f-ee72d415be1f@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-763475302-1684225214=:1682
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <7b612d7e-6041-ce4c-5f34-2a308480c142@linux.intel.com>

On Tue, 16 May 2023, Shyam Sundar S K wrote:

> This patch fixes warnings with -Wmissing-prototypes:
> 
> warning: no previous prototype for 'source_as_str' [-Wmissing-prototypes]
> warning: no previous prototype for 'slider_as_str' [-Wmissing-prototypes]
> 
> Fixes: a82ebb3d800d ("platform/x86/amd/pmf: Add PMF acpi debug support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305160220.REQc5T2y-lkp@intel.com/
> Suggested-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/sps.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index 0a4d0549ea03..445ff053b4df 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -13,7 +13,7 @@
>  static struct amd_pmf_static_slider_granular config_store;
>  
>  #ifdef CONFIG_AMD_PMF_DEBUG
> -const char *slider_as_str(unsigned int state)
> +static const char *slider_as_str(unsigned int state)
>  {
>  	switch (state) {
>  	case POWER_MODE_PERFORMANCE:
> @@ -27,7 +27,7 @@ const char *slider_as_str(unsigned int state)
>  	}
>  }
>  
> -const char *source_as_str(unsigned int state)
> +static const char *source_as_str(unsigned int state)
>  {
>  	switch (state) {
>  	case POWER_SOURCE_AC:
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.
--8323329-763475302-1684225214=:1682--
