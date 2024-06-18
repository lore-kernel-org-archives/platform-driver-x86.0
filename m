Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D898813BC30
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 21:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718745501; cv=none; b=W2r/150AOeXDQdlHQGaYsnQ8AM2UwJaZBj4JLNuwXfl8XA//F//vkWCYXY8dmXbq8tLZIEt4oIFjGFX1o7wYAFSJiwp55bOcLoU4E5lQMjAZm4NjvTx0yDvJVRsIGZ10AcJpH+HyvzqxH+zrctxz6siT/n5D0OPenbOyg9HVIsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718745501; c=relaxed/simple;
	bh=qF1Wf8rejeP4PNxfFYKV5Se1sv0eXKXobB1BPZrDU4E=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=ofr/InUNCGZ023XDbu7o7yEW5QU3K+uHntP290u79iFsQMz1JKaoDp1qBaQQrLJ2OGuwRETKYxp76os6P7ha6reXh1vDTOxpRtYxK0xMFOmiAOW1v5abQmjINqOQeJIFR2t4o+UrP1y5Jix6pdZipY/v8JlYId9xlLiVG/YjBPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Gygj0PJS; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Gygj0PJS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718745493; x=1719350293; i=w_armin@gmx.de;
	bh=qF1Wf8rejeP4PNxfFYKV5Se1sv0eXKXobB1BPZrDU4E=;
	h=X-UI-Sender-Class:Content-Type:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Gygj0PJSS+iC//KjJC01l0NzXG0kQSeQH1tgbob+cHuysQkpHHQxDcIy3AMyRGiA
	 9JDWhJVHI7v2KjuO34WKlX3kkVWccLIp73hvKuhCI94uRh6WJXMuvOvtGXTpf5hH+
	 LDPpZuzSQxlM9RuxB/fgVSb+D4g1YDGohNxtCM0o2qmFjao5NWMNm1jfxZDP4Wx4u
	 frmWXa2pH5JMLKj314fdaORpb5AXumle3fh8u1xwdKInRbdBvMuqOigLtcqcBhTZU
	 x03n4sM2Nq7+kVSNcE4EtVuQoPLvjGIfFQ5V9QdEYn8YtKVVErhXmo55p70MCztKT
	 K2h3S3ZNZJwWPyhrZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfHEJ-1sqn2k1p3T-00dh5h; Tue, 18
 Jun 2024 23:18:13 +0200
Content-Type: multipart/mixed; boundary="------------tLh6gMuQ0soOOAFja00sm2GJ"
Message-ID: <c6f4cbb7-ced0-4dfd-8d58-42878a47329c@gmx.de>
Date: Tue, 18 Jun 2024 23:18:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
To: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>,
 Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org
References: <50d7eef9-17c4-4be2-bb25-37d7b74048cc@gmail.com>
 <686d3c56-b95e-4081-bde2-d36a7c7ab2e9@gmx.de>
 <11bb0fe3-a252-4cdc-9903-dc35af794ddb@gmail.com>
 <694c5973-8f27-4f9a-9da3-829482884ab2@gmx.de> <ZnDhk4YvczQV0JhW@taihen.jp>
 <2c7aeda6-40a5-43e8-ad7d-c1ba4e8ee0c0@gmail.com>
 <617b732c-f044-46ca-a7eb-cade979386c7@gmx.de>
 <bb8ddd94-53e7-4824-94c6-f2ebff7d93ea@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <bb8ddd94-53e7-4824-94c6-f2ebff7d93ea@gmail.com>
