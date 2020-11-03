Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1642C388F7
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 14:53:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5917D20757
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 14:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bD2t2pBp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgKCOxD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 09:53:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbgKCOvw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 09:51:52 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A336C0613D1
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2020 06:51:52 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id t8so6781818vsr.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 06:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A+UL0rXnQR519vzXRTAcUMjt4QvuAtc8qG/uiDqe31E=;
        b=bD2t2pBpJIT6GhDQctPNOqegbxruKGh5KijLdCLR9MT1czmd0aHMlvH9N8B0LTx15Z
         R6t4SvDA7sWPAv5VIFIKBSZdvtyxYgiN8CBjulEyHhyIx7E732Lu4fNMrf3gBmQomzBF
         nmK2F6dYE6/7Tf+eaYdPk8NEqF48GjNijgq9zJHDTs/rWh1OFNZPy9Z9g08gd2GF2zJd
         shTDWLA3M5hmBWFtm7XJHr3V4Jm5BtM12YvgiMeZiajpOStHX8Egq/quTRNPcDhNw3nf
         cvXcj78HH2bOFZbAYoupDdyvSTEbh8rHkWbNyoGpWKn1fn0zuv8j48K0y4QGPpbUo5eZ
         YHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A+UL0rXnQR519vzXRTAcUMjt4QvuAtc8qG/uiDqe31E=;
        b=lRZ0kFjIb9dwqbSPwbcZGClu9dkk7vdBZ2drL5Fgrw6e7DoNCUoUGuGV9NAyGFwTeI
         T0FDWTWObSMjBy8UCS596paH98aRnda3syNHm5dig+Mx++n+b46NVwPyGT2Ym14rOkzG
         /U1d3Zo7oo5BI+JS+cVo+72xiWeOsnyDDJPWflGf+IwJxRdRm1YbKeFOROEGgIGLYzst
         kPheGKGlOEhQ4XVAjj17ysDJOD5jV8cx71RSHvwP39Uin2dn3Lps00DMnbraZjKYmdHb
         f4EuKBnwxl9vIXYuvnjBprDagLvrLFGF8iHYKKkffaYAzOkCkaYClwgIB4zosvFCTa9g
         GA4g==
X-Gm-Message-State: AOAM532AHSljN7VPz27FIY0G1a7yd8zf/OSVvVmMQwNeOjFYspuE+YKK
        5LgNJmpTn/8UwnVbqMQxpWIgodwzCS7/po0gM1Q=
X-Google-Smtp-Source: ABdhPJzwSZdaWgUl1dM43TdlMuWscJxX2ornT3LcFG7TAiwcBMDszJw+GLrdM/w0m3QF0z0FdrhHooyCgJ6YlmiblWY=
X-Received: by 2002:a05:6102:2c1:: with SMTP id h1mr18539609vsh.3.1604415111398;
 Tue, 03 Nov 2020 06:51:51 -0800 (PST)
MIME-Version: 1.0
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com> <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
 <HTSPI6-Ba3MfCgVG7q_YbRF6mUqskmyRdtSb_7eE2G7oCi_rSo5UP1ZKRK-qVfzSZ1zm_5sNp5hUorvgRz3VF8RM8b8361CLzbq4X5z59hw=@protonmail.com>
 <CAGTBY+vQ+UMPqFCwKMS0L5=F3eqQ21UtGETgmE+Le=SXcaWS2w@mail.gmail.com>
 <bjucdDbwHvavLvYVkhboo_jhvKC6ccqAslFPuuYO0ZZcgTZZaICda3WMFZhw_zS1o1m7VanyCmaJ4HZMqgyXwsCfqJFDGxb_1A4pdNCe8Bw=@protonmail.com>
 <CAGTBY+tso9BKJwe5F5bBU_RAo0yrwtYf=kGm1UvMpTJurS00MQ@mail.gmail.com>
 <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
 <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
 <9bb85a72-cb91-c0af-8289-dd8601f5b71b@redhat.com> <CAGTBY+u_=5Po2qTPuunmK+sxE8sJ3Z1jcQXjiTcMb7V2iVwSjA@mail.gmail.com>
 <80d43b00-09d3-9f15-d8d6-a4264cf68dd2@redhat.com>
In-Reply-To: <80d43b00-09d3-9f15-d8d6-a4264cf68dd2@redhat.com>
From:   Rhys Perry <rhysperry111@gmail.com>
Date:   Tue, 3 Nov 2020 14:51:25 +0000
Message-ID: <CAGTBY+v6HqbVtFSFKpC25TDHv2S29XbkWL5fDJjRL8o1zn8d6w@mail.gmail.com>
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 3 Nov 2020 at 14:43, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> Note I restored the Cc list again, please use Reply-to-all.
>

Yeah, sorry about that again. I have a hotkey set for reply and am
using it out of habit.

