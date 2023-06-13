Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79907C77B7A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Jun 2023 07:31:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238669AbjFMHbQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Jun 2023 03:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239873AbjFMHbG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Jun 2023 03:31:06 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AEA1A7
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 00:30:49 -0700 (PDT)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 833B73F117
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1686641445;
        bh=XhvZgSjAgW40FhZRCV5qaAFVTuKtcgyD+rF/6PGoEmI=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=f3ZdQaqogVJhJ7l2MRKZPN70+5USTxE4i4mlmHhwUBw014vOgoc1eD5zZTVvw+Ih/
         xW5SfUQMs+YvTYIuBpyDtE6TyKovy4b0gxA3/RChHx2G54qOWz9gKndDVKpOPV9dVC
         +JBtsssra2Z/KdD+NVylgL5NmmpGNvckU8URtwwwxayaTScSHJH8U5csjcs4iGZGw/
         pspHaqfCtE2gsiubHyYKXhp5CUSmhAziBjSwam8aCYYR+yHtLFDHOf+isc+hOgPbJ8
         lHgxYMbXwqY64jSQD9UinaD3piFhnmJtQgDrJlnGwW3JDCavt9d+u3gXbBzg243YDL
         o3WroOQStFnsA==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-56cfd5cb875so42297987b3.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jun 2023 00:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686641442; x=1689233442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhvZgSjAgW40FhZRCV5qaAFVTuKtcgyD+rF/6PGoEmI=;
        b=GESyGvDcjQAZnkTj/rqZp3eCjRWfCFQfnD55rNQVuYJGPVBzAkeGpTOzpOH59DSRk6
         nhh1d15DDAHxQoQ/VnCA1k7mrcbsYJplTtF9TrNsvzaCnlJ84cm/5Tz8fIgq3x6G7Y+r
         AL1tmDDFqGM6Pe2agIizuloImHzBmifbcGS2EuY4DisfiFAfThOA4Pluh8XPVwpcxbiT
         VJEQEdQqoAIXr2gHnjmO0m8/Oc5jqOOzPJ6fxfMpwWvh6lpjWigTUf69WsZ5jbH+8Gxx
         zTG9+qoi+Jj9zBvB4+8h4J9UiIWueAZ0kkOxuSKtTteIqTWsCPkOBjMsX1E0abEpMzSq
         3lFQ==
X-Gm-Message-State: AC+VfDwi/qggAQX3K61eMpc/TvyyD0LJwyVZHY16zmgLhLd1wXUC7ePs
        pXHZKj2zo5cmQzO+8CV655ljy83pHYQBTiiWHbFkMbHsnzNPXzTWbuiHW1uT98428SDayiSZL1I
        lfy9q2Rnd5i7F1QzSI8ZIr22WI9qESPf641MUy+nYNC67jK7ZdN5FNUrN0M6HcnbuPhNjxOSRwa
        T9ww==
X-Received: by 2002:a25:d3c7:0:b0:ba8:ae3a:dd39 with SMTP id e190-20020a25d3c7000000b00ba8ae3add39mr1042433ybf.43.1686641441952;
        Tue, 13 Jun 2023 00:30:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ATR1FvuezuSZCxSIxod98XGUmBmxYPqhSjrYQLOfLlbvdFf2+GZe7NKgxGsifG5f8LFxIYjsHnk/AH996CuI=
X-Received: by 2002:a25:d3c7:0:b0:ba8:ae3a:dd39 with SMTP id
 e190-20020a25d3c7000000b00ba8ae3add39mr1042423ybf.43.1686641441652; Tue, 13
 Jun 2023 00:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230607034331.576623-1-acelan.kao@canonical.com>
 <20230607042032.GA28835@srcf.ucam.org> <CAFv23QmDNUFcPwvSQt5aUxtmHasfr8wrF72ObvcO-X19gfn=LA@mail.gmail.com>
 <20230607052724.GA29834@srcf.ucam.org> <CAFv23QkEdGnEz1q7vbyFCa9S9Dqh-zec72nRGyZ3wAz-8wpbvA@mail.gmail.com>
 <20230607062341.GA30618@srcf.ucam.org> <20230607065604.yaivqbbd3dkawxo4@pali>
 <CAFv23Q==r4newMXE3OWavRSRt-bEi5-qR0Vo-5HGLw4r9J36MA@mail.gmail.com>
 <20230607074732.GA31666@srcf.ucam.org> <457e2a4a-e28a-cd24-c129-4ff6162ccc36@redhat.com>
 <CAFv23QmVP4ZFAhAFBSx6ty-4fcQ-u9+uZb0xaD2gCJPCdpPvQg@mail.gmail.com> <f27f0d06-0b18-06bb-cb1f-042527c1ca31@redhat.com>
