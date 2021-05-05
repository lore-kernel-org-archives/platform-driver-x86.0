Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1223DC43460
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 10:02:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D035F61002
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 10:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhEEKDt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 06:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbhEEKDt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 06:03:49 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E2F9C061574;
        Wed,  5 May 2021 03:02:52 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cl24-20020a17090af698b0290157efd14899so549098pjb.2;
        Wed, 05 May 2021 03:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LurxNA03dT5novdyKmb3mGZS5twFC2ifcGcAHDuYJ00=;
        b=AXzh+xUSsydhWsIlWIe7uD1WFBqX2wrKz6VaS2mQpB+XYJ2B3lu1lhgt7DIPZgVphI
         9EvLhwld0ANpLA2nSGI6FckoFLT1kNO7y7Fpsr1QzW9P06Bj83tpiqvEWWrHAE7sX/V9
         8CNlWCMJqIlOsn+xt2Fi3xGEw0J0Zq1ET7uxIe0yGIbbQAEtdEIcKx4zOBw5/CNlsWUX
         cWZlM+8Agmm0Rh0Y6H1+Mw3flJv1dTmkI4T7Ipp8wQuiARq+I+4abrJSAfnyYl3T+fqG
         04PtTHMGt2G1d4tPoubIwmgKd7M9PSFcVk5+2MPbVM7Jwv0YxMBIL+xl1oVAt49RWjhh
         18OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LurxNA03dT5novdyKmb3mGZS5twFC2ifcGcAHDuYJ00=;
        b=i7H5+9q3kDS+9eNAqTrh/9PjndSvZ4btQyF5edDldgfm3ZwHUkZFBucNjCgYeoJ8rQ
         YG2oZaNH/WaxcBiLdUloZwokJrwKXt13l9gePTj7Omb57PCIrLda8HJXxeuOyLx+jo8u
         tl+76IZRMmamb5kGCNeJjvnM4QF43O67I9O99nluk8yPjiAnXeaMM0Sm09K95FniBDzO
         84je8nD2WZZYuV3KnKsxTAmzbfRFp7A2Pa8mwAIPqEMvgfSPN0cFvVRPADFScC9FnlzO
         wr3Phq5HL8zG+A0A08p/KYVX3wK4Ci/GoTXyqYUwMORJ5P/1VpSOPMxY2YDV+XlljJwA
         DubQ==
X-Gm-Message-State: AOAM533CMLqSkWuB6vA338XcU2ny92Mm1q/eJo5ukLd4pFYnjpC9ez0L
        r5eUqaUrMtzOl+pJ3nZt0MeO+otd3+pg+dDdzDGS9IYcogA=
X-Google-Smtp-Source: ABdhPJyGY7J5ctyTPbUeAOqmX10pwlFAu9jY3mzvxAizq5nUTWv09hBUcr7gAYUPzjPDZf0oMrMVZ1M/Lubs++loGlY=
X-Received: by 2002:a17:90a:d90c:: with SMTP id c12mr10976677pjv.129.1620208971725;
 Wed, 05 May 2021 03:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210503154647.142551-1-hdegoede@redhat.com> <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
 <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com> <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
 <ffb46bb6-3548-4ec2-f176-99f3674e7f6d@redhat.com>
