From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 13 Nov 2015 11:17:16 +0100
Message-ID: <20151113101716.GA5458@eudyptula.hq.kempniu.pl>
References: <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <559C1C17.3060009@dell.com>
 <20150708035346.GB2413@eudyptula.hq.kempniu.pl>
 <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
 <20150831095107.GA2397@eudyptula.hq.kempniu.pl>
 <20150910043812.GB108260@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:36703 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932189AbbKMKRV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 13 Nov 2015 05:17:21 -0500
Received: by lbblt2 with SMTP id lt2so51283420lbb.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2015 02:17:19 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20150910043812.GB108260@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Mario Limonciello <mario_limonciello@dell.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

=46or those of you playing along at home, I have some news (mostly bad,
I'm afraid).

TL;DR: I don't believe there is any way of getting Vostro V131 fully
supported by the kernel without breaking stuff that already works, so I
suggest a slightly different approach (see the last paragraph).

I have recently noticed that backlight control on a Vostro V131 running
Linux has some glitches as well.  Before WMI gets enabled, pressing
either the "brightness down" (Fn+F4) or the "brightness up" (Fn+F5) key
causes two "presses" of the respective keycode (KEY_BRIGHTNESSUP or
KEY_BRIGHTNESSDOWN) to be reported.  This itself seems buggy to me, but
whatever.  The worse part is that there is an irritating flickering
effect as well [1].  But if that wasn't enough, it gets even worse afte=
r
issuing the WMI-enabling SMI call, because the keycode simulated by ACP=
I
gets "shifted" by one event while the WMI events are reported correctly=
=2E
Consider the following sequence of key presses:

Key pressed     Keycode reported        WMI event reported=20
-----------     ----------------        ------------------
=46n+F4           (none)                  0xe005
=46n+F4           KEY_BRIGHTNESSDOWN      0xe005
=46n+F5           KEY_BRIGHTNESSDOWN      0xe006
=46n+F5           KEY_BRIGHTNESSUP        0xe006
=46n+Mute         KEY_BRIGHTNESSUP        0x0000
=46n+Mute         (none)                  0x0000

I determined that both brightness flickering and incorrect keycode
reporting are caused (the latter indirectly) by ACPI method CESM (and
later I found out that [1] agrees in regard to flickering).  While I
haven't found the source of the "shifting" bug (and I am not willing to=
,
thanks, I'd rather cut myself with a butter knife), the basic tests I'v=
e
performed indicate that simply overriding that CESM method with a no-op
does the job, if combined with correct kernel parameters.

However, all this nonsense makes me come to the conclusion that any
attempts to fix it by only changing existing kernel code are futile [2]=
=2E
Thus, to avoid breaking other Dell devices which already work fine with
Linux, I devised a "solution" using libsmbios (which in turn uses
dcdbas) and ACPI method overriding which seems to work fine.  It still
needs a kernel patch which enables reporting the 0xe025 event as a
keypress (this event is currently associated with a KE_IGNORE sparse
keymap entry).  I prepared a patch which adds a module parameter to
dell-wmi that enables event 0xe025 to be either ignored or not,
depending on the user's choice.  Does that sound sane or is there a
better way to do it?  I'll be happy to post the patch once I'm done
polishing it, given that this route sounds reasonable to the
maintainers.  If we enable the kernel to react to WMI event 0xe025,
Vostro V131 users (at least those using kernels compiled with
CONFIG_ACPI_CUSTOM_METHOD) will actually be able to use all standard
features of their laptops on Linux without recompiling the kernel, whic=
h
I would consider a win (a Pyrrhic one, but still).

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D100441
[2] without Dell's assistance

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
