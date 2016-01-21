From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Thu, 21 Jan 2016 11:52:03 +0100
Message-ID: <20160121105203.GA4312@eudyptula.hq.kempniu.pl>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <20151204132745.GA13441@eudyptula.hq.kempniu.pl>
 <20160111191226.GF10643@malice.jf.intel.com>
 <201601112107.43510@pali>
 <20160121090401.GR7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f196.google.com ([209.85.217.196]:33240 "EHLO
	mail-lb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759362AbcAUKwH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Jan 2016 05:52:07 -0500
Received: by mail-lb0-f196.google.com with SMTP id bc4so1802373lbc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Jan 2016 02:52:06 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20160121090401.GR7192@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Darren Hart <dvhart@infradead.org>

> Micha=C5=82, can you prepare new (v3) version of this patch? Now requ=
ired
> acpi video changes are included and so dell-wmi changes should go to.=
=2E.
> To finally fix this keypress bug on Dell Vostro V131 machine.

I keep this on my to-do list, but the updated patch will depend on the
final version of the SMBIOS API rework, so I guess there is little poin=
t
in posting it now as that API is subject to change.  But rest assured
that as soon as the final version of the API rework series (which I hav=
e
yet to prepare, of course) gets applied by Darren, I will post a v3 of
this patch - after all, it is the very reason I am working on the API
rework.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
