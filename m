Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF7914A62B
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Oct 2025 15:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760195288; cv=none; b=GGasujJ6VL1CQPdY3v2ITkOJ376YlqOMiVQ+/Qhjo/s69vrkn3zV2vqfej4ClSrgrTAgZEEP1xNkM/WhAeuf77N8Pe7gBzpNtXsMPIkluya1hHExN/lhX0L2rUZxUowWlx/VyI9cn/15pzdY9Dc+qivTmBccubtD5nWF+WiwSRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760195288; c=relaxed/simple;
	bh=hFFtScJDHosot+m1ZIzZXejRDXqHqWyQe4c0KhEmshs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKMKce9AOFeo6CJ7NCVO5Yjxl0fvZ83yoj5Go3291Wi3PJFGKYBSCu7xxq7iCBFnHulsVxDtHHkQTdI7cn7HwHnx+BBdAFNTwK7z5SUjIe+hT2aP/qiTnFrgQo8JpFyMI4VkpszyABjnPbjpJVBhSSONTU1vyiu5rTxcMyyi78s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QuRQnQRu; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QuRQnQRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1760195282; x=1760800082; i=w_armin@gmx.de;
	bh=murOcs/C1MUHR64ZWltN4ZgLmNGtvnoVrGL8noEytG4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QuRQnQRuhH/WcMq+NSKX+JTi3f0PKYGJBrK7msqQOiqrpueOXv7G8mEqkadoyD2F
	 wfuPkkGVtrKQ4M5Ip2BgfznUKaq01i9Q7KAu9Z/tA6sZKwZfD8A70nZjLiJUQXQmK
	 6hP5mCFcoWnCdC+4fOSvcoOQZXrbiDxM0SAYpFlgW1GLUeGsHPq3HiS3C86s8ToMu
	 8hyDOJXRJ+5Ps/B2igaE9FK97twi7LtaqEVHAMDwS+yoiKkz/GhNEpZvLy6ON7BSB
	 07doL8OUOQm2EA6Q3SV+BqV1B+Q1UXNxsMX9QIflUDj2K6O1C0EJ3e7sTfunHq7W9
	 kAR8ktF7SSJ5ftRdLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzyya-1uLny01rni-00rxxn; Sat, 11
 Oct 2025 17:08:02 +0200
Message-ID: <1854119a-c257-4954-81e0-6aa07538d0c5@gmx.de>
Date: Sat, 11 Oct 2025 17:08:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness
 unexpectedly
To: Bugaddr <Bugaddr@protonmail.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com>
 <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de>
 <0RyizLnGQaxXLOtK-q6h-mHCTA2ergYBAIS-DkF1MPD9T5nx79rlaKdIOUBRft7Ghpy11OPo2OZM4waIjDbdnv2fnafWBDxWEYL75XZKtUo=@protonmail.com>
 <0b485b76-fb44-44a4-afab-d35fa31043db@gmx.de>
 <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <UyWxc6DtIYzBAkoHTnMQqR6ZTP_TVtFKEpJ1kFmuTP7jKLXmh5MJxU-qD7zLFosJPBpmpLN6Cl79prEADSrrvBQX4Wi6sltWot-u6i-RigI=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sbjQgzRq8idwdXvpoi4XLQWJdcWSPB4LEXOW+DcU4coUx1smwhU
 mx8wnkIav4aEyrwG0cogB2fw49fOqLVBkupse1DtJftVDqGkY+5+jSwVp7nxMcW00aP6p+x
 T5ZG5lFEUsIefKmaXhX7QxkNsfdBavIu3Ac5bXR15OlHYIRg8G4EdL3iPjbp9pSLsknrbWI
 z4koAPw2dGL00z/nlZePA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jCXxN0ondv8=;2Uo4MtqF29NDzQZFkWi/qF9/epi
 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
 0+mkj2GptCJ4Lf2coS5VqS3+qY=

Am 04.10.25 um 18:33 schrieb Bugaddr:

>
>
>
>
> Sent with Proton Mail secure email.
>
> On Thursday, October 2nd, 2025 at 3:26 AM, Armin Wolf <W_Armin@gmx.de> w=
rote:
>
>> Am 18.09.25 um 21:18 schrieb Bugaddr:
>>
>>>> Am 13.06.25 um 19:12 schrieb Bugaddr:
>>>>
>>>>> Hello,
>>>>> I'm writing to report what appears to be a bug affecting the Acer AN=
515-58 laptop, and I would appreciate any assistance in investigating or r=
esolving it.
>>>>>
>>>>> When I press Fn + F10=E2=80=94which is intended to increase the keyb=
oard backlight brightness=E2=80=94the display brightness unexpectedly decr=
eases along with it. Furthermore, the display brightness continues to lowe=
r incrementally, until I manually press Fn + Brightness Up to stop and rev=
erse it.
>>>>>
>>>>> After pressing Fn + Brightness Up, the display brightness behavior r=
eturns to normal, and the issue does not reoccur=E2=80=94however, from tha=
t point onward, the Brightness Down key no longer works.
>>>>>
>>>>> This behavior is consistent and reproducible. I'm happy to assist wi=
th any debugging, log collection, or kernel testing as needed.
>>>>>
>>>>> Best regards,
>>>>> Bugaddr
>>>>> Hi,
>>>> can you share the output of "acpidump"?
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>> Sorry for late reply, but checkout this:
>>>> https://paste.rs/Nqca3
>>> Thanks,
>>> Bugaddr
>>
>> Hi,
>>
>> sorry for the late response. It seems that you forgot to paste parts of=
 the DSDT table. Could you please store the output
>> of acpidump inside a file (sudo acpidump > acpidump.log) and attach it =
to the email? Also please put the whole mailing list
>>
>> on the CC next time.
>>
>> Thanks,
>> Armin Wolf
> Hey, please checkout the attached acpidump
>
> Thanks,
> Bugaddr

Alright, the following ACPI bytecode is likely responsible for sending tho=
se brightness down events:

	Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0xFF
	{
		Debug =3D "=3D=3D=3D=3D=3DQUERY_11=3D=3D=3D=3D=3D"
                 ^^^WMID.FEBC [Zero] =3D One	/* Acer hotkey event
                 ^^^WMID.FEBC [One] =3D HTBN	/* Hotkey scancode */
                 ^^^WMID.FEBC [One] =3D BRTS	/* Unknown, BIOS error? */
                 ^^^WMID.FEBC [Zero] =3D 0x04	/* Unknown, BIOS error? */
                 Notify (WMID, 0xBC)		/* Notify acer-wmi driver */
                 If (IGDS)			/* Integrated GPU device state? */
                 {
			Notify (^^^GFX0.DD1F, 0x87)		/* Decrease brightness on Intel iGPU */
                 }
                 Else
                 {
                 	Notify (^^^PEG1.PEGP.LCD0, 0x87)	/* Decrease brightness =
on discrete GPU */
                 }
	}

I think the brightness problems are caused by the kernel using the wrong b=
acklight interface.
Can you please try the following things:

1. Unload the acer-wmi driver using "modprobe -r acer-wmi".
2. Boot the kernel with "acpi_backlight=3Dvendor" if the problem still occ=
urs.

Can you also share the output of "acpi_listen" when the problem occurs? Ad=
ditionally you
should check if a BIOS update is available for your device.

Thanks,
Armin Wolf

