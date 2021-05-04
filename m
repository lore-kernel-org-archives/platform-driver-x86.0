Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6019C433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 15:22:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DF0661176
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 May 2021 15:22:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhEDPXn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 11:23:43 -0400
Received: from mga18.intel.com ([134.134.136.126]:37200 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230254AbhEDPXn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 11:23:43 -0400
IronPort-SDR: sGHJIiCvWZ/8lJ2kCFG/9NIur7r9aJgG7J6drmqHiixOToIi4x6eU0kyoeWK1Osv8GJtmroFzS
 pJxEG+zDIGZA==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="185472393"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="185472393"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2021 08:22:47 -0700
IronPort-SDR: c2tsf9ETkTY+3YKRnCCN6uOZvrJUlwLHly8GXAmCTUjnCwymTJN/h9YUz7Qnjtjs0kbBiRRYJ1
 hN9w20VMjdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; 
   d="scan'208";a="531099326"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 04 May 2021 08:22:43 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 04 May 2021 18:22:42 +0300
Date:   Tue, 4 May 2021 18:22:42 +0300
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
Subject: Re: [PATCH 0/9] drm + usb-type-c: Add support for out-of-band
 hotplug notification (v2)
Message-ID: <YJFmwpdLQghdvkga@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503154647.142551-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 03, 2021 at 05:46:38PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of my work on making DP over Type-C work on devices where the
> Type-C controller does not drive the HPD pin on the GPU, but instead
> we need to forward HPD events from the Type-C controller to the DRM driver.
> 
> Changes in v2:
> - Replace the bogus "drm/connector: Make the drm_sysfs connector->kdev
>   device hold a reference to the connector" patch with:
>   "drm/connector: Give connector sysfs devices there own device_type"
>   the new patch is a dep for patch 2/9 see the patches
> 
> - Stop using a class-dev-iter, instead at a global connector list
>   to drm_connector.c and use that to find the connector by the fwnode,
>   similar to how we already do this in drm_panel.c and drm_bridge.c
> 
> - Make drm_connector_oob_hotplug_event() take a fwnode pointer as
>   argument, rather then a drm_connector pointer and let it do the
>   lookup itself. This allows making drm_connector_find_by_fwnode() a
>   drm-internal function and avoids code outside the drm subsystem
>   potentially holding on the a drm_connector reference for a longer
>   period.
> 
> This series not only touches drm subsys files but it also touches
> drivers/usb/typec/altmodes/typec_displayport.c, that file usually
> does not see a whole lot of changes. So I believe it would be best
> to just merge the entire series through drm-misc, Assuming we can
> get an ack from Greg for merging the typec_displayport.c changes
> this way.
> 
> ### 
> 
> As already mentioned in the v1 cover-letter this series replaces
> a previous attempt from quite some time ago. 
> For anyone interested here are the old (2019!) patches for this:
> 
> https://patchwork.freedesktop.org/patch/288491/
> https://patchwork.freedesktop.org/patch/288493/
> https://patchwork.freedesktop.org/patch/288495/
> 
> Last time I posted this the biggest change requested was for more info to
> be included in the event send to the DRM-subsystem, specifically sending
> the following info was requested:
> 
> 1. Which DP connector on the GPU the event is for
> 2. How many lanes are available
> 3. Connector orientation
> 
> This series is basically an entirely new approach, which no longer
> uses the notifier framework at all. Instead the Type-C code looksup
> a connector based on a fwnode (this was suggested by Heikki Krogerus)
> and then calls a new oob_hotplug_event drm_connector_func directly
> on the connector, passing the requested info as argument.
> 
> Info such as the orientation and the number of dp-lanes is now passed
> to the drm_connector_oob_hotplug_event() function as requested in the
> review of the old code, but nothing is done with it for now.
> Using this info falls well outside of my knowledge of the i915 driver
> so this is left to a follow-up patch (I will be available to test
> patches for this).

Thanks for taking care of these! It's really great that you spent the
time to do this series. I'm already thinking about what we can add
after these are in. I think support for re-configuration, so support
for changing the pin-configuration in runtime is going to be needed
soon after these. But first things first (sorry, I'm getting ahead of
myself).


thanks,

-- 
heikki
