Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F02C77B76
	for <platform-driver-x86@archiver.kernel.org>; Wed, 12 Apr 2023 11:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjDLL31 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Apr 2023 07:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbjDLL2w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Apr 2023 07:28:52 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC199013
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Apr 2023 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681298895; x=1712834895;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/3XB7mhbuO5gwHgOdngWOHJSjFM2kB5ibKM5y5kmAy0=;
  b=nKkawwZJPj0z2kyuHKZDK7RiXTwOBRalA8PfdjF2kuWH8rBbcReElVUA
   YWgGJrR1lWULwSVBgZBtoSS/cFz9C00z2Wp85qcYwDVWSjtuLNiW5I4HO
   PrTVdgpVKFRRTi6Tjnb5FsBmbGSYm1MuOIyZqj2CqVmZGWLc/8bKUeBr5
   KtQ1xJHxnKMNULfozT0u4OoE/Z9vVONB3eUDzkG+SZ7aE9aXv6wxbXzk3
   8hSW2lg44GH3EL56vKdLT5YVmkudhmKfrQlBSif7WwFXcWMOyWhcMeNPN
   xpTrPLNddTcizCD8GjIGM3lQok9JNJbmxs18qAjrR4Svw/yKHzAeQyQCK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341358056"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="341358056"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 04:28:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="639184930"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="639184930"
Received: from chanse1-mobl2.ger.corp.intel.com ([10.251.213.80])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 04:28:12 -0700
Date:   Wed, 12 Apr 2023 14:28:09 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Add PMF debug facilities
In-Reply-To: <20230412105242.2602148-2-Shyam-sundar.S-k@amd.com>
Message-ID: <112f182-e88d-ea84-ed90-4143261e3546@linux.intel.com>
References: <20230412105242.2602148-1-Shyam-sundar.S-k@amd.com> <20230412105242.2602148-2-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 12 Apr 2023, Shyam Sundar S K wrote:

> At times, when the mode transitions fail to happen, the current
> driver does not give enough debug information on why the transition
> failed or the default preset values did not load. Having an on-demand
> logs guarded by CONFIG would be helpful in such cases.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> v2:
>  - Based on review-hans branch
>  - Drop extra CONFIG item based on feedback from Hans
> 
>  drivers/platform/x86/amd/pmf/auto-mode.c | 22 ++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/cnqf.c      | 19 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 557a962b48f9..c3c1621b9833 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -177,11 +177,33 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>  			config_store.transition[i].applied = false;
>  			update = true;
>  		}
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +		dev_dbg(dev->dev, "[AUTO MODE] time_ms:%lld avg_power:%d mode:%s timer:%u tc:%d\n",
> +			time_elapsed_ms, avg_power,
> +			state_as_str(config_store.current_mode),
> +			config_store.transition[i].timer,
> +			config_store.transition[i].time_constant);

time_constant is u32 so it should be %u.

> +
> +		dev_dbg(dev->dev, "[AUTO MODE] shiftup:%d pt:%d pf:%d pd:%u\n",
> +			config_store.transition[i].shifting_up,
> +			config_store.transition[i].power_threshold,
> +			config_store.mode_set[i].power_floor,
> +			config_store.transition[i].power_delta);

Fix printf field types here too.

> +#endif
>  	}
>  
>  	dev_dbg(dev->dev, "[AUTO_MODE] avg power: %u mW mode: %s\n", avg_power,
>  		state_as_str(config_store.current_mode));
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	dev_dbg(dev->dev, "[AUTO MODE] priority1: %u, priority2: %u, priority3: %u, priority4: %u",
> +		config_store.transition[0].applied,
> +		config_store.transition[1].applied,
> +		config_store.transition[2].applied,
> +		config_store. transition[3].applied);
> +#endif
> +
>  	if (update) {
>  		for (j = 0; j < AUTO_TRANSITION_MAX; j++) {
>  			/* Apply the mode with highest priority indentified */
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> index 371762ce8446..6146875dcc44 100644
> --- a/drivers/platform/x86/amd/pmf/cnqf.c
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -173,6 +173,13 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>  		config_store.trans_param[src][i].count++;
>  
>  		tp = &config_store.trans_param[src][i];
> +
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +		dev_dbg(dev->dev, "avg_power:%d total_power:%d count:%d timer:%d\n", avg_power,
> +			config_store.trans_param[src][i].total_power,
> +			config_store.trans_param[src][i].count,
> +			config_store.trans_param[src][i].timer);

Ditto.

> +#endif
>  		if (tp->timer >= tp->time_constant && tp->count) {
>  			avg_power = tp->total_power / tp->count;
>  
> @@ -193,6 +200,18 @@ int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_l
>  	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
>  		avg_power, socket_power, state_as_str(config_store.current_mode));
>  
> +#ifdef CONFIG_AMD_PMF_DEBUG
> +	dev_dbg(dev->dev, "[CNQF] priority 1: %u, priority 2: %u, priority 3: %u",

Missing \n ?

> +		config_store.trans_param[src][0].priority,
> +		config_store.trans_param[src][1].priority,
> +		config_store.trans_param[src][2].priority);
> +
> +	dev_dbg(dev->dev, "[CNQF] priority 4: %u, priority 5: %u, priority 6: %u",

Missing \n ?

> +		config_store.trans_param[src][3].priority,
> +		config_store.trans_param[src][4].priority,
> +		config_store.trans_param[src][5].priority);
> +#endif
> +
>  	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
>  		/* apply the highest priority */
>  		if (config_store.trans_param[src][j].priority) {
> 

-- 
 i.

