Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CAA38E8D5;
	Tue, 12 May 2026 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610562; cv=none; b=ZefZdHN9j/PRg0xOFqZDpelI8shXd+yh90ZqxA8TSInCmt/+upKSsnmnIDo8m/Hhl4UcC11FQ3MICeanIX1lUhAP0zZ0ZoWJT35FQ0BsXIRB6uSOhQjTkcRcwKtf7LpWX1qiJjwm4bYfN0B+u4/JF1A3NA/onxgEgXbP8SxVLnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610562; c=relaxed/simple;
	bh=zZmN4PTtclJJUry06AOOtJYQFykfiu4S+FfklLTYgzY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DR0YkmX9lkWad/H1iHeeFLjh9n1gzPRT6Cido17qzMR6+udMytM+gQK9TmiqALvh+Ri25CGDQ4M3gZCO1/0HEOoDMY+knsp1MVla8MXsznxdMBFCrjp4XPc34pEee4eSPCIDft4orSFGuSmVNiZDqqpNwH3ovWbDNGVGuy3T0n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=CpkOqPDN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bh8DXKfF; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="CpkOqPDN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bh8DXKfF"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E212A7A00A5;
	Tue, 12 May 2026 14:29:17 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 12 May 2026 14:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778610557;
	 x=1778696957; bh=MZ9n6cE0+AmbDEUMMsc0MXKN7NH9KziWmtArWv3vDWA=; b=
	CpkOqPDNgYIrZEEMRDZjL85Mo2xKGpdu+AYrOeBlIuT0NIGIxVTbXvCgIFzMD3fd
	MJA5r02I3ioDAOwfoXPnnaf6Cu9qfbgQ3Zinh+0HNRkvGyQvhpl1pA9TGSlPU3N6
	rt8TAPJ3cuw/GZALd46wIvr/HkwwWZniJHEtQov3KZlWBCh9/Kq7DBe6YkHe0Koc
	0zmyrweVdEeDqwpSmJ09sxZbfEiW5pAXCWqre895fn3pTp5K0znE+jSXFfS02hDP
	ffhIPBS3LOIjgqk5miQg5U/HLlGUX/xmhJG13GAPjwDxHDpn4bcFXShHnKU3x9ws
	8NWXU7E5Dak+NnQg0bdh0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778610557; x=
	1778696957; bh=MZ9n6cE0+AmbDEUMMsc0MXKN7NH9KziWmtArWv3vDWA=; b=B
	h8DXKfFZKKhiClUVStr7qGhRMKpozxHnlET62kzkdKoMfLSa65ubc+27zEozB8va
	sm17P0pwyPz8nYs333GtMqdeJVY8SpiZK4aQWN2r395X4SN0ahPBsVrIpJg3EYLG
	1PQNrp2os/CTme8jMl+RwGtT5CBbP0u5e/EA0WkKR+C4MoTPEB/G5Mm6nXtmMZAg
	FY9/FB4xDo/DsoFwxhFCslVkj+H44PaKzTEmIZWBokx7T6fAzGIzx1fHXthj2cNd
	r9aZ/MExVp9SW5Ip8EEgiKJ8T0zDvVTRCsn4T29HJk3LUzYDgpFAtnvWTfFVUyCY
	AC/5Bw3lsrrKGFLkFxBCw==
X-ME-Sender: <xms:fHEDappdLPYV86Yh6I-Ly7fC0885O_ftNIsnnpJBhgFoUF99UTnmWQ>
    <xme:fHEDamcKg162-FXoH37qnqi6WkdtQVYr7U-YS1qIVfgZWCzHw9FFiDE4VlBhkdcdf
    QMYd5AiwboyvoGK9FVslW169ToSQ5kIv70A1c-mu1YoYvOYAXGPGyFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvddvhedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeduhffgvdevhfefuddvudfgleetkeelhfdthedvhffh
    teeitdejteegvdejffdvffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhlvghnoh
    hvohdrtghomhdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgvihhkkhhirdhkrh
    hoghgvrhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhk
    hheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehisehrohhngh
    drmhhovgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:fXEDat92gJHsqiBqATuZsl35VRZ4rhboZD4PHCnzK7VvAAVoOtUByg>
    <xmx:fXEDarsU_MpkZ-AxoIwtwQXkzIXAgu0AiAb3AxwD5pFgI2fh5sBCmA>
    <xmx:fXEDahpkl1YA5ggPb8amalI-ef5XzzHwW4qosVvFc5Muq_swDb-UXg>
    <xmx:fXEDavr4FJciBb1ZaUVDADhfejudNtWTwLgQhuoL0YxiPeOl1KhuAg>
    <xmx:fXEDanAUzSWpkL3FMV9cfJb3GcoP3uFtQkOFVKDLJK6zPRUGetJiW7kN>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DFD6C2CE0072; Tue, 12 May 2026 14:29:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AEdzvOwqgJYJ
