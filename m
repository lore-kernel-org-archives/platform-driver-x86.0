From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RFC 0/4] Asus Wireless Radio Control driver
Date: Sat, 19 Dec 2015 00:00:47 -0800
Message-ID: <20151219080047.GG7244@malice.jf.intel.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57625 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753373AbbLSIAy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Dec 2015 03:00:54 -0500
Content-Disposition: inline
In-Reply-To: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Tue, Dec 15, 2015 at 10:30:38AM -0500, Jo=E3o Paulo Rechi Vita wrote=
:
> This series is a request for comments on the driver for the "Asus Wir=
eless
> Radio Control" device, as named on the vendor website, which handles
> notifications from the airplane mode hotkey and drives the airplane m=
ode
> indicator LED. This device appears in the DSDT as "ASHS".
>=20
> When the airplane mode hotkey is pressed a query 0x0B is started in t=
he
> Embedded Controller, and all this query does is a notify ASHS with th=
e value
> 0x88. ASHS also has one method HSWC, which can drive the airplane mod=
e LED and
> query its status, according to its parameter.

Hi Joao,

Thanks for a detailed introduction, very helpful.

>=20
> To properly drive the LED a new RFKill trigger was implemented, to tr=
ack the
> global state of all RFKill switches in the system, and turn the LED O=
N when all
> are blocked, and OFF otherwise. This code will have to go through rev=
iew on
> linux-wireless, but first I wanted to get feedback on the WRC driver =
itself.

Apologies, I see I jumped the gun on this. I was rushed this afternoon =
and was
trying to avoid being the bottleneck. At least we won't have to wait lo=
ng for
Johannes to decide after we're done with the review here.

>=20
> There is one known issue: the airplane mode LED uses the same ID as t=
he WLAN
> LED in asus-wmi, so at the moment to have the LED being driven correc=
tly by
> asus-wrc I have to disable asus-wmi. Even with wapf=3D0, which does n=
ot register
> a WLAN LED in asus-wmi, the conflict still occurs because
> ASUS_WMI_DSTS_USER_BIT is set. Please advise on what is the best way =
to solve
> this problem.

I'm trying to make sense of these two, what is the common ID?

I see asus-wmi.c uses the dev_id ASUS_WMI_DEVID_WLAN_LED 0x0010012. The=
  ASL you
reference addresses 0x0203000F in OWGD and OWGS, but I don't yet see ho=
w they're
the same thing? Is this buried in the guts of the wmi system?

Regardless, it seems an update to asus nb wmi quirks so we don't setup =
rfkill
with the wmi driver at all. It would be preferable not to have to do it=
 based on
DMI strings. Corentin, any insight you can offer here could be helpful =
in how to
identify these types of systems so we don't have to enumerate them one =
at a
time and make asus-wmi and asus-wrc play nice together.

Joao, it would be nice to consolidate on a naming scheme. hp-wireless,
dell-rbtn, *-rfill, etc. One of these should work for asus. Mousou used
asus-wireless which I'd prefer over another new term like wrc.

>=20
> I've chosen to make this a separate module because this is a separate=
 entry in
> the DSDT, and checkpatch told me to add an entry in MAINTAINERS in th=
is case.
> Please let me know if any of this should have been done differently.
>=20

Are you willing to be the maintainer for this driver? A response to pat=
ches to
this list within a week or so is all that's really required. This subsy=
stem
depends on people with the hardware to help keep it it good shape.

--=20
Darren Hart
Intel Open Source Technology Center
