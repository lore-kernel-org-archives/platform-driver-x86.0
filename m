Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A289EC001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 13:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229935AbjHNNlK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 09:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbjHNNk7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 09:40:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC32106
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692020459; x=1723556459;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mv3/GObaZ67+G4lwfY5L1lpXE/OvdQ4bokfQdTm15Fc=;
  b=MVhPwn/AQOP7+VSXuAgWU9CadAimc654jDAgOOZEJw/STXr5VPfZItjS
   BlxVGKAFTGA2dRfd5nyGX3WGDplIb81HiP5YPno3MKBeqBsx2r8xD1dwE
   T3I2Hm37RRLimIxFa6iYmHkpEfz+M3Qi+ejEXb0aw2cOaKUswutYiPTrM
   QYAXF+p97DgFw7lXiMK1ZeyFC4KhK8vnN8UYbGU0xVSnryfnPVS2YAFnP
   5HH/8tfy7fHf1XgC5UT6WMqS31AutKPRxZX75QU3Tkj3+tYy+dheVo6VY
   I6wXkE8bJQJZ9C5FmkAOrqH+MtiDuHWVXRSeEXWsEiwmEW1rP8OL2NgHG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403025563"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="403025563"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="857093807"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="857093807"
Received: from lgarello-mobl.ger.corp.intel.com ([10.249.40.121])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:40:27 -0700
Date:   Mon, 14 Aug 2023 16:40:24 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next 03/16] platform: mellanox: Modify reset
 causes description
In-Reply-To: <20230814085910.56069-4-vadimp@nvidia.com>
Message-ID: <f8ea202b-6522-1d0-cafd-bfad67a7e863@linux.intel.com>
References: <20230814085910.56069-1-vadimp@nvidia.com> <20230814085910.56069-4-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 14 Aug 2023, Vadim Pasternak wrote:

> For system of classes VMOD0005, VMOD0010:
> - remove "reset_from_comex", since this cause doesn't define specific
>   reason.
> - add more speicific reason "reset_sw_reset", which is set along with

specific

-- 
 i.


>   removed "reset_from_comex".
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 647a10252c2f..5b0579752afb 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -3556,12 +3556,6 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
>  		.mask = GENMASK(7, 0) & ~BIT(2),
>  		.mode = 0444,
>  	},
> -	{
> -		.label = "reset_from_comex",
> -		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> -		.mask = GENMASK(7, 0) & ~BIT(4),
> -		.mode = 0444,
> -	},
>  	{
>  		.label = "reset_from_asic",
>  		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
> @@ -3580,6 +3574,12 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
>  		.mask = GENMASK(7, 0) & ~BIT(7),
>  		.mode = 0444,
>  	},
> +	{
> +		.label = "reset_sw_reset",
> +		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> +		.mask = GENMASK(7, 0) & ~BIT(0),
> +		.mode = 0444,
> +	},
>  	{
>  		.label = "reset_comex_pwr_fail",
>  		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
> 
