Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EBA8634A
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 16:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736182747; cv=none; b=u1+gH9AHVth5DtU9sMR1yYr9KI0pDlW7fZeS+08KQ+565AI5YleuGs5oi+hdZcRU2jZxv8GWppsEK4EvtxG0cHJH19VXRZMYBVZaSvdPgQ58OLMc8FyfbGFSDQE9XVqiFFEc2ClgJbU6v17rnY4LIUQKV96Xt014UANy72ojrUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736182747; c=relaxed/simple;
	bh=GYagJQlAelxaTjIJO9tmBXrNbxpyNZdjjbhZCIougYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YVHKNQ+7lkdzwHOQ2tXC+haYY/fEKAAhJ+7l5+e3GXN927EhwOBr0injFGhBkD7RhV+9+JpY3LORehMSRSFIrb/qlFlB/kTqf5UYtvsP2n1HMxGdFGeOJIS7YZZvP/NR4+aEFRwswcdRDIHJS9lsdX1Z/7VLn6nztEgNQpWYdCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=IkYI+Sbs; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="IkYI+Sbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736182741; x=1736787541; i=w_armin@gmx.de;
	bh=TRhzlGa+KUGUyQBESTVVdf4gmdgmSxMtZiTOUDbjVGw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IkYI+SbsFe8TPB4CVTCkr+gfA+5gMSbBP0TV7E0W7XSmUxW1LNcnh2nKQPcjM8HP
	 1UUekTcQ6J9iceex1SBJrMhefBNpSTHo9sKnnQ/Mn83rmwkLOFHCGFkswl8XZn+vc
	 hb08HH79eohlW0nZ+avZ88BX0K3D2QPIjPXbEm2HhjWu2gyQFbI1HTno/K2hyWgFC
	 yjk/s6GqMLnJ1en7rULb9qhPSo4NiwJk2ngn1aqHTuHFPgBY6ssUFghT2q4RRBQB3
	 ZsS4z68lqtG4cWYMppj4clp9CgmWsDY5p8pSMO4mM8O1eC6VIU1ZxtD7dA5tt8ReI
	 j/KzePf7zjHsVKcMsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1tK94m3RJx-007bVh; Mon, 06
 Jan 2025 17:59:01 +0100
Message-ID: <ceb159f1-2900-4946-a9c9-088ba99d2d67@gmx.de>
Date: Mon, 6 Jan 2025 17:59:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acer-wmi: Nitro button doesn't produce a WMI event
To: Hridesh MG <hridesh699@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CALiyAom1xDH6A0Q2WNHCMUcpMJfM3pXO2DaW=bgHGUi8ZOpBbQ@mail.gmail.com>
 <8b8749c1-59c8-4f95-a43e-055cf94f9597@gmx.de>
 <CALiyAo=R1kcvwRpw22s=YU0YHUxR8T_WHLwSvDr=8Ahsenn-jA@mail.gmail.com>
 <9c625119-e46e-464b-933d-9c836577f454@gmx.de>
 <CALiyAo=7kVi4ipA5-xDfRYQ-gqyza0woYHUzwGuW5BccLOVHgg@mail.gmail.com>
 <209f39ab-a312-45b5-981c-8324d9b8cd90@gmx.de>
 <CALiyAon+5H_g1V-iNbjdLmjgYDJng+ePH0XeoYxijYurHj+uTg@mail.gmail.com>
 <31c28ea2-881c-42e3-b754-8b52ca7f63fd@gmx.de>
 <CALiyAo=_vGu50RoAPwFMv9J=mkaQWojAQxmB2qmwcEZ5Y8kfSg@mail.gmail.com>
 <583bbdfe-5c5a-4541-b30a-97eb89f2e4c3@gmx.de>
 <CALiyAo=Y1rh=OpTete0N=q2DrFh8CL449xAfSxfJuju+5tc_mQ@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAo=Y1rh=OpTete0N=q2DrFh8CL449xAfSxfJuju+5tc_mQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KiEKe1uiAVjlpkf87iLsRfmu2ahxZ2xbkM3vbfIIKyf3icaG7Vm
 ETONQgXoQJ1UzVmR1xBk3KVy8BEsWE8VRfFKoes/vfgGtdrbVAcVVgt5EcDD2H8lIDDqF6o
 wmLL3dvcZDNiFQaQOH6/QIS5mEjiZX/SLXzaR/H3nk/SNaAgo13MOS1umHNNf9wM8Fvwndu
 ir3jxKHavVdaRLTfBTYYQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:872jie9Az/c=;V3aJWwJVqd/0jjb8ZsWftLUn11i
 Mh8qYGfHrFdb0hr/DEVRzr5fGRpYy68GmfSAz3hLFlFUtd12uJRba/U+HJYxTPrZBjgx33iPK
 heZTAn2Aw51rqLCoIJc9n24jNvVVu6lpK9j343PepAcD5nXwvYcjh8D7UzFkt5mOu+V4ezjcu
 3U3N3oIRNVSJDv8dsIq4dXU1BCMJrpatxUQD2eC8bBgg9W0EB4vR9qxF5nmNTmlAMVGyAN+0q
 pGSdEDA2p1Oop/MqmsW9zCu9CvJMvadGYKsHR3nPDeZ4NwDjiiApkruMGnAVrB77yvJZW4E9z
 P6OE15/W/3VYX5UVjpZSNTKhcq7ugd4UL2KWlX8D59KVHYTviHzmzzUGgotaQTKG6mGodFvGr
 x1SofjXTJuOVekSUQ90RAOPHO+rlwCzZMzWfsV9uhgNiY2ab7jpLs3h1aO92kKi1u4n6zft51
 Majk/wl9vT71Mzv0sDFfXcHoG5ORAP8lwM03t4j4+StlJRFwMoNoTK5AFzR3OAs42HqsbPgb3
 U16Z4QejsCvO74y0zbz+zo1jWeM24IXgMMHutSE5Jru5TpFA3pHAN+WtXCzG80kvX6FoOv9od
 FwuWfCcvixAriwfRkytT6sMy3NVvyLt6BAiPQjIo0YcLi0ef7Sm3jmR2UD9d4bs/hdn7gltvy
 r3mQI4Fd3RffNCJGxF1cmAFje0IIRbKg7ch6nlE4DP1cLcb1rWXL7ls4juhyjG99AhPWYIiPK
 HkNFtdgwb946pg8BSIwt40yMXtjHsbLhTFPQ1ftq2VWE0tw/ZCCA3ZYxBwKrDbJYpaBMQARTC
 LWZyHUaS/atvHP7zvfeBKcGIcCyp6sUWT/j51PZvlkT1QOUzY+kD3IADRpbrkxhuEBoAkVLc1
 drkPPzqSiYBoIfcXvSeMm4rZvyBxAcENtf/K+WVSheZRAi/D9Iyj3XyfZuudca1F/n4pqOxBL
 SYVPXrkb8rFNsFGO0PQEwPyeROMmovV/+PIL3g8LqM3UPBo8yIlXIdn1wifBNmSeIYc/jTAYx
 dLpO5cbCKj7HOHhydK5JeY1SVk5f48lNCOYKEWgU5yh8TeUmSQpeSQydtwTFmgZ5mhUQ6oA3o
 E3QnjIFo/bLT9+/yCTJVf3NyFr98iX