X-Provags-ID: V03:K1:hLU6IY2TB4K8i5/ApO8sI18Y8d72+gVgZjDbAvnN1ngd09Bl5Ls
 x0lebFGN102oXtNp5esLCZYdpTb6hhreI/WjZaa0cPxJlNHXcM1wibBaIKckRwvfdobdiXP
 hmMim6RxNEKTmz5obWvmjCvjyLOwmeGkZ9ojMHWp6apxnZ2Xof+ai6YNwYrK2X6Cy6BRUQm
 9gQQPVWSjnAELnptAFG6A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/XWt7MFJsJc=;iBrokyvf++vE05uWVsZvD1H8pOP
 RE3knST8Udmh4ggeG9al0MdRHFhB5SXvWOME92jC2k+6xv5dmXTAAzyJ+lBxvHmWVlMsYVP4t
 zOWUCpqh+u9l3pMoJQXW2uUtnb4nj5kWABzw4iwOY61SVLvOlf/gItRZaLQK9+8xrVNnVkLeM
 1Zvtw6sShJHuKXsLrkpqNWJSBjvM9wj7paZl+IBfluXKcjjk3NZKN6rHsBtCNUkMy3ol/E4RA
 Kmc96y65XmLYHFg7jSCeCeVYadXeal4lFnXut6MhKbG+0VR5caMF4cmKK+4yoFIqHuC3v/daV
 0qwcQcNMj/ASh17YT+5tvZnDcn9ZvB6iH+mXQ1Q+UlGvCEf/0RBiM9F/d48O3IhOL+OGXBHZS
 +RWGX7j++bH05BWBFmYnKOp+CioWvckJNgHKHy0HPu4paALxdZtOzUnLRcLazZfwQXzYbS8uz
 VeBfgq1kkm7MYJVIGQhyBYOf9LijoqMpqa8IntTnvvfWdgbUXJ71AVglktUSoo/q/CDPzdWOY
 8PmEfzLYJJQuKoTa2r3pQWl8f64nSm3iwAcCcrAUiDVVmzHtaOvg3pK3rax4Sch7P68ACe7MG
 ZB2kY/m1EcFgGf/oshUd1OpC4UuSiZ4tVrcJDujPE8HZBQ4ux8hT2WgSe7UPnAO3AmojBX33A
 +zxB1Oom7CQl/DzqlSKLhoXiUupyeytCeRoDccqO9SSUxiTvdnIXsU+gL9mj9KXIOI9Ck/HFS
 9+umTM3EwzplVqQw5afg3j0yoBm7LGezxXeixmGJMs7AtIzcbmHJMrhukw/QrCox9qFKWfkJE
 G2Swo22ylPmaNDf8pHqdoorC3Z003TCxQnTtBMOfbX+7E=

This is a multi-part message in MIME format.
--------------tLh6gMuQ0soOOAFja00sm2GJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Am 18.06.24 um 15:08 schrieb Micha=C5=82 Szczepaniak:

