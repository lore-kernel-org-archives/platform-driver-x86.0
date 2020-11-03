Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A55C388F7
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 13:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3523322243
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 13:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Txm2EmrD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbgKCNf7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 08:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729213AbgKCNf6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 08:35:58 -0500
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59DC8C0613D1
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2020 05:35:58 -0800 (PST)
Received: by mail-ua1-x932.google.com with SMTP id w3so1881944uau.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1Jdsdj4qs+mJ/A3T8ww0Cu+YCnYo9ewx+f1ITlFkjhw=;
        b=Txm2EmrDzjEGM53ZNNvOsFoI8GnwLem/KE3qF0peoKRzP9VyU7FLz8wZ7eJWWeN+5c
         ENPtOgYpIPm3oVmtX7L3UiSV5s0PciW+eOVxo+A4MgCJADIXlK7w2WBtiOGmdDRyp14T
         OEhx9JM6Cl0lq4tBEb6NDdbJTGsIAzDD3HuQf2rd038B9W2xtrcrNdckJBIVZE69BC5O
         zaBA6D4tJyeokYeriPutG53UWzJ8BWj7AMf+5QL1BFc2HLQ4YtaZ617pE7pJvLROalBn
         dsBKWK82lG3Tl8YvYWSqeA/M/03OyQ90I97UTiXKlftZJzfuZUhYjlAhlihA6Q3oTFQL
         YqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1Jdsdj4qs+mJ/A3T8ww0Cu+YCnYo9ewx+f1ITlFkjhw=;
        b=j7nww/KgdouI/OHaX3z9/DX0t7s2EVelrirnaeXVOHRFSohdg3HOGmz+U1bRjhTYYj
         zjI4UBEFyzpZ4nrRZxWf+i0m+IGFFH6YJmY04E/qvIXLxEmQCQqPkncOjgHPldVxuPs+
         46hjwM4ButLU6x+MWgrUvbRF5xyhHZle02WW6AI/4DRlgLZ98uQ4p2Q/HRFJQTyZAp0H
         bA+0BuN5FSfyf9BY4o41BCYRnmQEOkLNVdd8df1qpFq/CNDvwjENJmR3mG2v6Tbbx4bf
         VwwEM0rh54iuI2fxbLm0v6JqoVn27V/xc5DostopntU1qb/4RmPWiBJdeLHDKBj6SdAV
         nnpg==
X-Gm-Message-State: AOAM5311lqk87Hj6WCTsno81ddWyObFjItqAjrpp21Ktsk27M9F/8gr/
        bER2OImXLCwW/OnayKNJOk5+U2AHcypeqeWzdnNWK6moxZs9UA==
X-Google-Smtp-Source: ABdhPJwsfVW+JOuejZ+JzS0z4RKPopyWmP2+CkUEIyEF0opkgwfk3tyNXC9h/PEHIsTBzCgUzbdFKiyGyu9iAsa9jhE=
X-Received: by 2002:a9f:2701:: with SMTP id a1mr9915395uaa.70.1604410555149;
 Tue, 03 Nov 2020 05:35:55 -0800 (PST)
MIME-Version: 1.0
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com> <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
 <HTSPI6-Ba3MfCgVG7q_YbRF6mUqskmyRdtSb_7eE2G7oCi_rSo5UP1ZKRK-qVfzSZ1zm_5sNp5hUorvgRz3VF8RM8b8361CLzbq4X5z59hw=@protonmail.com>
 <CAGTBY+vQ+UMPqFCwKMS0L5=F3eqQ21UtGETgmE+Le=SXcaWS2w@mail.gmail.com>
 <bjucdDbwHvavLvYVkhboo_jhvKC6ccqAslFPuuYO0ZZcgTZZaICda3WMFZhw_zS1o1m7VanyCmaJ4HZMqgyXwsCfqJFDGxb_1A4pdNCe8Bw=@protonmail.com>
 <CAGTBY+tso9BKJwe5F5bBU_RAo0yrwtYf=kGm1UvMpTJurS00MQ@mail.gmail.com> <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