Am 02.01.25 um 07:18 schrieb Hridesh MG:

> On Thu, Jan 2, 2025 at 1:51=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Am 01.01.25 um 20:53 schrieb Hridesh MG:
>>
>>>> This ACPI method should trigger the turbo mode button (found inside t=
he DSDT table):
>>>>
>>>>           Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x=
00-0xFF
>>>>            {
>>>>                   Debug =3D "=3D=3D=3D=3D=3DPROJECT_QUERY_58=3D=3D=3D=
=3D=3D"
>>>>                    ^^^WMID.FEBC [Zero] =3D 0x07
>>>>                    ^^^WMID.FEBC [One] =3D 0x04
>>>>                    ^^^WMID.FEBC [0x02] =3D One
>>>>                    Notify (WMID, 0xBC) // Device-Specific
>>>>           }
>>>>
>>> I feel like an idiot right now but I just realized something: So far
>>> I've been assuming that the button I've been calling the "Turbo
>>> Button" worked the same way on both Nitro and Predator laptops, but
>>> that's not the case.
>>>
>>> On Predator laptops, the button directly enables Turbo mode but on the
>>> Nitro it only opens the Nitro Sense app. I had assumed that both
>>> buttons simply opened the app and that directly enabling Turbo mode
>>> was a feature provided by the Linux driver.
>>>
>>> Given this, the ACPI code that you linked earlier is probably for the
>>> Predator's "Turbo Button". Could it be that the button on my laptop
>>> doesn=E2=80=99t use that ACPI code at all, considering its functionali=
ty is
>>> completely different? (Though i doubt Acer would leave it in if it
>>> wasn't being used)
>> It is quite common for manufactures to just copy and paste ACPI code sn=
ippets, so it is not
>> unusual to have some unused code inside the ACPI tables.
>>
>> Did you receive any input events or dmesg messages when pressing that b=
utton?
>>
>> If no then it could also be that this button depends on the Intel THC t=
ouch controller to work,
>> take a look at https://lore.kernel.org/all/20241216014127.3722172-1-eve=
n.xu@intel.com for details
>> about the Intel THC controller.
>>
>> Thanks,
>> Armin Wolf
>>
> I do receive input events, it shows up with the keycode 433 and symbol
> XF86Presentation. I think you mentioned something regarding an i8042
> filter, can we use that to call the function to cycle between the
> profiles?

Since this is a valid keycode i advise against filtering it out. Instead i=
t would make more
sense to allow userspace to control the turbo state for example trough a s=
ysfs attribute.

Then you can use a userspace program to react to this key press.

Thanks,
Armin Wolf

> --
> Thanks,
> Hridesh MG
>
