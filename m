Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F381C7EE22
	for <platform-driver-x86@archiver.kernel.org>; Mon, 15 May 2023 12:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241981AbjEOMk7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 15 May 2023 08:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241489AbjEOMja (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 May 2023 08:39:30 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A066710D4;
        Mon, 15 May 2023 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684154265; x=1715690265;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mZ2YyYt7WidnvyPtpMEr2s/eyGsg7AR64W9NENyNm7c=;
  b=gwa566qz3oIRuMNsAmLSstZWeW8NbuU1FKGrlCOEBII02agnKiOaH0Zg
   Cl/60oeLCol6zpQOznR8okBm7/miSjVHuGum+V+aY97c4GzGNnqLDMbWO
   JhV3QkNlEGLeotsAPsX+/KzxC8Ua4taTuzUej8y/T0X7JbrQ3aI7BJhmE
   f4mqShDIZjlXYxvxF8Srqw5eRVoUIKTidyjvLRuXiTkoGP2/pw5AecOJ/
   YF2q/SDbado7zz9BqmxGt3JD16mH6jRqDhNbPfKc1vnk9PCueJNHgv3yZ
   nZFNz900gxsfsaFx78MAJQiGEC3MNa1J29gv925hVOX8SKiThN8zE+h1V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="437529136"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="437529136"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 05:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="765905347"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="765905347"
Received: from fsamelis-mobl.ger.corp.intel.com ([10.252.42.18])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 05:37:38 -0700
Date:   Mon, 15 May 2023 15:37:36 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
cc:     Shravan Kumar Ramani <shravankr@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/mellanox: mlxbf-pmc: fix sscanf() error
 checking
In-Reply-To: <4ccdfd28-099b-40bf-8d77-ad4ea2e76b93@kili.mountain>
Message-ID: <b1187d38-a390-4934-1d30-f069a1a4a730@linux.intel.com>
References: <4ccdfd28-099b-40bf-8d77-ad4ea2e76b93@kili.mountain>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1529726389-1684154260=:2173"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1529726389-1684154260=:2173
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Mon, 15 May 2023, Dan Carpenter wrote:

> The sscanf() function never returns negatives.  It returns the number of
> items successfully read.
> 
> Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index c2c9b0d3244c..be967d797c28 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1348,9 +1348,8 @@ static int mlxbf_pmc_map_counters(struct device *dev)
>  
>  	for (i = 0; i < pmc->total_blocks; ++i) {
>  		if (strstr(pmc->block_name[i], "tile")) {
> -			ret = sscanf(pmc->block_name[i], "tile%d", &tile_num);
> -			if (ret < 0)
> -				return ret;
> +			if (sscanf(pmc->block_name[i], "tile%d", &tile_num) != 1)
> +				return -EINVAL;
>  
>  			if (tile_num >= pmc->tile_count)
>  				continue;

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>


-- 
 i.

--8323329-1529726389-1684154260=:2173--
