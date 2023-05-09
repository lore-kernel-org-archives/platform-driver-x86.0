Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCB4C77B75
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 May 2023 14:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235376AbjEIOMo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 May 2023 10:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235137AbjEIOMo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2023 10:12:44 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7273430EC
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2023 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683641562; x=1715177562;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SAL5co0fWXg47QhNXKqVi62/8DFAp6SaFVOF6K+It/I=;
  b=M4GTGyJ+av3tzyQW57jq6ExKqoyMIOlEYFgUh7SvGpP0Zow1EROphVJe
   s6iuP4KBIvKaA9DaX452+iDcelG/KfsPWqZVM4799Tq0jZ1zvhD+LXjcc
   K5r35PA7Z2kxy9NPln1nccbflLdGX2dwej0YrgOvpwjHK/GldW8pZHOBy
   D1k0o0unw/DVNujywXVO+ln871cKvmj4VPXh5q/57lwrv8SmsirpHec+s
   SOQGKIAI36pMHLgpN/mUen2z7qab3IGfThyZ6sR4CSrZfyiPAqK9kGuIj
   ehw4OC5aD9wlZAUOQ5R445u4URqKDUlziOv6l8OEwYwA5YNrbMB8x8qVa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413207138"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="413207138"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 07:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="676475326"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="676475326"
Received: from mbrdon-mobl.ger.corp.intel.com ([10.251.219.121])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 07:12:39 -0700
Date:   Tue, 9 May 2023 17:12:37 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH v3 2/2] platform/x86/amd/pmf: Add PMF debug facilities
In-Reply-To: <20230509140657.27479-2-Shyam-sundar.S-k@amd.com>
Message-ID: <54c09046-e89-2da8-c17-3a7124766ded@linux.intel.com>
References: <20230509140657.27479-1-Shyam-sundar.S-k@amd.com> <20230509140657.27479-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 9 May 2023, Shyam Sundar S K wrote:

> At times, when the mode transitions fail to happen, the current
> driver does not give enough debug information on why the transition
> failed or the default preset values did not load. Having an on-demand
> logs guarded by CONFIG would be helpful in such cases.
> 
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v3:
>  - Based on review-hans branch
>  - Address Ilpo's review remarks
>  - use the right format specifiers while printing the data
> 
> v2:
>  - Based on review-hans branch
>  - Drop extra CONFIG item based on feedback from Hans
> 
>  drivers/platform/x86/amd/pmf/auto-mode.c | 23 +++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 64425201d353..cb2fb4df39e9 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -179,11 +179,34 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>  			config_store.transition[i].applied = false;
>  			update = true;
>  		}
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +		dev_dbg(dev->dev, "[AUTO MODE] average_power : %d mW mode: %s\n", avg_power,
> +			state_as_str(config_store.current_mode));
> +
> +		dev_dbg(dev->dev, "[AUTO MODE] time: %lld ms timer: %u ms tc: %u ms\n",
> +			time_elapsed_ms, config_store.transition[i].timer,
> +			config_store.transition[i].time_constant);
> +
> +		dev_dbg(dev->dev, "[AUTO MODE] shiftup: %u pt: %u mW pf: %u mW pd: %u mW\n",
> +			config_store.transition[i].shifting_up,
> +			config_store.transition[i].power_threshold,
> +			config_store.mode_set[i].power_floor,
> +			config_store.transition[i].power_delta);
> +#endif
>  	}
>  
>  	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
>  		state_as_str(config_store.current_mode));
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	dev_dbg(dev->dev, "[AUTO MODE] priority1: %u priority2: %u priority3: %u priority4: %u\n",
> +		config_store.transition[0].applied,
> +		config_store.transition[1].applied,
> +		config_store.transition[2].applied,
> +		config_store. transition[3].applied);

Extra space.

-- 
 i.

> +#endif
> +
>  	if (update) {
>  		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
>  			/* Apply the mode with highest priority indentified */
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 35af7c18f600..539b186e9027 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -175,6 +175,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>  		config_store.trans_param[src][i].count++;
>  
>  		tp = &config_store.trans_param[src][i];
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +		dev_dbg(dev->dev, "avg_power: %u mW total_power: %u mW count: %u timer: %u ms\n",
> +			avg_power, config_store.trans_param[src][i].total_power,
> +			config_store.trans_param[src][i].count,
> +			config_store.trans_param[src][i].timer);
> +#endif
>  		if (tp->timer >= tp->time_constant && tp->count) {
>  			avg_power = tp->total_power / tp->count;
>  
> @@ -195,6 +202,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>  	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
>  		avg_power, socket_power, state_as_str(config_store.current_mode));
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	dev_dbg(dev->dev, "[CNQF] priority1: %u priority2: %u priority3: %u\n",
> +		config_store.trans_param[src][0].priority,
> +		config_store.trans_param[src][1].priority,
> +		config_store.trans_param[src][2].priority);
> +
> +	dev_dbg(dev->dev, "[CNQF] priority4: %u priority5: %u priority6: %u\n",
> +		config_store.trans_param[src][3].priority,
> +		config_store.trans_param[src][4].priority,
> +		config_store.trans_param[src][5].priority);
> +#endif
> +
>  	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
>  		/* apply the highest priority */
>  		if (config_store.trans_param[src][j].priority) {
> 

