Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92C0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 09:12:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B570D61185
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Sep 2021 09:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235160AbhIPJN2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:13:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55946 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234462AbhIPJN1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 05:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631783527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2aNJ+QUQUznI2p0/6l0UIVDoztEwnXWLrzbhf3qJBjI=;
        b=VyPAJaqp56mZBdktuxvlScFXFJtv6ygVZtynYA4+zttyJ9hP+jn8srFQ8nLFrrj79EDe1w
        kR2Nx3QT/3Z4QZULu1KQhiIWwnFZ5eWEnKlpn3mOvnzMK0NsYq10kb1XpQciCMwuW6s88I
        vzlbn9OE/iVjhym0waN3idyfsSr+ZYQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-_FO0uTKJPFytePvZONOSNA-1; Thu, 16 Sep 2021 05:12:06 -0400
X-MC-Unique: _FO0uTKJPFytePvZONOSNA-1
Received: by mail-ed1-f69.google.com with SMTP id h24-20020a50cdd8000000b003d8005fe2f8so626418edj.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Sep 2021 02:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2aNJ+QUQUznI2p0/6l0UIVDoztEwnXWLrzbhf3qJBjI=;
        b=SJfgxB+UKDeRSjn8VTulMR7vd57tOjQi5yb25pHCA2jtNNBKJHPkW7CL1qz8iHHgTi
         IIrNnhqySk1Kdm2VU0hUHje4uVO5mXGWOFv1i6NH1o0xHIbhZ8J+BixG+kYenr2qQjAT
         4ZymBJlQ+0uzVFRid0ZxKbSbMYG2nQSjHd1b+D6O5JRCpuULvszi0wDonPzwS3PHrRvy
         i3pH78Q1z+vhp4eTey0c9wIYeV6GzMESEicwL/5wdwbWDRo4G6FfzdgFJYOfcaGQqsZJ
         kFARB9jh1zJOh/s6xLHg8aux4/xXtKKeTqm8tYghRTVt+Tcczv7j+Ossm3sNDhTD4HU6
         Q/pA==
X-Gm-Message-State: AOAM5337ef+F7WYlbqcTmpFql4J7xDcCsTh293Lhlf+W/q8Hy6E/KXNq
        W/Ir+vozM3506VP/1mRUmtx6UZW0VaD1kYz2SHcQIr1fBvW2VbEJrdJW5eCT3hW6Gdb3QZi37DU
        nk9SU/u4lZIePSxeXbonUafJnakacjPGcBp7dxiPEO5rFuX6n1LgVVrUbjpooffmUKD1KoAvVqI
        nf1xr1Be6jeA==
X-Received: by 2002:a17:906:180a:: with SMTP id v10mr5220736eje.112.1631783523228;
        Thu, 16 Sep 2021 02:12:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyknKnr0Dxiv9lTbfFsBdPlp0y/0aaDNKDTYxFQ3Whn+dwqnLbbHGrvAtBLBdztWhj/Uzx7sg==
X-Received: by 2002:a17:906:180a:: with SMTP id v10mr5220690eje.112.1631783522882;
        Thu, 16 Sep 2021 02:12:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id mq25sm943367ejc.71.2021.09.16.02.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 02:12:02 -0700 (PDT)
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
To:     Lyude Paul <lyude@redhat.com>,
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
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com>
 <65286f7effc8b336f28f0c6f92fa9ae65e6e621b.camel@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e58d334a-ce05-29a9-d0f5-39068e2b94b9@redhat.com>
