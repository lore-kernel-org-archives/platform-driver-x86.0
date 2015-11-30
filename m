From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-wmi: add module param to control Dell Instant
 Launch hotkey processing
Date: Mon, 30 Nov 2015 12:55:42 -0800
Message-ID: <20151130205542.GD30553@malice.jf.intel.com>
References: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
 <20151126144130.GI14190@pali>
 <20151126145556.GA9371@eudyptula.hq.kempniu.pl>
 <201511292050.18883@pali>
 <20151130141400.GA5398@eudyptula.hq.kempniu.pl>
 <20151130143756.GC29576@pali>
 <20151130145458.GA5524@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20151130145458.GA5524@eudyptula.hq.kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 30, 2015 at 03:54:58PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > The best would be if embedded controller could be configured to sen=
d
> > events via i8042 bus...
>=20
> Yes, but if I correctly understand Mario's message back from July [1]=
,
> V131's EC simply does not support generating scancodes at all.
>=20
> > I'm starting to thing that blacklist or whitelist of machines is ne=
eded
> > to collect. And via it decide if WMI event will be accepted or drop=
ped.
>=20
> If you believe this is the way to go, I'm perfectly fine with that.

This is a common approach among platform drivers since we try to suppor=
t
multiple products with a single driver.

Ideally, we could detect if this was necessary by the response of some =
ACPI call
or another, but failing that, DMI matching is our fallback.

--=20
Darren Hart
Intel Open Source Technology Center
