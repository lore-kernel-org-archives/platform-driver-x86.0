Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C01356774;
	Mon, 11 May 2026 23:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778541095; cv=none; b=WrZ+6wjRfV19pmeK+y0Xcxiw0BmDBi+0Ofar2fQ0lLjk/de+9+m3bKz0BJ8Ha7OgkJOxvU405ioFeJlMZV/U8y7C8wT6mncE4iUzLVyQjIWFh4TyFSLFjUgDQNYMip41r1Ko2vIx4r5b5CS3TZl75IyPO9LedDanE5IF/m7+vw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778541095; c=relaxed/simple;
	bh=G2IpmZHZB++1xDEG0Hq3rULaclH6H09PSm/bU4mBxIQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e13TAEtWNQWhLn+zpswxlIadv8UDkK9qpzbBSsx/qOvJuaBmkjR+xlAuVWjVk+fwIusJUovIzfHdFWHooaauJp0bO/ZRuB+F9QVB2ac6nAZCFn3rPb2rI+6o5KnCXfSSdPO5qDPyLyG0aPKly7052/+gRR9+az1YIzXcIbWE6eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=OTQFJk0q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CfCZr0k/; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="OTQFJk0q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CfCZr0k/"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E45FA14000AE;
	Mon, 11 May 2026 19:11:31 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 11 May 2026 19:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778541091;
	 x=1778627491; bh=SQpoHsjgNvPeL8fIBzWb/T5JxpmjMmHbEQiwzr9Ymq0=; b=
	OTQFJk0q0MQmj1eiRsK5YbNstndls6LXz5mrRrCED05tRwx8nfx6LRVGptURYb9G
	blFiZfmLnfhbGzgSqWxFkqxou5Uy1l/64lghjSMmM1q8Ag0R4F5w8QMKAwERCbR9
	tLWQaQ1sdpbGcclGc6sP6UWtC1ev197JPrspSBYq7/UBmH4jw+7djHxlYohCEWdP
	kQGbRVEM0NCJQGbWbd3aBcBamAx5BRs+z+/pBGikR86cbWG6c2tIm/AITFCg/rlx
	VQpaNMhaTaLnMIibzRE2k6CTHLqo6krllu7xdkJOUZfbWMQCSzqxbmAg0yITx6m3
	iUtwQjawCqmW2rAEQpzvRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778541091; x=
	1778627491; bh=SQpoHsjgNvPeL8fIBzWb/T5JxpmjMmHbEQiwzr9Ymq0=; b=C
	fCZr0k/o27APfopJLlu25u+3W5mm7urskNobgATO6eG7M8LfEeyBtOyxY8/wsVZp
	brN+GeU9w40OUxayMvyqCW5UWcz886vs1U/vLNTHru2C0fQzUaCsVVXLTZVsAn9R
	RPDIgsFk6CLvr7UDz2RYMU9nedzEoiF5Gxf6nvb/08nbPi/IcT7OYkVeLXu4wcIc
	29CRRUYYOJn4auXnUTBWEKBrsvtc51xVwkOB0zOk45o7eFzmkLrp54Xsw00/DnOj
	CiNa3uVVemci74x12s5XT8gUKQBa8pjdx4kKWhu1Dz72y1Ba68fEM5FNtPFdWZG/
	LWrnpy6kpym/3vSBbqgaQ==
X-ME-Sender: <xms:I2ICat19TON3HZcJUkiabq6gZ4opc_Ja1BG51HcKu2wPjBvOBt53tw>
    <xme:I2ICau748AlqZSDcPFFbzSr_PIR-FJbTBdTUGgLwtCl0iopROUi4z1ogYdBCAQGvI
    5QwCDnOmCQA_1zehbtgIcHf-S8uC16tQKO-8_1pKqrWv2jgla7fmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvddtvdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeegvdegueffhfdtleeigfejhffggfeivdejgeelueej
    uedtudetheejudehtdeitdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepjedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohephhgvihhkkhhirdhkrhhoghgvrhhusheslhhinhhugidrihhnthgvlhdrtghomh
    dprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdp
    rhgtphhtthhopehisehrohhnghdrmhhovgdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhushgs
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurh
    hivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:I2ICapLQq9jkzedCKmmpkfdi0jBvlCz90PkBouSfD3RPoWMwlZiPMQ>
    <xmx:I2ICavIXDPYDabYaZvHP4fqRw4_ZcW2uwfTOgqJ5a3-jjYFjdXWbng>
    <xmx:I2ICaoUsALiwzQlIzUKle4KngHIrC4sCjJD3BQOvccTz_8rv1_dafA>
    <xmx:I2ICaolwZsGexF745iP6mjji5jiTCeSLgevU5FDmSKX57k6Z7pTqww>
    <xmx:I2ICaosrf1tRQeTzvQ5Z5odIioX9r1Vbk9JcEs5bx8Zri3ucdTmC3ymZ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 31FAF2CE0078; Mon, 11 May 2026 19:11:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AEdzvOwqgJYJ
