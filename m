Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B13EC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 10:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76DA261157
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 10:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbhEEKSe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 06:18:34 -0400
Received: from mga03.intel.com ([134.134.136.65]:3139 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232448AbhEEKSd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 06:18:33 -0400
IronPort-SDR: 5sHAOMOmbbA/WqYUO/nW8gXvx0h5lBsfydeRyFKTulmgYo8GI71uiZpghWSF9GdRdVbxEGYtTc
 xKC400X3PciQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="198233254"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="198233254"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 03:17:37 -0700
IronPort-SDR: WeJo6OE47B5MG8/tRuB6r+H7FEUNoUKOCw6h0Kh9WZs7DH1FFmri16pnnV03JDdepJj1yknsq5
 7ig55i4+G66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="531717347"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 05 May 2021 03:17:31 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 05 May 2021 13:17:30 +0300
Date:   Wed, 5 May 2021 13:17:30 +0300
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 8/9] usb: typec: altmodes/displayport: Notify drm subsys
 of hotplug events
Message-ID: <YJJwukxJfi9gGKcf@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503154647.142551-9-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On Mon, May 03, 2021 at 05:46:46PM +0200, Hans de Goede wrote:
> Use the new drm_connector_find_by_fwnode() and
> drm_connector_oob_hotplug_event() functions to let drm/kms drivers
> know about DisplayPort over Type-C hotplug events.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Add missing depends on DRM to TYPEC_DP_ALTMODE Kconfig entry
> ---
>  drivers/usb/typec/altmodes/Kconfig       |  1 +
>  drivers/usb/typec/altmodes/displayport.c | 40 +++++++++++++++++++++++-
>  2 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> index 60d375e9c3c7..1a6b5e872b0d 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -4,6 +4,7 @@ menu "USB Type-C Alternate Mode drivers"
>  
>  config TYPEC_DP_ALTMODE
>  	tristate "DisplayPort Alternate Mode driver"
> +	depends on DRM
>  	help
>  	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
>  	  displays and adapters to be attached to the USB Type-C
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index aa669b9cf70e..f00dfc5c14b6 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -11,8 +11,10 @@
>  #include <linux/delay.h>
>  #include <linux/mutex.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_dp.h>
> +#include <drm/drm_connector.h>
>  #include "displayport.h"
>  
>  #define DP_HEADER(_dp, ver, cmd)	(VDO((_dp)->alt->svid, 1, ver, cmd)	\
> @@ -62,12 +64,30 @@ struct dp_altmode {
>  	struct work_struct work;
>  	struct typec_altmode *alt;
>  	const struct typec_altmode *port;
> +	struct fwnode_handle *connector_fwnode;
>  };
>  
> +static void dp_altmode_notify_connector(struct dp_altmode *dp)
> +{
> +	struct drm_connector_oob_hotplug_event_data data = { };
> +	u8 pin_assign = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
> +
> +	data.connected = dp->data.status & DP_STATUS_HPD_STATE;
> +	data.orientation = typec_altmode_get_orientation(dp->alt);
> +
> +	if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
> +		data.dp_lanes = 4;
> +	else if (pin_assign & DP_PIN_ASSIGN_MULTI_FUNC_MASK)
> +		data.dp_lanes = 2;
> +
> +	drm_connector_oob_hotplug_event(dp->connector_fwnode, &data);
> +}
> +
>  static int dp_altmode_notify(struct dp_altmode *dp)
>  {
>  	unsigned long conf;
>  	u8 state;
> +	int ret;
>  
>  	if (dp->data.conf) {
>  		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
> @@ -76,7 +96,12 @@ static int dp_altmode_notify(struct dp_altmode *dp)
>  		conf = TYPEC_STATE_USB;
>  	}
>  
> -	return typec_altmode_notify(dp->alt, conf, &dp->data);
> +	ret = typec_altmode_notify(dp->alt, conf, &dp->data);
> +	if (ret)
> +		return ret;
> +
> +	dp_altmode_notify_connector(dp);

That is now going to be always called after configuration, right? The
HPD is not necessarily issued at that point.

I think that should be called from dp_altmode_status_update(), and
probable only if there really is HPD IRQ or HPD State changes... I
think?

> +	return 0;
>  }

thanks,

-- 
heikki