In-Reply-To: <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
From:   Rhys Perry <rhysperry111@gmail.com>
Date:   Tue, 3 Nov 2020 13:35:29 +0000
Message-ID: <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

>
> (please use reply-all so that the mailing list gets the emails as well)
>

Oh, my mistake. I didn't actually know the difference between the two.
Sorry for any confusion this might cause in the future.

>
> > > [...]
> > > > > Can you see any messages generated by the hp-wmi driver when these key presses occur?
> > > >
> > > > Not that I know of, unless there is some sort of debug mode that can be enabled
> > > >
> > > > > > > Now, this is not that interesting at first, I obviously just need to
> > > > > > > map a keycode. The confusing part is that for both the brightness up
> > > > > > > AND the brightness down key I get the same code (e02b). I am not to
> > > > > > > sure how to debug this behavior but I would appreciate if someone
> > > > > > > helped investigate this issue.
> > > > > > > I am not sure if this is relevant, but my RFKILL key does not work
> > > > > > > either (but does not show anything in journal).
> > > > >
> > > > > Could you please run `evtest` and see if you have a "HP WMI hotkeys" input device?
> > > > > If so, please select it, and then press the function keys and see if any events appear.
> > > >
> > > > After running`evtest` there is a device called "HP WMI hotkeys" (on
> > > > /dev/input/event16). However, after selecting it and pressing the
> > > > brightness keys no events appear.
> > > >
> > > > > Furthermore, you could install `acpid`, start it (something along the lines of
> > > > > `sudo systemctl start acpid`), then run `acpi_listen` and see if you get anything
> > > > > when you press the keys.
> > > >
> > > > After starting the service and running`acpi_listen`, no events appear
> > > > when pressing the brightness keys
> > > >
> > > > > > > Here is a link to acpidump:
> > > > > > > https://www.dropbox.com/s/ulyltq0gz35s79l/acpidump?dl=0
> > > > > > > ::: Rhys Perry :::
> > > > [...]
> > >
> > > Could you test other function keys like volume up/down, etc.?
> > >
> > After running some tests with evtest I have found out:
> > - Brightness keys: "AT Translated Set 2 keyboard" (although same keycode)
> > - Volume keys: "AT Translated Set 2 keyboard"
> > - Media keys: "AT Translated Set 2 keyboard"
> > - RFKILL key: (none, although there is a device called "HP Wireless hotkeys")
>
> Please install the `evemu` program suite, and run `evemu-record /dev/input/event...`
> for the AT keyboard, HP WMI hotkeys, and HP Wireless hotkeys; in each run press the
> brightness up/down, volume up/down keys in any fixed order you like, and then send
> the output of each run (including the part that is initially printed before
> receiving any events). Could you also run `acpi_listen` at the same time and
> see if any key presses are registered there? If yes, what was the output?
>

Ok, here you go:
"AT Translated Set 2 Keyboard": https://0x0.st/idpK.txt
"HP Wireless hotkeys": https://0x0.st/idpP.txt
"HP WMI hotkeys": https://0x0.st/idpN.txt
`acpi_listen`: https://0x0.st/idpb.txt

> Just to summarize (please correct me if I'm wrong):
> - brightness up/down keys
>   * send the same scan code via the keyboard; and
>   * do not trigger any ACPI events

Yep, that is what I get

> - volume up/down, and media keys send unique key codes via the keyboard and they work (?)

Yes, they work as intended

> - the rfkill hotkey does not appear to generate any events whatsoever (?)
> - the "HP WMI hotkeys" and "HP Wireless hotkeys" input devices don't register
>   any events

Yes, that is the case

>
> By the way, I suppose that screen brightness control with hotkeys does not work,
> correct?
>

Yes

>
> > I wonder what the point of the HP WMI or Wireless devices are if they
> > are not receiving any events.
>
> I can only assume that they do work in some circumstances/with older models/etc.
>
>
> [...]

Thanks for all the help,
Rhys Perry
