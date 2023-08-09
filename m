Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311FCEB64DD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Aug 2023 12:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232326AbjHIMyD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Aug 2023 08:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbjHIMyB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Aug 2023 08:54:01 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B292F2108
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Aug 2023 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691585636; x=1723121636;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zvVzWawfiMyCqF45oeKI0UROgVFvER3FJZ40qHDK534=;
  b=FR438KEN6cAqIZBhm9ERFEzQCvrg+14bovqZG6IVlJftYzJ9IMk4wsI7
   i6FdzU6DbM18i3nm2eMJ+RzUxDTvl8UvAOojjJUjJL7Wl0r3KnEbyEwUH
   gtNqtySL91HZiH30tOCR2B3L6Gjv/++SvYVCntASP2wqeiqhKT1jAKToH
   9pgwkKDFYRlXJvwhNmHSsSKIfLgcLsYrJHHj65ElMs7jfhc1a3v2Q7eJN
   W0EbLvuFGIZLe1PaS7rbcszBMUrQh40mQWDx0n8+h5knLEQpQWzaUUfyX
   NVCIDGnLyuPtac9uGIGTFWgo+Mjgvkwiis86vtUZknmCrFz8C9tu5ZB9A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="435002120"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="435002120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 05:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="875236715"
Received: from cvogler-mobl1.ger.corp.intel.com ([10.252.40.229])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 05:53:57 -0700
Date:   Wed, 9 Aug 2023 15:53:48 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        markgross@kernel.org, henning.schild@siemens.com
Subject: Re: [PATCH -next] platform/x86/siemens: simatic-ipc-batt: fix wrong
 pointer pass to PTR_ERR()
In-Reply-To: <20230809081227.1221267-1-yangyingliang@huawei.com>
Message-ID: <d1bf98bc-f99-c49-a885-89dc3a5c4544@linux.intel.com>
References: <20230809081227.1221267-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-735845644-1691585635=:1846"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-735845644-1691585635=:1846
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 9 Aug 2023, Yang Yingliang wrote:

> Fix wrong pointer pass to PTR_ERR() if devm_gpiod_get_index() fails.
> 
> Fixes: 917f54340794 ("platform/x86: simatic-ipc: add CMOS battery monitoring")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/platform/x86/siemens/simatic-ipc-batt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt.c b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> index d66b9969234b..15c08c4900b8 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> @@ -198,7 +198,7 @@ int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_tab
>  			flags = GPIOD_OUT_LOW;
>  		priv.gpios[2] = devm_gpiod_get_index(dev, "CMOSBattery meter", 2, flags);
>  		if (IS_ERR(priv.gpios[2])) {
> -			err = PTR_ERR(priv.gpios[1]);
> +			err = PTR_ERR(priv.gpios[2]);
>  			priv.gpios[2] = NULL;
>  			goto out;

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-735845644-1691585635=:1846--
