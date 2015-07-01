From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 1 Jul 2015 10:32:01 +0200
Message-ID: <20150701083201.GA3300@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150624132303.GK21149@pali>
 <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
 <201506272050.24352@pali>
 <20150630073835.GA3612@eudyptula.hq.kempniu.pl>
 <20150630080004.GB27720@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:34901 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751026AbbGAIcE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jul 2015 04:32:04 -0400
Received: by lbcpe5 with SMTP id pe5so8268196lbc.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Jul 2015 01:32:02 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150630080004.GB27720@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> Are you able to detect if Windows receive keypress via WMI or keyboar=
d
> controller or from other driver?

I believe it's done via WMI. In the first message in this thread, I
wrote:

"While in Windows, I copied a sample VBScript from MSDN for receiving
event notifications via WMI, set proper namespace ("root\wmi") and
notification query ("SELECT * FROM BIOSEvent") and it worked."

> Also what you can try is to dump EC registers and DSDT table from
> Windows and compare it with Linux.

Well, here's the catch: there is no PNP0C09 device in the DSDT and thus
the EC driver isn't even loaded in Linux and I can't dump EC registers.
Yet Windows tools seem to be able to do it, using ports 0x66/0x62. I'm
confused.

DSDT tables dumped from Windows and Linux are identical.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
