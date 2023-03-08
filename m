Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF78C678D5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Mar 2023 05:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjCHFQE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Mar 2023 00:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbjCHFP0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Mar 2023 00:15:26 -0500
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6EFFA8807
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Mar 2023 21:14:39 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-176b90e14a9so10000703fac.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Mar 2023 21:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678252477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+55ukHsCYO4q801zuBEa8hjGdPI/cawtTkhyHzoKZhA=;
        b=c7lLCUD8GcvgY75Ppfr0/CmwIZqBacHGpO1Bpsr/ZJvceAhmuYkaqwlSgJ35Ayws7H
         StzsPqsI1qzytQyUqEYbnrTQTKDMEt6VUJror3p86hzIGazak8fHZv8obi3HOLsoFiPG
         APkQtwIIqjhFn88iEVuVhkDaN57IZtWqHmmDfDNoHVgBAPUXKh8NXUSQrsVxZOa2rKxv
         zwHndpx2jTEn6GQTcDnK5qXxI9VIyUC5j+N5LPmzSbrb2IzBh99hIxeRhKcfmsf7Wbwg
         XesUCE1xuW18HRnbWI+qg69jcUzJu5PCVFEIIGpf6p1b2ItBXAXimrm/dlKZWm/V4rRh
         VtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678252477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+55ukHsCYO4q801zuBEa8hjGdPI/cawtTkhyHzoKZhA=;
        b=7WDLdNM+t5fV1waQ+6OtTNF4jhc/Rpy1569/tlS+SWDyv6lf2ivA+nD+pjt9cCSwJE
         3NAdi7V5FWC9vbh2gBGUCyYSrOT+U/cMqW7CHxLngGF0Gcyj5U17eDVB1nb1kwSBoJ8e
         vXrfkmWZKzlCsBasug2JColAzYqZHgrMJLScqZ6x2P3k4jW84qtioF2A1zER/SC5ORKp
         1Dxd9AToU6dKO3wQeL4/8mVcNzj47MZ3B4W39tozy6wLy2bp1EaZc7CkU9Ysx9qBcUwz
         Lpf2kbE60NS1fnKYVXEt4NRC9fEEfhe140CKyxp10ydtwPnwo/BzMhvRGUznFvoGrMwH
         0yNg==
X-Gm-Message-State: AO0yUKW2D38i7yc5NCwxsla7fYdEBy4RUioJedu/IPOqJqgtpC3Brogs
        KOSlnLH4rtNVi2T1ngWE9yIhpu8Nb8lEnI19pqE=
X-Google-Smtp-Source: AK7set83kHi8btpR+GMrP0J4f3AqzD2vkkDft0mNp54VNEL7r09Fq3N8cZx5HKMoJX+/63G98PFI5ZEbQsnDtPsh38g=
X-Received: by 2002:a05:6870:98af:b0:176:2b10:5f9f with SMTP id
 eg47-20020a05687098af00b001762b105f9fmr5537007oab.7.1678252477178; Tue, 07
 Mar 2023 21:14:37 -0800 (PST)
MIME-Version: 1.0
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
 <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
 <044d2716-2490-6600-33e2-ecf50f65a6e9@gmail.com> <2267dadd-f1a9-e064-6f3f-e3aea459cf5a@gmx.de>
 <CAG4kvq84Lso0x62AuZgRttcQFdKXAHpWWKB4n0ZMTgb9CZ=NCw@mail.gmail.com>
 <e95a38c0-15e0-92e2-97c0-4d09219158f5@gmx.de> <CAG4kvq9QzoXcwTxTFzoQeQDnMEHfWCG4JmLgQ-sMn_WjX-mVJw@mail.gmail.com>
 <2181c5de-44d6-aebd-52ba-63d9fabd620c@gmx.de> <e00df016-5ff1-3e5a-cffc-ab79672a2d7f@gmx.de>
 <24b85f3f-d973-09ef-218b-ad47d093f749@redhat.com>
