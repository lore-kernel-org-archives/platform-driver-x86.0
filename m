Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFFFC001DF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  4 Aug 2023 13:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231243AbjHDNnk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 4 Aug 2023 09:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231304AbjHDNnj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Aug 2023 09:43:39 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07832195;
        Fri,  4 Aug 2023 06:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691156619; x=1722692619;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gWSsidf+YTv/LNRpH8dpvjJyRrzmEbTXF3XBYk01GKg=;
  b=E9bueNFJ+erbX2lhATehTZeykBHwLpUVNS1lsWgidM79yU0y9R8LMFSI
   VBU4dvWRDiTepyoEQZWJ8yO7OmsYUdRsGJBIBNzXtCm0gsoLEFT6507Pf
   soogVRRoSbMih3SXNBzmMymU3zZKu2K+NQchv2aDI0QqtFMu59QLxilmu
   Eo7JPwJKV/hFfKyHwKx4wW8xg8TjzbNu+vUuS6xszI3xlGHBLyrcDNUff
   JzXFAUG/TgbQVh0cR9YcyE+6FQmAywOXOXXmHJfJdwLHWyLavQux+JU59
   fLTo2u3/u2aXhYGlQzSclPqLXYAjJP6K+fBiqtDjkxANbVgHmq6LEOjGr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="372902510"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="372902510"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 06:43:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="707030996"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="707030996"
Received: from mmocanu-mobl1.ger.corp.intel.com ([10.252.38.186])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 06:43:35 -0700
Date:   Fri, 4 Aug 2023 16:43:32 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     xingtong_wu@163.com
cc:     hdegoede@redhat.com, markgross@kernel.org, xingtong.wu@siemens.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        gerd.haeussler.ext@siemens.com, tobias.schaffner@siemens.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/2] platform/x86/siemens: simatic-ipc-batt: fix logic
 error for BX-59A
In-Reply-To: <20230801090712.4856-1-xingtong_wu@163.com>
Message-ID: <d41d3ae3-9c1b-661-4664-51d62ad1d786@linux.intel.com>
References: <20230731072148.4781-1-xingtong_wu@163.com> <20230801090712.4856-1-xingtong_wu@163.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-827239543-1691156617=:1581"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-827239543-1691156617=:1581
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 1 Aug 2023, xingtong_wu@163.com wrote:

> From: "xingtong.wu" <xingtong.wu@siemens.com>
> 
> There is a bug in if statement that lead to logical error
> and have influence to other IPC, it get correct now.
> 
> Fixes: c56beff20375 ("platform/x86/siemens: simatic-ipc-batt: add support for module BX-59A")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308010001.BGYCSQrl-lkp@intel.com/
> Signed-off-by: xingtong.wu <xingtong.wu@siemens.com>
> ---
>  drivers/platform/x86/siemens/simatic-ipc-batt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt.c b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> index d66b9969234b..e6c12c52843c 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> @@ -194,7 +194,8 @@ int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_tab
>  
>  	if (table->table[2].key) {
>  		flags = GPIOD_OUT_HIGH;
> -		if (priv.devmode == SIMATIC_IPC_DEVICE_BX_21A || SIMATIC_IPC_DEVICE_BX_59A)
> +		if (priv.devmode == SIMATIC_IPC_DEVICE_BX_21A ||
> +		    priv.devmode == SIMATIC_IPC_DEVICE_BX_59A)
>  			flags = GPIOD_OUT_LOW;
>  		priv.gpios[2] = devm_gpiod_get_index(dev, "CMOSBattery meter", 2, flags);
>  		if (IS_ERR(priv.gpios[2])) {
> 

The code change is fine but please try to improve the changelog (has 
similar problems as the other one).

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-827239543-1691156617=:1581--
