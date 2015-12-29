From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 1/2] dell-wmi: Check if Dell WMI descriptor structure is
 valid
Date: Tue, 29 Dec 2015 13:44:13 +0100
Message-ID: <20151229124413.GB2467@eudyptula.hq.kempniu.pl>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <1450991926-20937-2-git-send-email-pali.rohar@gmail.com>
 <20151228133707.GB7540@eudyptula.hq.kempniu.pl>
 <201512281508.20683@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:35709 "EHLO
	mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753265AbbL2MoS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 07:44:18 -0500
Received: by mail-lf0-f44.google.com with SMTP id c192so35355326lfe.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Dec 2015 04:44:17 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <201512281508.20683@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > > According to Dell WMI document mentioned in ML dicussion archived
> > > at http://www.spinics.net/lists/platform-driver-x86/msg07220.html
> > > OS should check Dell WMI descriptor structure.
> >=20
> > "Should" or "can"?  I skimmed through the ACPI-WMI PDF and Mario's
> > message again and I couldn't find any explicit statement urging the
> > reader to check the structure in question before doing anything els=
e.
>=20
> That's questionable... In "Design flow" is first point that WMI=20
> descriptor check.

Which "Design flow" are you referring to?  Because I found at least two=
:
chapter 2.3 and a subsection of chapter 2.3.3.  Funnily enough, in both
of these locations the WMI Descriptor Method is discussed first.

Personally, I wouldn't use the structure of that document to draw
cause-effect conclusions.  Just look at the last chapter (2.3.4), which
shows how to tell whether the BIOS supports the ACPI-WMI interface.
Shouldn't that be the first thing to check, before doing anything else
mentioned in that document?  Yet, it's the last thing discussed.

Anyway, while the document mentions in several places that the BIOS WMI
Descriptor object can be queried, it fails to convince me as to why thi=
s
is necessary at all as all values in the returned buffer are constant.
Perhaps parsing the buffer is useful as a sanity check of some kind, bu=
t
it certainly isn't a prerequisite for performing further actions.

Given the nature of your patchset, I'd personally rephrase the commit
message(s) to state that according to your observations, there are
behavioral differences between models with different versions of the WM=
I
Interface, so we parse the WMI Descriptor object to determine which WMI
Interface version is used on the machine we're running on.  Perhaps wit=
h
an additional word or two that it won't hurt to also check the WMI
Descriptor object's correctness while we're at it.

If you feel like I'm nit-picking and none of the above matters, please
feel free to disregard my input and just follow your gut.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
