From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 24 Jun 2015 13:18:25 +0200
Message-ID: <20150624111825.GA2405@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150623114659.GM31818@pali>
 <20150623194015.GA2579@eudyptula.hq.kempniu.pl>
 <201506232147.24651@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:36808 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752434AbbFXLSa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Jun 2015 07:18:30 -0400
Received: by wicnd19 with SMTP id nd19so132148568wic.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2015 04:18:29 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201506232147.24651@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> Maybe we need to somehow enable receiving such events?

ACPI method WED0, which should enable event collection, is automaticall=
y
invoked when dell-wmi is loaded. Some WMI implementations (e.g. Asus)
require special WMI method calls to enable hotkey event collection, but
these should be visible in the MOF and they're not in this case.

I suspect this is simply a firmware issue that the vendor works around
in Windows using some mysterious hacks. It already happened before [1]
and thus I share your lack of faith in pushing this matter any further
until we hear from Dell...

[1] http://www.spinics.net/lists/linux-acpi/msg34577.html

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
