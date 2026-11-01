Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793556151;
	b=VAJan7sJpKBCu2AegfQKL2+AcnxswYNj9zPSudVsQtCHFooyxn8/3oCix9m7YtLkUT01
	 uX4rohgxDE8pX7gqf/edtgQ+c6M///8QF6BrCy2kffXRSKqL/BjbGPCa9q1W2t4h8aYTB
	 KB2apLj1aXOyhEcYdx+3LexWbXL3yg2i4v+8zWISEUeDPHIB8uDyL258eathPL//4Cnbb
	 urdvMYhWQz9Gdjxezq+0eKoe7kM6fWI5Au9Z6Xn6qXMJbP8BWl2OlWx3KAhKQ97HsoBXB
	 sMxhFnObItcUN2xpTB3S6NYpeVV68NSiYk9wrYJVlcOTgi0La9drIvHXu7nDRc4FvQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556151;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=t7TudF1+AbHizZIulPgh7js5ivL/muf3dHDhO9X0yYI=;
	b=yRESLMzasK3o/RrkOVLIVDvURbU+mq2+jNbExJVNFHaEm9f1e3RpqGXu5U+UkuoAs5lw
	 x59NtCTnem3bOPEcykd+Sr0yfjtht9dEBs7ZDMwV/e0qlVcWR8MYtf06EZd4YHdYNc6EB
	 x02LoFnYrRLaU/fUgdCiZv3GySff/eXStCVWMff3P9XlHxRDc+69pDC1k9+aGI9nMJztt
	 hVaRVcHDrQj5zbikwD1jxIWTpn7Sy98Ra6EccpSDtidTe0gKufR0V2HdfRyzyEOuGSyht
	 US/R0En+yyAqskF8dgCpxRAl0dj1/7Xw2uYgTAt244/BPQ+tc02PmASPFS8wMz9iw5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=BnkCjWf8;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DAD606A324
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 18:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8DAD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=BnkCjWf8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793556148; x=1794160948; i=w_armin@gmx.de;
	bh=t7TudF1+AbHizZIulPgh7js5ivL/muf3dHDhO9X0yYI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BnkCjWf8qZoCs8GBd2n+0gjFCJTm0+4p5jCUcAzVLQJnaDAc9hE4XdDO5QFWXOgl
	 woknkFYZwyVKDL5G6dJEpJDBW8iBtYTbr6zSLTEGcEJVB9SiyEfHEbYOHyczjoE2j
	 Rjjlu0+gUZ8DKMDJ9Ylv9NXyF4+/wrlpPQgwDSOYuI3IgmX9OE36HNbFPaGzZV7SH
	 IcXhB9LTKp6Yk7c/+lztmqNkG1g7+AbcF+7RA8C1mQu+FWx0vWMVXCVYumIUqhkRX
	 V1/u58mrxyKTPMXOqJMKqEH9yXisJ2H2EdE7SqF1zOEjdH/A9Lx8PTbzMrzHFZlLr
	 /NlLSPUxXwywOTm5eA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXp9Y-1x2Xuq2GU8-00NDwP; Sun, 01
 Nov 2026 19:02:28 +0100
Message-ID: <2a69a03b-867d-4ff7-a680-d3186e8c7aa3@gmx.de>
Date: Sun, 1 Nov 2026 19:02:25 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: uniwill-laptop: Venom BlackBook Zero 14 Phantom (L360) - EC fan
 table findings
To: Luke Jones <jonesy@ozemail.com.au>
Cc: platform-driver-x86@vger.kernel.org
References: <027ab80d-0d00-4750-af2e-c7a72db0d0c6@ozemail.com.au>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <027ab80d-0d00-4750-af2e-c7a72db0d0c6@ozemail.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ktV0rX2gsIe3sTAsHpIbAstJOQyNvlcXWz+umvafqs++yW9c5OQ
 v8UA9ShcG82odulxD7eXl4UXz+mQjDNnzW3U35vKfFgSJXdTAIZUionsAFKhNX3PdvEB4WF
 mLnjd2w4UaWE/SktrZhhrDfaP2JL9i+DzicvLW70V49O6uzIvf0Vpprk86QCEVspuNzcw3o
 585CLRnaFZVNPOZDlzy3w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/vwLyToj2xA=;/yxOaycNjad6uym0TNNyaQkxeSc
 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

Am 05.10.26 um 13:29 schrieb Luke Jones:

