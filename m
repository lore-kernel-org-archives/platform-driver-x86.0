Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFC9C4346E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F242623600
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:39:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgIXIjE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:39:04 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:52961 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgIXIjE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 04:39:04 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MnagF-1kl78t23NN-00jX68; Thu, 24 Sep 2020 10:26:22 +0200
Received: by mail-qk1-f173.google.com with SMTP id v123so2487558qkd.9;
        Thu, 24 Sep 2020 01:26:22 -0700 (PDT)
X-Gm-Message-State: AOAM5322pE9d6oTUDb0fysgmklL1BUbMvIuxZ9lnKS8K5QjuEr2L1zxA
        ZY6wqc9/NIN+1S7po4YSnt5cXvw80BmJT+EDKbE=
X-Google-Smtp-Source: ABdhPJwdB4OckyypHDvhO1cGrqIWN2A9DDGKREeH56+z++Kes/ubhHRnkNRx8EJcehFdXXe5kRHJ6nndT91q+XgyvnE=
X-Received: by 2002:a37:5d8:: with SMTP id 207mr3790606qkf.352.1600935980950;
 Thu, 24 Sep 2020 01:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200923151511.3842150-1-luzmaximilian@gmail.com>
 <CAK8P3a3Qie_CP1dA-ERqyDv=EnaQQPnNbFYrGr3ySiY4mO0=Uw@mail.gmail.com>
 <dad42dce-15d0-245a-4d91-4733e54883a0@gmail.com> <CAK8P3a2ryzmsrHHApT9O=dvsw+=z18Sjd4ygVxvFrrDetKA+rQ@mail.gmail.com>
 <c4c1d999-9ab7-8988-906a-3cb6a70bc93d@gmail.com>
In-Reply-To: <c4c1d999-9ab7-8988-906a-3cb6a70bc93d@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 24 Sep 2020 10:26:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2XegsP71yvd8Ku08_k6ecQfkU+V+t+QnjQBrJKF2MwCg@mail.gmail.com>
Message-ID: <CAK8P3a2XegsP71yvd8Ku08_k6ecQfkU+V+t+QnjQBrJKF2MwCg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] Add support for Microsoft Surface System
 Aggregator Module
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-serial@vger.kernel.org,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>,
        Dorian Stoll <dorian.stoll@tmsp.io>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7BSu+DCzcAsvcwNW/57TzlBcHkc7QtvslyE7xNAfuxWY1xVxCeo
 vYxOvSAWLJpqEbhKmF0hg3Zga739OBAzSlxeJjvBo6SAvF3uiO049eJfPxMTg+7HB8vNX3B
 SKMxP6K3DPKwdLJhWX3WkxgN1SFR8v8X9nWg/AGHbA4tKGlll5EFdWlxArAeraBkXGUYH0B
 4qaWBHB0Oo/7g1ZZ+jkNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/kuDggNYB1c=:hbxlsSxYvykMo0XJ0MmrKg
 I2fbeBZSoQt2plYZLhNC+fr3kjj/pzPBnfxHN9C5z3yC7g9DmDoqSKcRgur2piE+UK7kT5MIm
 SPbtzREEvFBZlvtDU3z4Kxlc0RgjIeXjtkXDPQWM83XgHlRfEVsVTPDAzPWVKzGsUaXiphSBL
 zI6Sc6x241+AEYgBMqq/ZH5609YW4h99t4wq6zxi8O0lmW3gl2Cuj5Kxw3NO3JHbTA5sTo88c
 J8vA3DSCTAAtWi+QthQcryPUbYfYAeG3f/7c73U+YZ0nFS8Q7ugN0HvdGg5j0wPCUdjMytA82
 Lm+bZIiS9AUF+zNzFjdLmYIdMft1lZG8jK6YJUssuxkicOnSuu58wBNDOztACeMjfQ2/KP6I+
 hPS1TVH76+MbhrfwxxF3Oz92wShVDFIJ4/m73hA8JDk0SWrHfiCbdBxJZTnau0EsYlL6FdWdf
 5XxwwFp8WLGJKID9/FhE4cdZIWrPxnUBNYL2pVTHa6AWgPR2KTG0iIqhD83EUYSeEqOwNTZWj
 7vm0J9eEGCkltmG3yYK/YGd9nJn7PuNxLzJNsHUcLeetM3zEHA+yD0fFGNWagRraFzLocMudN
 L2sSyV+Al2bvpqAxdEY6JQuhYlJPkZmz9pSvlKMeXm0jLIhYGZwTc4CdbCymhuxgGyC1omaWS
 QxiWt03Y2r/Txw7F0nI9Mb2nR2fRSGbC8mqybMOSXdZuIgsYsLFWVfPeQEhCaWYz+sx1HJh7p
 3yv7uP3WEJg3p7uRg2nw07mHbdPg3dH9OrWd78OILwDvd+b+DdQ8s89eAD8rvE5p2Jm/aeDdI
 2iedrEj4EWV5j0amrarp8jvWs9Ov+vf+9sG6880l5BFQuJ5Qc5H7ZLFVYTKbOu/kskDRFHuon
 U5qUspXKOkSppcce2XR0Wn2y0toumC6ATUAhR23POhwBZmywrAsPiYcXNni8tQ7bPrATDBT53
 OHgPOBBks6LF585o95sj125BJIy5Lp8XLHsycyxioHssqrv++IjRs
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Sep 24, 2020 at 1:28 AM Maximilian Luz <luzmaximilian@gmail.com> wrote:
> On 9/23/20 9:43 PM, Arnd Bergmann wrote:
> > On Wed, Sep 23, 2020 at 5:43 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
> >>
> >> On 9/23/20 5:30 PM, Arnd Bergmann wrote:
> >>> On Wed, Sep 23, 2020 at 5:15 PM Maximilian Luz <luzmaximilian@gmail.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> The Surface System Aggregator Module (we'll refer to it as Surface
> >>>> Aggregator or SAM below) is an embedded controller (EC) found on various
> >>>> Microsoft Surface devices. Specifically, all 4th and later generation
> >>>> Surface devices, i.e. Surface Pro 4, Surface Book 1 and later, with the
> >>>> exception of the Surface Go series and the Surface Duo. Notably, it
> >>>> seems like this EC can also be found on the ARM-based Surface Pro X [1].
> >>>
> >>> I think this should go to drivers/platform/x86 or drivers/platform/surface/
> >>> along with other laptop vendor specific code rather than drivers/misc/.
> >>
> >> I initially had this under drivers/platform/x86. There are two main
> >> reasons I changed that: First, I think it's a bit too big for
> >> platform/x86 given that it basically introduces a new subsystem. At this
> >> point it's really less of "a couple of odd devices here and there" and
> >> more of a bus-type thing. Second, with the possibility of future support
> >> for ARM devices (Pro X, Pro X 2 which is rumored to come out soon), I
> >> thought that platform/x86 would not be a good fit.
> >
> > I don't see that as a strong reason against it. As you write yourself, the
> > driver won't work on the arm machines without major changes anyway,
> > and even if it does, it fits much better with the rest of it.
>
> Sorry, I should have written that a bit more clearly. I don't see any
> reason why these drivers would not work on an ARM device such as the Pro
> X right now, assuming that it boots via ACPI and the serial device it
> loads against is fully functional.