In-Reply-To: <24b85f3f-d973-09ef-218b-ad47d093f749@redhat.com>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Tue, 7 Mar 2023 21:14:26 -0800
Message-ID: <CAG4kvq-8-J_0ugJe0ut2A2WB83Yeq-9KCCXQCM+MDn4C5CzgCg@mail.gmail.com>
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Armin Wolf <W_Armin@gmx.de>, Gergo Koteles <soyer@irl.hu>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Mar 6, 2023 at 12:38=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Hi,
>
> Armin and Maximilian, thank you for helping Andrew with this.
>
> On 3/6/23 02:41, Armin Wolf wrote:
> > Am 06.03.23 um 02:26 schrieb Armin Wolf:
> >
> >> Am 05.03.23 um 23:59 schrieb Andrew Kallmeyer:
> >>
> >>> On Sun, Mar 5, 2023 at 1:40=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wr=
ote:
> >>>> Hi,
> >>>>
> >>>> could it be that bit 5 is set to disable the touchpad when the
> >>>> device switches
> >>>> to tablet mode? I suspect that the query handler does the following:
> >>>> 1. Notify VPC0 to disable the touchpad.
> >>>> 2. Notify ACPI WMI, which does submit the necessary scancode for
> >>>> switching to tablet mode.
> >>> I think you're right about this notification being for the touchpad,
> >>> although at least on my machine
> >>> there is no other touchpad switch. So this is identical for my machin=
e
> >>> specifically. In this function
> >>> from the decompiled ACPI dump you can see VCP0 and WM00 notified:
> >>>
> >>> Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
> >>> {
> >>>     P80B =3D 0x44
> >>>     Notify (VPC0, 0x80) // Status Change
> >>>     WEID =3D 0xF4
> >>>     Notify (WM00, 0x80) // Status Change
> >>> }
> >>>
> >>> This WM00 device sounds like the WMI you're talking about, however I'=
m
> >>> getting those errors
> >>> about this device not existing in journalctl still. I was asking
> >>> before about how to create this
> >>> missing device but it's not clear to me if that is possible.
> >>>
> >>> kernel: ACPI BIOS Error (bug): Could not resolve symbol
> >>> [\_SB.PC00.LPCB.EC0._Q44.WM00], AE_NOT_FOUND
> >>>
> >>> I searched in my .dsl files from the acpidump and wasn't able to find
> >>> any of the 3 ideapad_wmi_ids
> >>> listed in the driver. Maybe you have an idea of how to interface with
> >>> this missing WM00 object though.
> >>
> >> I was combing through the ACPI DSDT table inside the acpidump you
> >> provided,
> >> and i found serveral PNP0C14 devices, which hold WMI methods, events
> >> and data.
> >>
> >> The WMI GUIDs are encoded inside the associated _WDG buffers, you
> >> should therefore
> >> only grep for parts of the GUIDs.
> >> For example: GUID 06129D99-6083-4164-81AD-F092F9D773A6 -> grep "0xF0,
> >> 0x92"
> >>
> >> When feeding the content of the buffers named WQxx to the bmfdec
> >> utility, i was able
> >> to extract a description of each WMI object.
> >>
> >> On of which (WMIY) is handling the "Lenovo Yoga Mode", which seems to
> >> handle the tablet
> >> mode transitions. The MOF data is:
> >>
> >> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> >> Description("Lenovo Yoga Mode Change Event"),
> >> guid("{06129D99-6083-4164-81AD-F092F9D773A6}")]
> >> class LENOVO_GSENSOR_EVENT : WMIEvent {
> >>   [key, read] string InstanceName;
> >>   [read] boolean Active;
> >>   [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")]
> >> uint32 ModeDataVal;
> >> };
> >>
> >> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"),
> >> Description("LENOVO_GSENSOR_DATA class"),
> >> guid("{09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C}")]
> >> class LENOVO_GSENSOR_DATA {
> >>   [key, read] string InstanceName;
> >>   [read] boolean Active;
> >>
> >>   [WmiMethodId(1), Implemented, Description("Mode Data")] void
> >> GetUsageMode([out, Description("Mode Data")] uint32 Data);
> >>   [WmiMethodId(2), Implemented, Description("Get Xaxis Value")] void
> >> GetXaxisValue([out, Description("Get Xaxis Value")] uint32 Data);
> >>   [WmiMethodId(3), Implemented, Description("Get Yaxis Value")] void
> >> GetYaxisValue([out, Description("Get Yaxis Value")] uint32 Data);
> >>   [WmiMethodId(4), Implemented, Description("Get Zaxis Value")] void
> >> GetZaxisValue([out, Description("Get Zaxis Value")] uint32 Data);
> >>   [WmiMethodId(5), Implemented, Description("Base to Ground")] void
> >> GetAngle4Value([out, Description("Base to Ground")] uint32 Data);
> >>   [WmiMethodId(6), Implemented, Description("Screen to Ground")] void
> >> GetAngle5Value([out, Description("Screen to Ground")] uint32 Data);
> >>   [WmiMethodId(7), Implemented, Description("Screen to Base")] void
> >> GetAngle6Value([out, Description("Screen to Base")] uint32 Data);
> >> };
> >>
> >> While looking at _WED (used to get ModeDataVal) and WMAB (handles
> >> method calls on LENOVO_GSENSOR_DATA),
> >> i assume that  only the first method (GetUsageMode) is implemented,
> >> and that ModeDataVal is used to tell
> >> which value of LENOVO_GSENSOR_DATA has changed (hardwired to 1 on your
> >> device).
> >>
> >> Maybe you can write a wmi driver which handles both WMI objects, so
> >> that you can find out what the values
> >> returned by GetUsageMode mean. With a bit of luck, you can use this to
> >> implement tablet mode toggle detection.
> >>
> >> BTW, what is the name of your notebook model?
> >>
> >> Armin Wolf
> >>
> > Well, it turns out i totally forgot that there exists already a patch w=
hich adds support for this:
> > https://patchwork.kernel.org/project/platform-driver-x86/patch/20221004=
214332.35934-1-soyer@irl.hu/
> >
> > Maybe you can get this patch into shape and submit it again?
>
> Yes if you can do that, then that would be great.
>
> The end result should really be a patch-series then with the first patch
> being the prep patch introducing a new ideapad-laptop.h I suggested
> during my review. This patch can have you as the author + your
> Signed-off-by.
>
> The 2nd patch would then introduce a new version of Gergo's driver using
> the helper functions introduced in the first patch.
>
> For this patch you want to keep Gergo as the author (1), and then add
> yourself as co-author by using the following tags at the end of
> the commit message:
>
> Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
>
> Note do NOT add a Signed-off-by for Gergo, he clearly intended to
> submit his code under the GPL (see the GPL copyright header in
> the new file) so the Signed-off-by missing is fine. And you must
> not add Signed-off-by-s for other people. A S-o-b must always
> be given by the person themselves.
>
> Regards,
>
> Hans
>
> 1) git commit --author=3D"..."

Hi, Hans, thanks for the great advice! I'm excited to see it's already
so close to being done. I have compiled Gergo's module separately from
the kernel tree and loaded it on my laptop and it works perfectly.

I will follow the review comments on the patch, getting it integrated
with the existing module etc. I will also make sure to sign the
commits as you advise. It will be good to have it working for
everyone. This will be my first kernel patch; I have found the docs
page on submitting a patch but let me know if there's anything I'm
missing when I do it.

- Andrew
