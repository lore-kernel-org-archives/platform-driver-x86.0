Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3273BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 21:11:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 169B961131
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 21:11:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhIOVMi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Sep 2021 17:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30593 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232179AbhIOVMi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Sep 2021 17:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631740278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g6BfT/bWvfgSQj6yRG8JvR0JOGusdA0R9kseiicnTX0=;
        b=UYikE4Y7NjlEZ78yzH3oPJedN/3JUPsTlV1iB1vSknu0/HnyCLGKeeHvMeDqoc5lvKRm9K
        vFz6xYHYq0pv0twPzM8BUYSOzKR0KS7YU7A2HKo+e7RKYQJW49QobH7FNF+k+CyYDX7PoW
        1Ta88ephMpFUCYg9PBFa6pGR6MQFhNI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-W_Qi5-vyM1Gbv8ear-mxiw-1; Wed, 15 Sep 2021 17:11:17 -0400
X-MC-Unique: W_Qi5-vyM1Gbv8ear-mxiw-1
Received: by mail-qv1-f70.google.com with SMTP id a15-20020a0ce34f000000b0037a944f655dso11489880qvm.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Sep 2021 14:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=g6BfT/bWvfgSQj6yRG8JvR0JOGusdA0R9kseiicnTX0=;
        b=be4EfAyGclZ/QRNzmzWFiHY2p7T9M9lo1VBDTXGEiL1Prh9Da/flcHd7ymLN7HKfNK
         Xinr9oni+0pOWqilhvTRDOGIo1CPoBtxqed0M+iz2uGjgjMPR5xGrYKmOeBo/yKx2657
         2uGRec6kTsvN40BW+deMaLleGu0aF74RP78PtRjGneF4SkFVVYc/Rsx+HTX5vBNVV5EO
         xXnxJEw6ptimgdbfoaJvlsmOmwijPBhrGm7Ghm/Oc7llTFQjvDNT/CLEt0YpudM6cJ1q
         s2oRVC1RcJu9nYevGKOn/nwCzRXuLrTqrbqSRkOxtGJjt9gAV7K4ZkqxzQWdbEib+hCz
         Wu3A==
X-Gm-Message-State: AOAM531gpmVMX9+tGMJy+bjC6dXAzDn0/EE2GN9bUfUdab0FXGdEPsxb
        tQB2CmwvocBEGMuqbZFIZa7yE1c+HRDWKEFwQaCPwPQXTQTwHuANG0RMNS3aE2kMECaz5/9rZK4
        qlOVsyz//xcHsD07hPPbPyKfviGUAB/wH/A==
X-Received: by 2002:ad4:4ab1:: with SMTP id i17mr1814735qvx.11.1631740276270;
        Wed, 15 Sep 2021 14:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyk+0M3TmhG/pOqAeC0dVVTXyMcbdKUArP5owyG8E+WZ5dRwQwZrfy7hjk+95sKVoXlmF4fw==
X-Received: by 2002:ad4:4ab1:: with SMTP id i17mr1814720qvx.11.1631740276095;
        Wed, 15 Sep 2021 14:11:16 -0700 (PDT)