In-Reply-To: <ffb46bb6-3548-4ec2-f176-99f3674e7f6d@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 5 May 2021 13:02:35 +0300
Message-ID: <CAHp75VcHEMaZ67yy7TD8f8Nk=+oiLT-vRCt9A6fT9K6LeR78Ew@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 5, 2021 at 12:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 5/5/21 11:17 AM, Andy Shevchenko wrote:
> > On Wed, May 5, 2021 at 12:07 PM Hans de Goede <hdegoede@redhat.com> wro=
te:
> >> On 5/4/21 9:52 AM, Andy Shevchenko wrote:
> >>> On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hd=
egoede@redhat.com>> wrote:
> >
> > ...
> >
> >>>     +               fwnode =3D device_get_next_child_node(kdev, fwnod=
e);
> >
> >>> Who is dropping reference counting on fwnode ?
> >>
> >> We are dealing with ACPI fwnode-s here and those are not ref-counted, =
they
> >> are embedded inside a struct acpi_device and their lifetime is tied to
> >> that struct. They should probably still be ref-counted (with the count
> >> never dropping to 0) so that the generic fwnode functions behave the s=
ame
> >> anywhere but atm the ACPI nodes are not refcounted, see: acpi_get_next=
_subnode()
> >> in drivers/acpi/property.c which is the get_next_child_node() implemen=
tation
> >> for ACPI fwnode-s.
> >
> > Yes, ACPI currently is exceptional, but fwnode API is not.
> > If you may guarantee that this case won't ever be outside of ACPI
>
> Yes I can guarantee that currently this code (which is for the i915
> driver only) only deals with ACPI fwnodes.
>
> > and
> > even though if ACPI won't ever gain a reference counting for fwnodes,
> > we can leave it as is.
>
> Would it not be better to add fake ref-counting to the ACPI fwnode
> next_child_node() op though. I believe just getting a reference
> on the return value there should work fine; and then all fwnode
> implementations would be consistent ?

But it's already there by absent put/get callbacks. On fwnode level it
is like you described. So, talking for a good pattern we have to call
the fwnode_handle_put() independently and always for for_each_child
and get_next_child usages.

> (note I did not check that the of and swnode code do return
> a reference but I would assume so).

Yes, it's only ACPI that survives w/o reference counting.

> >>> I=E2=80=99m in the middle of a pile of fixes for fwnode refcounting w=
hen for_each_child or get_next_child is used. So, please double check you d=
rop a reference.
> >>
> >> The kdoc comments on device_get_next_child_node() / fwnode_get_next_ch=
ild_node()
> >> do not mention anything about these functions returning a reference.
> >
> > It's possible. I dunno if it had to be done earlier. Sakari?
> >
> >> So I think we need to first make up our mind here how we want this all=
 to
> >> work and then fix the actual implementation and docs before fixing cal=
lers.
> >
> > We have already issues, so I prefer not to wait for a documentation
> > update, because for old kernels it will still be an issue.
>
> I wonder if we really have issues though, in practice fwnodes are
> generated from an devicetree or ACPI tables (or by platform codes
> adding swnodes) and then these pretty much stick around for ever.

Overlays. Not for ever.

> IOW the initial refcount of 1 is never dropped at least for of-nodes
> and ACPI nodes.

>  I know there are some exceptions like device-tree
> overlays which I guess may also be dynamically removed again, but those
> exceptions are not widely used.

ACPI overlays are quite used (at least by two people I know and a few
more that asked questions about them here and there), but luckily it
doesn't require refcounting (yet?).

> And if we forget to drop a reference in the worst case we have a small
> non-re-occuring (so not growing) memleak.

And is it good to provoke all kinds of tools (kmemleak, *SANs, etc)? I
do not think so. If we are writing good code it should be good enough.

> Where as if we start adding
> put() calls everywhere we may end up freeing things which are still
> in use; or dropping refcounts below 0 triggering WARNs in various
> places (IIRC).

Which is good. Then we will discover real issues.

> So it seems the cure is potentially worse then the disease in this
> case.

I tend to disagree with you. How in this case we can go below 0 in
case we know that we took a counter? If somewhere else the code will
do that, it is a problem that has to be fixed on case-by-case basis.

> So if you want to work on this, then IMHO it would be best to first make
> sure that all the fwnode implementations behave in the same way wrt
> ref-counting, before adding the missing put() calls in various
> places.
>
> And once the behavior is consistent

It's consistent now independently of the beneath layer from fwnode API p.o.=
v.

> then we can also document this
> properly making it easier for other people to do the right thing
> when using these functions.



--=20
With Best Regards,
Andy Shevchenko
