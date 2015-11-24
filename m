From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Tue, 24 Nov 2015 10:02:27 +0100
Message-ID: <20151124090227.GC29874@pali>
References: <5650D693.6050808@gmail.com>
 <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali>
 <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com>
 <20151123192943.GY7413@malice.jf.intel.com>
 <56539427.5090304@gmail.com>
 <5653E243.9010707@gmail.com>
 <5654248E.8030505@gmail.com>
 <20151124085215.GA7046@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:35738 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047AbbKXJCb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Nov 2015 04:02:31 -0500
Received: by wmuu63 with SMTP id u63so86720797wmu.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2015 01:02:29 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151124085215.GA7046@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andrei Borzenkov <arvidjaar@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Tuesday 24 November 2015 08:52:16 Matthew Garrett wrote:
> On Tue, Nov 24, 2015 at 09:49:18AM +0100, Gabriele Mazzotta wrote:
> >=20
> > Pali, what should we do for the case Latitude/Precision + RBTN_TOGG=
LE?
>=20
> Are there any systems which claim Windows 8 support via OSI and which=
=20
> don't implement the rbtn interface? If not, just add an ACPI dependen=
cy=20
> to dell-laptop and have it skip the rfkill code on Windows 8 and late=
r=20
> systems. I never trusted that code, but Dell insisted that it would=20
> always wor on Latitudes and Precisions=E2=80=A6
>=20

Matthew, Dell released documentation for that radio device code in
userspace libsmbios project. And Gabriele told me that userspace tools
works fine. Just kernel implementation is somehow broken and does not
work correctly on XPS. I already found some bugs in that kernel
implementation (e.g. garbage was send in buffer via SMI to BIOS). And I
think that SMBIOS is working also on XPS laptops, just there are unfixe=
d
bugs in kernel...

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
