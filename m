Return-Path: <SRS0=a5Ee=EJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50A6C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 15:43:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66ADB20780
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Nov 2020 15:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YR/VzzjB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbgKCPnf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Nov 2020 10:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgKCPne (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Nov 2020 10:43:34 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C85C0613D1
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2020 07:43:34 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id z10so3810109vkn.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Nov 2020 07:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GQ28/M793tR6Inc8A8z3+7ps4xx8nVMGz7IwSy13y8w=;
        b=YR/VzzjBw8D+npFE4hg/NeX5o6D7QT5nFI3i14p8GKYyroow2sZ0CakziHyCS5RCcr
         Gu49iNyBkXcXGxZQ4B/k2HoWdtCCZjbktY0qW2v6yhXhpqsO4zlTgE1yiHXAecilWHqR
         /FmPxor9mV890sSBmNrao7Q7u9GHZaXvuqejzrldjODilV7Pdr35T7THRRlVJ8x9sJO6
         5zzFnQHh+V+6H3bJ9t/VbKbfmBSOhu64cU+O4I4+fdSsqoNTS8UImUVtPH04RtF+3Ysp
         6Gowl4y/nxlsRnV0gSGEN/4JC+V25GQ1IfQgSisnpMWnPgsrP+nLoNNI/hEAQpiZ8qgu
         MKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GQ28/M793tR6Inc8A8z3+7ps4xx8nVMGz7IwSy13y8w=;
        b=C4wfWUO96f79G4GSmISxfb9aHue8siH+D9p8LSKqjZ4UFlO/PFiwO6Xxi1hJ6tO4Gr
         g6LAdcNwSsTZhtI4IoqhzU97V+GFDcCaW5ot0FeIzrbeletBOMmM2wZMnqVp1b9Nn8d2
         +wcQufy6/uankwGVkKKaDfTFu28RGPR7FEc878DuiXL127yowZVHzvMrlnjX/j3MX4o5
         RW44BwjZ7+oq0LRAfSkqPS7wfnrrR7ug4FZWC4Zm6HZZ+NpCpb4JMC54rxKK1aoWtQC4
         jz9elGVSMBJONoy8fuXfZQ+o1+nLqwrrpT/BHeVMaqO/EHmBxrjkapdrQRmlAEj4OILj
         hu0g==
X-Gm-Message-State: AOAM531J95nZX7wo2h9WD8ETHuHokj3SG+uLO5dvp66uUIxTYeOEfXIC
        115HQ6yRzrPa9HeInksRTtoS4yf+Wee2cFfXhk5M3kRqgw5M6A==
X-Google-Smtp-Source: ABdhPJzW12oAjky7ZmnRKBffdTQ5pus0jZWBTl4TKBAZf8sumbNMT3Qse0R8JfevPB46V8yEEymsrpM2CY4FsEE3AuM=
X-Received: by 2002:a1f:9f05:: with SMTP id i5mr16558414vke.12.1604418213807;
 Tue, 03 Nov 2020 07:43:33 -0800 (PST)
MIME-Version: 1.0
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com> <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
 <HTSPI6-Ba3MfCgVG7q_YbRF6mUqskmyRdtSb_7eE2G7oCi_rSo5UP1ZKRK-qVfzSZ1zm_5sNp5hUorvgRz3VF8RM8b8361CLzbq4X5z59hw=@protonmail.com>
 <CAGTBY+vQ+UMPqFCwKMS0L5=F3eqQ21UtGETgmE+Le=SXcaWS2w@mail.gmail.com>
 <bjucdDbwHvavLvYVkhboo_jhvKC6ccqAslFPuuYO0ZZcgTZZaICda3WMFZhw_zS1o1m7VanyCmaJ4HZMqgyXwsCfqJFDGxb_1A4pdNCe8Bw=@protonmail.com>
 <CAGTBY+tso9BKJwe5F5bBU_RAo0yrwtYf=kGm1UvMpTJurS00MQ@mail.gmail.com>
 <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
 <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
 <9bb85a72-cb91-c0af-8289-dd8601f5b71b@redhat.com> <CAGTBY+u_=5Po2qTPuunmK+sxE8sJ3Z1jcQXjiTcMb7V2iVwSjA@mail.gmail.com>
 <80d43b00-09d3-9f15-d8d6-a4264cf68dd2@redhat.com> <CAGTBY+v6HqbVtFSFKpC25TDHv2S29XbkWL5fDJjRL8o1zn8d6w@mail.gmail.com>
 <df0edaa1-c53c-7012-1d73-2ac108b1bd6a@redhat.com>
In-Reply-To: <df0edaa1-c53c-7012-1d73-2ac108b1bd6a@redhat.com>
From:   Rhys Perry <rhysperry111@gmail.com>
Date:   Tue, 3 Nov 2020 15:43:07 +0000
Message-ID: <CAGTBY+sh=31UsYGmVHmTtYxGQV=EnnFetMbG1YcfOs14PPZGBg@mail.gmail.com>
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

>
> Hi,
>
> On 11/3/20 3:51 PM, Rhys Perry wrote:
> > On Tue, 3 Nov 2020 at 14:43, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> Note I restored the Cc list again, please use Reply-to-all.
> >>
> >
> > Yeah, sorry about that again. I have a hotkey set for reply and am
> > using it out of habit.
> >
> >> On 11/3/20 3:25 PM, Rhys Perry wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 11/3/20 2:35 PM, Rhys Perry wrote:
> >>>>>>>>>> (please use reply-all so that the mailing list gets the emails as well)
> >>>>>>
> >>>>>
> >>>>> Oh, my mistake. I didn't actually know the difference between the two.
> >>>>> Sorry for any confusion this might cause in the future.
> >>>>>
> >>>>>>
> >>>>>>>> [...]
> >>>>>>>>>> Can you see any messages generated by the hp-wmi driver when these key presses occur?
> >>>>>>>>>
> >>>>>>>>> Not that I know of, unless there is some sort of debug mode that can be enabled
> >>>>>>>>>
> >>>>>>>>>>>> Now, this is not that interesting at first, I obviously just need to
> >>>>>>>>>>>> map a keycode. The confusing part is that for both the brightness up
> >>>>>>>>>>>> AND the brightness down key I get the same code (e02b). I am not to
> >>>>>>>>>>>> sure how to debug this behavior but I would appreciate if someone
> >>>>>>>>>>>> helped investigate this issue.
> >>>>>>>>>>>> I am not sure if this is relevant, but my RFKILL key does not work
> >>>>>>>>>>>> either (but does not show anything in journal).
> >>>>>>>>>>
> >>>>>>>>>> Could you please run `evtest` and see if you have a "HP WMI hotkeys" input device?
> >>>>>>>>>> If so, please select it, and then press the function keys and see if any events appear.
> >>>>>>>>>
> >>>>>>>>> After running`evtest` there is a device called "HP WMI hotkeys" (on
> >>>>>>>>> /dev/input/event16). However, after selecting it and pressing the
> >>>>>>>>> brightness keys no events appear.
> >>>>>>>>>
> >>>>>>>>>> Furthermore, you could install `acpid`, start it (something along the lines of
> >>>>>>>>>> `sudo systemctl start acpid`), then run `acpi_listen` and see if you get anything
> >>>>>>>>>> when you press the keys.
> >>>>>>>>>
> >>>>>>>>> After starting the service and running`acpi_listen`, no events appear
> >>>>>>>>> when pressing the brightness keys
> >>>>>>>>>
> >>>>>>>>>>>> Here is a link to acpidump:
> >>>>>>>>>>>> https://www.dropbox.com/s/ulyltq0gz35s79l/acpidump?dl=0
> >>>>>>>>>>>> ::: Rhys Perry :::
> >>>>>>>>> [...]
> >>>>>>>>
> >>>>>>>> Could you test other function keys like volume up/down, etc.?
> >>>>>>>>
> >>>>>>> After running some tests with evtest I have found out:
> >>>>>>> - Brightness keys: "AT Translated Set 2 keyboard" (although same keycode)
> >>>>>>> - Volume keys: "AT Translated Set 2 keyboard"
> >>>>>>> - Media keys: "AT Translated Set 2 keyboard"
> >>>>>>> - RFKILL key: (none, although there is a device called "HP Wireless hotkeys")
> >>>>>>
> >>>>>> Please install the `evemu` program suite, and run `evemu-record /dev/input/event...`
> >>>>>> for the AT keyboard, HP WMI hotkeys, and HP Wireless hotkeys; in each run press the
> >>>>>> brightness up/down, volume up/down keys in any fixed order you like, and then send
> >>>>>> the output of each run (including the part that is initially printed before
> >>>>>> receiving any events). Could you also run `acpi_listen` at the same time and
> >>>>>> see if any key presses are registered there? If yes, what was the output?
> >>>>>>
> >>>>>
> >>>>> Ok, here you go:
> >>>>> "AT Translated Set 2 Keyboard": https://0x0.st/idpK.txt
> >>>>> "HP Wireless hotkeys": https://0x0.st/idpP.txt
> >>>>> "HP WMI hotkeys": https://0x0.st/idpN.txt
> >>>>> `acpi_listen`: https://0x0.st/idpb.txt
> >>>>
> >>>> Can you also run evemu-record for the "Video Bus"
> >>>> input device and check if you get events there for the
> >>>> brightness up/down key presses?  On modern laptops events
> >>>> for the brightness keys are typically delivered there.
> >>>>
> >>>
> >>> I ran evemu-record for my "Video Bus" devices (of which I had two) and
> >>> there was nothing on those either. I quickly ran over every single
> >>> input device and I can confirm that "AT Translated Set 2 Keyboard" is
> >>> the only one that responds to brightness keys.
> >>
> >> Hmm, ok, weird.
> >>
> >> Usually at least something is generating events for this. Often
> >> we have the problem that we get the brightness keys reported
> >> by multiple input devices, this is a new problem.
> >>
> >> Can you try adding:
> >>
> >> wmi.debug_event=1
> >>
> >> To your kernel commandline and then after rebooting do:
> >>
> >> cat /proc/cmdline
> >>
> >> To check that it really is there and then do:
> >>
> >> dmesg -w
> >>
> >> To monitor kernel messages and then press the brightness
> >> up/down hotkeys and see if you get any new messages ?
> >>
> >
> > Nope, exactly the same as before:
> > ```
> > [   42.501517] atkbd serio0: Unknown key pressed (translated set 2,
> > code 0xab on isa0060/serio0).
> > [   42.501524] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
> > [   42.512377] atkbd serio0: Unknown key released (translated set 2,
> > code 0xab on isa0060/serio0).
> > [   42.512383] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
> > [   43.160730] atkbd serio0: Unknown key pressed (translated set 2,
> > code 0xab on isa0060/serio0).
> > [   43.160738] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
> > [   43.171970] atkbd serio0: Unknown key released (translated set 2,
> > code 0xab on isa0060/serio0).
> > [   43.171978] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make it known.
> > ```
>
> Ok bummer, so it looks like only get the one event and need to catch
> that (we can use i8042_install_filter() from some driver for that) and
> then when we catch it probably make some ACPI call to figure out what
> is going on. I took a quick peek at the acpidump you provided, but it is
> huge.  One thing which did stand out is that ssdt14.dsl (after disassembling)
> has:
>
>             Method (GHKS, 0, NotSerialized)
>             {
>                 Debug = "GetHotkeyState-----"
>
>
>             Method (SHKS, 1, Serialized)
>             {
>                 Debug = "SetHotkeyState-----"
>
> Which may or may not be related ... But I'm afraid I do not have
> the time to investigate that avenue further.
>

That looks promising (I think). I don't have any experience working
with this sort of stuff, so is there a place you recommend I start?

> One last thing to try (I guess) is adding the following to your kernel
> commandline and see if that changes things:
>
> acpi_backlight=video
>
> Possible other values to try are "vendor" "native" and "none"
>

Just tried all of those, sadly it's still not working.

> Regards,
>
> Hans
>

Yours Thankfully,
Rhys Perry

> p.s.
>
> I think you mentioned this before, but what was the exact model of your laptop again?
>

HP Pavilion cx-0598na. It has an i5-8300H and a 1050Ti
