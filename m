Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AB9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 13:46:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E21FB60F21
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 13:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240326AbhIPNrY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Sep 2021 09:47:24 -0400
Received: from mga07.intel.com ([134.134.136.100]:24087 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240283AbhIPNrY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 09:47:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="286251038"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="scan'208";a="286251038"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 06:45:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="scan'208";a="509310365"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
  by fmsmga008.fm.intel.com with SMTP; 16 Sep 2021 06:45:44 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 16 Sep 2021 16:45:43 +0300
Date:   Thu, 16 Sep 2021 16:45:43 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
Message-ID: <YUNKh9xcIGoi1eol@intel.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210906073519.4615-10-hdegoede@redhat.com>
X-Patchwork-Hint: comment
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 06, 2021 at 09:35:19AM +0200, Hans de Goede wrote:
> Add support for eDP panels with a built-in privacy screen using the
> new drm_privacy_screen class.
> 
> One thing which stands out here is the addition of these 2 lines to
> intel_atomic_commit_tail:
> 
> 	for_each_new_connector_in_state(&state->base, connector, ...
> 		drm_connector_update_privacy_screen(connector, state);
> 
> It may seem more logical to instead take care of updating the
> privacy-screen state by marking the crtc as needing a modeset and then
> do this in both the encoder update_pipe (for fast-sets) and enable
> (for full modesets) callbacks. But ATM these callbacks only get passed
> the new connector_state and these callbacks are all called after
> drm_atomic_helper_swap_state() at which point there is no way to get
> the old state from the new state.

Pretty sure the full atomic state is plumbed all the way
down these days.

> 
> Without access to the old state, we do not know if the sw_state of
> the privacy-screen has changes so we would need to call
> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
> since all current known privacy-screen providers use ACPI calls which
> are somewhat expensive to make.

I doubt anyone is going to care about a bit of overhead for a modeset.
The usual rule is that a modeset doesn't skip anything. That way we
can be 100% sure we remeber to update everythinbg. For fastsets I guess
one could argue skipping it if not needed, but not sure even that is
warranted.

The current code you have in there is cettainly 110% dodgy. Since the
sw_state is stored in the connector state I presume it's at least
trying to be an atomic property, which means you shouldn't go poking
at it after the swap_state ever. swap_state just swaps the pointers
which is all that you need. So at least that part should get nuked.
The immutable hw_state I guess should get updated when we program the
actual hw.

-- 
Ville Syrjälä
Intel
