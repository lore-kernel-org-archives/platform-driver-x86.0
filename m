Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE519C43460
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 09:50:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84D0C61002
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 09:50:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232265AbhEEJvv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 05:51:51 -0400
Received: from mga17.intel.com ([192.55.52.151]:13496 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232256AbhEEJvv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 05:51:51 -0400
IronPort-SDR: czSfKYUch3ZWDqlU2FVGyv3hYXiLWCULsXGl5gIKyCsI2N4QcBMMlXZtaDyA201MFHUpJfC+KB
 oC02lgP46O8w==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="178399130"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="178399130"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2021 02:50:54 -0700
IronPort-SDR: KmhCI3dzVEZ+ZbXjihfmYAKWqO9AFO7gzEVcFElUZ26IIHJ9fT/4SnE8b2p+bkRvMpbu26xskr
 gSWYHZXXc6qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
   d="scan'208";a="531649779"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 05 May 2021 02:50:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 05 May 2021 12:50:49 +0300
Date:   Wed, 5 May 2021 12:50:49 +0300
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
 notification (v2)
Message-ID: <YJJqeVzS8do3F8wx@kuha.fi.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-5-hdegoede@redhat.com>
 <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
 <326621fe-cc4e-ad77-c87e-922a655bfbc8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <326621fe-cc4e-ad77-c87e-922a655bfbc8@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 04, 2021 at 05:35:49PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 5/4/21 5:10 PM, Heikki Krogerus wrote:
> >> +/**
> >> + * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >> + * @connector: connector to report the event on
> >> + * @data: data related to the event
> >> + *
> >> + * On some hardware a hotplug event notification may come from outside the display
> >> + * driver / device. An example of this is some USB Type-C setups where the hardware
> >> + * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
> >> + * status bit to the GPU's DP HPD pin.
> >> + *
> >> + * This function can be used to report these out-of-band events after obtaining
> >> + * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >> + */
> >> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> >> +				     struct drm_connector_oob_hotplug_event_data *data)
> >> +{
> >> +	struct drm_connector *connector;
> >> +
> >> +	connector = drm_connector_find_by_fwnode(connector_fwnode);
> >> +	if (IS_ERR(connector))
> >> +		return;
> >> +
> >> +	if (connector->funcs->oob_hotplug_event)
> >> +		connector->funcs->oob_hotplug_event(connector, data);
> >> +
> >> +	drm_connector_put(connector);
> >> +}
> >> +EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
> > 
> > So it does looks like the "data" parameter is not needed at all:
> 
> Well Imre did indicate that having the number of lanes is useful, so
> for the next version I'll drop the orientation but I plan to keep
> the number of lanes if that is ok with you.
> 
> Not having passing along this info was one of the reasons why my
> previous attempt at this was nacked, so dropping it all together
> feels wrong.

If you need to pass any information to the function, then you need to
pass all the information that we have. Don't start with abstraction.
First create a dedicated API, and then, only if we really have another
user for it, we can add an abstraction layer that both users can use.
All cases are going to be different. We don't know how the abstraction
/ generalisation should look like before we have at least two real
users (ideally more than two, actually). Right now we can not even say
for sure that generalising the API is even possible.

I would not make a huge deal out of this unless I wasn't myself being
told by guys like Greg KH in the past to drop my attempts to
"generalize" things from the beginning when I only had a single user.
By doing so you'll not only force all ends, the source of the data
(the typec drivers in this case) as well as the consumer (i915), to be
always changed together, it will also confuse things. We are not
always going to be able to tell the lane count for example like we can
with USB Type-C, so i915 can't really rely on that information.

Right now we also don't know what exact details i915 (or what ever GPU
driver) needs. We can only say for sure that some details are going to
be needed. Trying to guess and cherry-pick the details now does not
makes sense because of that reason too.

So just make this API USB Type-C DP Alt Mode specific API first, and
supply it everything we have.


thanks,

-- 
heikki
