Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A37C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 15:10:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79EC6610E9
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 15:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhEDPLa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 11:11:30 -0400
Received: from mga05.intel.com ([192.55.52.43]:63481 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230246AbhEDPL3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 11:11:29 -0400
IronPort-SDR: w+C2wbYXG4uo7rRgJJ4odU/vsI6eKbIbmicCH3qy2kvQ4iPynCXv9xFfVFkdrCvLLEkqMSPern
 sn/S5uCEOM+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="283410462"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="283410462"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 08:10:34 -0700
IronPort-SDR: nLyJdrNp3CNGXSAwYbytKe0ckXjGML1xV1KD42EwKj701NzYv1e0EzfkSWgA11DN4YaWBR70DR
 6krTNmyrau8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="531093933"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 04 May 2021 08:10:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 04 May 2021 18:10:29 +0300
Date:   Tue, 4 May 2021 18:10:29 +0300
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
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification (v2)
Message-ID: <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503154647.142551-5-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> +/**
> + * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> + * @connector: connector to report the event on
> + * @data: data related to the event
> + *
> + * On some hardware a hotplug event notification may come from outside the display
> + * driver / device. An example of this is some USB Type-C setups where the hardware
> + * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
> + * status bit to the GPU's DP HPD pin.
> + *
> + * This function can be used to report these out-of-band events after obtaining
> + * a drm_connector reference through calling drm_connector_find_by_fwnode().
> + */
> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> +				     struct drm_connector_oob_hotplug_event_data *data)
> +{
> +	struct drm_connector *connector;
> +
> +	connector = drm_connector_find_by_fwnode(connector_fwnode);
> +	if (IS_ERR(connector))
> +		return;
> +
> +	if (connector->funcs->oob_hotplug_event)
> +		connector->funcs->oob_hotplug_event(connector, data);
> +
> +	drm_connector_put(connector);
> +}
> +EXPORT_SYMBOL(drm_connector_oob_hotplug_event);

So it does looks like the "data" parameter is not needed at all:

void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode)
{
	struct drm_connector *connector;

	connector = drm_connector_find_by_fwnode(connector_fwnode);
	if (IS_ERR(connector))
		return;

	if (connector->funcs->oob_hotplug_event)
		connector->funcs->oob_hotplug_event(connector);

	drm_connector_put(connector);
}

thanks,

-- 
heikki