> Hi Armin,
>
> I own a Venom BlackBook Zero 14 Phantom (L360), an Australian rebrand=20
> of a Uniwill Intel P-series board, and have been getting it working=20
> properly on Linux (Ubuntu 26.04, kernel 7.0). Since uniwill-laptop is=20
> where this belongs long-term, I wanted to share what I found in case=20
> it's useful, and offer to test anything on this hardware.
>
> Hardware:
> - DMI sys_vendor: Venom
> - DMI product/board: Venom BlackBook Zero 14 Phantom (L360)
> - DMI family: Zero Phantom
> - BIOS: N.1.10VEN00 (2023-08-08), EC firmware 1.16
> - CPU: i7-1360P, no dGPU
> - ACPI: \_SB.INOU (INOU0000) with ECRR/ECRW; UNIW0001 touchpad
> - EC 0x0740 (project ID): 0x18 (PHxPxxx); fan tables in Uniwill=20
> Control Center suggest PH4PGx1/PH4PGx2
> - EC 0x078E: UNIVERSAL_FAN_CTRL and CHARGING_PROFILE bits set
>
> Findings on the RAM fan table:
>
> 1. The EC ignores the custom table unless EC_ADDR_AP_OEM (0x0741)=20
> ENABLE_MANUAL_CTRL (bit 0) is set. With the table written and 0x07C6=20
> bit 2 set, but 0x0741 bit 0 clear, the fan stayed on the factory=20
> curve. Setting bit 0 made it follow the table within ~20 s. Uniwill's=20
> Control Center sets this bit while its service runs ("AP exists").
>
Hi, sorry for taking so long to respond.

The driver sets ENABLE_MANUAL_CTRL by default at startup for exactly this =
reason, so we are ready
when support for fan curves is implemented in the future.

> 2. Control Center's sequence: clear 0x07C6 bit 2, write the table, set=
=20
> 0x07C6 bit 2. 0x07C5 bit 7 (SPLIT_TABLES) is per-profile "respective"=20
> CPU/GPU control and is left clear here.
>
Nice, AFAIK the Tuxedo driver does something similar. I suspect that the O=
EM control center only splits the tables
if two fans are present.

> 3. Table semantics, from Control Center 5.1's FanTable_Manager1p5=20
> (their names: TEMP_UP / TEMP_DOWN / DUTY):
> - 0x0F00+k: temperature to step up from level k to k+1 (0x0F0F =3D 0xFF)
> - 0x0F10+k: temperature to step down from level k to k-1 (0x0F10 unused)
> - 0x0F20+k: duty for level k, 0-200 (percent * 2)
> GPU tables are at 0x0F30/0x0F40/0x0F50 with the same layout. In=20
> Control Center's JSON, row i maps as UpT -> 0x0F00+i-1, DownT ->=20
> 0x0F10+i+1.
>
This matches my findings and the layout inside the Tuxedo drivers.

> 4. The EC can dump its own factory table: write the mode to 0x0F5F (1=20
> =3D turbo, 2 =3D gaming, 3 =3D office), then 0xFD to 0x0F5D and 0xC9 to=
=20
> 0x0F5E, and poll until both change.

Very nice, i will keep that in mind when implementing fan curves. This way=
 we can
try fan control into the global platform profile interface.

>
> 5. The factory curve here starts the fan at 35 C (about 40-50% duty at=
=20
> a 50 C idle), which is the main complaint about this laptop. With a=20
> custom table (off below 57 C, 100% from 87 C) it idles silently and=20
> reached 100% / ~7200 rpm under sustained load, peaking at 95 C.
>
> Other notes: 0x0751 reads 0x20 on this machine, which matches none of=20
> Control Center's office/gaming/turbo values (0xA0/0x00/0x10).=20
> EC_ADDR_CHARGE_CTRL (0x07B9) reads 0, so charge modes rather than the=20
> threshold seem to be the right feature for this board, as for the=20
> PH4PG31/PH4PRX1 entries.
>
0x0751 is AFAIK not used on all devices, especially if they support fan ta=
bles. And battery charge limits are so far only used
on Intel Whitebook-based platforms.

> I've packaged this as an out-of-tree DKMS module and tool, so owners=20
> can use it now: https://gitlab.com/ozjonesy/venom-blackbook-linux
>
> NOTES.md there has the full register map. The reverse engineering was=20
> done with an AI assistant's help, but everything above was tested on=20
> the hardware.
>
> Would you be interested in:
> - a DMI entry for this laptop (I can test whatever feature set you=20
> think fits; hwmon readings and charge modes work through the same=20
> registers your driver uses), and/or
> - fan curve support in uniwill-laptop, perhaps through the standard=20
> hwmon pwm1_auto_point*_temp/_pwm attributes?
>
> I'm not a kernel developer, but I'm happy to run test builds, dump=20
> registers or try patches on this machine.
>
> Thanks for the driver,
> Luke

I am keen on adding support for the platform profile and fan curve, but i =
want to
finish battery support and refactoring first. I can however whitelist your=
 device
so that battery charging modes/sensors/keyboard backlight will already wor=
k. For this
i need the output of dmidecode and acpidump.

Thanks,
Armin Wolf

