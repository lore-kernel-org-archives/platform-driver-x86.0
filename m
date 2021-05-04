Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D4BC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 14:52:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2A3E61006
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 14:52:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhEDOxl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 10:53:41 -0400
Received: from mga09.intel.com ([134.134.136.24]:11720 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231326AbhEDOxl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 10:53:41 -0400
IronPort-SDR: ga4yvMvjaUYwnYHVVrDYNeld+pAndwlAIKHBpLHC6wCZ48TOMT5DC06g3d6Ks5QrT6cCBJmF3/
 BBeWZ2hH77fg==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="198083717"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="198083717"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 07:52:45 -0700
IronPort-SDR: vU+uxj5bo8hDLN6NcpjGw6Pky+yuJ7aER+QDsY62qHxO4ixpBbwju6LlsRENQoKe/I1++IH5Mj
 l8zTA6jmHa8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="531087248"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 04 May 2021 07:52:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 04 May 2021 17:52:40 +0300
Date:   Tue, 4 May 2021 17:52:40 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Imre Deak <imre.deak@intel.com>,
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
Message-ID: <YJFfuF3UGP0TZrVw@kuha.fi.intel.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-5-hdegoede@redhat.com>
 <YI+tlE35i+6F/WUO@kuha.fi.intel.com>
 <00e380b2-0376-0ddb-9b0e-342779b7fc06@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00e380b2-0376-0ddb-9b0e-342779b7fc06@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 03, 2021 at 04:35:29PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/3/21 10:00 AM, Heikki Krogerus wrote:
> > Hi Hans,
> > 
> > On Wed, Apr 28, 2021 at 11:52:52PM +0200, Hans de Goede wrote:
> >> +/**
> >> + * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
> >> + *
> >> + * Contains data about out-of-band hotplug events, signalled through
> >> + * drm_connector_oob_hotplug_event().
> >> + */
> >> +struct drm_connector_oob_hotplug_event_data {
> >> +	/**
> >> +	 * @connected: New connected status for the connector.
> >> +	 */
> >> +	bool connected;
> >> +	/**
> >> +	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
> >> +	 */
> >> +	int dp_lanes;
> >> +	/**
> >> +	 * @orientation: Connector orientation.
> >> +	 */
> >> +	enum typec_orientation orientation;
> >> +};
> > 
> > I don't think the orientation is relevant. It will always be "normal"
> > from DP PoW after muxing, no?
> 
> That is what I thought to, but during the discussion of my previous attempt
> at this one of the i915 devs mentioned that in some cases the muxes manage
> to swap the lane order when the connector upside-down and at least the
> Intel GPUs can correct for this on the GPU side, so they asked for this
> info to be included.
> 
> > I'm also not sure those deatils are enough in the long run. Based on
> > what I've understood from our graphics team guys, for example knowing
> > if multi-function is preferred may be important in some cases.
> 
> The current data being passed is just intended as a starting point,
> this is purely a kernel internal API so we can easily add more
> data to the struct. As I mentioned in the cover-letter the current
> oob_hotplug handler which the i915 patch adds to the i915 driver does
> not actually do anything with the data.  ATM it is purely there to
> demonstrate that the ability to pass relevant data is there now
> (which was an issue with the previous attempt). I believe the current
> code is fine as a PoC of "pass event data" once GPU drivers actually
> start doing something with the data we can extend or outright replace
> it without issues.

Ah, if there is nothing using that information yet, then just don't
pass it at all for now. As you said, it's kernel internal API, we can
change it later if needed.

> > All of that, and more, is already available in the Configuration VDO
> > Status VDO that the we have negotiated with the DP partner. Both those
> > VDOs are part of struct typec_displayport_data. I think we should
> > simply supply that structure to the DRM code instead of picking those
> > details out of it...
> 
> I'm not sure I like the idea of passing the raw VDO, but if the
> DRM folks think that would be useful we can certainly add it.

Why are you against passing all the data that we have? What is the
benefit in picking only certain details out of an object that has a
standard format, and constructing a customised object for those
details instead?


thanks,

-- 
heikki
