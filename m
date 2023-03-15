Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0D2C6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Mar 2023 03:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjCODiM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Mar 2023 23:38:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjCODiJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2023 23:38:09 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 557325B427
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 20:38:07 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id bg11so13292437oib.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2023 20:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678851486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53sh+94q31+3ntDg2r5npGSeYZTo5bVCXWSakH7MeA0=;
        b=pNdBc7JAnUcr16oKOxlyWVCWvZ1Ut7v1aICbLoOBnP/ySgQEiJpXzSvcIupjYuVYNO
         mR156c+TQP+csjdGS019bt6Ur7hy32An5J2wy9wX2fSKHHHizX98jZMT7HwzyWU3NHAE
         kW02dvHyoSI7dsbnroqVSkoRsHc5a+RKezbIwZZ2IRhwuQFu2xRfiirTZWksKy/xpBfc
         6ZijLB1AalxN4IAVIkbO3yqQvy/+PtM+EFWKAHaFVc19yOriffyRZkdneYZgfC4m4aaC
         cNTdb2GM21xn9jUet6p+jiq4QSsOnQ2bgqxSoT74XWcfOhCMH29lptAURpYQ3AeK8rOM
         PiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678851486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53sh+94q31+3ntDg2r5npGSeYZTo5bVCXWSakH7MeA0=;
        b=qeEYgpObh9QCrfHgN4Iptp4dkK/BILiVmpXY60Vv2VOYgiTN1GyBOUMeWz6ll/vGLY
         tWPjZ69Y//cIoD3iinGbRcMYt/e+Jp37SVJnLS2Hq+4PROgCqw1kudh5RxafAqOOXMTU
         zX/b+JVUMCklCDs3GykOQxcavb9BCBtZL2hdoJoQvapvGCp5WNwl7VVe234zJUuvXIdM
         rBJ5Wh6Mgg5uG5yz9DnGVRavq7bSVDDossUb3jMUJ/w+SX07J/yR+ZaGG1aw4Iopo2b+
         Ot9rwXJrpcu3qzZQdm0l1ivPKR6/yWA/eB40JFJs1ZB/odGKCQ5CVxg/HbDLzkTA22lj
         7dLA==
X-Gm-Message-State: AO0yUKW5dEeVkEGf8YeeBtWjDyUklYe+azFrkr/4jPHHzgmRmKQppDzS
        Cufu6yIXgwtE+IoA3ObVyWwpNrV4YsJtbjGK5KE=
X-Google-Smtp-Source: AK7set+wXY0lDPxzvafRMOwjXuGLsHcgJGIaglKY5SM4GPiDxtLfxOXV8U43m/1vVTYUD1+B/ZG0QFNZKJPXyMWvUnI=
X-Received: by 2002:aca:1c1a:0:b0:37f:a6c0:108f with SMTP id
 c26-20020aca1c1a000000b0037fa6c0108fmr408898oic.6.1678851486593; Tue, 14 Mar
 2023 20:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221004214332.35934-1-soyer@irl.hu> <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com> <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
In-Reply-To: <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Tue, 14 Mar 2023 20:37:55 -0700
Message-ID: <CAG4kvq8GMcw_ytss+e3y9nsaOAk9+m+TSnSBwcqdhqEOUJg_dQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        soyer@irl.hu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Mar 10, 2023 at 2:28=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote:
>
> Hi,
>
> according to the embedded MOF data, the method id for retrieving the mode=
 data
> is 0x1, not 0xAB.

Thanks! I can see from your earlier email in the other thread that
this is right. Strangely, when I tested 0xAB had almost exactly the
same behavior as 0x01. I think you're right though, I have updated my
local copy to 0x01.

I have also fixed the missing cleanup calls and

> Using wmi_evaluate_method() is deprecated as WMI GUIDs are not guaranteed=
 to be
> unique for a given machine. I think both WMI GUIDs should be handled by s=
eparate
> drivers, and the driver for the event GUID uses a notifier call chain to =
inform
> the driver for the data GUID that the usage mode changed, which then hand=
les the
> input device stuff.
>
> This way the driver does not rely on deprecated WMI APIs, and everything =
would
> still work should Lenovo decide to duplicate some WMI GUIDs.

After reading many times, I believe I understand this and can figure
out the implementation. How should I attribute the commits? Should
this be a 3rd patch in a v2 patch series with myself as the author? Or
should these drivers be introduced in one commit without the
intermediate single driver that uses the deprecated API?

Also have I correctly set Gergo as the commit author for this PATCH
2/2 email like Hans said to? I wasn't sure if I had it right and I
could fix it in the v2 series.

> acpi_dev_put() is missing.

Thanks! Not sure why I thought it was okay to delete lenovo_ymc_remove
but I have added that back in with the input_unregister_device call.

> Maybe it would be beneficial to allow userspace to get the current usage =
mode without having
> to wait for an WMI event. This way, userspace could still react to situat=
ions like the device
> already being in tablet mode when this driver is loaded.

I'm not following how to implement this, not familiar enough with WMI.
Could you explain more?

> If the drivers handling the event and data GUIDs are fine with being inst=
antiated multiple
> times, then adding the WMI GUIDs to the allow_duplicates[] list in driver=
s/platform/x86/wmi.c
> will allow the WMI driver core to handle duplicated event and data GUIDs.

Is there an easy way to test if it's fine to run multiple copies?
Currently testing by compiling the module with an inlined
ideapad-laptop.h out of the kernel tree and using the insmod command
to load it.