Date: Tue, 12 May 2026 14:28:56 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>, linux-usb@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <bbea5db0-f19c-4bf4-a8b9-db764d22fc71@app.fastmail.com>
In-Reply-To: <f7e11c958432701c69651f0666ec1604383113e3.camel@rong.moe>
References: <20260512-ucsi-acpi-broken-devices-v1-1-0f8cd90c35b5@rong.moe>
 <2026051146-husked-ladybug-0c9f@gregkh>
 <c1df76ba422eebfc733f1c73655582804d0e2921.camel@rong.moe>
 <06e5005d-8621-4031-b3a3-6fd735cebbd4@app.fastmail.com>
 <f7e11c958432701c69651f0666ec1604383113e3.camel@rong.moe>
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Disable on devices with broken firmware
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rong

On Tue, May 12, 2026, at 8:46 AM, Rong Zhang wrote:
> Hi Mark,
>
> On Mon, 2026-05-11 at 19:11 -0400, Mark Pearson wrote:
>> On Mon, May 11, 2026, at 3:12 PM, Rong Zhang wrote:
>> > (+CC Mark Pearson from Lenovo)
>> >=20
>> > Hi Greg,
>> >=20
>> > On Mon, 2026-05-11 at 20:25 +0200, Greg Kroah-Hartman wrote:
>> > > On Tue, May 12, 2026 at 01:59:34AM +0800, Rong Zhang wrote:
>> > > > Some Lenovo devices have broken firmware, which reads/writes ha=
lf-valid-
>> > > > half-garbage values.
>> > >=20
>> > > How does this work with this firmware on other operating systems?=
 =C2=A0
>> > >=20
>> >=20
>> > The timeout=C2=A0can hardly reached unless a bunch of events cause =
multiple
>> > drivers to compete for the same mutex simultaneously.
>> >=20
>> > If other operating systems' UCSI drivers don't send any command dur=
ing
>> > power events, they won't suffer from the mutex acquisition timeout.
>> > Also, if other drivers on these operating systems don't touch the m=
utex
>> > on power events at all, their UCSI drivers should work well too.
>> >=20
>> > These operating systems' UCSI drivers are powered by undefined beha=
vior
>> > (TM) in both cases.
>> >=20
>> > > What
>> > > is the odds of fixing the firmware?
>> >=20
>> > They are not Linux-certified devices, so Lenovo is very unlikely to=
 fix