As I understand, the dialect of ACPI used on the snapdragon laptops
is not really compatible with the subset expected by the kernel, so
you'd be more likely to run those laptops with a device tree description
of the hardware instead (if at all).

Making the driver talk to the hardware directly instead of going through
AML likely requires more refactoring.

> >> I'd be happy to move this to platform/surface though, if that's
> >> considered a better fit and you're okay with me adding that. Would make
> >> sense given that there's already a platform/chrome, which, as far as I
> >> can tell, also seems to be mainly focused on EC support.
> >
> > Yes, I think the main question is how much overlap you see functionally
> > between this driver and the others in drivers/platform/x86.
>
> I think that the Pro X likely won't be the last ARM Surface device with
> a SAM EC. Further, the subsystem is going to grow, and platform/x86
> seems more like a collection of, if at all, loosely connected drivers,
> which might give off the wrong impression. In my mind, this is just a
> bit more comparable to platform/chrome than the rest of platform/x86. I
> don't think I'm really qualified to make the decision on that though,
> that's just my opinion.

I would ask the drivers/platform/x86 maintainers for an opinion here,
they are probably best qualified to make that decision.

I don't really mind either way, for me this is more about who is
responsible as a subsystem maintainer than whether these are
technically x86 or not.

> Here's an overview of other drivers that I hopefully at some point get
> in good enough shape, which are part of this subsystem/dependent on the
> EC API introduced here:
>
> - A device registry / device hub for devices that are connected to the
>    EC but can't be detected via ACPI.
>
> - A dedicated battery driver for 7th generation devices (where the
>    battery isn't hanled via the ACPI shim).
>
> - A driver properly handling clipboard detachment on the Surface Books.
>
> - A driver for HID input/transport on the Surface Laptops and Surface
>    Book 3.
>
> - A driver for allowing users to set the performance/cooling mode via
>    sysfs.
>
> - Possibly a driver improving hot-plug handling of the discrete GPU in
>    the Surface Book base.

Note that drivers that connect to the bus typically don't live in the
same subdirectory as the driver that operates the bus. E.g. the
battery driver would go into drivers/power/supply and the input
would go into drivers/input/ or drivers/hid.

    Arnd
