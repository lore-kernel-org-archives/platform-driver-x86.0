From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-wmi: add module param to control Dell Instant
 Launch hotkey processing
Date: Mon, 30 Nov 2015 13:15:42 -0800
Message-ID: <20151130211542.GE30553@malice.jf.intel.com>
References: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 26, 2015 at 03:18:32PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> On some laptop models (e.g. Dell Vostro V131), pressing the Dell Inst=
ant
> Launch hotkey does not raise an i8042 interrupt - only WMI event 0xe0=
25
> is generated.  As there is no flawless way to determine whether a giv=
en
> machine is capable of simulating a keypress when this hotkey is press=
ed,
> a new module parameter is added so that the user can decide whether t=
he
> WMI event should be processed or ignored.
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>

Module parameters are to be avoided wherever possible, especially for t=
hings
like this which set precedent and don't scale well. If we cannot detect=
 which
machines use the EC and which only use WMI, then we can fall back to ch=
ecking
DMI for specific models.

Per the above, and Pali's feedback. I'll be dropping this one in antici=
pation of
a V2.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
