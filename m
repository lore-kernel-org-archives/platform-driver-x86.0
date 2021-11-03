Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5668BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Nov 2021 23:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37058611C5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Nov 2021 23:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhKCXTg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Nov 2021 19:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhKCXTf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Nov 2021 19:19:35 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D54C061714
        for <platform-driver-x86@vger.kernel.org>; Wed,  3 Nov 2021 16:16:58 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n8so4131509plf.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Nov 2021 16:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nPUeRo4P9qCmQn4DuIC8HZxfw8STfSLwfGHQpdZPJK0=;
        b=lJ54p1bpc5dNl1qn8G0PyZcQQ7nf9cImYbZNUZZkV6erYIXEvTEB00hKRtK8Ja949x
         EenvlthZ4PQ7D4q4Q2o2XFB3ae/TwEvA5VLlTp1v2abwL+aRNFIM2+Xza+cDzM8juKZx
         PBoqhnkoOoQYYQ7bCuwPRnxEx3AvxOFeYzV15E9Q4RrHQHyk+JAlSpokM4XRZU0/CMVm
         GGjMga7P9p4fylESj1nA8LSyrtIG1KMBuLloG2wXMoh74Y1vDYwWiYAd4xa7Gfy5Ps1o
         0RPm6Nq9q+fjGbGRES2xEmSTx/xMzj1FuO65R0ubXTEYQfauL8bo9RK61PldfsQ0PXhd
         sgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nPUeRo4P9qCmQn4DuIC8HZxfw8STfSLwfGHQpdZPJK0=;
        b=JsOy7VdEPio08V4A9/CyzpcFS5RyJrtbnQ+s1cVAJfHhfFmKoluelB0UrFUucuQiR2
         +aym6mtmUxMBEkLuZS2Ju/ZQDkeUEmGLZyEVzZygH6J4im2p0aIA9nSZxqHuWEaCCdpm
         XSTG+vzleo+WMYuiJQKw26g/I/B/VZSh7fen9J2rNGGbDnbqT78X+xtvROi3NDQQGY90
         uMEPkv2KeowspNvEZcRpvh4yum46uBgGdbEiLE1DLea79HhGBhdkCSzUtTIXKe1lEZhL
         FpopRWky+I5LlZVyxR55K9AGucF+HwaKnI1s4SiN7gXQS1uo2kuKcYW7Qdi6/RrbOIdk
         +G4Q==
X-Gm-Message-State: AOAM533RtY4k5s4tGtFTj0I+6o8vpKMwPcZz3V1SCAJZV9yqRSBCc/gs
        93xbPvftCFlcXrc2aDdVlVopl8oChLph9h5eqA46hg==
X-Google-Smtp-Source: ABdhPJzKhlfXKTBHLc2xE+rbAQct0n9ITCxXdeR2vJAAU+30V1dqR+a5D2swN4o40sRQWrb/PdQWaP7KzvwMnJMl7aY=
X-Received: by 2002:a17:90a:db81:: with SMTP id h1mr18291271pjv.46.1635981418075;
 Wed, 03 Nov 2021 16:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211005202322.700909-1-hdegoede@redhat.com> <20211005202322.700909-11-hdegoede@redhat.com>
 <YWdWyTVXMA3907no@intel.com>
In-Reply-To: <YWdWyTVXMA3907no@intel.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Wed, 3 Nov 2021 16:16:21 -0700
Message-ID: <CACK8Z6GPu=Y_-0rrgN-S=HUrgqn_OoU0XroxAp--N0JKZxOnEQ@mail.gmail.com>
Subject: Re: [PATCH 10/10] drm/i915: Add privacy-screen support (v3)
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Hans,

Thanks a lot for working on this diligently and getting almost all of
it finally merged!

