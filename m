Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB7EC001DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Aug 2023 13:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjHNNrD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Aug 2023 09:47:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbjHNNql (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2023 09:46:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F2A1701
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Aug 2023 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692020798; x=1723556798;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iONhHrWqV8e0o6a8WMO9s+CxTrDDCoe+SVVUJ2ftk/g=;
  b=HravW3G2nvv6VRo74v/cBU4ew7IEwPDditvbynbotjKtE70y7ZNwiQqa
   151b9qXcLxjSXCHmKy59cHTlWqc/rbeMrOBHBWtvx4aUfRbSqdEE58sNh
   Dlu9xJHqlA/oJdatxEAb/d9NMImXfRYau71UjBy5uLIrDVLHA6O4yfjXW
   CAXiwO+nVGnOEpN60gMBPdyVdxBOtIpPCZnlQDjLngjNGoOZbloQ+Q5ho
   ksX2Q9RjYYYAmyurdAmXDBlnyDcep1cipUYvJ0EOUfsEcl3t6A8wPlzgF
   7KTteTZxwte+BJJL3DZSuG1SjDsnaMxYlUh8a1ow6w6/bK8EK1lcJo6ln
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458402548"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="458402548"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="710319938"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="710319938"
Received: from lgarello-mobl.ger.corp.intel.com ([10.249.40.121])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 06:46:36 -0700
Date:   Mon, 14 Aug 2023 16:46:34 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform-next 08/16] platform: mellanox: Cosmetic
 changes
In-Reply-To: <20230814085910.56069-9-vadimp@nvidia.com>
Message-ID: <acb5835-99af-c525-c3e8-954f12baa9cc@linux.intel.com>
References: <20230814085910.56069-1-vadimp@nvidia.com> <20230814085910.56069-9-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 14 Aug 2023, Vadim Pasternak wrote:

> Fix routines and labels names by s/topology/topology.

You meant: s/topolgy/topology (add the typo to the pattern).

> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: Michael Shych <michaelsh@nvidia.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index a505f619f337..1010064d54e9 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -6265,7 +6265,7 @@ mlxplat_i2c_mux_complition_notify(void *handle, struct i2c_adapter *parent,
>  	return mlxplat_post_init(priv);
>  }
>  
> -static int mlxplat_i2c_mux_topolgy_init(struct mlxplat_priv *priv)
> +static int mlxplat_i2c_mux_topology_init(struct mlxplat_priv *priv)
>  {
>  	int i, err;
>  
> @@ -6294,7 +6294,7 @@ static int mlxplat_i2c_mux_topolgy_init(struct mlxplat_priv *priv)
>  	return err;
>  }
>  
> -static void mlxplat_i2c_mux_topolgy_exit(struct mlxplat_priv *priv)
> +static void mlxplat_i2c_mux_topology_exit(struct mlxplat_priv *priv)
>  {
>  	int i;
>  
> @@ -6308,7 +6308,7 @@ static int mlxplat_i2c_main_complition_notify(void *handle, int id)
>  {
>  	struct mlxplat_priv *priv = handle;
>  
> -	return mlxplat_i2c_mux_topolgy_init(priv);
> +	return mlxplat_i2c_mux_topology_init(priv);
>  }
>  
>  static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
> @@ -6336,14 +6336,14 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
>  	}
>  
>  	if (priv->i2c_main_init_status == MLXPLAT_I2C_MAIN_BUS_NOTIFIED) {
> -		err = mlxplat_i2c_mux_topolgy_init(priv);
> +		err = mlxplat_i2c_mux_topology_init(priv);
>  		if (err)
> -			goto fail_mlxplat_i2c_mux_topolgy_init;
> +			goto fail_mlxplat_i2c_mux_topology_init;
>  	}
>  
>  	return 0;
>  
> -fail_mlxplat_i2c_mux_topolgy_init:
> +fail_mlxplat_i2c_mux_topology_init:
>  fail_platform_i2c_register:
>  fail_mlxplat_mlxcpld_verify_bus_topology:
>  	return err;
> @@ -6351,7 +6351,7 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
>  
>  static void mlxplat_i2c_main_exit(struct mlxplat_priv *priv)
>  {
> -	mlxplat_i2c_mux_topolgy_exit(priv);
> +	mlxplat_i2c_mux_topology_exit(priv);
>  	if (priv->pdev_i2c)
>  		platform_device_unregister(priv->pdev_i2c);
>  }
> 

-- 
 i.