Received: from [192.168.8.206] (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id h6sm772062qtn.51.2021.09.15.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 14:11:15 -0700 (PDT)
Message-ID: <65286f7effc8b336f28f0c6f92fa9ae65e6e621b.camel@redhat.com>
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
From:   Lyude Paul <lyude@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Date:   Wed, 15 Sep 2021 17:11:13 -0400
In-Reply-To: <20210906073519.4615-10-hdegoede@redhat.com>
References: <20210906073519.4615-1-hdegoede@redhat.com>
         <20210906073519.4615-10-hdegoede@redhat.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
> Add support for eDP panels with a built-in privacy screen using the
> new drm_privacy_screen class.
> 
> One thing which stands out here is the addition of these 2 lines to
> intel_atomic_commit_tail:
> 
>         for_each_new_connector_in_state(&state->base, connector, ...
>                 drm_connector_update_privacy_screen(connector, state);
> 
> It may seem more logical to instead take care of updating the
> privacy-screen state by marking the crtc as needing a modeset and then
> do this in both the encoder update_pipe (for fast-sets) and enable
> (for full modesets) callbacks. But ATM these callbacks only get passed
> the new connector_state and these callbacks are all called after
> drm_atomic_helper_swap_state() at which point there is no way to get
> the old state from the new state.

I was going to suggest that you workaround this simply by adding a variable
that corresponds to the most recently committed privacy screen state somewhere
in a driver private structure. But, then I realized that's basically the same
as what you're doing now except that your current solution stores said state
in a shared struct. So, I think you probably do have the right idea here as
long as we don't get any non-ACPI providers in the future. This also seems
like something that wouldn't be difficult to fixup down the line if that ends
up changing.

> 
> Without access to the old state, we do not know if the sw_state of
> the privacy-screen has changes so we would need to call
> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
> since all current known privacy-screen providers use ACPI calls which
> are somewhat expensive to make.
> 
> Also, as all providers use ACPI calls, rather then poking GPU registers,
> there is no need to order this together with other encoder operations.
> Since no GPU poking is involved having this as a separate step of the
> commit process actually is the logical thing to do.
> 
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c |  5 +++++
>  drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
>  drivers/gpu/drm/i915/i915_pci.c              | 12 ++++++++++++
>  3 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> index 5560d2f4c352..7285873d329a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -10140,6 +10140,8 @@ static void intel_atomic_commit_tail(struct
> intel_atomic_state *state)
>         struct drm_device *dev = state->base.dev;
>         struct drm_i915_private *dev_priv = to_i915(dev);
>         struct intel_crtc_state *new_crtc_state, *old_crtc_state;
> +       struct drm_connector_state *new_connector_state;
> +       struct drm_connector *connector;
>         struct intel_crtc *crtc;
>         u64 put_domains[I915_MAX_PIPES] = {};
>         intel_wakeref_t wakeref = 0;
> @@ -10237,6 +10239,9 @@ static void intel_atomic_commit_tail(struct
> intel_atomic_state *state)
>                         intel_color_load_luts(new_crtc_state);
>         }
>  
> +       for_each_new_connector_in_state(&state->base, connector,
> new_connector_state, i)
> +               drm_connector_update_privacy_screen(connector, &state-
> >base);
> +
>         /*
>          * Now that the vblank has passed, we can go ahead and program the
>          * optimal watermarks on platforms that need two-step watermark
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> index 7f8e8865048f..3aa2072cccf6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -37,6 +37,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #include "g4x_dp.h"
> @@ -5217,6 +5218,7 @@ static bool intel_edp_init_connector(struct intel_dp
> *intel_dp,
>         struct drm_connector *connector = &intel_connector->base;
>         struct drm_display_mode *fixed_mode = NULL;
>         struct drm_display_mode *downclock_mode = NULL;
> +       struct drm_privacy_screen *privacy_screen;
>         bool has_dpcd;
>         enum pipe pipe = INVALID_PIPE;
>         struct edid *edid;
> @@ -5308,6 +5310,14 @@ static bool intel_edp_init_connector(struct intel_dp
> *intel_dp,
>                                 fixed_mode->hdisplay, fixed_mode->vdisplay);
>         }
>  
> +       privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
> +       if (!IS_ERR(privacy_screen)) {
> +               drm_connector_attach_privacy_screen_provider(connector,
> +                                                           
> privacy_screen);
> +       } else if (PTR_ERR(privacy_screen) != -ENODEV) {
> +               drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
> +       }
> +
>         return true;
>  
>  out_vdd_off:
> diff --git a/drivers/gpu/drm/i915/i915_pci.c
> b/drivers/gpu/drm/i915/i915_pci.c
> index 146f7e39182a..d6913f567a1c 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -25,6 +25,7 @@
>  #include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_privacy_screen_consumer.h>
>  #include <drm/i915_pciids.h>
>  
>  #include "i915_drv.h"
> @@ -1167,6 +1168,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const
> struct pci_device_id *ent)
>  {
>         struct intel_device_info *intel_info =
>                 (struct intel_device_info *) ent->driver_data;
> +       struct drm_privacy_screen *privacy_screen;
>         int err;
>  
>         if (intel_info->require_force_probe &&
> @@ -1195,7 +1197,17 @@ static int i915_pci_probe(struct pci_dev *pdev, const
> struct pci_device_id *ent)
>         if (vga_switcheroo_client_probe_defer(pdev))
>                 return -EPROBE_DEFER;
>  
> +       /*
> +        * We do not handle -EPROBE_DEFER further into the probe process, so
> +        * check if we have a laptop-panel privacy-screen for which the
> driver
> +        * has not loaded yet here.
> +        */
> +       privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
> +       if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -
> EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +
>         err = i915_driver_probe(pdev, ent);
> +       drm_privacy_screen_put(privacy_screen);
>         if (err)
>                 return err;
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

