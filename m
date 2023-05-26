Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F67AC77B7A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 May 2023 09:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243224AbjEZJce (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 May 2023 05:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243190AbjEZJcW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 May 2023 05:32:22 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF0E187
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 May 2023 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685093533; x=1716629533;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=P2o8SvmZ8wWSc0o9AmI824lV23woWTJtCVoN2q2WBzY=;
  b=mkx/0WZmeRLEVquwoGz32Dn4UgKRMB8yNwXwhLqQ4SoHClE2N5dH/SJ2
   jzY7UU19C9oRutktQ82W9dZbI5WufmjK/VxPGQdhYJdlOd1CvE/Ps/Lxg
   MoyRr6JXN3LOCnA22jNKQjnPPQLnnOZj5hm4A2jOrG2B1OEw6RL/qLbGn
   tBhltToyrSd/kRVbdlgtzUpWJpCHyzne8hqi9+ZEfTdTngIrt+cfj6nyl
   vFDC1SlBqGFClAZcKBC0uotQNzGohyiYY+j9aFYbqKHQZkWDOEOx6Yonm
   5p02yVzT823O04vMN5Sv+Gf0905wNTxLQjiCgZYMxJEgBCfbMaYSxTHJy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="353005137"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="353005137"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="705138181"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="705138181"
Received: from eandrei-mobl5.ger.corp.intel.com ([10.252.53.213])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 02:32:10 -0700
Date:   Fri, 26 May 2023 12:32:04 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     hdegoede@redhat.com, markgross@kernel.org, Sanket.Goswami@amd.com,
        mario.limonciello@amd.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5 3/4] platform/x86/amd: pmc: Add helper function to
 check the cpu id
In-Reply-To: <20230525141929.866385-4-Shyam-sundar.S-k@amd.com>
Message-ID: <e2ae3dc1-9142-732c-59ff-5f1d91f12147@linux.intel.com>
References: <20230525141929.866385-1-Shyam-sundar.S-k@amd.com> <20230525141929.866385-4-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-817866906-1685093532=:1602"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-817866906-1685093532=:1602
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Thu, 25 May 2023, Shyam Sundar S K wrote:

> Add a helper routine to check the underlying cpu id, that can be used
> across the PMC driver to remove the duplicate code.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmc.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
> index e2439fda5c02..c2f03cdc9ca9 100644
> --- a/drivers/platform/x86/amd/pmc.c
> +++ b/drivers/platform/x86/amd/pmc.c
> @@ -564,6 +564,18 @@ static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>  	debugfs_remove_recursive(dev->dbgfs_dir);
>  }
>  
> +static bool amd_pmc_is_stb_supported(struct amd_pmc_dev *dev)
> +{
> +	switch (dev->cpu_id) {
> +	case AMD_CPU_ID_YC:
> +	case AMD_CPU_ID_CB:
> +	case AMD_CPU_ID_PS:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  {
>  	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
> @@ -575,8 +587,7 @@ static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
>  			    &amd_pmc_idlemask_fops);
>  	/* Enable STB only when the module_param is set */
>  	if (enable_stb) {
> -		if (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB ||
> -		    dev->cpu_id == AMD_CPU_ID_PS)
> +		if (amd_pmc_is_stb_supported(dev))
>  			debugfs_create_file("stb_read", 0644, dev->dbgfs_dir, dev,
>  					    &amd_pmc_stb_debugfs_fops_v2);
>  		else
> @@ -1036,7 +1047,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	mutex_init(&dev->lock);
>  
> -	if (enable_stb && (dev->cpu_id == AMD_CPU_ID_YC || dev->cpu_id == AMD_CPU_ID_CB)) {
> +	if (enable_stb && amd_pmc_is_stb_supported(dev)) {
>  		err = amd_pmc_s2d_init(dev);
>  		if (err)
>  			goto err_pci_dev_put;
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-817866906-1685093532=:1602--
