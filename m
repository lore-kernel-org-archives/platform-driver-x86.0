Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67D8C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 14:00:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5BA461B6F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Nov 2021 14:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238058AbhKQODp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Nov 2021 09:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238060AbhKQODR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Nov 2021 09:03:17 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53630C0613B9
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Nov 2021 06:00:19 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 200so2364532pga.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Nov 2021 06:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OH6t+6GIHRg0CG1WLw2l583TcotSnecp5ZKg3XsxKq4=;
        b=ImseyeJrN9aNnVJwlmMsLJjwzLQWDpwWdK+SiqOIycbcFMCDRMonQ6/TSVls8RgDdZ
         sLW9X/aLzT6yALgv5qEjpHWSHG154iv3K6z3PVVuAz5PAT2o6acFdnfjPk2g+O7EClYv
         gpMvPhhOxdabdgf5Ejzrz8bKBjcLnGe24vZGRepIZDu4L/MABxZ/lOUknHKcowll7cIZ
         cGxsD70bldSz5bkcBK5PDE2QbdvcLg5XQgNpZd7o5YD3dw5In9m078Tlbg2NmH3yk3MV
         mtRLN2ubJEc0Cd2WQnaPV0C8rRaXjJA8O7yU3c9oyBp3KbJNYB6TU+rINfal1O50sgIL
         gcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OH6t+6GIHRg0CG1WLw2l583TcotSnecp5ZKg3XsxKq4=;
        b=uDGHxOP6q9DDKEpVpArxMo8fvSLEwKFZp/+Quf0/eYbFuXR7AvNS2dLtiRnBZdecON
         ksegQDqsPTXQShgHjwmB579XyHmxfD9DB8E1Djb03wPVt/wKwIzNZPkDSxDqlwfF9C2o
         1IdmM7jr0yrJzn11O2WU0aRpQ9rx90zn+46i/vs6CTpyrg5hw6D29OwKvdsIHhICkFB/
         t9LdNhWu7xd/prywQOAD9FOGPznkAsL6jwQbjjzWrdf4K3pAQfMOBAitVcmqW8TRZ8xh
         Qz3EnUr+pQydXfprBOefNmYnVF/wulpYn/mB9ZACRZ6Olv4SnvEaZXKYIN9ZcKG26Nqo
         5Phg==
X-Gm-Message-State: AOAM532cpzsuQNZdZz8Z+QYFHaHU3TSIfA4xdkaZdGs6S8VKsgr8+wO3
        jTRKBhd9cGMo/KYCKsuLb07aH/vLCJE/zYIfa9Oecg==
X-Google-Smtp-Source: ABdhPJxgLSxww5kuJzc6S+KFRA2AXFiV5ZpCLeyHJ2zPUYXN7gXRZmxtxajvD5DacB2ZtDMiQhDxeKpaLxanteBbE6E=
X-Received: by 2002:a63:8a4a:: with SMTP id y71mr5315024pgd.378.1637157618452;
 Wed, 17 Nov 2021 06:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20211005202322.700909-1-hdegoede@redhat.com> <20211005202322.700909-11-hdegoede@redhat.com>
In-Reply-To: <20211005202322.700909-11-hdegoede@redhat.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Wed, 17 Nov 2021 05:59:42 -0800
Message-ID: <CACK8Z6GWdv9cbzk+8Ym90+3FjeToarhBjON8RGXQ9Dc0_zAKtg@mail.gmail.com>
Subject: Re: [PATCH 10/10] drm/i915: Add privacy-screen support (v3)
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Hans,

I'm working on my platform's privacy-screen support based on your
patches, and had some (I know late) questions. Would be great if you
could please help answer. Please see inline.

On Tue, Oct 5, 2021 at 1:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add support for eDP panels with a built-in privacy screen using the
> new drm_privacy_screen class.
>
> Changes in v3:
> - Move drm_privacy_screen_get() call to intel_ddi_init_dp_connector()
>
> Changes in v2:
> - Call drm_connector_update_privacy_screen() from
>   intel_enable_ddi_dp() / intel_ddi_update_pipe_dp() instead of adding a
>   for_each_new_connector_in_state() loop to intel_atomic_commit_tail()
> - Move the probe-deferral check to the intel_modeset_probe_defer() helper
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_atomic.c  |  1 +
>  drivers/gpu/drm/i915/display/intel_ddi.c     | 16 ++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
>  3 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
> index b4e7ac51aa31..a62550711e98 100644
> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> @@ -139,6 +139,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>             new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
>             new_conn_state->base.content_type != old_conn_state->base.content_type ||
>             new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
> +           new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
>             !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
>                 crtc_state->mode_changed = true;
>
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 0d4cf7fa8720..272714e07cc6 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -25,6 +25,7 @@
>   *
>   */
>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_scdc_helper.h>
>
>  #include "i915_drv.h"
> @@ -2946,6 +2947,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
>         if (port == PORT_A && DISPLAY_VER(dev_priv) < 9)
>                 intel_dp_stop_link_train(intel_dp, crtc_state);
>
> +       drm_connector_update_privacy_screen(conn_state);
>         intel_edp_backlight_on(crtc_state, conn_state);
>
>         if (!dig_port->lspcon.active || dig_port->dp.has_hdmi_sink)
> @@ -3161,6 +3163,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
>         intel_drrs_update(intel_dp, crtc_state);
>
>         intel_backlight_update(state, encoder, crtc_state, conn_state);
> +       drm_connector_update_privacy_screen(conn_state);
>  }
>
>  void intel_ddi_update_pipe(struct intel_atomic_state *state,
> @@ -3979,6 +3982,19 @@ intel_ddi_init_dp_connector(struct intel_digital_port *dig_port)
>                 return NULL;
>         }
>
> +       if (dig_port->base.type == INTEL_OUTPUT_EDP) {
> +               struct drm_device *dev = dig_port->base.base.dev;
> +               struct drm_privacy_screen *privacy_screen;
> +
> +               privacy_screen = drm_privacy_screen_get(dev->dev, NULL);

Why pass NULL for con_id? Can we pass something more meaningful (e.g.
"eDP-1") so that the non-KMS platform components that provide the
privacy-screen can provide a more specific lookup? Or is that
information (connector name) not available at the time this call is
being made?

Thanks,

Rajat


> +               if (!IS_ERR(privacy_screen)) {
> +                       drm_connector_attach_privacy_screen_provider(&connector->base,
> +                                                                    privacy_screen);
> +               } else if (PTR_ERR(privacy_screen) != -ENODEV) {
> +                       drm_warn(dev, "Error getting privacy-screen\n");
> +               }
> +       }
> +
>         return connector;
>  }
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 86dbe366a907..84715a779d9d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -42,6 +42,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_rect.h>
>
> @@ -12769,6 +12770,8 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
>
>  bool intel_modeset_probe_defer(struct pci_dev *pdev)
>  {
> +       struct drm_privacy_screen *privacy_screen;
> +
>         /*
>          * apple-gmux is needed on dual GPU MacBook Pro
>          * to probe the panel if we're the inactive GPU.
> @@ -12776,6 +12779,13 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
>         if (vga_switcheroo_client_probe_defer(pdev))
>                 return true;
>
> +       /* If the LCD panel has a privacy-screen, wait for it */
> +       privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
> +       if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
> +               return true;
> +
> +       drm_privacy_screen_put(privacy_screen);
> +
>         return false;
>  }
>
> --
> 2.31.1
>