> On 18/06/2024 13:47, Armin Wolf wrote:
>> Am 18.06.24 um 09:09 schrieb Micha=C5=82 Szczepaniak:
>>
>>> On 18/06/2024 03:24, Mattia Dongili wrote:
>>>> On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
>>>>> Am 16.06.24 um 22:34 schrieb Micha=C5=82 Szczepaniak:
>>>>>
>>>>>> On 16/06/2024 20:18, Armin Wolf wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> can you share the output of "acpidump"? The zoom-out button should
>>>>>>> report KEY_ZOOMOUT, can you also share the output of dmesg
>>>>>>> after loading the driver with the module parameter "debug=3D1" and
>>>>>>> pressing the buttons?
>>>> [...]
>>>>>> dmesg:
>>>>>> [=C2=A0=C2=A0 19.108393] [=C2=A0 T475] sony_laptop: detected Type3 =
model
>>>>>> [=C2=A0=C2=A0 19.108407] [=C2=A0 T475] sony_laptop: Evaluating _STA
>>>>>> [=C2=A0=C2=A0 19.115105] [=C2=A0 T475] sony_laptop: Device disabled
>>>>>> [=C2=A0=C2=A0 19.115115] [=C2=A0 T475] sony_laptop: Evaluating _PRS
>>>>>> [=C2=A0=C2=A0 19.115145] [=C2=A0 T475] sony_laptop: IO1 at 0xc000 (=
0x20)
>>>>>> [=C2=A0=C2=A0 19.115150] [=C2=A0 T475] sony_laptop: IO1 at 0xc800 (=
0x20)
>>>>>> [=C2=A0=C2=A0 19.115154] [=C2=A0 T475] sony_laptop: IO1 at 0xd000 (=
0x20)
>>>>>> [=C2=A0=C2=A0 19.115157] [=C2=A0 T475] sony_laptop: IO1 at 0xd800 (=
0x20)
>>>>>> [=C2=A0=C2=A0 19.115294] [=C2=A0 T475] input: Sony Vaio Keys as
>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/in=
put/input6
>>>>>>
>>>>>>
>>>>>> [=C2=A0=C2=A0 19.115631] [=C2=A0 T475] input: Sony Vaio Jogdial as
>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/in=
put/input7
>>>>>>
>>>>>>
>>>>>> [=C2=A0=C2=A0 19.118777] [=C2=A0 T475] sony_laptop: device allocate=
d minor is 123
>>>>>> [=C2=A0=C2=A0 19.118791] [=C2=A0 T475] sony_laptop: I/O port1: 0xc0=
00 (0xc000) +
>>>>>> 0x20
>>>>>> [=C2=A0=C2=A0 19.118826] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([ff] [ff]) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0=C2=A0 19.118839] [=C2=A0 T475] sony_laptop: IRQ: 6 - trigge=
ring: 1 -
>>>>>> polarity: 0 - shr: 0
>>>>>> [=C2=A0=C2=A0 19.118844] [=C2=A0 T475] sony_laptop: Evaluating _SRS
>>>>>> [=C2=A0=C2=A0 19.128310] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([ff] [ff]) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0=C2=A0 19.130430] [=C2=A0 T474] input: Power Button as
>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
>>>>>> [=C2=A0=C2=A0 19.136861] [=C2=A0 T475] sony_laptop: sony_pic_call1(=
0x82): 0x0e0a
>>>>>> [=C2=A0=C2=A0 19.136899] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([0e] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0=C2=A0 19.136905] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: unkno=
wn event ([0e] [05]) at
>>>>>> port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0=C2=A0 19.136927] [=C2=A0 T475] sony_laptop: sony_pic_call2(=
0x81 - 0xff):
>>>>>> 0x000e
>>>>>> [=C2=A0=C2=A0 19.136949] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([00] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0=C2=A0 19.136961] [=C2=A0 T475] sony_laptop: sony_pic_call1(=
0x82): 0x000b
>>>>>> [=C2=A0=C2=A0 19.136988] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([0e] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0=C2=A0 19.136993] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: unkno=
wn event ([0e] [05]) at
>>>>>> port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0=C2=A0 19.137161] [=C2=A0 T475] sony_laptop: SPIC setup done=
.
>>>>>> [=C2=A0=C2=A0 19.137261] [=C2=A0 T475] sony_laptop: method: name: G=
BRT, args 0
>>>>>> [=C2=A0=C2=A0 19.137268] [=C2=A0 T475] sony_laptop: method: name: S=
BRT, args 1
>>>>>> [=C2=A0=C2=A0 19.137272] [=C2=A0 T475] sony_laptop: method: name: G=
PBR, args 0
>>>>>> [=C2=A0=C2=A0 19.137276] [=C2=A0 T475] sony_laptop: method: name: S=
PBR, args 1
>>>>>> [=C2=A0=C2=A0 19.137281] [=C2=A0 T475] sony_laptop: method: name: P=
WAK, args 0
>>>>>> [=C2=A0=C2=A0 19.137285] [=C2=A0 T475] sony_laptop: method: name: P=
WRN, args 0
>>>>>> [=C2=A0=C2=A0 19.137289] [=C2=A0 T475] sony_laptop: method: name: C=
SXB, args 1
>>>>>> [=C2=A0=C2=A0 19.137293] [=C2=A0 T475] sony_laptop: method: name: G=
WDP, args 0
>>>>>> [=C2=A0=C2=A0 19.137298] [=C2=A0 T475] sony_laptop: method: name: S=
LRS, args 1
>>>>>> [=C2=A0=C2=A0 19.137302] [=C2=A0 T475] sony_laptop: method: name: R=
BMF, args 1
>>>>>> [=C2=A0=C2=A0 19.137306] [=C2=A0 T475] sony_laptop: method: name: R=
SBI, args 1
>>>>>> [=C2=A0=C2=A0 19.137310] [=C2=A0 T475] sony_laptop: method: name: C=
BMF, args 1
>>>>>> [=C2=A0=C2=A0 19.137314] [=C2=A0 T475] sony_laptop: method: name: L=
NPW, args 1
>>>>>> [=C2=A0=C2=A0 19.137319] [=C2=A0 T475] sony_laptop: method: name: G=
LNP, args 0
>>>>>> [=C2=A0=C2=A0 19.137323] [=C2=A0 T475] sony_laptop: method: name: S=
CAM, args 1
>>>>>> [=C2=A0=C2=A0 19.137327] [=C2=A0 T475] sony_laptop: method: name: G=
CAM, args 0
>>>>>> [=C2=A0=C2=A0 19.137340] [=C2=A0 T475] sony_laptop: Found brightnes=
s_default
>>>>>> getter:
>>>>>> GPBR
>>>>>> [=C2=A0=C2=A0 19.137388] [=C2=A0 T475] sony_laptop: Found brightnes=
s_default
>>>>>> setter:
>>>>>> SPBR
>>>>>> [=C2=A0=C2=A0 19.137402] [=C2=A0 T475] sony_laptop: Found lanpower =
getter: GLNP
>>>>>> [=C2=A0=C2=A0 19.137406] [=C2=A0 T475] sony_laptop: Found lanpower =
setter: LNPW
>>>>>> [=C2=A0=C2=A0 19.137423] [=C2=A0 T475] sony_laptop: SNC setup done.
>>>>>>
>>>>>>
>>>>>> and the 3 buttons zoomin, zoom out, the third one
>>>>>> [=C2=A0 161.975552] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c=
] [31]) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0 161.975596] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_c=
all1(0xa0): 0x5c0a
>>>>>> [=C2=A0 161.975681] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([10=
] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>
>>>>> Zoom in
>>>>>
>>>>>> [ 162.154768] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]=
) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0 162.154814] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_c=
all1(0xa0): 0x5c0a
>>>>>> [=C2=A0 162.154880] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00=
] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>
>>>>> Ignored
>>>>>
>>>>>> [ 163.327457] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]=
) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0 163.327511] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_c=
all1(0xa0): 0x5c0a
>>>>>> [=C2=A0 163.327563] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([20=
] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>
>>>>> Zoom out
>>>>>
>>>>>> [ 163.516819] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]=
) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0 163.516856] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_c=
all1(0xa0): 0x5c0a
>>>>>> [=C2=A0 163.517008] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00=
] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>
>>>>> ignored
>>>>>
>>>>>> [ 165.206657] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]=
) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0 165.206700] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_c=
all1(0xa0): 0x5c0a
>>>>>> [=C2=A0 165.206805] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([01=
] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>
>>>>> Prog 1
>>>>>
>>>>>> [ 165.365447] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]=
) at port
>>>>>> 0xc000(+0x12)
>>>>>> [=C2=A0 165.365491] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_c=
all1(0xa0): 0x5c0a
>>>>>> [=C2=A0 165.365548] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00=
] [05]) at port
>>>>>> 0xc000(+0x12)
>>>>>>
>>>>> ignored
>>>>>
>>>>>> Sorry i messed up and didn't use reply all, Im still quite new to
>>>>>> this
>>>>>>
>>>>> That ok, mistakes happen :)
>>>>>
>>>>> I think the reason for you problem with the zoom-out key is that
>>>>> when sony-laptop
>>>>> iterates through the list of possible key responses, it first
>>>>> matches the definition
>>>>> for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key data as
>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED (also 0x20).
>>>>>
>>>>> This causes SONYPI_EVENT_PKEY_P1 to be picked instead of
>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED.
>>>>
>>>> That's right. The event mask is the same for programmable and zoom
>>>> keys,
>>>> thus the conflict.
>>>>
>>>> { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>>> { 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>>>
>>>>> I am sending this mail to the maintainer of the sony-laptop driver,
>>>>> maybe he can help us in this case.
>>>>
>>>> Heh... I actually have a UX ultra portable laptop somewhere (a UX50
>>>> IIRC) but I'm not sure it'll even turn on. Those things are like 15~2=
0
>>>> years old now.
>>>>
>>>> I don't quite remember the idiosyncrasies of this particular model v/=
s
>>>> other models to be quite frank. On the other hand the module has a
>>>> 'mask' option that you can use to allow-list only certain sets of
>>>> events.
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/drivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n94
>>>>
>>>>
>>>> (I'm glad the help text says "see doc" because I don't see this optio=
n
>>>> mentioned in the doc...)
>>>>
>>>> The bitmasks are here:
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/drivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n3365
>>>>
>>>>
>>>>
>>> Thanks for response but I'm bit confused now, since they have same
>>> event, and i only allow the zoom in/out keys, won't I lose the third
>>> key? Am I missing something?
>>>
>> When using the "mask" module param, you will lose the third key.
>>
>> I think the underlying issue could be that support for the
>> problematic 0x20 SONYPI_EVENT_PKEY_P1 was
>> added in commit 1cae71032183 ("sony-laptop: VGN-A317M hotkey
>> support"), while support for you VIAO model
>> was added in commit 3eb8749a3799 ("sony-laptop: add Type4 model").
>>
>> Commit 1cae71032183 was added after commit 3eb8749a3799, so i think
>> it will be enough to introduce a
>> separate copy of sonypi_pkeyev[] without the conflicting 0x20
>> SONYPI_EVENT_PKEY_P1 definition.
>> This separate copy can then be used by the type3_events[] definition
>> (which is used on you model).
>>
>> If the maintainer agrees with this approach, i can create a patch for
>> you to test. Are you able to
>> compile kernel modules on your device?
>>
>> Thanks,
>> Armin Wolf
>>
> I am using opensuse on the device, I can just add patch in the obs so
> yeah rebuilding kernel is no issue, I could do the patch myself but I
> don't know how to make it device-specific.
>
> Thanks for help!

Nice, can you test the attached patch and report back if it works?

Thanks,
Armin Wolf

--------------tLh6gMuQ0soOOAFja00sm2GJ
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-sony-laptop-Fix-SONYPI_EVENT_ZOOM_OUT_P.patch"
Content-Disposition: attachment;
 filename*0="0001-platform-x86-sony-laptop-Fix-SONYPI_EVENT_ZOOM_OUT_P.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3YzQ0YzFkMTVmODU5NjQ3ZjE5ZTVlMmQ5ODc0NDMyYmIzYTVjYjkyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBcm1pbiBXb2xmIDxXX0FybWluQGdteC5kZT4KRGF0
ZTogVHVlLCAxOCBKdW4gMjAyNCAyMzowOTozNiArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIHBs
YXRmb3JtL3g4Njogc29ueS1sYXB0b3A6IEZpeCBTT05ZUElfRVZFTlRfWk9PTV9PVVRfUFJF
U1NFRAogb24gU29ueSBWQUlPIFVYIFZHTi1VWDM5ME4KCkl0IHR1cm5zIG91dCB0aGF0IG9u
IHR5cGUgMyBtb2RlbHMsIHRoZSBkZWZpbml0aW9ucyBmb3IgdGhlIHByb2dyYW1tYWJsZQpr
ZXlzIHBhcnRpYWxseSBjb25mbGljdCB3aXRoIHRoZSBkZWZpbml0aW9ucyBmb3IgdGhlIHpv
b20ga2V5cy4KClRoaXMgY2F1c2VzIFNPTllQSV9FVkVOVF9aT09NX09VVF9QUkVTU0VEIG9u
IHRoZSBTb255IFZBSU8gVVggVkdOLVVYMzkwTgp0byBiZSByZXBvcnRlZCBhcyBTT05ZUElf
RVZFTlRfUEtFWV9QMS4gRml4IHRoaXMgYnkgcHJvdmlkaW5nIGEgc2VwYXJhdGUKZGVmaW5p
dGlvbiBmb3IgdHlwZTMgbW9kZWxzIHdpdGhvdXQgdGhlIGNvbmZsaWN0aW5nIGtleSBlbnRy
eS4KClNpZ25lZC1vZmYtYnk6IEFybWluIFdvbGYgPFdfQXJtaW5AZ214LmRlPgotLS0KIGRy
aXZlcnMvcGxhdGZvcm0veDg2L3NvbnktbGFwdG9wLmMgfCA5ICsrKysrKysrLQogMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGxhdGZvcm0veDg2L3NvbnktbGFwdG9wLmMgYi9kcml2ZXJzL3BsYXRmb3Jt
L3g4Ni9zb255LWxhcHRvcC5jCmluZGV4IDNlOTRmZGQxZWE1Mi4uMGUxZDA5OWFjMDZhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9zb255LWxhcHRvcC5jCisrKyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L3NvbnktbGFwdG9wLmMKQEAgLTM0NTEsNiArMzQ1MSwxMyBA
QCBzdGF0aWMgc3RydWN0IHNvbnlwaV9ldmVudCBzb255cGlfcGtleWV2W10gPSB7CiAJeyAw
LCAwIH0KIH07CiAKK3N0YXRpYyBzdHJ1Y3Qgc29ueXBpX2V2ZW50IHNvbnlwaV9wa2V5ZXZf
dHlwZTNbXSA9IHsKKwl7IDB4MDEsIFNPTllQSV9FVkVOVF9QS0VZX1AxIH0sCisJeyAweDAy
LCBTT05ZUElfRVZFTlRfUEtFWV9QMiB9LAorCXsgMHgwNCwgU09OWVBJX0VWRU5UX1BLRVlf
UDMgfSwKKwl7IDAsIDAgfQorfTsKKwogLyogVGhlIHNldCBvZiBwb3NzaWJsZSBibHVldG9v
dGggZXZlbnRzICovCiBzdGF0aWMgc3RydWN0IHNvbnlwaV9ldmVudCBzb255cGlfYmx1ZWV2
W10gPSB7CiAJeyAweDU1LCBTT05ZUElfRVZFTlRfQkxVRVRPT1RIX1BSRVNTRUQgfSwKQEAg
LTM1NzIsNyArMzU3OSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc29ueXBpX2V2ZW50dHlwZXMgdHlw
ZTNfZXZlbnRzW10gPSB7CiAJeyAweDMxLCBTT05ZUElfTUVNT1JZU1RJQ0tfTUFTSywgc29u
eXBpX21lbW9yeXN0aWNrZXYgfSwKIAl7IDB4NDEsIFNPTllQSV9CQVRURVJZX01BU0ssIHNv
bnlwaV9iYXR0ZXJ5ZXYgfSwKIAl7IDB4MzEsIFNPTllQSV9QS0VZX01BU0ssIHNvbnlwaV9w
a2V5ZXYgfSwKLQl7IDB4MDUsIFNPTllQSV9QS0VZX01BU0ssIHNvbnlwaV9wa2V5ZXYgfSwK
Kwl7IDB4MDUsIFNPTllQSV9QS0VZX01BU0ssIHNvbnlwaV9wa2V5ZXZfdHlwZTMgfSwKIAl7
IDB4MDUsIFNPTllQSV9aT09NX01BU0ssIHNvbnlwaV96b29tZXYgfSwKIAl7IDB4MDUsIFNP
TllQSV9DQVBUVVJFX01BU0ssIHNvbnlwaV9jYXB0dXJlZXYgfSwKIAl7IDB4MDUsIFNPTllQ
SV9QS0VZX01BU0ssIHNvbnlwaV92b2x1bWVldiB9LAotLSAKMi4zOS4yCgo=

--------------tLh6gMuQ0soOOAFja00sm2GJ--
