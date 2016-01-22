From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Fri, 22 Jan 2016 12:08:30 +0100
Message-ID: <20160122110830.GA5557@eudyptula.hq.kempniu.pl>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <20151204132745.GA13441@eudyptula.hq.kempniu.pl>
 <20160111191226.GF10643@malice.jf.intel.com>
 <201601112107.43510@pali>
 <20160121090401.GR7192@pali>
 <20160121105203.GA4312@eudyptula.hq.kempniu.pl>
 <20160121134425.GG7192@pali>
 <20160121145612.GA4684@eudyptula.hq.kempniu.pl>
 <20160121154248.GI7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160121154248.GI7192@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

> For full support we need:
>=20
> 1) invoke special SMBIOS call for some machine
>=20
> 2) patch dell-wmi.c to do not drop some events for some machines
>=20
> Part 2) needs to touch only dell-wmi.c code, this is obvious. But I
> thought that part 1) will be done in dell-laptop.c code where are all
> others SMBIOS calls. Reason is just because dell-wmi.c is doing WMI
> stuff. Do you want to include this is part 1) also to dell-wmi.c file=
?

Yes, that was my idea.  That SMBIOS call is basically WMI initializatio=
n
code.  Consider the case of Vostro V131 - there is no WMI on that
machine without that SMBIOS call and there is no need to issue that
SMBIOS call if you don't want to use WMI.  Given that dell-wmi does not
depend on dell-laptop, consider the extreme case where the user selects
CONFIG_DELL_LAPTOP=3Dn and CONFIG_DELL_WMI=3Dm, expecting WMI to work. =
 If
we put the WMI-enabling SMBIOS call in dell-laptop, it won't.  Also,
once my Dell SMBIOS API rework series gets applied, adding the relevant
call to dell-wmi will be easy.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
