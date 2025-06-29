Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94071EE035
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jun 2025 23:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751239912; cv=none; b=YhtTmWLp/rhoIXfPaDrq0vENrOoWEq80X+wU4DA0nbr6dxoGSifXpkKZMNR1QPo1840DRyDW8CPeNwNCih30BANyV1ZiTOTY+ThXj9Y2j/HJfp8uoL+JO8b4IOz074VvAD/r1cXkND3kofztOGCtMSXDVwZEDpEzxyXSrE0O7W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751239912; c=relaxed/simple;
	bh=SguBH5622aqi/5s2a5390Toif9M5eca6y0BTqKAawvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1PY4AzhJ/MMo6EOGjx0OQhynEWgmLywUmaxBBxUstVO3bw2oS3jSGU9CMmeiyx1KD0keR/ZxCVy0eZGMREVMnSctF5AkH83u+UYHCDbTEVRNy7lJHMde5J9w4Vq74giA0/uUmgAJD19RGNHI0W+W6UMdXxBKS5wmV0azePbnek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Nppr4lO0; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Nppr4lO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751239903; x=1751844703; i=w_armin@gmx.de;
	bh=SguBH5622aqi/5s2a5390Toif9M5eca6y0BTqKAawvU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Nppr4lO0Yu2Ig0diOre9Yz5O2HmyRHeFd/rK6rvPvyMgpw6d/2pdpVnW4Qc5OBAj
	 5ayiM9S9d/h4sN2Gxlx/FvSxnmVs2ux3UQgvOyeIRYAf9awrQqagUKxWxyJGAQYMz
	 aNrLNMPsBThybBZ3b4lY4NsO0HNxHF9p6X7/wE6bVmiT8IfoftNbffVK+rMq4A8Td
	 QyjU/xoHMg28PqUOZgk7eJn2sssG9REZXJ8QQlxEaeOsg+OtxIFzngYfo9TomrpDZ
	 jl/9HVveD4wMEghR9iUYKFwUf9GpS6e3ND/Oelwy5wJKMy4gmomJDIUGTFhPHOOWc
	 maW6avfALDEGvOf3+A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzQg6-1urpdP1Dm4-00yQI7; Mon, 30
 Jun 2025 01:31:43 +0200
Message-ID: <0f15012b-f65c-4fda-81a1-9fff091f166c@gmx.de>
Date: Mon, 30 Jun 2025 01:31:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux kernel 6.8.0-62 generic null pointer
To: Jan Graczyk <jangraczyk@yahoo.ca>, Kurt Borja <kuurtb@gmail.com>
Cc: Prasanth Ksr <prasanth.ksr@dell.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "dell.client.kernel@dell.com" <dell.client.kernel@dell.com>,
 PDx86 <platform-driver-x86@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Hans de Goede <hansg@kernel.org>
References: <740368848.567654.1751195731131.ref@mail.yahoo.com>
 <740368848.567654.1751195731131@mail.yahoo.com>
 <CAHk-=wgMiSKXf7SvQrfEnxVtmT=QVQPjJdNjfm3aXS7wc=rzTw@mail.gmail.com>
 <CAHk-=wjOg3ODTiNF9T5Kifwiz2FnU5DCrUB1MLxG1mnWAo_k9w@mail.gmail.com>
 <DAZ7CSDVAD9H.31NIC2DQ4U1SJ@gmail.com>
 <164439597.623624.1751220132689@mail.yahoo.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <164439597.623624.1751220132689@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Mduoxs4vlr41lORysO/VgzO5bI4utrRzLHk+FDEVzzlXnEL78d/
 0jDsIFqD+CJwAEfji3s1dJbLhZzEAPrrQpvxQC1wtyHB5cxaH5rZkB+qGzpGJ8my7tQOE29
 bYd1l+kUIr8vivOGKN2jZJjayMtBH/WHz37zC2rIM2Giw3limIaXcM4WxD6R8X3d7WsW6bq
 bZERKMWoqlgoXZhISNVLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DV6NSFX63Z8=;6uOjmbXu8eBPyv5V6/ibxpCZl6Y
 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