>> > the firmware unless it breaks Windows :(
>> >=20
>> > Quoting Mark Pearson's reply to the bugzilla thread:
>> >=20
>> >    I can't promise anything - I don't have any official levers to p=
ull for
>> >    this platform I'm afraid (it is better to buy Linux supported/ce=
rtified
>> >    systems ;) )
>> >=20
>> > https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c38
>> >=20
>> > >=20
>> > > > Given that everything is broken, disable ucsi_acpi on these dev=
ices. The
>> > > > impact of disabling it is minimal, as Lenovo laptops usually ha=
ve most
>> > > > USCI commands more or less stubbed, and the EC can always handl=
es USB-C
>> > > > events on its own.
>> > > >=20
>> > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c33
>> > > > Signed-off-by: Rong Zhang <i@rong.moe>
>> > > > ---
>> > > >  drivers/usb/typec/ucsi/ucsi_acpi.c | 91 ++++++++++++++++++++++=
++++++++++++++++
>> > > >  1 file changed, 91 insertions(+)
>> > > >=20
>> > > > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/t=
ypec/ucsi/ucsi_acpi.c
>> > > > index 6b92f296e985..7632b441d401 100644
>> > > > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
>> > > > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
>> > > > @@ -155,6 +155,91 @@ static const struct dmi_system_id ucsi_acp=
i_quirks[] =3D {
>> > > >  	{ }
>> > > >  };
>> > > > =20
>> > > > +static const struct dmi_system_id ucsi_acpi_broken_devices[] =3D=
 {
>> > > > +	/* Firmware reads/writes half-valid-half-garbage values. */
>> > > > +
>> > > > +	/* BIOS: P1CN??WW */
>> > > > +	{
>> > > > +		.ident =3D "Lenovo IdeaPad 5 2-in-1 14AHP9",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DR"),
>> > > > +		},
>> > > > +	},
>> > > > +	{
>> > > > +		.ident =3D "Lenovo IdeaPad 5 2-in-1 16AHP9",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DS"),
>> > > > +		},
>> > > > +	},
>> > > > +
>> > > > +	/* BIOS: R0CN??WW */
>> > > > +	{
>> > > > +		.ident =3D "Lenovo IdeaPad Slim 5 14AKP10",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83NJ"),
>> > > > +		},
>> > > > +	},
>> > > > +	{
>> > > > +		.ident =3D "Lenovo IdeaPad Slim 5 14AKP10",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HX"),
>> > > > +		},
>> > > > +	},
>> > > > +	{
>> > > > +		.ident =3D "Lenovo IdeaPad Slim 5 16AKP10",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HY"),
>> > > > +		},
>> > > > +	},
>> > > > +
>> > > > +	/* BIOS: QXCN??WW */
>> > > > +	{
>> > > > +		.ident =3D "Lenovo Yoga 7 2-in-1 14AKP10",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JR"),
>> > > > +		},
>> > > > +	},
>> > > > +	{
>> > > > +		.ident =3D "Lenovo Yoga 7 2-in-1 16AKP10",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JU"),
>> > > > +		},
>> > > > +	},
>> > > > +
>> > > > +	/* BIOS: LNCN??WW */
>> > > > +	{
>> > > > +		.ident =3D "Lenovo Yoga Pro 7 14ARP8",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AU"),
>> > > > +		},
>> > > > +	},
>> > > > +	{
>> > > > +		.ident =3D "Lenovo Slim Pro 7 14ARP8",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AX"),
>> > > > +		},
>> > > > +	},
>> > > > +
>> > > > +	/* BIOS: PSCN??WW */
>> > > > +	{
>> > > > +		.ident =3D "Lenovo Yoga Pro 7 14ASP9",
>> > > > +		.matches =3D {
>> > > > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > > > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
>> > > > +		},
>> > > > +	},
>> > > > +	{ }
>> > > > +};
>> > >=20
>> > > That is a lot of devices to exclude, are you sure that none of th=
em will
>> > > ever work properly?
>> >=20
>> > Yes. I carefully checked all acpidumps for these devices provided by
>> > device owners who replied to the bugzilla thread, and confirmed that
>> > they all share the same UCSI-ACPI implementation.
>> >=20
>> > 83DR, 83HN, 83HY, 83AU, 83JR are owned by these device owners. Other
>> > devices share the same BIOS images (see comments in the match table=
), so
>> > I added them as well.
>> >=20
>> > Device owners also reported their dmesg dumps/snips with ucsi_acpi
>> > errors.
>> >=20
>> > As a reference, buggy ASL methods are shown as below.
>> >=20
>> > \_SB.PCI0.LPC0.EC0:
>> >                     Method (ECRD, 1, Serialized)
>> >                     {
>> >                         Local0 =3D Acquire (ECMT, 0x03E8)
>> >                         If ((Local0 =3D=3D Zero))
>> >                         {
>> >                             If (ECAV)
>> >                             {
>> >                                 Local1 =3D DerefOf (Arg0)
>> >                                 Release (ECMT)
>> >                                 Return (Local1)
>> >                             }
>> >                             Else
>> >                             {
>> >                                 Release (ECMT)
>> >                             }
>> >                         }
>> >=20
>> >                         Return (Zero)
>> >                     }
>> >=20
>> >                     Method (ECWT, 2, Serialized)
>> >                     {
>> >                         Local0 =3D Acquire (ECMT, 0x03E8)
>> >                         If ((Local0 =3D=3D Zero))
>> >                         {
>> >                             If (ECAV)
>> >                             {
>> >                                 Arg1 =3D Arg0
>> >                             }
>> >=20
>> >                             Release (ECMT)
>> >                         }
>> >                     }
>> >=20
>> > \_SB.UBTC:
>> >             Method (ECWR, 0, Serialized)
>> >             {
>> >                 IO80 =3D 0xD0
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO0, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO0))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO1, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO1))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO2, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO2))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO3, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO3))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO4, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO4))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO5, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO5))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO6, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO6))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO7, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO7))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO8, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO8))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGO9, RefOf (\_SB.PCI0.LPC=
0.EC0.MGO9))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOA, RefOf (\_SB.PCI0.LPC=
0.EC0.MGOA))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOB, RefOf (\_SB.PCI0.LPC=
0.EC0.MGOB))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOC, RefOf (\_SB.PCI0.LPC=
0.EC0.MGOC))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOD, RefOf (\_SB.PCI0.LPC=
0.EC0.MGOD))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOE, RefOf (\_SB.PCI0.LPC=
0.EC0.MGOE))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (MGOF, RefOf (\_SB.PCI0.LPC=
0.EC0.MGOF))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL0, RefOf (\_SB.PCI0.LPC=
0.EC0.CTL0))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL1, RefOf (\_SB.PCI0.LPC=
0.EC0.CTL1))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL2, RefOf (\_SB.PCI0.LPC=
0.EC0.CTL2))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL3, RefOf (\_SB.PCI0.LPC=
0.EC0.CTL3))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL4, RefOf (\_SB.PCI0.LPC=
0.EC0.CTL4))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL5, RefOf (\_SB.PCI0.LPC=
0.EC0.CTL5))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL6, RefOf (\_SB.PCI0.LPC=
0.EC0.CTL6))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (CTL7, RefOf (\_SB.PCI0.LPC=
0.EC0.CTL7))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (0xE0, RefOf (\_SB.PCI0.LPC=
0.EC0.USDC))
>> >                 IO80 =3D 0xD1
>> >             }
>> >=20
>> >             Method (ECRD, 0, Serialized)
>> >             {
>> >                 IO80 =3D 0xD3
>> >                 MGI0 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI0))
>> >                 MGI1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI1))
>> >                 MGI2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI2))
>> >                 MGI3 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI3))
>> >                 MGI4 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI4))
>> >                 MGI5 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI5))
>> >                 MGI6 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI6))
>> >                 MGI7 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI7))
>> >                 MGI8 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI8))
>> >                 MGI9 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGI9))
>> >                 MGIA =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGIA))
>> >                 MGIB =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGIB))
>> >                 MGIC =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGIC))
>> >                 MGID =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGID))
>> >                 MGIE =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGIE))
>> >                 MGIF =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.MGIF))
>> >                 VER1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.VER1))
>> >                 VER2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.VER2))
>> >                 RSV1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.RSV1))
>> >                 RSV2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.RSV2))
>> >                 CCI0 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.CCI0))
>> >                 CCI1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.CCI1))
>> >                 CCI2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.CCI2))
>> >                 CCI3 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.=
LPC0.EC0.CCI3))
>> >                 \_SB.PCI0.LPC0.EC0.ECWT (0xE1, RefOf (\_SB.PCI0.LPC=
0.EC0.USGC))
>> >                 IO80 =3D 0xD4
>> >             }
>> >=20
>> >             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific=20
>> > Method
>> >             {
>> >                 If ((Arg0 =3D=3D ToUUID=20
>> > ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
>> >                 {
>> >                     If ((ToInteger (Arg2) =3D=3D Zero))
>> >                     {
>> >                         Return (Buffer (One)
>> >                         {
>> >                              0x0F                                  =
    =20
>> >       // .
>> >                         })
>> >                     }
>> >                     ElseIf ((ToInteger (Arg2) =3D=3D One))
>> >                     {
>> >                         ECWR ()
>> >                     }
>> >                     ElseIf ((ToInteger (Arg2) =3D=3D 0x02))
>> >                     {
>> >                         ECRD ()
>> >                     }
>> >                     Else
>> >                     {
>> >                         Return (Zero)
>> >                     }
>> >                 }
>> >=20
>> >                 Return (Zero)
>> >             }
>> >         }
>> >=20
>> > Thanks,
>> > Rong
>> >=20
>> > >=20
>> > > thanks,
>> > >=20
>> > > greg k-h
>>=20
>> My biggest concern with this patch is it stands a chance of growing r=
apidly and extensively.
>
> If the length of match table is a concern, we can turn this into an
> allow list, i.e., disable ucsi_acpi on all Ryzen-based (after Rembrand=
t-
> R) IdeaPad and Yoga devices by default if the allow list doesn't
> matches, as it seems that these devices heavily shares the same UCSI-
> ACPI implementation (probably developed by the same teams?).
>
> I don't have a strong preference on either, so it's up to you and Greg.
>

An allow list would be worse from my (slightly selfish) perspective.

>> We've been having a ton of UCSI issues on this years Thinkpad systems=
. We'll get them fixed, though it's been slow going.
>
> I don't think ThinkPad devices have the same issue, as their USCI-ACPI
> implementations are completely different, which matches with my
> understanding to Lenovo firmware, i.e., ThinkPad firmware is generally
> developed by different teams compared to IdeaPad/Yoga teams.
>
> For example, ThinkPad Z16 Gen 1 (21D4/21D5) seems to implement the UCS=
I-
> ACPI DSM properly (my analysis attached at the end of the reply). Even
> if it is problematic, it must be caused by a different bug.
>

I'm testing on platforms that aren't released yet. Generally you're righ=
t - it's not a problem. But this years platforms have been bad (I don't =
think it's related to the CPU vendor)

>>=20
>> I don't understand it yet (and your notes above might be useful for n=
arrowing it down). The FW team says the FW passes all the UCSI tests und=
er Windows,=C2=A0
>>=20
>
> It's just like you can safely use MT-unsafe libc functions in a single-
> threaded program -- this doesn't prove the MT-safety of these function=
s.
>
> As I've said, the timeout will only reach when a lot of ACPI methods
> compete for the ECMT mutex as the same time. If they tested it with
> little background noise, the mutex acquisition timeout was never reach=
ed
> so no test failed.
>
>> but on Linux it's really bad and I see the same on my HW.
>
> Well, I have another conjecture. Typical Windows users don't bother
> taking a look at Windows Event Viewer at all, so they never notices any
> error related to the ECMT mutex. In contrast, checking dmesg is much
> easier.
>

