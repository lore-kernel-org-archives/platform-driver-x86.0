Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F990C4320A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 20:51:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E524460EEA
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 20:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbhHCUvo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 16:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhHCUvn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 16:51:43 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF3FC061757
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 13:51:32 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u2so525238plg.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Aug 2021 13:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sfftEtgrcdAgJtxxMxV/AMJLSicv+M22mjPBU5y8w/g=;
        b=BmjanVsIy8h7SrXm9eU8iVoxNLRh8Rh2h+NopTulkEHAAKAzGlP0N7s6ioaz9n6j6J
         PIikGOYDwnnmVI9UvPSdZ5YWpEz2XtSqexX1QIWzoM9ELP8AgLiMtLhnk3Y83qElZf65
         9x/znzLAuGTjhm5IFY0VoqMPJykhZ/nEquLa9M3WqZ4mY0GWZD+ToCfuTU7GYvpq6gs1
         J9RQySgCSmenkSOmfcO3akg1qB5sSYEFMTGieXsDUOI0Z2v8R1a/oECtyRVXbrO+pY49
         m1wT61slzmYQ1m2WVgBUvFmBksXzAmO+LY9bKpQnv4rwGm4NaLRlYwea+9yW4xgNsBcr
         MNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sfftEtgrcdAgJtxxMxV/AMJLSicv+M22mjPBU5y8w/g=;
        b=nT+P1iBbTQCPzacOqlL7filwlBnOpjvbWATbnd0XjpHUmF6xiBHP5QwP/VX8uGCBTu
         RYfhvYeUzV6uFBSkKaMV3BMzkEIQvOB6ZnQ8O+gGzIY3Ad7/XkkzNBRtarY3ogZY3Nrd
         y0uVOCCNufQVCjepgKzoJtcb9roW+quTbvicykFlyb1K8Xf6kKjfQ+/JKTEC7bAeCPcZ
         6qKPzMEYkFas2bTSBalmMS3MdVQukcqFhiBxcyQeXnTcY3mt7cOwWNgIJX1/9GrHXwRe
         pjU47x6BscF6dQBLV3Vf5Ji/WrSV97TUee9/euiKO6TgG3E1bMtPMdr3LBfha7sbm9cl
         Xfww==
X-Gm-Message-State: AOAM532FhKo6DsggUg7XLJ0ouIZb3qKYSzikZTPzCsFwbaJXhaNamBtO
        GzF64Eiu5dTfWoRA00aQMbXnWL5EzqAwiVb1ofOMfA==
X-Google-Smtp-Source: ABdhPJzzMdFIoC4FUQ+5qAmfespQhMKsyzKO9ckAU+1wZnDV562/fTMPvuOXAVghyfE86/6uh2oy9WY2X7eHNFJHgh0=
X-Received: by 2002:a17:90b:4ad1:: with SMTP id mh17mr22649805pjb.164.1628023891241;
 Tue, 03 Aug 2021 13:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <CACK8Z6FPsywe49fP=5pVc5DFm--4xt0daYLDzpbujA1_qoK7Dg@mail.gmail.com>
 <78260D21-AD73-4EBC-8E69-A5B16F1A72D5@getmailspring.com>
In-Reply-To: <78260D21-AD73-4EBC-8E69-A5B16F1A72D5@getmailspring.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 3 Aug 2021 13:50:55 -0700
Message-ID: <CACK8Z6ErDLW76hXwK4wFhOdMj4eyOZpceJPt7WX+KT6C2oWO7Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] drm: Add privacy-screen class and connector properties
To:     Marco Trevisan <marco.trevisan@canonical.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Simon Ser <contact@emersion.fr>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Mario Limonciello <mario.limonciello@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello DRM / GPU maintainers,

On Tue, Aug 3, 2021 at 8:20 AM Marco Trevisan
<marco.trevisan@canonical.com> wrote:
>
> Hi Rajat,
>
> The merge proposals are now in place after discussing a bit more with upstream:
>
>  - https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/merge_requests/49
>  - https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1952
>  - https://gitlab.gnome.org/GNOME/gnome-control-center/-/merge_requests/1032

It seems that the subject kernel patch series (privacy screen support)
from Hans, has now satisfied all the requirements that were needed for
it to be accepted upstream, and there aren't any open comments that
need to be addressed.

I was wondering when would it be applied to the upstream kernel?

Thanks,

Rajat


>
> This is all implemented and working for the wayland backend, for X11 I'm
> looking at it right now, even though it seems that we don't get any
> RRScreenChangeNotify on hotkey changes, and monitoring udev directly
> seems overkill. Anything should be adjusted at lower levels?
>
> Cheers
>
> On lug 13 2021, at 9:25 pm, Rajat Jain <rajatja@google.com> wrote:
>
> > Hello Hans, Marco, et al,
> >
> > On Tue, Apr 27, 2021 at 10:03 AM Marco Trevisan
> > <marco.trevisan@canonical.com> wrote:
> >>
> >> Hi,
> >>
> >> >>> There now is GNOME userspace code using the new properties:
> >> >>> https://hackmd.io/@3v1n0/rkyIy3BOw
> >> >>
> >> >> Thanks for working on this.
> >> >>
> >> >> Can these patches be submitted as merge requests against the upstream
> >> >> projects? It would be nice to get some feedback from the maintainers,
> >> >> and be able to easily leave some comments there as well.
> >>
> >> FYI, I've discussed with other uptream developers about these while
> >> doing them, and afterwards on how to improve them.
> >>
> >> > I guess Marco was waiting for the kernel bits too land before
> >> > submitting these,
> >> > but I agree that it would probably be good to have these submitted
> >> > now, we
> >> > can mark them as WIP to avoid them getting merged before the kernel side
> >> > is finalized.
> >>
> >> I'll submit them in the next days once I'm done with the refactor I've
> >> in mind, and will notify the list.
> >
> > Any updates on the privacy-screen patchset? Can Hans' patchset be
> > accepted upstream now?
> >
> > Thanks,
> >
> > Rajat
> >
> >>
> >> And for sure we can keep them in WIP till the final bits aren't completed.
> >>
> >> Cheers
> >
