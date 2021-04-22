Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D773FC433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Apr 2021 08:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9769E6144E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Apr 2021 08:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235362AbhDVI67 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Apr 2021 04:58:59 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:49651 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbhDVI67 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Apr 2021 04:58:59 -0400
Date:   Thu, 22 Apr 2021 08:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1619081903;
        bh=ksZ9xjdVDUAJPNnPQapUG7QZ0jJsFkES9FCjco4bUd8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ThGsy0bV1R7JQgItfFdc4kE6e1U10QSIiKd7DrKRoUcBPsZsjY2KU3MZ9nPDQBOgu
         3MMI+e7VHtDVaT3dHK0YtZkwLSMV6qzaxq6XKb69zNIX1Ny/AlTsCNOi0+dwezNIz6
         hFjnLz16dd5PIjK3PUftTGEKqvViNTCI37tX9cvwODSz7jnVP4Drnyoi+9mg+IE624
         Yh/e39aBsG3LiMhzHOKIEfegyy77RPY5/r2Mlp8tyrFpD8T4tymUskyQlivW+cPofU
         NARdXFaiWKoyo1oh4lTITLURXLwc3PH3ef8VQ9aCSvIa5YljBmcpDuTVvdY0kXXb11
         f7khO2orGmdbg==
To:     Hans de Goede <hdegoede@redhat.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     Marco Trevisan <marco.trevisan@canonical.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector properties
Message-ID: <xVZdxPoOewlP5LmxWy2EHKEIxRw1oeQH9xfPG5a6i8O5IJf5AqpFelwBSIoacwhIqCWJG0sqzHpfGL3WqAxM0CZOUyCOPUuCToD8Ia1Dwjw=@emersion.fr>
In-Reply-To: <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com>
References: <20210421204804.589962-1-hdegoede@redhat.com> <OwVTQDmCbSZMBV41nuJO75afEwmVzcrgF9gLIDqAL4fODvfI-Md_R-Z-ifcVhy6VLc6FyOINwx6lUUz0B1hpykdQYe4b3iZALLftfk6yp_E=@emersion.fr> <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thursday, April 22nd, 2021 at 10:54 AM, Hans de Goede <hdegoede@redhat.c=
om> wrote:

> I guess Marco was waiting for the kernel bits too land before submitting =
these,
> but I agree that it would probably be good to have these submitted now, w=
e
> can mark them as WIP to avoid them getting merged before the kernel side
> is finalized.

Yes, this is how it should be done, see [1]. In particular:

> The userspace side must be fully reviewed and tested to the standards
> of that userspace project.

And yeah, the user-space side still can't be merged before the kernel
side:

> The kernel patch can only be merged after all the above requirements
> are met, but it must be merged to either drm-next or drm-misc-next
> before the userspace patches land.

[1]: https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-use=
rspace-requirements
