Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E302E81DFC
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 13:30:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbjJFNaN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 09:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232259AbjJFNaM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 09:30:12 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B2595
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696599011; x=1728135011;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=W0o6K2UP/G4iv+Z2GTiXFD7HfgyUvZU4XuDIgUmad6Y=;
  b=Uri5QmIGLSFHRuj7Mq4IHIkqcqu8G5IxPnb9sBVVQj+Pxj0kwv8hAvfN
   +HATT/8utnsjDg/wNuz0hpeS+E6oZlRNl4oJwpbQPh81D/H9FLFZNP6Xq
   PyWLRbxGVbGy/fE9Uwe2DGGfE4wyXeWscWg25W7kfbmjvYMluuRlJ8gJS
   n2Z4YM+Fh8ZqQTrwIxEPUXuCcAfqIBnJsE3R58H1pn7AztYyVzuEPa8xn
   AFXXYlC8FSbqU+e4vO10hdk6pGpQsvDSHnuhqJIn1oYTtAyaog20w/fPi
   vo4zf2/S15pCxgYy+qqvYpDZUOgjEBbIrY2yMX3l3QIdddC52BBpbXXSS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="383641482"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="383641482"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 06:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="999329045"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="999329045"
Received: from srab-mobl1.ger.corp.intel.com ([10.252.43.69])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 06:30:09 -0700
Date:   Fri, 6 Oct 2023 16:30:07 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Vadim Pasternak <vadimp@nvidia.com>
cc:     Hans de Goede <hdegoede@redhat.com>, christophe.jaillet@wanadoo.fr,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH platform 1/3] platform: mellanox: Fix a resource leak in
 an error handling path in probing flow
In-Reply-To: <20231005075616.42777-2-vadimp@nvidia.com>
Message-ID: <fe3cba6e-6a50-8f51-552d-2d76344813da@linux.intel.com>
References: <20231005075616.42777-1-vadimp@nvidia.com> <20231005075616.42777-2-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1839080889-1696599010=:3530"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1839080889-1696599010=:3530
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Thu, 5 Oct 2023, Vadim Pasternak wrote:

> Fix missed resource deallocation in rollback flows.
> 
> Currently if an error occurs after a successful
> mlxplat_i2c_main_init(), mlxplat_i2c_main_exit() call is missed in
> rollback flow.
> Thus, some resources are not de-allocated.
> 
> Move mlxplat_pre_exit() call from mlxplat_remove() into
> mlxplat_i2c_main_exit().
> 
> Call mlxplat_i2c_main_exit() instead of calling mlxplat_pre_exit() in
> mlxplat_probe() error handling flow.
> 
> Unregister 'priv->pdev_i2c' device in mlxplat_i2c_main_init() cleanup
> flow if this device was successfully registered.
> 
> Fixes: 158cd8320776 ("platform: mellanox: Split logic in init and exit flow")
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Closes: https://lore.kernel.org/lkml/70165032-796e-6f5c-6748-f514e3b9d08c@linux.intel.com/T/
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 3d96dbf79a72..a2ffe4157df1 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -6514,6 +6514,7 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
>  	return 0;
>  
>  fail_mlxplat_i2c_mux_topology_init:
> +	platform_device_unregister(priv->pdev_i2c);
>  fail_platform_i2c_register:
>  fail_mlxplat_mlxcpld_verify_bus_topology:
>  	return err;
> @@ -6521,6 +6522,7 @@ static int mlxplat_i2c_main_init(struct mlxplat_priv *priv)
>  
>  static void mlxplat_i2c_main_exit(struct mlxplat_priv *priv)
>  {
> +	mlxplat_pre_exit(priv);
>  	mlxplat_i2c_mux_topology_exit(priv);
>  	if (priv->pdev_i2c)
>  		platform_device_unregister(priv->pdev_i2c);
> @@ -6597,7 +6599,7 @@ static int mlxplat_probe(struct platform_device *pdev)
>  
>  fail_register_reboot_notifier:
>  fail_regcache_sync:
> -	mlxplat_pre_exit(priv);
> +	mlxplat_i2c_main_exit(priv);
>  fail_mlxplat_i2c_main_init:
>  fail_regmap_write:
>  fail_alloc:
> @@ -6614,7 +6616,6 @@ static int mlxplat_remove(struct platform_device *pdev)
>  		pm_power_off = NULL;
>  	if (mlxplat_reboot_nb)
>  		unregister_reboot_notifier(mlxplat_reboot_nb);
> -	mlxplat_pre_exit(priv);
>  	mlxplat_i2c_main_exit(priv);
>  	mlxplat_post_exit();
>  	return 0;
> 

Thanks,

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1839080889-1696599010=:3530--