In-Reply-To: <f27f0d06-0b18-06bb-cb1f-042527c1ca31@redhat.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Tue, 13 Jun 2023 15:30:30 +0800
Message-ID: <CAFv23Q==ghYCW-ukKQJZ_JhYgS4CSCDwbg9sZL9_B1Pa_LviWg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add drm module soft dependency
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hans de Goede <hdegoede@redhat.com> =E6=96=BC 2023=E5=B9=B46=E6=9C=888=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:16=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi AceLan,
>
> On 6/8/23 05:04, AceLan Kao wrote:
> > Hans de Goede <hdegoede@redhat.com> =E6=96=BC 2023=E5=B9=B46=E6=9C=888=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=883:16=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >>
> >> Hi,
> >>
> >> On 6/7/23 09:47, Matthew Garrett wrote:
> >>> On Wed, Jun 07, 2023 at 03:39:33PM +0800, AceLan Kao wrote:
> >>>
> >>>> What do you think if we unregister backlight devices if the backligh=
t type
> >>>> is larger than the current registered one.
> >>>> Do this check in backlight_device_register() and unregister backligh=
t
> >>>> devices by the order raw(1) > platform(2) > firmware(3)
> >>>> And maybe introduce a sticky bit into the backlight device if the ba=
cklight
> >>>> driver doesn't want to be removed.
> >>>
> >>> Hans looked at doing this, but there were some awkward corner cases.
> >>> When we first introduced this functionality, firmware was preferred t=
o
> >>> platform was preferred to raw - but on Intel, at least, this behaviou=
r
> >>> changed with later versions of Windows. I don't think there's a singl=
e
> >>> static policy that works, I think you need to pay attention to the hi=
nts
> >>> the platform gives you. How does Windows know which interface to use =
on
> >>> this platform? The simplest solution may actually just be for
> >>> dell-laptop to refuse to register a backlight if the platform claims =
to
> >>> be Windows 8 or later.
> >>
> >> I like that idea.
> >>
> >> AceLan, I guess that you hit this easy while testing on a (development=
)
> >> Meteor Lake platform ?
> >>
> >> I have had other/similar reports about Meteor Lake platforms.
> >>
> >> On hw from the last 10 years dell-laptop will not register
> >> its vendor-type backlight class device because
> >> acpi_video_get_backlight_type() will return acpi_backlight_video
> >> there (1) so it does not matter if the GPU driver shows up only
> >> later (2).
> >>
> >> But it seems that on Meteor Lake the ACPI tables will no longer
> >> contain acpi_video backlight control support which causes
> >> acpi_video_get_backlight_type() to return acpi_backlight_vendor (2).
> >> triggering the issue you are seeing.
> >>
> >> Can you give the attached patch a try please ?
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >> 1) Starting with kernel >=3D 6.2 acpi_video.c will only register
> >> the /sys/class/backlight/acpi_video# node after a drm/kms drivers
> >> asks it to register it.
> >>
> >> 2) The native GPU driver will tell the drivers/acpi/video_detect.c
> >> code that native backlight control is available changing
> >> the return of acpi_video_get_backlight_type() to native, which
> >> is why loading the native GPU driver first also fixes this issue.
> >
> > Hi Hans,
> >
> > Yes, this patch works for me, thanks.
> >
> > BTW, I encountered this issue on the RPL platform.
>
> Thank you for testing. I have updated the commit message
> to reflect that this impacts both RPL and MTL platforms
> and submitted the fix upstream:
>
> https://lore.kernel.org/linux-acpi/20230608091258.7963-1-hdegoede@redhat.=
com/
>
> Regards,
>
> Hans
>

Hi Hans,

I got another issue on the same platform.
The first issue was that when set to DSC graphics only in the BIOS,
I encountered the issue I reported here, dell_laptop creates dell_backlight
and then nvidia creates nvidia_0 later.

Now, set to hybrid mode in the BIOS, I found I still got 2 backlight interf=
aces
   $ ls /sys/class/backlight/
   acpi_video0  intel_backlight
acpi_video0 is redundant and non-working.

Do you think should I set this platform to the dmi quirk? Or is there anyth=
ing
I could try to get rid of this?

Thanks.
