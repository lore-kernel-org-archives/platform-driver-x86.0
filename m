Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DB4C41535
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 12:52:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232861AbjKNMwS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 07:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232883AbjKNMwR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 07:52:17 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A40196;
        Tue, 14 Nov 2023 04:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699966330; x=1731502330;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=tdpRTh8mi1j54mF2UKa8rnaVopWpaAVwCAK3KQYClOY=;
  b=F9IxUBFAZJIMMXy9HPaYFr9l0b+pTFu3xivDg0Z5TRulwDxdBbVShqDQ
   dapsM0RPb9vfCL8vAiFyrTHFdjxPG3deBYy4Sr2mbkjhbBknKQNJXtM3Z
   DRcPIqkZ6tU9bs46hLBLBcaTlMXpcRwh2GdCfXoMrcBLfn3LABJjwzrLa
   G9YUmol5ZVTXjOJ0HH8gZ4M2ousPZquM7IC1eUUSyvPy525ubLzUblYTy
   Rs2rvtj+Bs5H7J07NLqUPywfOMEXLyuyor+pP/zcwS6V2cCFzb+GPWhvP
   b2lxrSFiZ9qn8VfT6z1+wvvqSfnCWsvmvJqT49t01vKpS5hyLZFI1X7wx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394563478"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="394563478"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:52:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="793777806"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="793777806"
Received: from rauhjoha-mobl2.ger.corp.intel.com ([10.251.217.194])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 04:52:07 -0800
Date:   Tue, 14 Nov 2023 14:52:05 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ike Panhc <ike.pan@canonical.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Set max_brightness
 before using it
In-Reply-To: <20231114114055.6220-2-stuart.a.hayhurst@gmail.com>
Message-ID: <d37ef0cf-a8b-d445-c737-4b5ec78bc061@linux.intel.com>
References: <9f46c613-63c2-4bc7-b938-7c9ea862a55e@linux.intel.com> <20231114114055.6220-2-stuart.a.hayhurst@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1794934158-1699966329=:1748"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1794934158-1699966329=:1748
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 14 Nov 2023, Stuart Hayhurst wrote:

> max_brightness is used in ideapad_kbd_bl_brightness_get() before it's set,
> causing ideapad_kbd_bl_brightness_get() to return -EINVAL sometimes
> 
> Fixes: ecaa1867b524 ("platform/x86: ideapad-laptop: Add support for keyboard backlights using KBLC ACPI symbol")
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> Cc: stable@vger.kernel.org
> ---
> 
> Sorry if I messed up the stable cc bit, I have no idea how that process works

It looks fine now, thank you (except for the . missing at the end of the 
sentence but I can fix that when I'll later apply the patch).

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

> v1 -> v2:
>  - Fix commit message
>  - Add missing tags
> 
> ---
>  drivers/platform/x86/ideapad-laptop.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index ac037540acfc..88eefccb6ed2 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1425,18 +1425,17 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>  	if (WARN_ON(priv->kbd_bl.initialized))
>  		return -EEXIST;
>  
> -	brightness = ideapad_kbd_bl_brightness_get(priv);
> -	if (brightness < 0)
> -		return brightness;
> -
> -	priv->kbd_bl.last_brightness = brightness;
> -
>  	if (ideapad_kbd_bl_check_tristate(priv->kbd_bl.type)) {
>  		priv->kbd_bl.led.max_brightness = 2;
>  	} else {
>  		priv->kbd_bl.led.max_brightness = 1;
>  	}
>  
> +	brightness = ideapad_kbd_bl_brightness_get(priv);
> +	if (brightness < 0)
> +		return brightness;
> +
> +	priv->kbd_bl.last_brightness = brightness;
>  	priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
>  	priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
>  	priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
> 

--8323329-1794934158-1699966329=:1748--