You might be right. I'm told there is a bunch of qualification testing t=
hey do against Windows but I don't know the details and I've definitely =
previously seen garbage results previously with invalid connector number=
s being returned (that we got fixed); so I'm personally dubious.

Agreed that regular Windows users won't notice. I get this all the time =
- we fix stuff (usually ACPI  errors) that Windows just covers up. Such =
is the penalty for being a superior OS ;)

>>=20
>> Hopefully once we figure out what is going on with the Thinkpads the =
other platforms will benefit? but flagging that this error is not uncomm=
on.
>
> See my analysis at the end of the reply.
>
>>=20
>> I'd be surprised if this is Lenovo only to be honest.=C2=A0
>>=20
>
> That's not surprising. This is not an issue of EC itself, but rather an
> issue of improper implementation of the UCSI-ACPI DSM method, as well =
as
> other EC-related ACPI methods.
>

My concern is that you could end up seeing this on a lot of different HW.

Maybe we just need to be more brutal when an error is detected and quit =
at that point with a pr_err "your UCSI FW is bad, report it to the vendo=
r" and not retry?

There's a huge number of different PCs being released every year, Linux =
usage is growing, any list approach feels doomed to me.

>> I might be wrong, but there's really not a lot common between an Idea=
pad and Thinkpad - they're completely different FW teams.=C2=A0I would e=
xpect the chances that this shows up elsewhere to be reasonable, in whic=
h case your list will grow even more.
>
> That's why the best solution is BIOS update. It would be great if Leno=
vo
> provides BIOS updates to fix all these ECMT chaos.
>
> Meanwhile, some devices (namely, 83JR and 83JU) in the match table hav=
e,
> unfortunately, reached the "End of Development Support" as their BIOS
> download pages show:
>
> https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/yoga-=
series/yoga-7-2-in-1-14akp10/83jr/downloads/ds573496
> https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/yoga-=
series/yoga-7-2-in-1-16akp10/83ju/downloads/ds573496
>
> ... and PSREF says 83DR, 83AU and 83AX are "withdrawn," which means th=
ey
> are EOL according to the FAQs:
>
> https://psref.lenovo.com/WDProduct/IdeaPad/IdeaPad_5_2_in_1_14AHP9
> https://psref.lenovo.com/WDProduct/Yoga/Yoga_Pro_7_14ARP8
> https://psref.lenovo.com/WDProduct/lenovo_slim_pro_7_14arp8
>

