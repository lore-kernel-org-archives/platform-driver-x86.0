Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284162;
	b=enuFlVZFhZrJ6FfqHlbKLXYacqHRArdQ3jWRIy7YlGQOnXpkGLK3upE8rJ0Uag0FyCTL
	 HKyGsYxts96bW+iiHQfzoA0TKeSJ5b05OwEcqD+IzHz2liGx9+0WNtnQ79j62+jjuVAL3
	 Vp6QXhsH42pHCK1C9kd0Ak93IASW8oIpcaXIQEwdc+6nfAVuFAa0KpX9UmAzx5IqFjudg
	 85boSSy5FbOfYlSycCF42icKhTjv0Mb9BGyAkALmImm9R/6qMz3VA0kloY0Uz++Wrgu0K
	 KfCfCkvpP6BqNXaiU0NtydHKbSWIBWtSv4+Hwm6QORS9mRBUFEmOoP2h4+3j7F3Ybtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284162;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=sWQuH4oO39iUcf9Jv2WWOgQKt2BBBzL/4uzZ5b6CmRE=;
	b=cCGfi/1ZKKOmcOWSBRnwoiUbN5gpgHU8oOtOu/Z3HtZHmMEsZD1EkB4erwbQ8ZHw1WPH
	 H9aP1FvOz19LHG3hcG2TxNIXsHeSboCy8tmjbxy9Hgou/U0L/FQxcBB8g1Ui0xynj/Lu0
	 Ehky/+yDG3m8feginJ/XaiBd9pFNw9bdywj0INCj7qDCY50MCexWdLPlqfnO/bh9pXhdz
	 E35FMCAC36tC0LLAknx7OqSiyXjSwO1qYOOolZ+Hr2WOf59SAoPDSmDG97cSAbVgx9bXf
	 uVcJzxk/FzjWoi0eMQhZ2R0P5K4TmTsDmHnjwc0bomtxfeIpO0kfvOiJMmhFjcHZ+BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=RDm4ChNF;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E99606A31A
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Oct 2026 14:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E99606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=RDm4ChNF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793284159; x=1793888959; i=w_armin@gmx.de;
	bh=sWQuH4oO39iUcf9Jv2WWOgQKt2BBBzL/4uzZ5b6CmRE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RDm4ChNF8j67/jWa6zJJWu5z5YId0uG5tP2K9paHlkRgLrTgtwDhpxImF3CubceP
	 svdq6dBFVSy6ON5WL5hN3BraGyiKpOm+7NpSWuE3zfztfDeMvCEIkD/5bqkS/wHqa
	 CvdNUqVdEU/ltI3IFfpmEoe8uYIehglazFRL0ypYq+rRIGy1Mkp4K2lw5iY88DAxD
	 LSm2vVhfChodtEeE7hd5ja8R7z7XTRE22TLT6s2BfAvSm2kcTOBoqsUr1uXoQ+x53
	 Aa1shHMBwViYU0VR8D+PFdlkBfSRrTPeGMQz1erqBojBiWt7+fCwdcItyocfBx54B
	 /0SNzLpeQkKraGyLxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNY2-1wnNQU3gWm-00qLwP; Thu, 29
 Oct 2026 15:29:18 +0100
Message-ID: <dda27ed7-9f59-4de2-a7b3-4b4f82b0e4ca@gmx.de>
Date: Thu, 29 Oct 2026 15:29:17 +0100
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
Subject: Re: dell-laptop: battery charge control unavailable on XPS 13 DX13260
 (2026), tokens report location 0xffff
From: Armin Wolf <W_Armin@gmx.de>
To: Joseph Kim <wykim88@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, pali@kernel.org
References: <CAFAqP1u38sPN34+wQ47WwphNOrM2q9o_+917fTRJSZvSd4Kc2g@mail.gmail.com>
 <5cac7c60-3b1e-427c-b516-562c1d197e01@gmx.de>
Content-Language: en-US
In-Reply-To: <5cac7c60-3b1e-427c-b516-562c1d197e01@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2jG2acWT8mFA6rep7IhnGA+GR9YvDWkBDMyQmjGMD2GermJsuZo
 YWX8O9u0QW7cGgOX3bG8SUN8MNFcOR/zdXh/IYBAOKBpf2Wle9VcaFg4y0HFmUyDMVPtcA3
 Ygi2zaW4FxuARQio2YxENSOLTDP25vjnT51/AGduDwQJNC9pReurb4kGY9Twj/DJJKYlJZO
 nFt1sF4Q2UaQmmOZK5SOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jLwvO36b9+c=;aKfsD80EKP4K1/W+4y4bfZQMRj0
 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

Am 29.10.26 um 15:12 schrieb Armin Wolf:
> Am 29.10.26 um 05:25 schrieb Joseph Kim:
>> Hi,
>>
>> On the 2026 Dell XPS 13 (DMI product name "XPS 13 DX13260", BIOS 1.6.0,
>> kernel 7.2.8), the dell-laptop battery charge control attributes are
>> created but don't work:
>>
>> /sys/class/power_supply/BAT0/charge_types -> EIO
>> /sys/class/power_supply/BAT0/charge_control_start_threshold -> ENXIO
>> /sys/class/power_supply/BAT0/charge_control_end_threshold -> ENXIO
>>
>> The battery tokens are present in the dell-smbios token table, but all
>> of them report location 0xffff and value 0:
>>
>> 0x0341 0x0342 0x0343 0x0346 0x0347 0x0349 0x034a -> location 0000ffff
>>
>> Most of the ~900 tokens on this BIOS have location 0xffff. Charge mode
>> and Custom start/stop thresholds can be set in BIOS setup (currently
>> Custom 80/90) and are enforced by firmware, but there is no way to read
>> or change them from the OS.
>=20
> I have the same issue on my Dell device, i wonder if we should filter=20
> out such tokens containing placeholder values.
>=20
>> dell-wmi-sysman does not load ("No such device"), so there is no
>> firmware-attributes interface either. These WMI GUIDs are present with
>> no driver bound:
>>
>> 1F13AB7F-6220-4210-8F8E-8BB5E71EE969
>> 2BC49DEF-7B15-4F05-8BB7-EE37B9547C0B
>> A6FEA33E-DABF-46F5-BFC8-460D961BEC9F
>>
>> Dell Command | Configure 5.1.0 (cctk) also fails to query
>> PrimaryBattChargeCfg on this machine.
>>
>> Is battery charge configuration exposed through a different interface
>> on this platform (possibly one of the GUIDs above), or is this somethin=
g
>> a future BIOS update will add to the SMBIOS token interface? Happy to
>> test patches or provide dumps (bmof, token table, acpidump).
>=20
> I did some reverse-engineering on my device a long time ago, and i found=
=20
> out that Dell has introduced a more advanced battery control interface=
=20
> that is currently not supported, see the attached file for details.
>=20
> I would be interested in having support for this too, i can work on some=
=20
> patches if you want.
>=20
> Thanks,
> Armin Wolf

I just remembered the reason why i stopped working on this: i was unable=
=20
to determine if the WMI extensions to the SMBIOS buffer structure are=20
also supported on the legacy SMM-based interface. Maybe someone at Dell=20
can help us with that?

Thanks,
Armin Wolf

>> (Resending from my personal address in plain text; an earlier copy went
>> out from contact@inkas.org with an HTML part by mistake.)
>>
>> Thanks,
>> Joseph
>>
