Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12C9C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 11:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbjKNLCO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 06:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbjKNLCN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 06:02:13 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8969FD9;
        Tue, 14 Nov 2023 03:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699959730; x=1731495730;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hctPdmiuDKvm5TxHwo3gQ0zTUX9g+Utmt/ekin5mRC8=;
  b=HQFRe05vRNglMHINpdea7qA0YRqW7DKweiv3ADT2Cnqy/gDxmyW+uAyg
   8Ea0rXfrysol+AqTrSqU068aBxVcFvAztdpjtiG9KkeAtO9GP+f9SvUa4
   jueI9ogjKC5kKcnb/CH1YQ7Yis5h/lINViIW1JD66E8/z4JK8WM0tHaAQ
   ToDSptePkh7EJJ6Wic7JUNpsDjYKVyqYbJnR/8MqVmFDh/uqJxUaSWroJ
   kGPvKCL1XNRj+DkV1X9ohYtPkOzWo3vPmi3/Rpw+849zYblkN6Dq+q9Ky
   S2sLZZVKh+XO81D+azEs0W1NXUO3iRWRdEqFg3jBaCkgpENoOZJfQYUT6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="381030965"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="381030965"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="908332968"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="908332968"
Received: from rauhjoha-mobl2.ger.corp.intel.com ([10.251.217.194])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 03:02:07 -0800
Date:   Tue, 14 Nov 2023 13:02:05 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc:     platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Set max_brightness before
 using it
In-Reply-To: <20231112152851.17687-2-stuart.a.hayhurst@gmail.com>
Message-ID: <9f46c613-63c2-4bc7-b938-7c9ea862a55e@linux.intel.com>
References: <20231112152851.17687-2-stuart.a.hayhurst@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, 12 Nov 2023, Stuart Hayhurst wrote:

> max_brightness would be used in ideapad_kbd_bl_brightness_get() before it was
> set, causing ideapad_kbd_bl_brightness_get() to return -EINVAL sometimes

... is used ... is set ...

> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

This lacks Fixes: + stable cc tags.

The code change seems fine.

-- 
 i.

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
