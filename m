From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Thu, 3 Dec 2015 17:16:06 -0800
Message-ID: <20151204011606.GI1800@malice.jf.intel.com>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56632 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755051AbbLDBQK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Dec 2015 20:16:10 -0500
Content-Disposition: inline
In-Reply-To: <1654e7bcde98f1cf89f698a1e359110c06c6fcd4.1448999372.git.kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

On Tue, Dec 01, 2015 at 08:51:34PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> On some laptop models (e.g. Dell Vostro V131), pressing the Dell Inst=
ant
> Launch hotkey does not raise an i8042 interrupt - only WMI event 0xe0=
25
> is generated.  As there seems to be no ACPI method or SMI call to
> determine without possible side effects whether a given machine is
> capable of simulating a keypress when this hotkey is pressed, DMI
> matching is used to whitelist the models for which an input event sho=
uld
> be generated when WMI event 0xe025 is received.
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
> Changes from v1:
>=20
>   - Use DMI matching instead of a module parameter
>   - Change flag name to improve readability
>=20
> Darren, I am aware this patch conflicts with Andy's WMI rework series
> posted yesterday, so please just let me know if you want me to rebase=
=2E

Thanks for the heads' up. Andy's series is longer and likely going to n=
eed more
review from more people, so I don't necessarily want to hold this one u=
p on it -
unless it makes sense to include it in that series so they can evolve t=
ogether.
I'll leave that to you and Andy to decide.

This looks fine to me, and if Pali will ack it, I'll move it from for-r=
eview to
testing and Andy will need to update patch 14/14 to accomodate - unless=
 you guys
decide to include this in his.

=46or now, this is queued to for-review.

Thanks!

--=20
Darren Hart
Intel Open Source Technology Center
