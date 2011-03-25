From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add support for T101MT Home/Express Gate key
Date: Fri, 25 Mar 2011 15:43:11 +0000
Message-ID: <AANLkTinr2FJA2H3CJWx-wZ_g-hCZ3DT7PR6QsXqi5Rkw@mail.gmail.com>
References: <20110324195720.GB31713@thinkpad-t410>
	<1300997035-14104-2-git-send-email-seth.forshee@canonical.com>
	<AANLkTimF2UR8BVQW-3YJaGFEz39q8ydESAiMOjmdM1X7@mail.gmail.com>
	<20110325135311.GA14328@thinkpad-t410>
	<AANLkTin3MDYdL6x1Qs8Q9oMMgDMfsoO2GjWMJO_65GAR@mail.gmail.com>
	<AANLkTi=iWeKVww_XPm0PQa09NLtPCo4wvz7ZYkk1ajhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:54795 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752576Ab1CYPnO convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Mar 2011 11:43:14 -0400
In-Reply-To: <AANLkTi=iWeKVww_XPm0PQa09NLtPCo4wvz7ZYkk1ajhQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Seth Forshee <seth.forshee@canonical.com>

> Here is how I envision using these keys. =C2=A0I wanted to map quick =
press
> to GNOME3/KDE4/Unity's Activities menu and map press-and-hold to
> script that rotates screen. =C2=A0I like the repeating of rotates but=
 I
> didn't really want a rotate to also force a pop up of the activities
> menu.

Makes sense.

>>
>>> And back to the question of KEY_HOME -- that's not really what you =
want,
>>> is it? As in "move cursor to start of line"?
>>
>> Ho .. right, that's what mean KEY_HOME :/. So no, I don't want that.=
=2E.
>> What about:
>> - KEY_CYCLEWINDOWS
>> - KEY_COMPUTER
>> - KEY_HOMEPAGE
>> - KEY_DASHBOARD
>>
>> I think KEY_HOMEPAGE is the best choice.
>
> I've only had limited time to look more. =C2=A0So far, I found under =
udev a
> toshiba tablet that maps what is probably a rotate button to
> KEY_DIRECTION so thats one option for it instead of KEY_PROG2. =C2=A0=
I
> couldn't find anybody using that though.
>
> I see in /usr/share/X11/symbols/inet:
>
> =C2=A0 =C2=A0key <I162> =C2=A0 { =C2=A0 =C2=A0 =C2=A0[ XF86RotateWind=
ows =C2=A0 =C2=A0 ] =C2=A0 =C2=A0 =C2=A0 };
>
> and in /usr/share/X11/xkb/symbols/evdev:
>
> xkb/keycodes/evdev: =C2=A0 =C2=A0 <I162> =3D 162; =C2=A0 // #define K=
EY_CYCLEWINDOWS =C2=A0 =C2=A0 =C2=A0 =C2=A0154
>
> Looks like KEY_CYCLEWINDOWS is already hooked up to
> gnome-settings-daemon to auto-rotate screen?

XF86RotateWindows is probably more "alt-tab" than "rotate screen".

> I ran into total dead end for finding a pre-existing example of home
> button usage. =C2=A0I'm really surprised we do not yet have a KEY_LAU=
NCHER
> or similar because so many tablet PCs/smartphones/pads do have a
> button with this specific concept of "bring up your icon based
> application launcher".

KEY_LAUNCHER sounds like "Alt-F2" (that means krunner on KDE).
The advantage over KEY_HOMEPAGE is that it would work even when a
browser have the focus.

> - KEY_MENU
> - KEY_EXIT (smartphones sometime mean this)
> - KEY_PROG3 (basically all that Windows is doing)
> - KEY_LAUNCHER (why not be the first to finally create it!)
>
> I vote for either KEY_PROG3 or KEY_HOMEPAGE for at least short term.

So now, I vote (in order):
- KEY_LAUNCHER
- KEY_DASHBOARD
- KEY_PROG3

With this behavior (I'll use KEY_LAUCHER and KEY_PROG2)

- On press, do nothing
- On release, emit KEY_LAUNCHER if KEY_PROG2 wasn't emited
- On press, emit only one  KEY_PROG2 (I'd like to emit repeated
KEY_PROG2, but I understand that it makes things harder for
userspace).

--=20
Corentin Chary
http://xf.iksaif.net
