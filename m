Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42640C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 19:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235444AbiFHT26 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 15:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235442AbiFHT25 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 15:28:57 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A566E1BBACD
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 12:28:56 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3137c877092so19725827b3.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 12:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hycE+c4GAVzLjEPq9KDawunvbRo0DGeEFzP1XH9fj10=;
        b=eDrWO0s9anS7W9YINJzPSTQrvgB0sCbebfya9U2d/1e6qIVDaZprszYjONj4pgSwHw
         SAEeFeC7oqX1VekcwlYXRoFRwO0ZF8Uq0qQ4G8bOXaZY0pTO7GPO7cFMcbSv/P1GP+2x
         sV1WT9Ydb2BliyS+QpBi4IFvZtu+HBIwAksuiqKRbX21J34JUK4LvgYHWR3LUYFV0lRW
         H1N1DKWc1tskqqbVOjaHJCeNr1cKADa1xrXx24ju7xyEBTMTGqSlghn3YaHJP+Q4pq4K
         7dWhJL7ICS/+TW4L9AvOkC4f1JOBwh/RImYjJv3tNYgP9gSZIfENWyEhhdaJKrVkWyAx
         yCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hycE+c4GAVzLjEPq9KDawunvbRo0DGeEFzP1XH9fj10=;
        b=dkZ5w0a5ZeY6JOrvTbMo1gYf2WIeBsu+osaJ+inJIMWoZlVJHmh4eONf19OghKX6qN
         IUQg2J3pZgFplo+QMXLoox5TqJK6glSbNkcXgeRMm0mV2T+x6A2Ly/H3+onJ2ZHHhGvI
         FlTNy2EfrHam8LydcIcQqM69canCYe+1VvmRc2esr6WpYR6PeewBu0L0j7wr/cZT+6Fj
         2Qgr9XaA+n5ObuBkNeYOlSHy241RwSoGlIkiGkw0JANt1H+reqrs3yv8uv3VHcPxZH+R
         G8XV51n9pQiOSvu47n8Am1nCb+arEGc9LfMPMvWhzyQzLE4WFpOJf/TwUdYR51mh3qWu
         DWAw==
X-Gm-Message-State: AOAM532f1XzLOvCOHKR/vIc9OC7mUTUnoNeqp1KugkOxuLJS1vmYYMh8
        dOZIDebD6ZibifaNFCezuRSXTxF4gSMaPZZ2bLX2tFyd
X-Google-Smtp-Source: ABdhPJxP0u4VEl6Ng8Cd9XbjTmmTZTqVusQQc4wpCGWP/exeq+5n868+nnUUPI6Pc+FSJEDLCJ9KeCI9MRRae1tdDb4=
X-Received: by 2002:a81:a006:0:b0:30c:37e3:846c with SMTP id
 x6-20020a81a006000000b0030c37e3846cmr38107510ywg.310.1654716535945; Wed, 08
 Jun 2022 12:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220608170220.5751-1-jorge.lopez2@hp.com> <CAHp75VfG5aanMFz+F_JE1oTF8B-nxc=LaH=T-R=RAC3S+VguLg@mail.gmail.com>
In-Reply-To: <CAHp75VfG5aanMFz+F_JE1oTF8B-nxc=LaH=T-R=RAC3S+VguLg@mail.gmail.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Wed, 8 Jun 2022 14:28:45 -0500
Message-ID: <CAOOmCE81hchN+f+BtAuOYM0bZ_psrx71suN66JEJ-fjd-KTOSQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Resolve-WMI-query-failures-on-some-devices
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Will do, thanks!

On Wed, Jun 8, 2022 at 1:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jun 8, 2022 at 7:21 PM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
> >
> > The intention for this patch is resolve WMI query failures reported
> > in several HP OMEN notebooks.  WMI queries fail on some devices where
> > the ACPI method HWMC unconditionally attempts to create Fields beyond
> > the buffer if the buffer is too small, this breaks essential features
> > such as power profiles.
>
> Maintainers are still missed. Try first to send patches to yourself
> (another address or so) and check.
>
> > Description of changes between version 1 and version 2
> > ------------------------------------------------------
> > v2 patch 1: Resolve-WMI-query-failures-on-some-devices
> >             - No new changes to the logic.
> >
> > v2 patch 2: Organize-declaration-variables
> >             - Organize declared variables in hp_wmi_perform_query method
> >
> > Jorge Lopez (2):
> >   Resolve WMI query failures on some devices
> >   Organize declaration variables
> >
> >  drivers/platform/x86/hp-wmi.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > --
> > 2.25.1
> >
>
>
> --
> With Best Regards,
> Andy Shevchenko
