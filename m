Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD4AC433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 06:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 198F861469
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 May 2021 06:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhEKG6A (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 May 2021 02:58:00 -0400
Received: from mga14.intel.com ([192.55.52.115]:64374 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229931AbhEKG57 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 May 2021 02:57:59 -0400
IronPort-SDR: 2hu1sqpPNtFsM5bbjkBnbYdhwWTZnHuJRV02S45uneOlYOBmY0rRzDK3C+2QlTWGs3v3EtZrZj
 xTp++AfWKJAA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199049358"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="199049358"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 23:56:53 -0700
IronPort-SDR: AXt6I+3BZTXV82Na/G8r1U/DmwHW+A/xtrteoQDsOcDEi74Fp05hRB+PswzxV/7z36q0dPhEXt
 CxeX9zQOciWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; 
   d="scan'208";a="536844677"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 10 May 2021 23:56:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 11 May 2021 09:56:48 +0300
Date:   Tue, 11 May 2021 09:56:48 +0300
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
Subject: Re: [PATCH 8/8] usb: typec: altmodes/displayport: Notify drm subsys
 of hotplug events
Message-ID: <YJoqsMTJnOUdg1hk@kuha.fi.intel.com>
References: <20210505162415.531876-1-hdegoede@redhat.com>
 <20210505162415.531876-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505162415.531876-9-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 05, 2021 at 06:24:15PM +0200, Hans de Goede wrote:
> Use the new drm_connector_oob_hotplug_event() functions to let drm/kms
> drivers know about DisplayPort over Type-C hotplug events.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v3:
> - Only call drm_connector_oob_hotplug_event() on hpd status bit change
> - Adjust for drm_connector_oob_hotplug_event() no longer having a data
>   argument
> 
> Changes in v2:
> - Add missing depends on DRM to TYPEC_DP_ALTMODE Kconfig entry
> ---
>  drivers/usb/typec/altmodes/Kconfig       |  1 +
>  drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++++++++++
>  2 files changed, 24 insertions(+)
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
> index aa669b9cf70e..c1d8c23baa39 100644
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
> @@ -57,11 +59,13 @@ struct dp_altmode {
>  	struct typec_displayport_data data;
>  
>  	enum dp_state state;
> +	bool hpd;
>  
>  	struct mutex lock; /* device lock */
>  	struct work_struct work;
>  	struct typec_altmode *alt;
>  	const struct typec_altmode *port;
> +	struct fwnode_handle *connector_fwnode;
>  };
>  
>  static int dp_altmode_notify(struct dp_altmode *dp)
> @@ -125,6 +129,7 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
>  static int dp_altmode_status_update(struct dp_altmode *dp)
>  {
>  	bool configured = !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
> +	bool hpd = !!(dp->data.status & DP_STATUS_HPD_STATE);
>  	u8 con = DP_STATUS_CONNECTION(dp->data.status);
>  	int ret = 0;
>  
> @@ -137,6 +142,11 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
>  		ret = dp_altmode_configure(dp, con);
>  		if (!ret)
>  			dp->state = DP_STATE_CONFIGURE;
> +	} else {
> +		if (dp->hpd != hpd) {
> +			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +			dp->hpd = hpd;
> +		}
>  	}
>  
>  	return ret;
> @@ -512,6 +522,7 @@ static const struct attribute_group dp_altmode_group = {
>  int dp_altmode_probe(struct typec_altmode *alt)
>  {
>  	const struct typec_altmode *port = typec_altmode_get_partner(alt);
> +	struct fwnode_handle *fwnode;
>  	struct dp_altmode *dp;
>  	int ret;
>  
> @@ -540,6 +551,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
>  	alt->desc = "DisplayPort";
>  	alt->ops = &dp_altmode_ops;
>  
> +	fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
> +	dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
> +	if (IS_ERR(dp->connector_fwnode))
> +		dp->connector_fwnode = NULL;
> +
>  	typec_altmode_set_drvdata(alt, dp);
>  
>  	dp->state = DP_STATE_ENTER;
> @@ -555,6 +571,13 @@ void dp_altmode_remove(struct typec_altmode *alt)
>  
>  	sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
>  	cancel_work_sync(&dp->work);
> +
> +	if (dp->connector_fwnode) {
> +		if (dp->hpd)
> +			drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +
> +		fwnode_handle_put(dp->connector_fwnode);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(dp_altmode_remove);
>  
> -- 
> 2.31.1

-- 
heikki