> On 11/3/20 3:25 PM, Rhys Perry wrote:
> >>
> >> Hi,
> >>
> >> On 11/3/20 2:35 PM, Rhys Perry wrote:
> >>>>>>>> (please use reply-all so that the mailing list gets the emails as well)
> >>>>
> >>>
> >>> Oh, my mistake. I didn't actually know the difference between the two.
> >>> Sorry for any confusion this might cause in the future.
> >>>
> >>>>
> >>>>>> [...]
> >>>>>>>> Can you see any messages generated by the hp-wmi driver when these key presses occur?
> >>>>>>>
> >>>>>>> Not that I know of, unless there is some sort of debug mode that can be enabled
> >>>>>>>
> >>>>>>>>>> Now, this is not that interesting at first, I obviously just need to
> >>>>>>>>>> map a keycode. The confusing part is that for both the brightness up
> >>>>>>>>>> AND the brightness down key I get the same code (e02b). I am not to
> >>>>>>>>>> sure how to debug this behavior but I would appreciate if someone
> >>>>>>>>>> helped investigate this issue.
> >>>>>>>>>> I am not sure if this is relevant, but my RFKILL key does not work
> >>>>>>>>>> either (but does not show anything in journal).
> >>>>>>>>
> >>>>>>>> Could you please run `evtest` and see if you have a "HP WMI hotkeys" input device?
> >>>>>>>> If so, please select it, and then press the function keys and see if any events appear.
> >>>>>>>
> >>>>>>> After running`evtest` there is a device called "HP WMI hotkeys" (on
> >>>>>>> /dev/input/event16). However, after selecting it and pressing the
> >>>>>>> brightness keys no events appear.
> >>>>>>>
> >>>>>>>> Furthermore, you could install `acpid`, start it (something along the lines of
> >>>>>>>> `sudo systemctl start acpid`), then run `acpi_listen` and see if you get anything
> >>>>>>>> when you press the keys.
> >>>>>>>
> >>>>>>> After starting the service and running`acpi_listen`, no events appear
> >>>>>>> when pressing the brightness keys
> >>>>>>>
> >>>>>>>>>> Here is a link to acpidump:
> >>>>>>>>>> https://www.dropbox.com/s/ulyltq0gz35s79l/acpidump?dl=0
> >>>>>>>>>> ::: Rhys Perry :::
> >>>>>>> [...]
> >>>>>>
> >>>>>> Could you test other function keys like volume up/down, etc.?
> >>>>>>
> >>>>> After running some tests with evtest I have found out:
> >>>>> - Brightness keys: "AT Translated Set 2 keyboard" (although same keycode)
> >>>>> - Volume keys: "AT Translated Set 2 keyboard"
> >>>>> - Media keys: "AT Translated Set 2 keyboard"
> >>>>> - RFKILL key: (none, although there is a device called "HP Wireless hotkeys")
> >>>>
> >>>> Please install the `evemu` program suite, and run `evemu-record /dev/input/event...`
> >>>> for the AT keyboard, HP WMI hotkeys, and HP Wireless hotkeys; in each run press the
> >>>> brightness up/down, volume up/down keys in any fixed order you like, and then send
> >>>> the output of each run (including the part that is initially printed before
> >>>> receiving any events). Could you also run `acpi_listen` at the same time and
> >>>> see if any key presses are registered there? If yes, what was the output?
> >>>>
> >>>
> >>> Ok, here you go:
> >>> "AT Translated Set 2 Keyboard": https://0x0.st/idpK.txt
> >>> "HP Wireless hotkeys": https://0x0.st/idpP.txt
> >>> "HP WMI hotkeys": https://0x0.st/idpN.txt
> >>> `acpi_listen`: https://0x0.st/idpb.txt
> >>
> >> Can you also run evemu-record for the "Video Bus"
> >> input device and check if you get events there for the
> >> brightness up/down key presses?  On modern laptops events
> >> for the brightness keys are typically delivered there.
> >>
> >
> > I ran evemu-record for my "Video Bus" devices (of which I had two) and
> > there was nothing on those either. I quickly ran over every single
> > input device and I can confirm that "AT Translated Set 2 Keyboard" is
> > the only one that responds to brightness keys.
>
> Hmm, ok, weird.
>
> Usually at least something is generating events for this. Often
> we have the problem that we get the brightness keys reported
> by multiple input devices, this is a new problem.
>
> Can you try adding:
>
> wmi.debug_event=1
>
> To your kernel commandline and then after rebooting do:
>
> cat /proc/cmdline
>
> To check that it really is there and then do:
>
> dmesg -w
>
> To monitor kernel messages and then press the brightness
> up/down hotkeys and see if you get any new messages ?
>

Nope, exactly the same as before:
```
[   42.501517] atkbd serio0: Unknown key pressed (translated set 2,
code 0xab on isa0060/serio0).
[   42.501524] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
[   42.512377] atkbd serio0: Unknown key released (translated set 2,
code 0xab on isa0060/serio0).
[   42.512383] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
[   43.160730] atkbd serio0: Unknown key pressed (translated set 2,
code 0xab on isa0060/serio0).
[   43.160738] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
[   43.171970] atkbd serio0: Unknown key released (translated set 2,
code 0xab on isa0060/serio0).
[   43.171978] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
```

> >> Also are you perhaps using the nvidia binary driver for
> >> your GPU ?
> >>
> >
> > No, I am running with nouveau. Most of the performance isn't there, as
> > they haven't worked out reclocking on the 1050Ti yet, but it's enough
> > for what I do.
>
> Ok, good, then at least the nvidia binary driver is not
> getting in the way.
>
> Regards,
>
> Hans
>

Thanks,
Rhys
