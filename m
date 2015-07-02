From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Thu, 2 Jul 2015 22:41:22 +0200
Message-ID: <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150624132303.GK21149@pali>
 <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
 <201506272050.24352@pali>
 <20150630073835.GA3612@eudyptula.hq.kempniu.pl>
 <20150630080004.GB27720@pali>
 <20150701083201.GA3300@eudyptula.hq.kempniu.pl>
 <20150701084002.GC17577@pali>
 <20150701101146.GA3421@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f177.google.com ([209.85.217.177]:33850 "EHLO
	mail-lb0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754614AbbGBUl0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jul 2015 16:41:26 -0400
Received: by lbnk3 with SMTP id k3so38988750lbn.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2015 13:41:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150701105544.GD17577@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> Yes, I'm still thinking about some missing init call.

I finally figured it out and we were right - to enable event reporting
via WMI, a WMI method call with a specially crafted buffer passed as an
argument is needed. (Though the SMI lead was correct as the WMI method
generates an SMI calling a BIOS function specified in the buffer
passed.)

I'll be happy to prepare a patch, though I'll appreciate some guidance
in two areas:

 1) The GUID, buffer format and the function to use (DELL_APP_GUID,
    struct app_wmi_args and dell_wmi_perform_query(), respectively) are
    already defined in drivers/leds/dell-led.c. However, the call to be
    made is obviously not related to LEDs, but rather to WMI hotkeys,
    which are handled in drivers/platform/x86/dell-wmi.c. Also, the cal=
l
    should only be made on a Vostro V131 and DMI-based filtering is don=
e
    in yet another file, drivers/platform/x86/dell-laptop.c. Where
    should the fix be placed?

 2) Pressing hotkey #3 on a Dell Vostro V131 generates WMI event 0xe025=
,
    but no keycode. Apparently, Dell XPS L502X generates the same WMI
    event for a hotkey which also generates a keycode [1]. What's the
    best way to solve this conflict?

[1] commit f1566f0: "dell-wmi: Add keys for Dell XPS L502X"

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
