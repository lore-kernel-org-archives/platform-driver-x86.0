From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 22:55:42 +0200
Message-ID: <20150703205542.GB2408@eudyptula.hq.kempniu.pl>
References: <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
 <20150703114356.GL1841@pali>
 <20150703132341.GA3129@eudyptula.hq.kempniu.pl>
 <20150703133227.GM1841@pali>
 <20150703135047.GA3530@eudyptula.hq.kempniu.pl>
 <20150703140901.GN1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:35819 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755362AbbGCUzr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 16:55:47 -0400
Received: by lagh6 with SMTP id h6so96340386lag.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 13:55:45 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703140901.GN1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> Then in your case, I would need to know format of *all* events which =
can
> your laptop via WMI receive. If we collect as more as possible events
> from different laptops we can try to abstract format/interface.

Here's a list of all WMI events I could come up with on a Vostro V131. =
I
also put the generated keycode in parentheses next to each entry.

  * AC power connected (keycode: none)
    Note: No WMI event is generated when AC power is disconnected.

dell_wmi: Received WMI event (06 00 00 00 00 00 01 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Unknown key 0 pressed

  * Hotkey #2: Dell Support Center (keycode: 0xe06e)

dell_wmi: Received WMI event (02 00 00 00 6e e0 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Unknown key e06e pressed

  * Hotkey #3: Dell Instant Launch Manager (keycode: none)

dell_wmi: Received WMI event (02 00 00 00 25 e0 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e025 pressed

  * Fn + F2: Wireless on -> off (keycode: none)

dell_wmi: Received WMI event (06 00 00 00 08 e0 1d 03 2e 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e008 pressed
=20
  * Fn + F2: Wireless off -> on (keycode: none)

dell_wmi: Received WMI event (06 00 00 00 08 e0 1d 03 21 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e008 pressed

  * Fn + F4: LCD brightness down (keycode: none)

dell_wmi: Received WMI event (03 00 00 00 05 e0 05 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e005 pressed

  * Fn + F5: LCD brightness up (keycode: none)

dell_wmi: Received WMI event (03 00 00 00 06 e0 07 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e006 pressed

  * Fn + F6: Cycle keyboard backlight brightness (keycode: none)
    Note: Exact same event for all backlight brightness levels.

dell_wmi: Received WMI event (03 00 00 00 0c e0 01 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e00c pressed

  * Fn + F11: Volume down (keycode: 0xe02e)

dell_wmi: Received WMI event (02 00 00 00 2e e0 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e02e pressed

  * Fn + F12: Volume up (keycode: 0xe030)

dell_wmi: Received WMI event (02 00 00 00 30 e0 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e030 pressed

  * Fn + Mute (keycode: 0xe020)
    Note: Yes, all event data bytes are zeros (sigh).

dell_wmi: Received WMI event (00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Unknown key 0 pressed

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
