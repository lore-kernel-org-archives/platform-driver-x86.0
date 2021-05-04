Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6E4C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 12:53:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8516611AE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 12:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhEDMyj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 08:54:39 -0400
Received: from mga12.intel.com ([192.55.52.136]:49125 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230346AbhEDMyj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 08:54:39 -0400
IronPort-SDR: 0BQbwveTeMZx5csEArOUwo+zXzw3S41Z8r711xumrMl0ls3TFGl5GvnR78pWlSvIpPFZvMM1Ww
 OD5ElDsEX26A==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="177511993"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="177511993"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 05:53:42 -0700
IronPort-SDR: fvSVcDAH5DChXuddF2Etdns2q6zsCelkGeI2GKbJcmhMRZ6EM5GgqaG3qgRufd6/pPEb7L4x3M
 LA22KC8Y9dug==
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="433268052"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 05:53:38 -0700
Date:   Tue, 4 May 2021 15:53:35 +0300
From:   Imre Deak <imre.deak@intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
Message-ID: <20210504125335.GA30246@ideak-desk.fi.intel.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-5-hdegoede@redhat.com>
 <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 03, 2021 at 11:00:20AM +0300, Heikki Krogerus wrote:
> Hi Hans,
> 
> On Wed, Apr 28, 2021 at 11:52:52PM +0200, Hans de Goede wrote:
> > +/**
> > + * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
> > + *
> > + * Contains data about out-of-band hotplug events, signalled through
> > + * drm_connector_oob_hotplug_event().
> > + */
> > +struct drm_connector_oob_hotplug_event_data {
> > +	/**
> > +	 * @connected: New connected status for the connector.
> > +	 */
> > +	bool connected;
> > +	/**
> > +	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
> > +	 */
> > +	int dp_lanes;
> > +	/**
> > +	 * @orientation: Connector orientation.
> > +	 */
> > +	enum typec_orientation orientation;
> > +};
> 
> I don't think the orientation is relevant. It will always be "normal"
> from DP PoW after muxing, no?
> 
> I'm also not sure those deatils are enough in the long run. Based on
> what I've understood from our graphics team guys, for example knowing
> if multi-function is preferred may be important in some cases.

Combo PHY ports - which is what this patchset is adding the notification
for - can only reverse the lane assignment. TypeC PHY ports (on ICL+)
have a more C-type aware mux in the SoC (FIA) as well, so in theory we
could have a system based on such platforms with an external mux only
switching between the USB, DP, USB+DP (MFD) modes, but leaving the plug
orientation specific muxing up to the FIA. The graphics driver is not
involved in programming the FIA though, it's done by a firmware
component, so I don't think this configuration needs to get passed.

Yes, the driver needs to know if the PD controller configured the sink
in the MFD mode (DP+USB) or in the DP-only mode. For that the number of
lanes assigned to DP is enough.

> +Imre.
> 
> All of that, and more, is already available in the Configuration VDO
> Status VDO that the we have negotiated with the DP partner. Both those
> VDOs are part of struct typec_displayport_data. I think we should
> simply supply that structure to the DRM code instead of picking those
> details out of it...
> 
> >  /**
> >   * struct drm_tv_connector_state - TV connector related states
> >   * @subconnector: selected subconnector
> > @@ -1110,6 +1132,15 @@ struct drm_connector_funcs {
> >  	 */
> >  	void (*atomic_print_state)(struct drm_printer *p,
> >  				   const struct drm_connector_state *state);
> > +
> > +	/**
> > +	 * @oob_hotplug_event:
> > +	 *
> > +	 * This will get called when a hotplug-event for a drm-connector
> > +	 * has been received from a source outside the display driver / device.
> > +	 */
> > +	void (*oob_hotplug_event)(struct drm_connector *connector,
> > +				  struct drm_connector_oob_hotplug_event_data *data);
> 
> So I would not try to generalise this like that. This callback should
> be USB Type-C DP altmode specific:
> 
> 	void (*oob_hotplug_event)(struct drm_connector *connector,
>                                   struct typec_displayport_data *data);
> 
> Or like this if the orientation can really be reversed after muxing:
> 
> 	void (*oob_hotplug_event)(struct drm_connector *connector,
> 				  struct typec_altmode *altmode,
>                                   struct typec_displayport_data *data);
> 
> You can now check the orientation separately with
> typec_altmode_get_orientation() if necessary.
> 
> 
> thanks,
> 
> -- 
> heikki
