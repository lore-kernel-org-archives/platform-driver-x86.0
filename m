Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 924CCC11F66
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jul 2021 19:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7432661183
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jul 2021 19:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234452AbhGMT3J (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jul 2021 15:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbhGMT3H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jul 2021 15:29:07 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58D8C0613DD
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jul 2021 12:26:16 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u25so31616228ljj.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jul 2021 12:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AbX9Xu9c06giO/U+v639pJu8KA6hGm26Zdj5YP+EUss=;
        b=wJkZmqOLp3rfXdWR0LRg0m1k77k9osElwcslBYsP5olnnrFdbmizZCuiAyJGUbNDrj
         RhP1BkAqsytHhIRPh1S2nuT2JzNd9vOolTErTK/OtfRAD3coj7OqigabzAQgL1vWLCnU
         2j4EBRkGHXIMGhgGfbtH1wK1GumCaRRLyLZKm6mqbRR7ky4VeP5tM9K1Q0/OuImTzIEZ
         Pi4I0sF+5FyuE0HP9tGRK4aUGl3m1Xd4IGaVgNbvlI4PWkh0UnE65BP39sJRy8lH8Nrq
         k2wUNGjLxwwVJsGXQJRcg5t0GovPby8hSzWzHuEArLCOl1tDO2RxyBlwERWmMOuBsIO+
         KIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AbX9Xu9c06giO/U+v639pJu8KA6hGm26Zdj5YP+EUss=;
        b=CDD3DEhtX7FVZUc+9Xvh7d3B2CCeRPzmXy37myPtXuTCKfVLVwsVI4zH2beVIgNWh4
         37QHuhd1LkrLW+YsJPFX26ikTYAqesX8CSE4aIv6EEFqZcD6XLjDNh5/aXF5Jvg6HVj0
         QwrmSmHHgLprLlXNmnhzQxJ9lXFDofxGKRc8aunIalVITOeLfoIqq2a06bARTCMCrodK
         ue8sVeTiYW1TLNKeOtze5pmKnj2IwCgqp52UgLqZ3OP6vIUwgbQtzQ6Vwr9oqRTTuvrr
         kX5sEL5n+HSgAFj3iWTdzGSDWrLUHJPvbNRsfEv9JEIVhYkRBsz9b2iYpvbn0FXqoUBi
         WEbg==
X-Gm-Message-State: AOAM533asWT3XqINxzFQe44MICqLR2/0hcLeWG5dVcrzwwUsK44+Dx9w
        8LCRfjBP90hQgAugCy+MrZqMLlN4uLuCIWtCNhRWaw==
X-Google-Smtp-Source: ABdhPJwazSjMBKSD1KsMMqLDNHfhs748K2fCEmgqZmF3JvX9SK0I+hv55CRW5kFDjp5Stk4bfpPF2SoviRNY7ckKzGI=
X-Received: by 2002:a2e:8909:: with SMTP id d9mr5534574lji.65.1626204374759;
 Tue, 13 Jul 2021 12:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <88ad0981-0763-9c8d-fb57-70278bcaffd4@redhat.com> <0D708B40-20DB-4D5C-BFAD-74A30D5DE477@getmailspring.com>
In-Reply-To: <0D708B40-20DB-4D5C-BFAD-74A30D5DE477@getmailspring.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Tue, 13 Jul 2021 12:25:33 -0700
Message-ID: <CACK8Z6FPsywe49fP=5pVc5DFm--4xt0daYLDzpbujA1_qoK7Dg@mail.gmail.com>
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

Hello Hans, Marco, et al,

On Tue, Apr 27, 2021 at 10:03 AM Marco Trevisan
<marco.trevisan@canonical.com> wrote:
>
> Hi,
>
> >>> There now is GNOME userspace code using the new properties:
> >>> https://hackmd.io/@3v1n0/rkyIy3BOw
> >>
> >> Thanks for working on this.
> >>
> >> Can these patches be submitted as merge requests against the upstream
> >> projects? It would be nice to get some feedback from the maintainers,
> >> and be able to easily leave some comments there as well.
>
> FYI, I've discussed with other uptream developers about these while
> doing them, and afterwards on how to improve them.
>
> > I guess Marco was waiting for the kernel bits too land before
> > submitting these,
> > but I agree that it would probably be good to have these submitted
> > now, we
> > can mark them as WIP to avoid them getting merged before the kernel side
> > is finalized.
>
> I'll submit them in the next days once I'm done with the refactor I've
> in mind, and will notify the list.

Any updates on the privacy-screen patchset? Can Hans' patchset be
accepted upstream now?

Thanks,

Rajat

>
> And for sure we can keep them in WIP till the final bits aren't completed.
>
> Cheers
