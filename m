Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF672C678D5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Mar 2023 05:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjCDFqu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Mar 2023 00:46:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCDFqt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Mar 2023 00:46:49 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D23546149
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Mar 2023 21:46:48 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id t22so3371597oiw.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Mar 2023 21:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677908806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpQQYpLg1Nw+QoMkqFUAx3ESRpQMEl0vgFCAqclQ4iI=;
        b=eUANFbkaQ4/kub1/JyJS5KS4kDbNfzxWSYCvIfZDfgtLVK7a0RMT1RtVNCDeK/BVa6
         o3bEJMmCtKL/tOahhNuruMC6EKDkgH352VVUG8LIYtetseJcWDozUK49a7DOVWGxa7ki
         +q2daQ52NIK2D1aVCsydQBgJ31YRUT3sFKUvnRs1wjxhBmc2wCSCcZrreggltFGPMTrC
         B2XwJppRgvVhT+5vOK4YTNTrszAJaXcuIiteJgYzD69LmHT8YLtvN5oFIWQee6VDSr/Q
         evS4HJBjZq5tmoiG27mkI/4aMnA7bfHXU3QhHc3z0YYyCZDvOVVaWUc3/M+HwhUs74mx
         l5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677908806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpQQYpLg1Nw+QoMkqFUAx3ESRpQMEl0vgFCAqclQ4iI=;
        b=lr04nOYHyIGfo2CGyYvqKjK8TQ+q9TjaZsZ8d1KEttHh6f6BXS/wM9HfsaoJbPHCW6
         lQYEHPwZqnLY7qYnOfm6C4f6iHGcFkib5Lvd962HCVhb2tMio32WygmzGvJuGelRoTjS
         XBsGt8Go9P1SVzPFYNMAVFchPbK4f8f6NQxmFYZUzaQWtq8zSqWoWN6YW0XFKqVCA6xr
         lQ9Xo6bHb+uPYsIWhxvbab4LkrYkJH51tmGe3y0yVq2TASklWf0u9hn8rwD/4TryJITi
         DFB1ywy0F15PMpB3zKuH9I3xGdmQjoFjy4HWg3OIQOKFDmxDGA6M8AJ5ExpCMpKDN2C8
         QdFg==
X-Gm-Message-State: AO0yUKWuuu8lvLewAWkeIv2WpPPT+1Td7OcLgMJNc7RFHryDo/jsWMXR
        ssrK+EEB5YCjKJECNImyGqq2KWwRSkznFeA3D3zr428ftIs=
X-Google-Smtp-Source: AK7set+ri4hHuc00VkiR9oHV/TlSE9lzoFnI223+Q1R+GSQRd6OgpGFzATpG6aZCkQHVxDRI2DehBmI3iIbwQhnjx6c=
X-Received: by 2002:a05:6808:2805:b0:383:f8b1:c259 with SMTP id
 et5-20020a056808280500b00383f8b1c259mr1350971oib.7.1677908806423; Fri, 03 Mar
 2023 21:46:46 -0800 (PST)
MIME-Version: 1.0
References: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
In-Reply-To: <CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com>
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
Date:   Fri, 3 Mar 2023 21:46:35 -0800
Message-ID: <CAG4kvq9-qGFNRP29i4jDPL6RVLwGG86wdtTR1+VWZWu5krfv2A@mail.gmail.com>
Subject: Re: ideapad_laptop tablet mode toggle detection
To:     platform-driver-x86@vger.kernel.org
Cc:     Maximilian Luz <luzmaximilian@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Feb 28, 2023 at 8:45=E2=80=AFPM Andrew Kallmeyer <kallmeyeras@gmail=
.com> wrote:
>
> Hello, I'm interested in detecting tablet mode switching for my Lenovo
> Yoga laptop properly in the kernel. Ultimately I'd like to provide the
> SW_TABLET_MODE input event.
>
> I have found that there are ACPI events fired when the tablet mode is
> toggled (both directions send the same event). Here are the logs:
>
> kernel: ACPI BIOS Error (bug): Could not resolve symbol
> [\_SB.PC00.LPCB.EC0._Q44.WM00], AE_NOT_FOUND (20221020/psargs-330)
> kernel: ACPI Error: Aborting method \_SB.PC00.LPCB.EC0._Q44 due to
> previous error (AE_NOT_FOUND) (20221020/psparse-529)
> root[10258]: ACPI group/action undefined: 06129D99-6083- / 000000d0
>
> When I looked at the code I found TP_HKEY_EV_TABLET_CHANGED in the
> thinkpad_acpi.c driver which seems to have exactly the behavior I'm
> looking for but with a different ACPI event number. Would it be
> possible to do something like this in the ideapad_laptop driver?

I've made some progress! After some very helpful pointers about ACPI
from Maximilian Luz I was able to create a small module printks on screen
flip events! It finds the _SB.PC00.LPCB.EC0.VPC0 acpi_handle and calls
acpi_install_notify_handler on it and receives the events.

I'm still wondering about that AE_NOT_FOUND error about the WM00 device
though. It seems that the ACPI expects the kernel to define this WM00
device as an extension point. In the DSDT I found:

External (_SB_.WM00, DeviceObj)
...
Scope (\_SB.PC00.LPCB.EC0)
{

    Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
    {
       P80B =3D 0x44
       Notify (VPC0, 0x80) // Status Change
       WEID =3D 0xF4
       Notify (WM00, 0x80) // Status Change
    }
...
    Device (VPC0)
    {
        Name (_HID, "VPC2004")  // _HID: Hardware ID
        Name (_UID, Zero)  // _UID: Unique ID
        Name (_VPC, 0x7C0DE114)
        Name (VPCD, Zero)


Additionally two other _Qxx methods (11 and 12) Notify the same
two devices. These other two are the brightness up and down keys.
The only difference is they set those two variables differently so I'll
have to read those variables as well to differentiate screen flips.
Right now my module actually detects both screen flips and
brightness key presses.

I haven't been able to figure out how to create the WM00 device,
I'm not even sure that's a thing in ACPI. I also haven't seen how
to read those variables. Is it okay to reuse the events sent to this
VPC0 device or am I intercepting the events from some other
functionality? Any pointers would be greatly appreciated.

- Andrew Kallmeyer
