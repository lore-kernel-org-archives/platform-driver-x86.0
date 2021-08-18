Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F03EEC4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 15:01:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D10F960238
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 15:01:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239504AbhHRPBn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 11:01:43 -0400
Received: from mail-4322.protonmail.ch ([185.70.43.22]:44347 "EHLO
        mail-4322.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239768AbhHRPBl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 11:01:41 -0400
Date:   Wed, 18 Aug 2021 15:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1629298864;
        bh=L3fry6yxaOowBhPpBlDnZjsUXtH1c6Rp6HvbdGfvbB0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=fvlXO566QS0wlwkdzvdtcNWGCs6xzold2jJ9NXSnvtN48FPJxq6J/SIaI4/citbJa
         upYc4GSZ6wbdqJHlCIBBSOFKAIAEYplUulgsaan5OFvLXBAzwosVShnZsD1aVnguBu
         09QKt/MJMysd6H0svXf35nK1fWRjCNyAYMXDi1PA=
To:     Matan Ziv-Av <matan@svgalib.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: lg-laptop: Support for battery charge limit on newer models
Message-ID: <JC7il3WRp7mOUsysl5Ovyvp8xpmqQJ_HpkO0DSIRoJUi7yN3MLcAfsl-5I10D2X1O4kc9foQKsIFuUuMIk8RuwoOmqgKEU_TpzjDc82wQoY=@protonmail.com>
In-Reply-To: <d8f5fb50-68d5-b331-3a56-e638e423d269@svgalib.org>
References: <9338b0b1-e76e-68f5-36de-a642745ba6ad@svgalib.org> <7d2ea9fc-6942-d7c9-c6cf-61072dc13ba9@redhat.com> <d8f5fb50-68d5-b331-3a56-e638e423d269@svgalib.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. augusztus 18., szerda 15:36 keltez=C3=A9ssel, Matan Ziv-Av =C3=ADrta:
> [...]
> > If this hotkey changes the kbd-backlight level "in hardware"
> > then it should not send a key-press instead you should specify
> >
> > led_classdev.flags =3D LED_BRIGHT_HW_CHANGED
> >
> > For the kbd-backlight led_classdev and then call:
> >
> > =09led_classdev_notify_brightness_hw_changed(&kbd_backlight, new_backli=
ght_level);
> >
> > When receiving the event. upower will pick the event send by this up
> > and then notify interested parties such as e.g. gnome-settings-daemon
> > which will then show a nice OSD with the new backlight level similar
> > to how it is done for e.g. volume controls.
> >
> >
> > If you can also send patches to change these 2 things, so that lg-lapto=
p
> > conforms with the standard userspace APIs used for this that would be g=
reat.
>
> I sent patches for this (in a separate thread). But in my testing, this
> does not happen automatically and I did not find yet how to configure
> udev/upower/kde to display this notification.
>

You can check the events by running something like:

  dbus-monitor --system "type=3D'signal',interface=3D'org.freedesktop.UPowe=
r.KbdBacklight',member=3D'BrightnessChanged'"

The gnome-settings-daemon watches these signals and instructs the GNOME she=
ll to display
an OSD about the new keyboard brightness. Well, at least on my machine. A q=
uick search in
the repository[1] suggests that KDE's PowerDevil is also listening for thes=
e signals.

I am not sure now, but I seem to recall that UPower needed to be restarted =
to see a LED
that appeared after it was started when I was testing these LED brightness =
change notifications.

[1]: https://invent.kde.org/plasma/powerdevil


Best regards,
Barnab=C3=A1s P=C5=91cze
