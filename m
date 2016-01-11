From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Mon, 11 Jan 2016 11:12:26 -0800
Message-ID: <20160111191226.GF10643@malice.jf.intel.com>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
 <20151204011606.GI1800@malice.jf.intel.com>
 <20151204085624.GN10982@pali>
 <20151204132745.GA13441@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42180 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759074AbcAKTM2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:12:28 -0500
Content-Disposition: inline
In-Reply-To: <20151204132745.GA13441@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

On Fri, Dec 04, 2015 at 02:27:45PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> > This patch is not enough for enabling 0xe025 key on that Vostro mac=
hine.
> > Some extra SMBIOS call is needed, without them ACPI will not send W=
MI
> > keypress event.
>=20
> Indeed.  But have you read the last e-mail I wrote before submitting =
the
> original patch [1]?  Brightness control on the V131 is already broken
> "out of the box" with newer kernels (flickering upon brightness chang=
e),
> but if we do what you're suggesting and include the SMI call in the
> kernel, we'll break it even more, to the point where pressing one of =
the
> brightness control keys might not result in any brightness change at
> all.  Sure, we can fix that by overriding an arbitrary ACPI method.  =
Oh,
> wait, did I say "fix"?
>=20
> I posted the patch without the SMI call because that way if you want =
to
> use the Dell Instant Launch hotkey, you just fire up a userspace scri=
pt
> (which uses libsmbios and takes care of overriding the ACPI method) a=
nd
> chances are you will end up with a fully functional system.  Of cours=
e
> you need to understand that using this script is not an elegant solut=
ion
> and that it might break something else, but it's your choice, not the
> kernel's.  And the patch itself does not change kernel's default
> behavior, so we're not risking breaking any other models out there.
>=20
> > At least I think this one patch should not be included into kernel =
until
> > there will be full support for 0xe025 key (adding that SMBIOS call)=
=2E
>=20
> Again, fully supporting the Dell Instant Launch hotkey makes brightne=
ss
> control even more broken than it has to be.  In other words, everythi=
ng
> is terrible.
>=20
> The only real solution to all these issues is a BIOS fix and I'm pret=
ty
> sure it's not happening.
>=20
> [1] http://www.spinics.net/lists/platform-driver-x86/msg07679.html
>=20

I have this patch as still pending review, and I *think* where we are i=
s Pali
had some objections but Michal felt they didn't help address the proble=
m.

Where are we?

--=20
Darren Hart
Intel Open Source Technology Center
