Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A507C47093
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 15:32:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43665613AB
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Jun 2021 15:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhFAPdw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Jun 2021 11:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232592AbhFAPdu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Jun 2021 11:33:50 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6585C061574
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Jun 2021 08:32:07 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id x8so3238189vso.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Jun 2021 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d/JiYYhFUO04t8CGV6jIQdwSg5PSkQH6BUVjJ3YfIh4=;
        b=FJi/AQpbfzIFBLaSRITA+QlCyoO2xWP8WhJoU4ft2ynZE/Dbk7qnDUfXx11UyG5xe5
         Y6ImEWjTWo/s4dpEgJu7iT8ZbBBGGzbYS6d/qI51ArFbvkvt2LDL3b4darSWy+U/xGI4
         WjSA61mqSVT2KjgEfzE2eiAKnrxntf7QD5ECWq1GcRFMPVns/U22whNi1iJMAnVCxXRS
         TKaip/C+efrj1dPElBxwnsRuV20xEaPwgNMyabyCkRF3E0zHj6rTalt9BmLPIN+U46Qr
         Q20UI3HLBW6bsAT/5xJ09OJl7tzPJNX8R2gWtwjQDyvb+QNsE8PrrM59bZkvC70gwj5C
         rEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d/JiYYhFUO04t8CGV6jIQdwSg5PSkQH6BUVjJ3YfIh4=;
        b=TC8hEyIEVgq/eNOsu+NROlBT8R/xXPPVU+w1/MTgLAEPPd9EycH72iRu4gLnyEpvcN
         vhhesCD/LcXOA6IfoucqjmNSasgg+FW8nEyJF2qrAr/2FV+HJWR8/F0wcY4KxlG/Zo3y
         C2tIZd+U/823QQb2k50onJicbgg1ZCQD5f05vXlUVcL05oihxbsxGWPaBwoK/rr8Idfo
         tn0IFv+vnRNyOgSncH0URJONLERx6pzr2g46Ef9oOO2fK4W3nTdSa8/q7pl9Hgt856bW
         oZBdVweUbWi0tsHb1tvpxc1o/b3Cqu3RcqBgX6fsP7JMtmj0IoXY1QPGY8roBjAeMdvI
         Roqw==
X-Gm-Message-State: AOAM533Qj4tHmDDV0UUADIuErQmG0qsv0waHnhN9pHPsdDj6X2pcDJkp
        3JMLwbWcpeIHwN3JaJNyh6CtbYKLHqKDk69NlJg=
X-Google-Smtp-Source: ABdhPJygFw5MiS1g73bRd4O7g/mZExW7EW6JfpfcXXtw6r0DVbwtj6PkcKaKP6eU1Ea4ttgCb6bapVSygv6iWUWd0Go=
X-Received: by 2002:a67:878a:: with SMTP id j132mr19228098vsd.18.1622561527002;
 Tue, 01 Jun 2021 08:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210421204804.589962-1-hdegoede@redhat.com> <20210421204804.589962-3-hdegoede@redhat.com>
In-Reply-To: <20210421204804.589962-3-hdegoede@redhat.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Tue, 1 Jun 2021 16:31:55 +0100
Message-ID: <CACvgo50onXuRvtXySYNHJZshSkmX8ukcMitNJAKC4dEMPTyXYw@mail.gmail.com>
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

Hi Hans,

What happened with this series, did it fall through the cracks?

On Wed, 21 Apr 2021 at 21:48, Hans de Goede <hdegoede@redhat.com> wrote:

> --- /dev/null
> +++ b/drivers/gpu/drm/drm_privacy_screen.c

> +#include "drm_internal.h"

I think we don't need this include, do we?


> --- /dev/null
> +++ b/include/drm/drm_privacy_screen_consumer.h

> +#include <drm/drm_connector.h>

Ditto

> --- /dev/null
> +++ b/include/drm/drm_privacy_screen_driver.h

> +#include <drm/drm_connector.h>

Ditto

I like how you avoided leaking any DRM details within the new code,
modulo the includes above. With above tweaks, the series is:
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Theoretically one could also remove the `depends on DRM` from patch
8/9 but I'm not sure how much that saves us.

HTH
-Emil
