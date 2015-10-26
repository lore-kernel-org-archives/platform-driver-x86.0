From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Mon, 26 Oct 2015 15:58:20 +0100
Message-ID: <20151026145820.GI27266@pali>
References: <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7>
 <5628E812.2070708@gmail.com>
 <20151022141710.GD15219@pali>
 <56297148.6060605@gmail.com>
 <20151023090027.GG15219@pali>
 <562A022D.1020302@gmail.com>
 <20151023111445.GH15219@pali>
 <562A7667.3050208@gmail.com>
 <20151026143813.GA27580@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:37090 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753772AbbJZO6Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Oct 2015 10:58:25 -0400
Received: by wicfv8 with SMTP id fv8so120162787wic.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2015 07:58:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20151026143813.GA27580@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Monday 26 October 2015 23:38:13 Darren Hart wrote:
> My understanding here though is that laptops with a Fn+RBTN key which=
 changes
> the state of the radio in firmware should be handled via the rfkill i=
nterface
> rather than the inpu interface - so while this patch may appear to wo=
rk, it's
> using the input interface to copy the rfkill interface/state.
>=20

Here is problem: ACPI device ABCE/RBTN (handled by dell-rbtn.ko) just
receive events. It cannot set or change wireless state.

=46or changing rfkill/wireless state is there Dell SMBIOS api and it is
implemented in dell-laptop.ko. But due to bugs in that module, it is
disabled for XPS machines.

And problem is that on machines without HW switch you do not know if
wifi switch is in ON or OFF mode. ACPI tell you just "key pressed". So
for this reason Alex decided to export that event via input layer,
because it is really just key press, not changing state.

> The proper solution, if I'm understanding this correctly - and apolog=
ies if not,
> some of this is new territory for me as well - would be for this devi=
ce to be
> detected as firmware controlled (what we refer to as a SLIDER in the =
code -
> which needs to be renamed IMHO).
>=20

I understood that if you blacklist dell-rbtn.ko on that XPS machine,
then firmware takes control and automatically turn ON/OFF wifi card.

> Let's sort out this point, then we can pull in Rafael to make sure th=
is is how
> to best deal with the spurious event on resume.
>=20

=46or me solution (=3Dignore events when ACPI device is suspended) soun=
ds
good. I do not know if there is better way to implement it, maybe
general linux device model should provide function "am_i_suspended?"
instead tracking "suspend" state internally in each driver. But if such
support in linux device or acpi model is not implemented, I'm fine with
provided patch if it really works.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