Am 29.06.25 um 20:02 schrieb Jan Graczyk:

> Hello Kurt,
>
> I have attached both full dmesg dump and acpi dump.
>
> Best Regards,
>
> Jan
>
No top posting please.

> On Sunday, June 29, 2025 at 07:45:13 p.m. GMT+2, Kurt Borja=20
> <kuurtb@gmail.com> wrote:
>
>
> Hi Linus,
>
> On Sun Jun 29, 2025 at 1:55 PM -03, Linus Torvalds wrote:
> > On Sun, 29 Jun 2025 at 09:19, Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> >>
> >> The band-aid fix looks fairly obvious:
> >>
> >>=C2=A0 -=C2=A0 =C2=A0 =C2=A0 if (!obj)
> >>=C2=A0 +=C2=A0 =C2=A0 =C2=A0 if (!obj || !obj->package.elements)
> >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return =
-EIO;
> >>
> >> in both places, but I wonder if there's something more fundamentally
> >> wrong there that the elements array doesn't exist.
> >
> > Bah. That band-aid may fix the oops. but I think the problem is deeper=
.
> >
> > It should probably also check that
> >
> >=C2=A0 (a) obj->type =3D=3D ACPI_TYPE_PACKAGE
> >
> >=C2=A0 (b) obj->package.count is actually large enough for the derefere=
nce
>
> As you mentioned, the driver does check this when creating the sysfs
> attributes here [1]. But I believe it should definitely check every time
> to catch spurious errors.
>
> I'll submit this fix.
>
> >
> > because maybe some broken ACPI bios ends up having a non-package
> > object there and then checking "is obj->package.elements NULL"
> > pointless, because that "package.elements" may be something entirely
> > different than a pointer in the first place, because
> > "package.elements" is only valid for a ACPI_TYPE_PACKAGE.
> >
> > Maybe that wmi_query_block() is always *supposed* to return a
> > ACPI_TYPE_PACKAGE, but I don't see any such guarantees, and it
> > obviously happily is returning an ACPI object with a NULL
> > package.elements.
>
> Not necessarily, AFAIK data blocks could be of any type.
>
> >
> > Some other drivers do seem to check this all, eg
> > drivers/hwmon/hp-wmi-sensors.c has check_wobj() to verify the thing it
> > uses, and it does do things like this:
> >
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (type !=3D ACPI_TYPE_PACKAGE)
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> >
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 elem_count =3D wobj->package.count;
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (elem_count !=3D last_prop + 1)
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> >
> > at the very top of the function. So clearly people have either hit
> > this kind of issue before, or some people have just been more careful.
>
> I think in this case this bug is not common at all, because the driver
> already retrieved this data block successfully once (at init).
>
> I also believe this has something to do with WMI method enablement.
> There might be a race condition at play here. I'll Cc this to Armin Wolf
> so he can take a look.

I do not think so, from my point of view querying the DELL_WMI_BIOS_ENUMER=
ATION_ATTRIBUTE_GUID using ACPI control method WQBL
causes the error. The reason for this seems that this control method can r=
eturn an integer when encountering an error.

Under windows the WMI request would thus fail as the integer would be mars=
haled as a 32-bit buffer, being too small to fulfill
the request. So i think improving the ACPI object validation inside the dr=
iver is indeed the best way to go.

Thanks,
Armin Wolf

>
> >
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linus
>
> @Jan:
>
> What is the reproduction rate of the OOPS?
>
> Your crash log suggest this was triggered by fwupd, maybe a call to
> `fwupdmgr get-bios-settings`?
>
> Also, please attach your full `dmesg` output and `acpidump`.
>
>
>
> [1]
> https://elixir.bootlin.com/linux/v6.16-rc3/source/drivers/platform/x86/d=
ell/dell-wmi-sysman/sysman.c#L426
>
> --=20
> ~ Kurt
>
>
