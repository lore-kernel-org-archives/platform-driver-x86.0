From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Thu, 25 Jun 2015 11:02:06 +0200
Message-ID: <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150623114659.GM31818@pali>
 <20150623194015.GA2579@eudyptula.hq.kempniu.pl>
 <201506232147.24651@pali>
 <20150624111825.GA2405@eudyptula.hq.kempniu.pl>
 <20150624132303.GK21149@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:35649 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750968AbbFYJCL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Jun 2015 05:02:11 -0400
Received: by wgbhy7 with SMTP id hy7so56574063wgb.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Jun 2015 02:02:10 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150624132303.GK21149@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> Can you try to load wmi.ko with params debug_event=3D1 and
> debug_dump_wdg=3D1 if you can see something in dmesg?

I tried that too, to no avail (well, debug_dump_wdg obviously caused th=
e
parsed contents of _WDG to be printed out, but there was only one event
GUID - the one already present in dell-wmi). Even inserting a pr_info()
call at the beginning of acpi_wmi_notify() didn't make a difference.

> Maybe we really need some hack/hook if this is firmware issue...

Probably, but I have no elegant solution (note my lack of kernel and
ACPI expertise, though), only two unholy abominations:

 a) install a GPE 0x17 handler which would imitate the actions taken by
    the NEVT method and also handle any additional values which may be
    returned by ECG1; the 0x0400 branch would come out pretty lengthy,
    though,

 b) override the ECG1 method (using ACPI method customization) so that
    it notifies some otherwise unused ACPI device [1] just before it
    returns if an event code not already handled by NEVT is detected;
    then implement a standard notify handler for that device; this
    requires CONFIG_ACPI_CUSTOM_METHOD or installing a precompiled DSDT
    using acpi_install_method(), which would just add to the insanity.

[1] Creating a new one solely for this purpose sounds utterly bonkers.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