Date: Mon, 11 May 2026 19:11:10 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>, linux-usb@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <06e5005d-8621-4031-b3a3-6fd735cebbd4@app.fastmail.com>
In-Reply-To: <c1df76ba422eebfc733f1c73655582804d0e2921.camel@rong.moe>
References: <20260512-ucsi-acpi-broken-devices-v1-1-0f8cd90c35b5@rong.moe>
 <2026051146-husked-ladybug-0c9f@gregkh>
 <c1df76ba422eebfc733f1c73655582804d0e2921.camel@rong.moe>
Subject: Re: [PATCH] usb: typec: ucsi: acpi: Disable on devices with broken firmware
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026, at 3:12 PM, Rong Zhang wrote:
> (+CC Mark Pearson from Lenovo)
>
> Hi Greg,
>
> On Mon, 2026-05-11 at 20:25 +0200, Greg Kroah-Hartman wrote:
>> On Tue, May 12, 2026 at 01:59:34AM +0800, Rong Zhang wrote:
>> > Some Lenovo devices have broken firmware, which reads/writes half-v=
alid-
>> > half-garbage values.
>>=20
>> How does this work with this firmware on other operating systems? =C2=A0
>>=20
>
> The timeout=C2=A0can hardly reached unless a bunch of events cause mul=
tiple
> drivers to compete for the same mutex simultaneously.
>
> If other operating systems' UCSI drivers don't send any command during
> power events, they won't suffer from the mutex acquisition timeout.
> Also, if other drivers on these operating systems don't touch the mutex
> on power events at all, their UCSI drivers should work well too.
>
> These operating systems' UCSI drivers are powered by undefined behavior
> (TM) in both cases.
>
>> What
>> is the odds of fixing the firmware?
>
> They are not Linux-certified devices, so Lenovo is very unlikely to fix
> the firmware unless it breaks Windows :(
>
> Quoting Mark Pearson's reply to the bugzilla thread:
>
>    I can't promise anything - I don't have any official levers to pull=
 for
>    this platform I'm afraid (it is better to buy Linux supported/certi=
fied
>    systems ;) )
>
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c38
>
>>=20
>> > Given that everything is broken, disable ucsi_acpi on these devices=
. The
>> > impact of disabling it is minimal, as Lenovo laptops usually have m=
ost
>> > USCI commands more or less stubbed, and the EC can always handles U=
SB-C
>> > events on its own.
>> >=20
>> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221065#c33
>> > Signed-off-by: Rong Zhang <i@rong.moe>
>> > ---
>> >  drivers/usb/typec/ucsi/ucsi_acpi.c | 91 ++++++++++++++++++++++++++=
++++++++++++
>> >  1 file changed, 91 insertions(+)
>> >=20
>> > diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec=
/ucsi/ucsi_acpi.c
>> > index 6b92f296e985..7632b441d401 100644
>> > --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
>> > +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
>> > @@ -155,6 +155,91 @@ static const struct dmi_system_id ucsi_acpi_qu=
irks[] =3D {
>> >  	{ }
>> >  };
>> > =20
>> > +static const struct dmi_system_id ucsi_acpi_broken_devices[] =3D {
>> > +	/* Firmware reads/writes half-valid-half-garbage values. */
>> > +
>> > +	/* BIOS: P1CN??WW */
>> > +	{
>> > +		.ident =3D "Lenovo IdeaPad 5 2-in-1 14AHP9",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DR"),
>> > +		},
>> > +	},
>> > +	{
>> > +		.ident =3D "Lenovo IdeaPad 5 2-in-1 16AHP9",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83DS"),
>> > +		},
>> > +	},
>> > +
>> > +	/* BIOS: R0CN??WW */
>> > +	{
>> > +		.ident =3D "Lenovo IdeaPad Slim 5 14AKP10",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83NJ"),
>> > +		},
>> > +	},
>> > +	{
>> > +		.ident =3D "Lenovo IdeaPad Slim 5 14AKP10",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HX"),
>> > +		},
>> > +	},
>> > +	{
>> > +		.ident =3D "Lenovo IdeaPad Slim 5 16AKP10",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HY"),
>> > +		},
>> > +	},
>> > +
>> > +	/* BIOS: QXCN??WW */
>> > +	{
>> > +		.ident =3D "Lenovo Yoga 7 2-in-1 14AKP10",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JR"),
>> > +		},
>> > +	},
>> > +	{
>> > +		.ident =3D "Lenovo Yoga 7 2-in-1 16AKP10",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83JU"),
>> > +		},
>> > +	},
>> > +
>> > +	/* BIOS: LNCN??WW */
>> > +	{
>> > +		.ident =3D "Lenovo Yoga Pro 7 14ARP8",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AU"),
>> > +		},
>> > +	},
>> > +	{
>> > +		.ident =3D "Lenovo Slim Pro 7 14ARP8",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83AX"),
>> > +		},
>> > +	},
>> > +
>> > +	/* BIOS: PSCN??WW */
>> > +	{
>> > +		.ident =3D "Lenovo Yoga Pro 7 14ASP9",
>> > +		.matches =3D {
>> > +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>> > +			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
>> > +		},
>> > +	},
>> > +	{ }
>> > +};
>>=20
>> That is a lot of devices to exclude, are you sure that none of them w=
ill
>> ever work properly?
>
> Yes. I carefully checked all acpidumps for these devices provided by
> device owners who replied to the bugzilla thread, and confirmed that
> they all share the same UCSI-ACPI implementation.
>
> 83DR, 83HN, 83HY, 83AU, 83JR are owned by these device owners. Other
> devices share the same BIOS images (see comments in the match table), =
so
> I added them as well.
>
> Device owners also reported their dmesg dumps/snips with ucsi_acpi
> errors.
>
> As a reference, buggy ASL methods are shown as below.
>
> \_SB.PCI0.LPC0.EC0:
>                     Method (ECRD, 1, Serialized)
>                     {
>                         Local0 =3D Acquire (ECMT, 0x03E8)
>                         If ((Local0 =3D=3D Zero))
>                         {
>                             If (ECAV)
>                             {
>                                 Local1 =3D DerefOf (Arg0)
>                                 Release (ECMT)
>                                 Return (Local1)
>                             }
>                             Else
>                             {
>                                 Release (ECMT)
>                             }
>                         }
>
>                         Return (Zero)
>                     }
>
>                     Method (ECWT, 2, Serialized)
>                     {
>                         Local0 =3D Acquire (ECMT, 0x03E8)
>                         If ((Local0 =3D=3D Zero))
>                         {
>                             If (ECAV)
>                             {
>                                 Arg1 =3D Arg0
>                             }
>
>                             Release (ECMT)
>                         }
>                     }
>
> \_SB.UBTC:
>             Method (ECWR, 0, Serialized)
>             {
>                 IO80 =3D 0xD0
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO0, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO0))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO1, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO1))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO2, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO2))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO3, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO3))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO4, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO4))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO5, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO5))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO6, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO6))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO7, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO7))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO8, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO8))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGO9, RefOf (\_SB.PCI0.LPC0.E=
C0.MGO9))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGOA, RefOf (\_SB.PCI0.LPC0.E=
C0.MGOA))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGOB, RefOf (\_SB.PCI0.LPC0.E=
C0.MGOB))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGOC, RefOf (\_SB.PCI0.LPC0.E=
C0.MGOC))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGOD, RefOf (\_SB.PCI0.LPC0.E=
C0.MGOD))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGOE, RefOf (\_SB.PCI0.LPC0.E=
C0.MGOE))
>                 \_SB.PCI0.LPC0.EC0.ECWT (MGOF, RefOf (\_SB.PCI0.LPC0.E=
C0.MGOF))
>                 \_SB.PCI0.LPC0.EC0.ECWT (CTL0, RefOf (\_SB.PCI0.LPC0.E=
C0.CTL0))
>                 \_SB.PCI0.LPC0.EC0.ECWT (CTL1, RefOf (\_SB.PCI0.LPC0.E=
C0.CTL1))
>                 \_SB.PCI0.LPC0.EC0.ECWT (CTL2, RefOf (\_SB.PCI0.LPC0.E=
C0.CTL2))
>                 \_SB.PCI0.LPC0.EC0.ECWT (CTL3, RefOf (\_SB.PCI0.LPC0.E=
C0.CTL3))
>                 \_SB.PCI0.LPC0.EC0.ECWT (CTL4, RefOf (\_SB.PCI0.LPC0.E=
C0.CTL4))
>                 \_SB.PCI0.LPC0.EC0.ECWT (CTL5, RefOf (\_SB.PCI0.LPC0.E=
C0.CTL5))
>                 \_SB.PCI0.LPC0.EC0.ECWT (CTL6, RefOf (\_SB.PCI0.LPC0.E=
C0.CTL6))
>                 \_SB.PCI0.LPC0.EC0.ECWT (CTL7, RefOf (\_SB.PCI0.LPC0.E=
C0.CTL7))
>                 \_SB.PCI0.LPC0.EC0.ECWT (0xE0, RefOf (\_SB.PCI0.LPC0.E=
C0.USDC))
>                 IO80 =3D 0xD1
>             }
>
>             Method (ECRD, 0, Serialized)
>             {
>                 IO80 =3D 0xD3
>                 MGI0 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI0))
>                 MGI1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI1))
>                 MGI2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI2))
>                 MGI3 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI3))
>                 MGI4 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI4))
>                 MGI5 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI5))
>                 MGI6 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI6))
>                 MGI7 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI7))
>                 MGI8 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI8))
>                 MGI9 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGI9))
>                 MGIA =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGIA))
>                 MGIB =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGIB))
>                 MGIC =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGIC))
>                 MGID =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGID))
>                 MGIE =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGIE))
>                 MGIF =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.MGIF))
>                 VER1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.VER1))
>                 VER2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.VER2))
>                 RSV1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.RSV1))
>                 RSV2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.RSV2))
>                 CCI0 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.CCI0))
>                 CCI1 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.CCI1))
>                 CCI2 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.CCI2))
>                 CCI3 =3D \_SB.PCI0.LPC0.EC0.ECRD (RefOf (\_SB.PCI0.LPC=
0.EC0.CCI3))
>                 \_SB.PCI0.LPC0.EC0.ECWT (0xE1, RefOf (\_SB.PCI0.LPC0.E=
C0.USGC))
>                 IO80 =3D 0xD4
>             }
>
>             Method (_DSM, 4, Serialized)  // _DSM: Device-Specific=20
> Method
>             {
>                 If ((Arg0 =3D=3D ToUUID=20
> ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
>                 {
>                     If ((ToInteger (Arg2) =3D=3D Zero))
>                     {
>                         Return (Buffer (One)
>                         {
>                              0x0F                                     =
 =20
>       // .
>                         })
>                     }
>                     ElseIf ((ToInteger (Arg2) =3D=3D One))
>                     {
>                         ECWR ()
>                     }
>                     ElseIf ((ToInteger (Arg2) =3D=3D 0x02))
>                     {
>                         ECRD ()
>                     }
>                     Else
>                     {
>                         Return (Zero)
>                     }
>                 }
>
>                 Return (Zero)
>             }
>         }
>
> Thanks,
> Rong
>
>>=20
>> thanks,
>>=20
>> greg k-h

My biggest concern with this patch is it stands a chance of growing rapi=
dly and extensively.
We've been having a ton of UCSI issues on this years Thinkpad systems. W=
e'll get them fixed, though it's been slow going.

I don't understand it yet (and your notes above might be useful for narr=
owing it down). The FW team says the FW passes all the UCSI tests under =
Windows, but on Linux it's really bad and I see the same on my HW.

Hopefully once we figure out what is going on with the Thinkpads the oth=
er platforms will benefit? but flagging that this error is not uncommon.

I'd be surprised if this is Lenovo only to be honest. I might be wrong, =
but there's really not a lot common between an Ideapad and Thinkpad - th=
ey're completely different FW teams. I would expect the chances that thi=
s shows up elsewhere to be reasonable, in which case your list will grow=
 even more.

Can we wait until a bit more investigation has been done on Thinkpad? Ri=
ght now it's on a small list of gating issues on a few of our platforms =
- so it is getting a bit more attention. Once we have root cause it migh=
t be easier to find a better solution?

Mark
