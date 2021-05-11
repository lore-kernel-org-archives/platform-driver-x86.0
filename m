Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B856C43460
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 06:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54A97616EB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 06:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhEKG4t (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 May 2021 02:56:49 -0400
Received: from mga06.intel.com ([134.134.136.31]:48355 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229931AbhEKG4s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 May 2021 02:56:48 -0400
IronPort-SDR: vcSwiJXO4UIcaiOvyUv3aEMqi40SmfAa12LT97tupf38n4p19CvHi75S7XP2YrY3UioPa/hMfG
 Hm/JDWN/fc/A==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="260635697"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="260635697"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 23:55:42 -0700
IronPort-SDR: ctgxOA3SIyHB7zc7AqfRBbjNXGNL/FaP4Fxv+v47gg7D3EWWK/XMD4cPJNu40uczbmXoAWn/6R
 dUG7fdh81jgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="536844425"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 May 2021 23:55:36 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 May 2021 09:55:36 +0300
Date:   Tue, 11 May 2021 09:55:36 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/8] usb: typec: altmodes/displayport: Make
 dp_altmode_notify() more generic
Message-ID: <YJoqaKps8L5QNJoU@kuha.fi.intel.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
 <20210505162415.531876-8-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505162415.531876-8-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 05, 2021 at 06:24:14PM +0200, Hans de Goede wrote:
> Make dp_altmode_notify() handle the dp->data.conf == 0 case too,
> rather then having separate code-paths for this in various places
> which call it.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 35 +++++++++---------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index b7f094435b00..aa669b9cf70e 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -66,10 +66,17 @@ struct dp_altmode {
>  
>  static int dp_altmode_notify(struct dp_altmode *dp)
>  {
> -	u8 state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
> +	unsigned long conf;
> +	u8 state;
> +
> +	if (dp->data.conf) {
> +		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
> +		conf = TYPEC_MODAL_STATE(state);
> +	} else {
> +		conf = TYPEC_STATE_USB;
> +	}
>  
> -	return typec_altmode_notify(dp->alt, TYPEC_MODAL_STATE(state),
> -				   &dp->data);
> +	return typec_altmode_notify(dp->alt, conf, &dp->data);
>  }
>  
>  static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
> @@ -137,21 +144,10 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  
>  static int dp_altmode_configured(struct dp_altmode *dp)
>  {
> -	int ret;
> -
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
> -
> -	if (!dp->data.conf)
> -		return typec_altmode_notify(dp->alt, TYPEC_STATE_USB,
> -					    &dp->data);
> -
> -	ret = dp_altmode_notify(dp);
> -	if (ret)
> -		return ret;
> -
>  	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
>  
> -	return 0;
> +	return dp_altmode_notify(dp);
>  }
>  
>  static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
> @@ -172,13 +168,8 @@ static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
>  	}
>  
>  	ret = typec_altmode_vdm(dp->alt, header, &conf, 2);
> -	if (ret) {
> -		if (DP_CONF_GET_PIN_ASSIGN(dp->data.conf))
> -			dp_altmode_notify(dp);
> -		else
> -			typec_altmode_notify(dp->alt, TYPEC_STATE_USB,
> -					     &dp->data);
> -	}
> +	if (ret)
> +		dp_altmode_notify(dp);
>  
>  	return ret;
>  }
> -- 
> 2.31.1

-- 
heikki
