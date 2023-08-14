Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B081C04A6A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 13:44:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbjHNNoX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 09:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231712AbjHNNoK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 09:44:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 237A11726
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 06:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692020642; x=1723556642;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ru1X/US6eZy1DRAtLGxI8qKmLotaVurLPonX8H0u6Ik=;
  b=aszRERGHDuE5emhmwAD8+XV+A3q75jcUSuee4+51jQKkpoGWFuo+gjhk
   4gLwJZy+PrTatuK5Hw5E3yVHW05Oi2BR8ruh4/LPRRNvAmdaEqfZDuR8e
   yIy77EcTUy/GHenVflcH9+UUY0HAkGTVPGEJlBRyhsHhXnYbBzITHo3S/
   Z7hCtokXXqscjaU5cjj7WpRQjhC4PwezMMAYM2ypxwahFvuCeFdZSLT1b
   loTFvV2pHJIKeoIDSDV/mRoSPvACrff6JAoFuauPv+L/Xi5i3rjPBOoWa
   a0Zmf35E4tFVf5SwBEnGwsphaCPdEa66y63kqjJ8inKAFlynP52bhjbFO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="370939576"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="370939576"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:44:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="727018581"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="727018581"
Received: from lgarello-mobl.ger.corp.intel.com ([10.249.40.121])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:44:00 -0700
Date:   Mon, 14 Aug 2023 16:43:58 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next 07/16] platform: mellanox: mlx-platform:
 Modify power off callback
In-Reply-To: <20230814085910.56069-8-vadimp@nvidia.com>
Message-ID: <2fef925b-54b4-5c25-7e59-e42cc08c1423@linux.intel.com>
References: <20230814085910.56069-1-vadimp@nvidia.com> <20230814085910.56069-8-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 14 Aug 2023, Vadim Pasternak wrote:

> Extend platform power off callback with kernel_halt() call.

That much is obvious from the code change itself but please amend this 
changelog with the answer to question "Why?" you're making this change.

-- 
 i.

> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index dce35934cc37..a505f619f337 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -5539,6 +5539,7 @@ static void mlxplat_poweroff(void)
>  	struct mlxplat_priv *priv = platform_get_drvdata(mlxplat_dev);
>  
>  	regmap_write(priv->regmap, MLXPLAT_CPLD_LPC_REG_GP1_OFFSET, MLXPLAT_CPLD_HALT_MASK);
> +	kernel_halt();
>  }
>  
>  static int __init mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
> 

