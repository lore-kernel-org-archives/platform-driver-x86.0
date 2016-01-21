From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2] dell-wmi: process Dell Instant Launch hotkey on Dell
 Vostro V131
Date: Thu, 21 Jan 2016 15:56:12 +0100
Message-ID: <20160121145612.GA4684@eudyptula.hq.kempniu.pl>
References: <20151130211542.GE30553@malice.jf.intel.com>
 <20151204132745.GA13441@eudyptula.hq.kempniu.pl>
 <20160111191226.GF10643@malice.jf.intel.com>
 <201601112107.43510@pali>
 <20160121090401.GR7192@pali>
 <20160121105203.GA4312@eudyptula.hq.kempniu.pl>
 <20160121134425.GG7192@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160121134425.GG7192@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

> > > Micha=C5=82, can you prepare new (v3) version of this patch? Now =
required
> > > acpi video changes are included and so dell-wmi changes should go=
 to...
> > > To finally fix this keypress bug on Dell Vostro V131 machine.
> >=20
> > I keep this on my to-do list, but the updated patch will depend on =
the
> > final version of the SMBIOS API rework, so I guess there is little =
point
> > in posting it now as that API is subject to change.  But rest assur=
ed
> > that as soon as the final version of the API rework series (which I=
 have
> > yet to prepare, of course) gets applied by Darren, I will post a v3=
 of
> > this patch - after all, it is the very reason I am working on the A=
PI
> > rework.
>=20
> There is still need to patch dell-wmi.c? And this change does not dep=
end
> on another SMBIOS change (in dell-laptop), right?

Well, back in December, you wrote [1]:

> This patch is not enough for enabling 0xe025 key on that Vostro machi=
ne.
> Some extra SMBIOS call is needed, without them ACPI will not send WMI
> keypress event.
>=20
> (...)
>=20
> Maybe now it could make sense to unify Dell SMBIOS API in kernel and
> move common functions to one place and let drivers to use just common
> functions. According to older Dell ACPI WMI documentation in DMI is b=
it
> which specify if BIOS support SMBIOS via WMI or not.
>=20
> At least I think this one patch should not be included into kernel un=
til
> there will be full support for 0xe025 key (adding that SMBIOS call).

=46rom the above I understood that first you want to unify the Dell SMB=
IOS
API used throughout the kernel (that's currently in progress), so that
it can then be used in dell-wmi as well to perform the SMBIOS call
needed on the Vostro V131.

If you want me to just rework the patch so that it doesn't introduce a
quirk structure, I recalled another reason to use it after all: there
are other Dell laptops which require the special SMI for enabling WMI
events, but report the Dell Instant Launch Hotkey using a different WMI
event code [2].  So I'd say that two separate issues should be fixed
using DMI matching:

  * whether the special SMBIOS call is required,
  * whether the 0x0e25 event should be translated into a keypress.

A quirk structure looks like an elegant way to deal with this.

Could you please advise how you would like me to proceed with this?

[1] http://www.spinics.net/lists/platform-driver-x86/msg07845.html
[2] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1205791/commen=
ts/12

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
