Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C120C433ED
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 May 2021 08:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE65961221
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 May 2021 08:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbhECIBW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 May 2021 04:01:22 -0400
Received: from mga02.intel.com ([134.134.136.20]:58342 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhECIBW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 May 2021 04:01:22 -0400
IronPort-SDR: YZVN5P/b+Wzf/NlMy+kBz1GmpzWpkdew9Lq2TheZ2DEctudbi0QXkk8pNVg6dP1K/mooCGng9k
 PDBMQGyr/PrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9972"; a="184826537"
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; 
   d="scan'208";a="184826537"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2021 01:00:28 -0700
IronPort-SDR: 0BtbVBvW4cKwxyUMXLuMNzqQR8eNMkGREOUVxBr1myj9cvQZmdyv3RaoH6saWoxMkb2gW4mAbU
 vEVYOaACypdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,268,1613462400"; 
   d="scan'208";a="530292089"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 03 May 2021 01:00:21 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 03 May 2021 11:00:20 +0300
Date:   Mon, 3 May 2021 11:00:20 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Imre Deak <imre.deak@intel.com>
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
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification
Message-ID: <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428215257.500088-5-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On Wed, Apr 28, 2021 at 11:52:52PM +0200, Hans de Goede wrote:
> +/**
> + * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
> + *
> + * Contains data about out-of-band hotplug events, signalled through
> + * drm_connector_oob_hotplug_event().
> + */
> +struct drm_connector_oob_hotplug_event_data {
> +	/**
> +	 * @connected: New connected status for the connector.
> +	 */
> +	bool connected;
> +	/**
> +	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
> +	 */
> +	int dp_lanes;
> +	/**
> +	 * @orientation: Connector orientation.
> +	 */
> +	enum typec_orientation orientation;
> +};

I don't think the orientation is relevant. It will always be "normal"
from DP PoW after muxing, no?

I'm also not sure those deatils are enough in the long run. Based on
what I've understood from our graphics team guys, for example knowing
if multi-function is preferred may be important in some cases.

+Imre.

All of that, and more, is already available in the Configuration VDO
Status VDO that the we have negotiated with the DP partner. Both those
VDOs are part of struct typec_displayport_data. I think we should
simply supply that structure to the DRM code instead of picking those
details out of it...

>  /**
>   * struct drm_tv_connector_state - TV connector related states
>   * @subconnector: selected subconnector
> @@ -1110,6 +1132,15 @@ struct drm_connector_funcs {
>  	 */
>  	void (*atomic_print_state)(struct drm_printer *p,
>  				   const struct drm_connector_state *state);
> +
> +	/**
> +	 * @oob_hotplug_event:
> +	 *
> +	 * This will get called when a hotplug-event for a drm-connector
> +	 * has been received from a source outside the display driver / device.
> +	 */
> +	void (*oob_hotplug_event)(struct drm_connector *connector,
> +				  struct drm_connector_oob_hotplug_event_data *data);

So I would not try to generalise this like that. This callback should
be USB Type-C DP altmode specific:

	void (*oob_hotplug_event)(struct drm_connector *connector,
                                  struct typec_displayport_data *data);

Or like this if the orientation can really be reversed after muxing:

	void (*oob_hotplug_event)(struct drm_connector *connector,
				  struct typec_altmode *altmode,
                                  struct typec_displayport_data *data);

You can now check the orientation separately with
typec_altmode_get_orientation() if necessary.


thanks,

-- 
heikki