Yeah, I know. And it sucks that we can't just have Linux on everything w=
ith vendor suport. One day we'll get there.....

>>=20
>> Can we wait until a bit more investigation has been done on Thinkpad?=
=C2=A0
>>=20
>
> I originally decided to wait a few months before submitting this. Three
> months had passed and Hans suggested I should submit this:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c68
>
> As my analysis will show, I don't think the issue on IdeaPad/Yoga has
> anything in common with ThinkPad.
>
> My speculation on the UCSI issues on ThinkPad is that they might be
> caused by the EC itself or the local mutex (so other ACPI methods may
> access EC simultaneously while ucsi_acpi accessing the EC).
>
>> Right now it's on a small list of gating issues on a few of our platf=
orms - so it is getting a bit more attention.=C2=A0
>>=20
>
> Did you refer to "a ton of UCSI issues on this years Thinkpad systems,"
> or the ECMT chaos on these IdeaPad/Yoga devices?
>
>> Once we have root cause it might be easier to find a better solution?
>>=20
>> Mark
>
> UCSI-ACPI DSM on ThinkPad Z16 Gen 1 (21D4/21D5):
>
> /*
>  * This is an example of my comments.
>  */
>
> /*
>  * ThinkPad: UBSY is a local mutex, so no other methods compete for it.
>  *
>  * IdeaPad/Yoga: ECMT is shared among a lot of ACPI methods:
>  *
>  *   $ grep -rE 'Acquire \(.*ECMT' | wc -l
>  *   21
>  *   $ grep -orE 'Acquire \(.*ECMT[^)]+' | cut -d ',' -f2 | xargs -i=20
> bash -c 'echo $(( {} ))ms' | sort -n | uniq -c
>  *    1 300ms
>  *    2 1000ms
>  *    4 2000ms
>  *    4 8192ms
>  *   10 40960ms
>  */
>             Mutex (UBSY, 0x00)
>             Method (SECM, 1, Serialized)
>             {
>                 Local0 =3D 0x64
>                 While (((\_SB.SCMD !=3D 0x00) && (Local0 !=3D 0x00)))
>                 {
>                     Sleep (0x01)
>                     Local0--
>                 }
>
>                 \_SB.SCMD =3D Arg0
>                 If ((Arg0 =3D=3D 0x02))
>                 {
>                     Local0 =3D 0x64
>                     While (((\_SB.SCMD !=3D 0x00) && (Local0 !=3D 0x00=
)))
>                     {
>                         Sleep (0x01)
>                         Local0--
>                     }
>                 }
>             }
>
> /*
>  * ThinkPad: the UBSY mutex protects the whole UCSI methods.
>  *
>  * IdeaPad/Yoga: the ECMT mutex protects a single byte read/write to t=
he EC,
>  * i.e., protects \_SB.PCI0.LPC0.EC0.ECWT and \_SB.PCI0.LPC0.EC0.ECRD.
>  */
>             Method (ECWR, 0, Serialized)
>             {
> /*
>  * ThinkPad: the acquisition of UBSY has no timeout (0xFFFF means no t=
imeout
>  * according to the ACPI spec), so it will never fail.
>  *
>  * IdeaPad/Yoga: \_SB.PCI0.LPC0.EC0.ECWT and \_SB.PCI0.LPC0.EC0.ECRD s=
ilently
>  * fail after the 1s timeout is reached while their callers never chec=
k for
>  * failure.
>  */
>                 Acquire (UBSY, 0xFFFF)
> /*
>  * ThinkPad: direct EC access, the UCSI buffer and the EC are synchron=
ized.
>  *
>  * IdeaPad/Yoga: the helper functions fail silently when the timeout i=
s reached,
>  * leaving the UCSI buffer and the EC are out of sync.
>  */
>                 \_SB.MGO0 =3D MGO0 /* \_SB_.UBTC.MGO0 */
>                 \_SB.MGO1 =3D MGO1 /* \_SB_.UBTC.MGO1 */
>                 \_SB.MGO2 =3D MGO2 /* \_SB_.UBTC.MGO2 */
>                 \_SB.MGO3 =3D MGO3 /* \_SB_.UBTC.MGO3 */
>                 \_SB.MGO4 =3D MGO4 /* \_SB_.UBTC.MGO4 */
>                 \_SB.MGO5 =3D MGO5 /* \_SB_.UBTC.MGO5 */
>                 \_SB.MGO6 =3D MGO6 /* \_SB_.UBTC.MGO6 */
>                 \_SB.MGO7 =3D MGO7 /* \_SB_.UBTC.MGO7 */
>                 \_SB.MGO8 =3D MGO8 /* \_SB_.UBTC.MGO8 */
>                 \_SB.MGO9 =3D MGO9 /* \_SB_.UBTC.MGO9 */
>                 \_SB.MGOA =3D MGOA /* \_SB_.UBTC.MGOA */
>                 \_SB.MGOB =3D MGOB /* \_SB_.UBTC.MGOB */
>                 \_SB.MGOC =3D MGOC /* \_SB_.UBTC.MGOC */
>                 \_SB.MGOD =3D MGOD /* \_SB_.UBTC.MGOD */
>                 \_SB.MGOE =3D MGOE /* \_SB_.UBTC.MGOE */
>                 \_SB.MGOF =3D MGOF /* \_SB_.UBTC.MGOF */
>                 \_SB.CTL0 =3D CTL0 /* \_SB_.UBTC.CTL0 */
>                 \_SB.CTL1 =3D CTL1 /* \_SB_.UBTC.CTL1 */
>                 \_SB.CTL2 =3D CTL2 /* \_SB_.UBTC.CTL2 */
>                 \_SB.CTL3 =3D CTL3 /* \_SB_.UBTC.CTL3 */
>                 \_SB.CTL4 =3D CTL4 /* \_SB_.UBTC.CTL4 */
>                 \_SB.CTL5 =3D CTL5 /* \_SB_.UBTC.CTL5 */
>                 \_SB.CTL6 =3D CTL6 /* \_SB_.UBTC.CTL6 */
>                 \_SB.CTL7 =3D CTL7 /* \_SB_.UBTC.CTL7 */
>                 Sleep (0x19)
>                 SECM (0x01)
>                 Release (UBSY)
>             }
>
>             Method (ECRD, 0, Serialized)
>             {
> /*
>  * Same as above.
>  */
>                 Acquire (UBSY, 0xFFFF)
>                 SECM (0x02)
>                 Sleep (0x19)
>                 MGI0 =3D \_SB.MGI0
>                 MGI1 =3D \_SB.MGI1
>                 MGI2 =3D \_SB.MGI2
>                 MGI3 =3D \_SB.MGI3
>                 MGI4 =3D \_SB.MGI4
>                 MGI5 =3D \_SB.MGI5
>                 MGI6 =3D \_SB.MGI6
>                 MGI7 =3D \_SB.MGI7
>                 MGI8 =3D \_SB.MGI8
>                 MGI9 =3D \_SB.MGI9
>                 MGIA =3D \_SB.MGIA
>                 MGIB =3D \_SB.MGIB
>                 MGIC =3D \_SB.MGIC
>                 MGID =3D \_SB.MGID
>                 MGIE =3D \_SB.MGIE
>                 MGIF =3D \_SB.MGIF
>                 CCI0 =3D \_SB.CCI0
>                 CCI1 =3D \_SB.CCI1
>                 CCI2 =3D \_SB.CCI2
>                 CCI3 =3D \_SB.CCI3
>                 Release (UBSY)
>             }
>
>             [...]
>
>             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific=20
> Method
>             {
>                 If ((Arg0 =3D=3D ToUUID=20
> ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
>                 {
>                     If ((ToInteger (Arg2) =3D=3D 0x00))
>                     {
>                         Return (Buffer (0x01)
>                         {
>                              0x0F                                     =
 =20
>       // .
>                         })
>                     }
>                     ElseIf ((ToInteger (Arg2) =3D=3D 0x01))
>                     {
>                         ECWR ()
>                     }
>                     ElseIf ((ToInteger (Arg2) =3D=3D 0x02))
>                     {
>                         ECRD ()
>                     }
>                 }
>
>                 Return (0x00)
>             }
>
> The acpidump can be found at=20
> https://github.com/linuxhw/ACPI/blob/master/Notebook/Lenovo/ThinkPad/T=
hinkPad%20Z16%20Gen%201%2021D4S02A00/41C7BA241943.bin
>
Been tied up in meetings today, but I do plan on seeing if this matches =
what I'm seeing. On my todo list...

Mark