On Wed, Oct 13, 2021 at 2:59 PM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Oct 05, 2021 at 10:23:22PM +0200, Hans de Goede wrote:
> > Add support for eDP panels with a built-in privacy screen using the
> > new drm_privacy_screen class.
> >
> > Changes in v3:
> > - Move drm_privacy_screen_get() call to intel_ddi_init_dp_connector()
> >
> > Changes in v2:
> > - Call drm_connector_update_privacy_screen() from
> >   intel_enable_ddi_dp() / intel_ddi_update_pipe_dp() instead of adding =
a
> >   for_each_new_connector_in_state() loop to intel_atomic_commit_tail()
> > - Move the probe-deferral check to the intel_modeset_probe_defer() help=
er
> >
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_atomic.c  |  1 +
> >  drivers/gpu/drm/i915/display/intel_ddi.c     | 16 ++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
> >  3 files changed, 27 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/=
drm/i915/display/intel_atomic.c
> > index b4e7ac51aa31..a62550711e98 100644
> > --- a/drivers/gpu/drm/i915/display/intel_atomic.c
> > +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
> > @@ -139,6 +139,7 @@ int intel_digital_connector_atomic_check(struct drm=
_connector *conn,
> >           new_conn_state->base.picture_aspect_ratio !=3D old_conn_state=
->base.picture_aspect_ratio ||
> >           new_conn_state->base.content_type !=3D old_conn_state->base.c=
ontent_type ||
> >           new_conn_state->base.scaling_mode !=3D old_conn_state->base.s=
caling_mode ||
> > +         new_conn_state->base.privacy_screen_sw_state !=3D old_conn_st=
ate->base.privacy_screen_sw_state ||
> >           !drm_connector_atomic_hdr_metadata_equal(old_state, new_state=
))
> >               crtc_state->mode_changed =3D true;
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm=
/i915/display/intel_ddi.c
> > index 0d4cf7fa8720..272714e07cc6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> > +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> > @@ -25,6 +25,7 @@
> >   *
> >   */
> >
> > +#include <drm/drm_privacy_screen_consumer.h>
> >  #include <drm/drm_scdc_helper.h>
> >
> >  #include "i915_drv.h"
> > @@ -2946,6 +2947,7 @@ static void intel_enable_ddi_dp(struct intel_atom=
ic_state *state,
> >       if (port =3D=3D PORT_A && DISPLAY_VER(dev_priv) < 9)
> >               intel_dp_stop_link_train(intel_dp, crtc_state);
> >
> > +     drm_connector_update_privacy_screen(conn_state);
> >       intel_edp_backlight_on(crtc_state, conn_state);
> >
> >       if (!dig_port->lspcon.active || dig_port->dp.has_hdmi_sink)
> > @@ -3161,6 +3163,7 @@ static void intel_ddi_update_pipe_dp(struct intel=
_atomic_state *state,
> >       intel_drrs_update(intel_dp, crtc_state);
> >
> >       intel_backlight_update(state, encoder, crtc_state, conn_state);
> > +     drm_connector_update_privacy_screen(conn_state);
> >  }
> >
> >  void intel_ddi_update_pipe(struct intel_atomic_state *state,
> > @@ -3979,6 +3982,19 @@ intel_ddi_init_dp_connector(struct intel_digital=
_port *dig_port)
> >               return NULL;
> >       }
> >
> > +     if (dig_port->base.type =3D=3D INTEL_OUTPUT_EDP) {
>
> Connector type check would be a bit more consistent with what this is
> about I think. But there's is 1:1 correspondence with the encoder type
> for eDP so not a particularly important point.
>
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

I see only 8 out of 10 patches in this series were applied to drm-tip.
I'm curious if there is any reason for which the last 2 patches were
not applied:

[Patch 9/10]: drm/i915: Add intel_modeset_probe_defer() helper
[Patch 10/10]: drm/i915: Add privacy-screen support (v3)

I look forward to getting them merged so that I can use them.

Thanks & Best regards,

Rajat

>
> > +             struct drm_device *dev =3D dig_port->base.base.dev;
> > +             struct drm_privacy_screen *privacy_screen;
> > +
> > +             privacy_screen =3D drm_privacy_screen_get(dev->dev, NULL)=
;
> > +             if (!IS_ERR(privacy_screen)) {
> > +                     drm_connector_attach_privacy_screen_provider(&con=
nector->base,
> > +                                                                  priv=
acy_screen);
> > +             } else if (PTR_ERR(privacy_screen) !=3D -ENODEV) {
> > +                     drm_warn(dev, "Error getting privacy-screen\n");
> > +             }
> > +     }
> > +
> >       return connector;
> >  }
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu=
/drm/i915/display/intel_display.c
> > index 86dbe366a907..84715a779d9d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -42,6 +42,7 @@
> >  #include <drm/drm_edid.h>
> >  #include <drm/drm_fourcc.h>
> >  #include <drm/drm_plane_helper.h>
> > +#include <drm/drm_privacy_screen_consumer.h>
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/drm_rect.h>
> >
> > @@ -12769,6 +12770,8 @@ void intel_modeset_driver_remove_nogem(struct d=
rm_i915_private *i915)
> >
> >  bool intel_modeset_probe_defer(struct pci_dev *pdev)
> >  {
> > +     struct drm_privacy_screen *privacy_screen;
> > +
> >       /*
> >        * apple-gmux is needed on dual GPU MacBook Pro
> >        * to probe the panel if we're the inactive GPU.
> > @@ -12776,6 +12779,13 @@ bool intel_modeset_probe_defer(struct pci_dev =
*pdev)
> >       if (vga_switcheroo_client_probe_defer(pdev))
> >               return true;
> >
> > +     /* If the LCD panel has a privacy-screen, wait for it */
> > +     privacy_screen =3D drm_privacy_screen_get(&pdev->dev, NULL);
> > +     if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) =3D=3D -EPR=
OBE_DEFER)
> > +             return true;
> > +
> > +     drm_privacy_screen_put(privacy_screen);
> > +
> >       return false;
> >  }
> >
> > --
> > 2.31.1
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