Date:   Thu, 16 Sep 2021 11:12:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <65286f7effc8b336f28f0c6f92fa9ae65e6e621b.camel@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/15/21 11:11 PM, Lyude Paul wrote:
> On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
>> Add support for eDP panels with a built-in privacy screen using the
>> new drm_privacy_screen class.
>>
>> One thing which stands out here is the addition of these 2 lines to
>> intel_atomic_commit_tail:
>>
>>         for_each_new_connector_in_state(&state->base, connector, ...
>>                 drm_connector_update_privacy_screen(connector, state);
>>
>> It may seem more logical to instead take care of updating the
>> privacy-screen state by marking the crtc as needing a modeset and then
>> do this in both the encoder update_pipe (for fast-sets) and enable
>> (for full modesets) callbacks. But ATM these callbacks only get passed
>> the new connector_state and these callbacks are all called after
>> drm_atomic_helper_swap_state() at which point there is no way to get
>> the old state from the new state.
> 
> I was going to suggest that you workaround this simply by adding a variable
> that corresponds to the most recently committed privacy screen state somewhere
> in a driver private structure. But, then I realized that's basically the same
> as what you're doing now except that your current solution stores said state
> in a shared struct. So, I think you probably do have the right idea here as
> long as we don't get any non-ACPI providers in the future. This also seems
> like something that wouldn't be difficult to fixup down the line if that ends
> up changing.

Ack, this is all kernel internal stuff so we can always rework it if necessary.

Regards,

Hans




> 
>>
>> Without access to the old state, we do not know if the sw_state of
>> the privacy-screen has changes so we would need to call
>> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
>> since all current known privacy-screen providers use ACPI calls which
>> are somewhat expensive to make.
>>
>> Also, as all providers use ACPI calls, rather then poking GPU registers,
>> there is no need to order this together with other encoder operations.
>> Since no GPU poking is involved having this as a separate step of the
>> commit process actually is the logical thing to do.
>>
>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c |  5 +++++
>>  drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
>>  drivers/gpu/drm/i915/i915_pci.c              | 12 ++++++++++++
>>  3 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> b/drivers/gpu/drm/i915/display/intel_display.c
>> index 5560d2f4c352..7285873d329a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -10140,6 +10140,8 @@ static void intel_atomic_commit_tail(struct
>> intel_atomic_state *state)
>>         struct drm_device *dev = state->base.dev;
>>         struct drm_i915_private *dev_priv = to_i915(dev);
>>         struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>> +       struct drm_connector_state *new_connector_state;
>> +       struct drm_connector *connector;
>>         struct intel_crtc *crtc;
>>         u64 put_domains[I915_MAX_PIPES] = {};
>>         intel_wakeref_t wakeref = 0;
>> @@ -10237,6 +10239,9 @@ static void intel_atomic_commit_tail(struct
>> intel_atomic_state *state)
>>                         intel_color_load_luts(new_crtc_state);
>>         }
>>  
>> +       for_each_new_connector_in_state(&state->base, connector,
>> new_connector_state, i)
>> +               drm_connector_update_privacy_screen(connector, &state-
>>> base);
>> +
>>         /*
>>          * Now that the vblank has passed, we can go ahead and program the
>>          * optimal watermarks on platforms that need two-step watermark
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index 7f8e8865048f..3aa2072cccf6 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -37,6 +37,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_dp_helper.h>
>>  #include <drm/drm_edid.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/drm_probe_helper.h>
>>  
>>  #include "g4x_dp.h"
>> @@ -5217,6 +5218,7 @@ static bool intel_edp_init_connector(struct intel_dp
>> *intel_dp,
>>         struct drm_connector *connector = &intel_connector->base;
>>         struct drm_display_mode *fixed_mode = NULL;
>>         struct drm_display_mode *downclock_mode = NULL;
>> +       struct drm_privacy_screen *privacy_screen;
>>         bool has_dpcd;
>>         enum pipe pipe = INVALID_PIPE;
>>         struct edid *edid;
>> @@ -5308,6 +5310,14 @@ static bool intel_edp_init_connector(struct intel_dp
>> *intel_dp,
>>                                 fixed_mode->hdisplay, fixed_mode->vdisplay);
>>         }
>>  
>> +       privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>> +       if (!IS_ERR(privacy_screen)) {
>> +               drm_connector_attach_privacy_screen_provider(connector,
>> +                                                           
>> privacy_screen);
>> +       } else if (PTR_ERR(privacy_screen) != -ENODEV) {
>> +               drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
>> +       }
>> +
>>         return true;
>>  
>>  out_vdd_off:
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c
>> b/drivers/gpu/drm/i915/i915_pci.c
>> index 146f7e39182a..d6913f567a1c 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/vga_switcheroo.h>
>>  
>>  #include <drm/drm_drv.h>
>> +#include <drm/drm_privacy_screen_consumer.h>
>>  #include <drm/i915_pciids.h>
>>  
>>  #include "i915_drv.h"
>> @@ -1167,6 +1168,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const
>> struct pci_device_id *ent)
>>  {
>>         struct intel_device_info *intel_info =
>>                 (struct intel_device_info *) ent->driver_data;
>> +       struct drm_privacy_screen *privacy_screen;
>>         int err;
>>  
>>         if (intel_info->require_force_probe &&
>> @@ -1195,7 +1197,17 @@ static int i915_pci_probe(struct pci_dev *pdev, const
>> struct pci_device_id *ent)
>>         if (vga_switcheroo_client_probe_defer(pdev))
>>                 return -EPROBE_DEFER;
>>  
>> +       /*
>> +        * We do not handle -EPROBE_DEFER further into the probe process, so
>> +        * check if we have a laptop-panel privacy-screen for which the
>> driver
>> +        * has not loaded yet here.
>> +        */
>> +       privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>> +       if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -
>> EPROBE_DEFER)
>> +               return -EPROBE_DEFER;
>> +
>>         err = i915_driver_probe(pdev, ent);
>> +       drm_privacy_screen_put(privacy_screen);
>>         if (err)
>>                 return err;
>>  
> 

