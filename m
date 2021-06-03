Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 936B1C47096
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 13:48:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E2FC6136E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 13:48:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhFCNuR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Jun 2021 09:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhFCNuR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Jun 2021 09:50:17 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289C8C06174A
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Jun 2021 06:48:19 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id f15so2991049vsq.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Jun 2021 06:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jNZvxv+I2PzQHifv6u1OBX2ue0p+ew/tzlxcfO5rbjI=;
        b=iHUO5szO77JtMpqC1Dhq85KKhjrGh3glW8bfrqBRoPQb5UE5BHvQNB7bl3+6OmxbwK
         fhlb9WvHFUmBpvb7OMYiU86OuId41LRNUleq/sdooTfg4LRVmKe98Ywm1m9BY2T+A1sc
         QdXDRMO+P4aN2yWQMZZTd+cQxhvuNjuTMdepqi1LWl5KYJqbGN6CglqJUGh5TelsrQrk
         ZJPRXCq9PhKeIXgEtClxaJCjqwkAMhhuqcVrDt69gRXON8Q+DuZVOc3TGfJ2qvQ7Ncsy
         ONjCbnxqqscWpGVk/Rl9f3lzfzs6kE/bu66i+cdke4nVL2aPx+fzMqDhMjXVOc44NbMI
         V2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jNZvxv+I2PzQHifv6u1OBX2ue0p+ew/tzlxcfO5rbjI=;
        b=MoaUFhy62x/XajHCJMApgFwT8yBEBrBlQdxl4ALstuRrcRHAceeDDstljgbDUzQLR5
         UznC0Hp4XyRQi6gTdz7q2uBOKQ4ZKZqXy2lU6b+BtWty+p2cKWoycxvRMARy5tf90+mZ
         OK1UAxXKdIoZtBtQJ83a7kOOn/+qMMDQaMIdM2Y1wKihjGkf3CCzc6lXP0hAPQaUpwII
         ql1lC8cRGQC54U7HbHaAaj/+GAhiqI3YJ+59Ctm/ZOokQh8XLJAKxQV1vsOVp0qP8M0c
         f1p04Tw1wxfiptHd83kRW/LO5GOzQUHZLq8uyL1TSjRTuJgmU/wshaP2DyzVAz+qFJiy
         VWQA==
X-Gm-Message-State: AOAM533X14WBNJefcye8cwRHa1Gx/hY1zfJrbncPj2zNJLYDT5H6l3BJ
        O33/yH4coI6wjAXtU4XGCNsAn9ehO8dRvUUYMBI=
X-Google-Smtp-Source: ABdhPJzYrWD71I21OfyloD9YwGdEuAKXxBlGu/xu/qy6WOi34HAMSD7H/J1gMvf40mkqigTejZiWC6qKZ7EpghQvrKQ=
X-Received: by 2002:a67:878a:: with SMTP id j132mr28254065vsd.18.1622728097504;
 Thu, 03 Jun 2021 06:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210421204804.589962-1-hdegoede@redhat.com> <20210421204804.589962-3-hdegoede@redhat.com>
 <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com> <fb2209f1-a6d8-4a1e-de58-00ee788aa6c2@redhat.com>
In-Reply-To: <fb2209f1-a6d8-4a1e-de58-00ee788aa6c2@redhat.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Thu, 3 Jun 2021 14:48:05 +0100
Message-ID: <CACvgo5352Oc=Re4pATi3oQ-RHBm3OTaaLouvfCPqewW+weUh1g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/9] drm: Add privacy-screen class (v2)
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 3 Jun 2021 at 12:59, Hans de Goede <hdegoede@redhat.com> wrote:

> >
> >> +#include "drm_internal.h"
> >
> > I think we don't need this include, do we?
>
> The drm_privacy_screen device registered by a provider
> uses /sys/class/drm as its class, quoting from
> drm_privacy_screen.c drm_privacy_screen_register():
>
>         priv->dev.class = drm_class;
>         priv->dev.type = &drm_privacy_screen_type;
>         priv->dev.parent = parent;
>         priv->dev.release = drm_privacy_screen_device_release;
>         dev_set_name(&priv->dev, "privacy_screen-%s", dev_name(parent));
>         priv->ops = ops;
>
>         priv->ops->get_hw_state(priv);
>
>         ret = device_register(&priv->dev);
>
> Notice the "priv->dev.class = drm_class", the drm_class
> variable is declared in "drm_internal.h".
>
I have been looking at v1 while replying here, oopsie.

> >> --- /dev/null
> >> +++ b/include/drm/drm_privacy_screen_consumer.h
> >
> >> +#include <drm/drm_connector.h>
> >
> > Ditto
>
> The "enum drm_privacy_screen_status" used in various places
> comes from drm/drm_connector.h (it is the same enum which is
> used for the possible values of the drm-connector properties).
>
Hmm indeed.

If really needed one could move/duplicate/duplicate-and-namespace the
enum. If duplicating, cross references would be great and with
namespacing BUILD_BUG_ON(drm_privacy_screen_status::foo !=
custom-enum::foo) to enforce consistency.

Each feels dirty and I'm not sure if it's worth it -  just a silly
idea, don't read too much into it.

>
> >> --- /dev/null
> >> +++ b/include/drm/drm_privacy_screen_driver.h
> >
> >> +#include <drm/drm_connector.h>
> >
> > Ditto
> >
> > I like how you avoided leaking any DRM details within the new code,
> > modulo the includes above.
>
> I'm glad you like it. I did indeed try to make the code mostly
> independent, but as you can see above there are still some
> inter-dependencies.
>
> Because of this, the CONFIG_DRM_PRIVACY_SCREEN option also does
> not control building this into a separate module. Like many other
> DRM Kconfig options, this controls if the privacy-screen code will
> be added to drm.ko or not.
>
> Despite being 99% independent, the 2 are still intertwined at such
> a level that this is necessary. Specifically drm_core_init() calls
> drm_privacy_screen_lookup_init() to initialize the static lookup
> table which is used to see if there is a privacy-screen (and to which
> GPU,output combo it should be mapped). So if CONFIG_DRM_PRIVACY_SCREEN
> is enabled and drm.ko is builtin then it must be builtin too, at which
> point it is easiest to just make it part of drm.ko .
>
Yes, the initialisation is called from core drm - it has to happen somewhere.

What I was thinking of, is that we can reuse it (with minor tweaks) if
vendors deploy the privacy screen principle for audio, camera, etc.
Kind of crazy examples, but who knows.

> > With above tweaks, the series is:
> > Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>
> As I've tried to explain, the includes are necessary, does your
> Reviewed-by still stands when I keep the includes ?
>
Yes, r-b it stands.

Thanks for the in the detailed reply and drm_class pointer :-P
-Emil
