Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E1135A6D
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jun 2024 12:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718798564; cv=none; b=ZF5M3bV1+koB1NH8YaAPSDcTemdinhEBcc4t5eR8UVixZRq+bZG5sFBI0dZldnDu64/6zik5iIO+DQZRglL+aMlu6Zku+9QzRHg6rsAu03LqGrIjiFzToVLiEo64Fh42L3OohxRvc+3nvPXGK+FVgm860fqaAzdIIEoxv7slQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718798564; c=relaxed/simple;
	bh=Lnrn9VEr8A8q5pgoabC2+Vcg93wI9HwtqUZR5ATI7qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=phCvcW63G1EQnMaVhr9Lxla6periJHcsnaaEhuz2GBGndm/unLvjin8D5iEXy5rrucA3QfiAgoF0ONTvKEkfKUlUUFwCFjgZga8RKzsKshM4nOfu50DAxHnIJo9kE3d2i4Ua63h0RAIXidbpf8WmG/a5gPWAWy83wbt1eEb/ZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=quWp/jfC; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="quWp/jfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718798556; x=1719403356; i=w_armin@gmx.de;
	bh=4zqNwOMgrNxP2a8w8GOTzgvnkfIaggbHP5ppYUsqOP8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=quWp/jfCgJki3MA1g80Pk0HOFfRa4u9IwTqkOl9fd21BDHcIT9tGShPKFEAwdoTH
	 LVWVvDse/Uf4vEqwzo41jN4Mo80mZI7YzMZpV5NjXTXiDxi4iBwTGO2jQG138ALaQ
	 74MuORetRCaha7DA5y39VCdzmJ/ZC2hzVBxxFbjOhQfXHN7zfbtXe/fRAvYxXiugN
	 SieHCV/Uy4Rt+CwrP9ytD3JIDvIXrWxTOx072FEgm50SlWVE8DRA2TKxRWmztLCT7
	 /p6ybebSXs0B/AxS90HXBEUUVGydzf4BYrFHfmHo2gYANZ62MnT7GB/R84cIt1E0j
	 qjnHaqy4q7e9HgCqbA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.2.35] ([91.137.126.34]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxDou-1sZ6Rv3Ohc-011LY8; Wed, 19
 Jun 2024 14:02:36 +0200
Message-ID: <dac93fe5-a72d-43dc-a7b2-c203f4c3156c@gmx.de>
Date: Wed, 19 Jun 2024 14:02:34 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
To: Mattia Dongili <malattia@linux.it>,
 =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <686d3c56-b95e-4081-bde2-d36a7c7ab2e9@gmx.de>
 <11bb0fe3-a252-4cdc-9903-dc35af794ddb@gmail.com>
 <694c5973-8f27-4f9a-9da3-829482884ab2@gmx.de> <ZnDhk4YvczQV0JhW@taihen.jp>
 <2c7aeda6-40a5-43e8-ad7d-c1ba4e8ee0c0@gmail.com>
 <617b732c-f044-46ca-a7eb-cade979386c7@gmx.de>
 <bb8ddd94-53e7-4824-94c6-f2ebff7d93ea@gmail.com>
 <c6f4cbb7-ced0-4dfd-8d58-42878a47329c@gmx.de> <ZnKOpP0sSklJh53i@taihen.jp>
 <3f3b63a3-7d6b-4f84-929c-41c9998f256d@gmail.com> <ZnKT6E5_bFdOa1bt@taihen.jp>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ZnKT6E5_bFdOa1bt@taihen.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BssBhG9X3BSX6QLl3/pgJdnavUVQW8uy4CBCiAyZdiDB3i7PUeX
 jelATsKrH2zH0AwFBDforNyVq4SKKMTw4vzHuAniDw2ZrZv3inbsS4h2MroUgx5x0rUKsKN
 dDi4IhhXksRNFJAeeWGiA+uTeD5Uo9fdYwZ0xAxqtrp3gpig81RtUyEESB5orFpWtazrrIR
 1aoRv0dbVUbVIxhBSLZ1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WyrCwVyYvSY=;82478yNjwvjhkUf/smn7asRxDic
 dLwSVI/ZjSfXa8xx7MaU2S9Uaa7lhiM7dAK1scegO8m7EDjPwAaMmSmbw2KcpzdwBsLtEtzQr
 O5jg93ke6xEOp9mBSIgBaWU+EPyKrzu/mP0YSWxG4cFlqJJLckphA4cO35Ncts4XecEm/aMhi
 q4xn8EI4qdWWnG4fOuSl74WM7ixWCpyotdgMRAMasoyGpQwdWeIUv1LmUW5VVY2Hvh0q+cMf9
 V+r/x8nEfuQzBte62XM1rdWUrePSkdH+pb4ifpxAVxnthRJ5wop7JHQPyrwwYZt+W/SZUkmmX
 f6seon37oNXHWdYNzlduIoPKxGEWl+vAjPz7l2By12tcy3VqTeXxtpPQ8WQbtvjmM9bA7qWAc
 02dtEvwBj+lzNfay9GHFKooQRyW1cWU9VRF5zP1VXQnpKD2VpeWgbfr8+j9/gBxws1wa/f7vx
 jp4gJt+gp3mZT6CzMV8cojSJNcuYmMQeBbQ8mnNpFH/JNlV/854k5xgEU8YxVGkHX/5CuFo6B
 SmaVB1+EjDCccXQfcOTm8/nayiMn4I6lRgWPr2U3p9v7QWTA3D/yvXz1rw+ssqLiuJbuUK6eX
 5/xvskJsT5+KsNkH3ge62Av/usglD2lqsNOWoIxeF6HDqfn3Weh0ulltBiFGG4ZURAgHkTgjo
 zNL19VOaEuEvW7LSdapj3xnlZtiASMS9wFxiy2pemJZvrCMVI68LmZ8Pda0bjMemPnlnHio4F
 NmwnNKF9qT0c58RJzF3H+sJLL3GmHE2gv/VgKz8RZzK/JFjI/mKMGUKao/A8afT7I0/2SLWQ3
 S7Jzs2AVOXt2SVp/QYCL7Fh1iORF9T+9DaD28YI/vg2Jc=

Am 19.06.24 um 10:16 schrieb Mattia Dongili:

> On Wed, Jun 19, 2024 at 10:00:18AM +0200, Micha=C5=82 Szczepaniak wrote:
>> On 19/06/2024 09:54, Mattia Dongili wrote:
>>> On Tue, Jun 18, 2024 at 11:18:12PM +0200, Armin Wolf wrote:
>>>> Am 18.06.24 um 15:08 schrieb Micha=C5=82 Szczepaniak:
>>>>
>>>>> On 18/06/2024 13:47, Armin Wolf wrote:
>>>>>> Am 18.06.24 um 09:09 schrieb Micha=C5=82 Szczepaniak:
>>>>>>
>>>>>>> On 18/06/2024 03:24, Mattia Dongili wrote:
>>>>>>>> On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
>>>>>>>>> Am 16.06.24 um 22:34 schrieb Micha=C5=82 Szczepaniak:
>>>>>>>>>
>>>>>>>>>> On 16/06/2024 20:18, Armin Wolf wrote:
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> can you share the output of "acpidump"? The zoom-out button sh=
ould
>>>>>>>>>>> report KEY_ZOOMOUT, can you also share the output of dmesg
>>>>>>>>>>> after loading the driver with the module parameter "debug=3D1"=
 and
>>>>>>>>>>> pressing the buttons?
>>>>>>>> [...]
>>>>>>>>>> dmesg:
>>>>>>>>>> [=C2=A0=C2=A0 19.108393] [=C2=A0 T475] sony_laptop: detected Ty=
pe3 model
>>>>>>>>>> [=C2=A0=C2=A0 19.108407] [=C2=A0 T475] sony_laptop: Evaluating =
_STA
>>>>>>>>>> [=C2=A0=C2=A0 19.115105] [=C2=A0 T475] sony_laptop: Device disa=
bled
>>>>>>>>>> [=C2=A0=C2=A0 19.115115] [=C2=A0 T475] sony_laptop: Evaluating =
_PRS
>>>>>>>>>> [=C2=A0=C2=A0 19.115145] [=C2=A0 T475] sony_laptop: IO1 at 0xc0=
00 (0x20)
>>>>>>>>>> [=C2=A0=C2=A0 19.115150] [=C2=A0 T475] sony_laptop: IO1 at 0xc8=
00 (0x20)
>>>>>>>>>> [=C2=A0=C2=A0 19.115154] [=C2=A0 T475] sony_laptop: IO1 at 0xd0=
00 (0x20)
>>>>>>>>>> [=C2=A0=C2=A0 19.115157] [=C2=A0 T475] sony_laptop: IO1 at 0xd8=
00 (0x20)
>>>>>>>>>> [=C2=A0=C2=A0 19.115294] [=C2=A0 T475] input: Sony Vaio Keys as
>>>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:0=
0/input/input6
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> [=C2=A0=C2=A0 19.115631] [=C2=A0 T475] input: Sony Vaio Jogdial=
 as
>>>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:0=
0/input/input7
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> [=C2=A0=C2=A0 19.118777] [=C2=A0 T475] sony_laptop: device allo=
cated minor is 123
>>>>>>>>>> [=C2=A0=C2=A0 19.118791] [=C2=A0 T475] sony_laptop: I/O port1: =
0xc000 (0xc000) +
>>>>>>>>>> 0x20
>>>>>>>>>> [=C2=A0=C2=A0 19.118826] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: e=
vent ([ff] [ff]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0=C2=A0 19.118839] [=C2=A0 T475] sony_laptop: IRQ: 6 - tr=
iggering: 1 -
>>>>>>>>>> polarity: 0 - shr: 0
>>>>>>>>>> [=C2=A0=C2=A0 19.118844] [=C2=A0 T475] sony_laptop: Evaluating =
_SRS
>>>>>>>>>> [=C2=A0=C2=A0 19.128310] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: e=
vent ([ff] [ff]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0=C2=A0 19.130430] [=C2=A0 T474] input: Power Button as
>>>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
>>>>>>>>>> [=C2=A0=C2=A0 19.136861] [=C2=A0 T475] sony_laptop: sony_pic_ca=
ll1(0x82): 0x0e0a
>>>>>>>>>> [=C2=A0=C2=A0 19.136899] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: e=
vent ([0e] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0=C2=A0 19.136905] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: u=
nknown event ([0e] [05]) at
>>>>>>>>>> port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0=C2=A0 19.136927] [=C2=A0 T475] sony_laptop: sony_pic_ca=
ll2(0x81 - 0xff):
>>>>>>>>>> 0x000e
>>>>>>>>>> [=C2=A0=C2=A0 19.136949] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: e=
vent ([00] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0=C2=A0 19.136961] [=C2=A0 T475] sony_laptop: sony_pic_ca=
ll1(0x82): 0x000b
>>>>>>>>>> [=C2=A0=C2=A0 19.136988] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: e=
vent ([0e] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0=C2=A0 19.136993] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: u=
nknown event ([0e] [05]) at
>>>>>>>>>> port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0=C2=A0 19.137161] [=C2=A0 T475] sony_laptop: SPIC setup =
done.
>>>>>>>>>> [=C2=A0=C2=A0 19.137261] [=C2=A0 T475] sony_laptop: method: nam=
e: GBRT, args 0
>>>>>>>>>> [=C2=A0=C2=A0 19.137268] [=C2=A0 T475] sony_laptop: method: nam=
e: SBRT, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137272] [=C2=A0 T475] sony_laptop: method: nam=
e: GPBR, args 0
>>>>>>>>>> [=C2=A0=C2=A0 19.137276] [=C2=A0 T475] sony_laptop: method: nam=
e: SPBR, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137281] [=C2=A0 T475] sony_laptop: method: nam=
e: PWAK, args 0
>>>>>>>>>> [=C2=A0=C2=A0 19.137285] [=C2=A0 T475] sony_laptop: method: nam=
e: PWRN, args 0
>>>>>>>>>> [=C2=A0=C2=A0 19.137289] [=C2=A0 T475] sony_laptop: method: nam=
e: CSXB, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137293] [=C2=A0 T475] sony_laptop: method: nam=
e: GWDP, args 0
>>>>>>>>>> [=C2=A0=C2=A0 19.137298] [=C2=A0 T475] sony_laptop: method: nam=
e: SLRS, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137302] [=C2=A0 T475] sony_laptop: method: nam=
e: RBMF, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137306] [=C2=A0 T475] sony_laptop: method: nam=
e: RSBI, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137310] [=C2=A0 T475] sony_laptop: method: nam=
e: CBMF, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137314] [=C2=A0 T475] sony_laptop: method: nam=
e: LNPW, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137319] [=C2=A0 T475] sony_laptop: method: nam=
e: GLNP, args 0
>>>>>>>>>> [=C2=A0=C2=A0 19.137323] [=C2=A0 T475] sony_laptop: method: nam=
e: SCAM, args 1
>>>>>>>>>> [=C2=A0=C2=A0 19.137327] [=C2=A0 T475] sony_laptop: method: nam=
e: GCAM, args 0
>>>>>>>>>> [=C2=A0=C2=A0 19.137340] [=C2=A0 T475] sony_laptop: Found brigh=
tness_default
>>>>>>>>>> getter:
>>>>>>>>>> GPBR
>>>>>>>>>> [=C2=A0=C2=A0 19.137388] [=C2=A0 T475] sony_laptop: Found brigh=
tness_default
>>>>>>>>>> setter:
>>>>>>>>>> SPBR
>>>>>>>>>> [=C2=A0=C2=A0 19.137402] [=C2=A0 T475] sony_laptop: Found lanpo=
wer getter: GLNP
>>>>>>>>>> [=C2=A0=C2=A0 19.137406] [=C2=A0 T475] sony_laptop: Found lanpo=
wer setter: LNPW
>>>>>>>>>> [=C2=A0=C2=A0 19.137423] [=C2=A0 T475] sony_laptop: SNC setup d=
one.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> and the 3 buttons zoomin, zoom out, the third one
>>>>>>>>>> [=C2=A0 161.975552] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([5c] [31]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0 161.975596] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_p=
ic_call1(0xa0): 0x5c0a
>>>>>>>>>> [=C2=A0 161.975681] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([10] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>> Zoom in
>>>>>>>>>
>>>>>>>>>> [ 162.154768] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] =
[31]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0 162.154814] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_p=
ic_call1(0xa0): 0x5c0a
>>>>>>>>>> [=C2=A0 162.154880] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([00] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>> Ignored
>>>>>>>>>
>>>>>>>>>> [ 163.327457] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] =
[31]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0 163.327511] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_p=
ic_call1(0xa0): 0x5c0a
>>>>>>>>>> [=C2=A0 163.327563] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([20] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>> Zoom out
>>>>>>>>>
>>>>>>>>>> [ 163.516819] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] =
[31]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0 163.516856] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_p=
ic_call1(0xa0): 0x5c0a
>>>>>>>>>> [=C2=A0 163.517008] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([00] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>> ignored
>>>>>>>>>
>>>>>>>>>> [ 165.206657] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] =
[31]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0 165.206700] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_p=
ic_call1(0xa0): 0x5c0a
>>>>>>>>>> [=C2=A0 165.206805] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([01] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>> Prog 1
>>>>>>>>>
>>>>>>>>>> [ 165.365447] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] =
[31]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> [=C2=A0 165.365491] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_p=
ic_call1(0xa0): 0x5c0a
>>>>>>>>>> [=C2=A0 165.365548] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event =
([00] [05]) at port
>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>
>>>>>>>>> ignored
>>>>>>>>>
>>>>>>>>>> Sorry i messed up and didn't use reply all, Im still quite new =
to
>>>>>>>>>> this
>>>>>>>>>>
>>>>>>>>> That ok, mistakes happen :)
>>>>>>>>>
>>>>>>>>> I think the reason for you problem with the zoom-out key is that
>>>>>>>>> when sony-laptop
>>>>>>>>> iterates through the list of possible key responses, it first
>>>>>>>>> matches the definition
>>>>>>>>> for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key data as
>>>>>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED (also 0x20).
>>>>>>>>>
>>>>>>>>> This causes SONYPI_EVENT_PKEY_P1 to be picked instead of
>>>>>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED.
>>>>>>>> That's right. The event mask is the same for programmable and zoo=
m
>>>>>>>> keys,
>>>>>>>> thus the conflict.
>>>>>>>>
>>>>>>>> { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>>>>>>> { 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>>>>>>>
>>>>>>>>> I am sending this mail to the maintainer of the sony-laptop driv=
er,
>>>>>>>>> maybe he can help us in this case.
>>>>>>>> Heh... I actually have a UX ultra portable laptop somewhere (a UX=
50
>>>>>>>> IIRC) but I'm not sure it'll even turn on. Those things are like =
15~20
>>>>>>>> years old now.
>>>>>>>>
>>>>>>>> I don't quite remember the idiosyncrasies of this particular mode=
l v/s
>>>>>>>> other models to be quite frank. On the other hand the module has =
a
>>>>>>>> 'mask' option that you can use to allow-list only certain sets of
>>>>>>>> events.
>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/=
tree/drivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n94
>>>>>>>>
>>>>>>>>
>>>>>>>> (I'm glad the help text says "see doc" because I don't see this o=
ption
>>>>>>>> mentioned in the doc...)
>>>>>>>>
>>>>>>>> The bitmasks are here:
>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/=
tree/drivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n3365
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>> Thanks for response but I'm bit confused now, since they have same
>>>>>>> event, and i only allow the zoom in/out keys, won't I lose the thi=
rd
>>>>>>> key? Am I missing something?
>>>>>>>
>>>>>> When using the "mask" module param, you will lose the third key.
>>>>>>
>>>>>> I think the underlying issue could be that support for the
>>>>>> problematic 0x20 SONYPI_EVENT_PKEY_P1 was
>>>>>> added in commit 1cae71032183 ("sony-laptop: VGN-A317M hotkey
>>>>>> support"), while support for you VIAO model
>>>>>> was added in commit 3eb8749a3799 ("sony-laptop: add Type4 model").
>>>>>>
>>>>>> Commit 1cae71032183 was added after commit 3eb8749a3799, so i think
>>>>>> it will be enough to introduce a
>>>>>> separate copy of sonypi_pkeyev[] without the conflicting 0x20
>>>>>> SONYPI_EVENT_PKEY_P1 definition.
>>>>>> This separate copy can then be used by the type3_events[] definitio=
n
>>>>>> (which is used on you model).
>>>>>>
>>>>>> If the maintainer agrees with this approach, i can create a patch f=
or
>>>>>> you to test. Are you able to
>>>>>> compile kernel modules on your device?
>>>>>>
>>>>>> Thanks,
>>>>>> Armin Wolf
>>>>>>
>>>>> I am using opensuse on the device, I can just add patch in the obs s=
o
>>>>> yeah rebuilding kernel is no issue, I could do the patch myself but =
I
>>>>> don't know how to make it device-specific.
>>>>>
>>>>> Thanks for help!
>>>> Nice, can you test the attached patch and report back if it works?
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>   From 7c44c1d15f859647f19e5e2d9874432bb3a5cb92 Mon Sep 17 00:00:00 2=
001
>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>> Date: Tue, 18 Jun 2024 23:09:36 +0200
>>>> Subject: [PATCH] platform/x86: sony-laptop: Fix SONYPI_EVENT_ZOOM_OUT=
_PRESSED
>>>>    on Sony VAIO UX VGN-UX390N
>>>>
>>>> It turns out that on type 3 models, the definitions for the programma=
ble
>>>> keys partially conflict with the definitions for the zoom keys.
>>>>
>>>> This causes SONYPI_EVENT_ZOOM_OUT_PRESSED on the Sony VAIO UX VGN-UX3=
90N
>>>> to be reported as SONYPI_EVENT_PKEY_P1. Fix this by providing a separ=
ate
>>>> definition for type3 models without the conflicting key entry.
>>>>
>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> ---
>>>>    drivers/platform/x86/sony-laptop.c | 9 ++++++++-
>>>>    1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x8=
6/sony-laptop.c
>>>> index 3e94fdd1ea52..0e1d099ac06a 100644
>>>> --- a/drivers/platform/x86/sony-laptop.c
>>>> +++ b/drivers/platform/x86/sony-laptop.c
>>>> @@ -3451,6 +3451,13 @@ static struct sonypi_event sonypi_pkeyev[] =3D=
 {
>>>>    	{ 0, 0 }
>>>>    };
>>>> +static struct sonypi_event sonypi_pkeyev_type3[] =3D {
>>>> +	{ 0x01, SONYPI_EVENT_PKEY_P1 },
>>>> +	{ 0x02, SONYPI_EVENT_PKEY_P2 },
>>>> +	{ 0x04, SONYPI_EVENT_PKEY_P3 },
>>>> +	{ 0, 0 }
>>>> +};
>>>> +
>>>>    /* The set of possible bluetooth events */
>>>>    static struct sonypi_event sonypi_blueev[] =3D {
>>>>    	{ 0x55, SONYPI_EVENT_BLUETOOTH_PRESSED },
>>>> @@ -3572,7 +3579,7 @@ static struct sonypi_eventtypes type3_events[] =
=3D {
>>>>    	{ 0x31, SONYPI_MEMORYSTICK_MASK, sonypi_memorystickev },
>>>>    	{ 0x41, SONYPI_BATTERY_MASK, sonypi_batteryev },
>>>>    	{ 0x31, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>>> -	{ 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>>> +	{ 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev_type3 },
>>> Based on the commits you found, the conflicting event was added for th=
e
>>> VGN-A series (a Type3 model). This change is effectively removing the =
P1
>>> button handling for them.
>>>
>>> See 3eb8749a37990b505ab94466038c067444bbd7eb and later
>>> e93c8a6819b217f4f4a490f67f26e02ff6b23b44: there used to be a Type4 mod=
el
>>> that was meant to keep some of the events separate from Type3 models.
>>> Perhaps reintroducing the distinction is going to serve us better in
>>> this case?
>>> The IRQ handler can be shared between Type3/4, but the events
>>> can be in separate arrays, one for type3 and one for type4.
>>>
>>> What do you think?

Sounds good, however there seem to be even more conflicting key entries in=
side the type 3 key definitions.
Since you are the maintainer of the driver, i would prefer if you would ha=
ndle this.

Thanks,
Armin Wolf

>>> Alternatively you could just swap the pkeysev lists based on the forme=
r
>>> type3/4 distinction, i.e.
>>>
>>> +       pcidev =3D pci_get_device(PCI_VENDOR_ID_INTEL,
>>> +                       PCI_DEVICE_ID_INTEL_ICH6_1, NULL);
>>> +       if (pcidev) {
>>> +               dev->control =3D &spic_types[2];
>>> +               goto out;
>>> +       }
>>> +
>>> +       pcidev =3D pci_get_device(PCI_VENDOR_ID_INTEL,
>>> +                       PCI_DEVICE_ID_INTEL_ICH7_1, NULL);
>>> +       if (pcidev) {
>>> +               dev->control =3D &spic_types[3];
>>> +               goto out;
>>> +       }
>>> +
>>> +       pcidev =3D pci_get_device(PCI_VENDOR_ID_INTEL,
>>> +                       PCI_DEVICE_ID_INTEL_ICH8_4, NULL);
>>> +       if (pcidev) {
>>> +               dev->control =3D &spic_types[3];
>>> +               goto out;
>>> +       }
>>>
>>> (and maybe include also ICH9 as type4).
>>>
>>> The output of `lspci` from the UX390 could also help making sure we ge=
t
>>> the right distinction.
>>>
>>>>    	{ 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>>>    	{ 0x05, SONYPI_CAPTURE_MASK, sonypi_captureev },
>>>>    	{ 0x05, SONYPI_PKEY_MASK, sonypi_volumeev },
>> I am here to deliver!
>>
>> Not sure which one you need so here are the main internal ones (minus w=
ifi
>> etc)
>>
>> 00:00.0 Host bridge: Intel Corporation Mobile 945GM/PM/GMS, 943/940GML =
and
>> 945GT Express Memory Controller Hub (rev 03)
>> 00:02.0 VGA compatible controller: Intel Corporation Mobile 945GM/GMS,
>> 943/940GML Express Integrated Graphics Controller (rev 03)
>> 00:02.1 Display controller: Intel Corporation Mobile 945GM/GMS/GME,
>> 943/940GML Express Integrated Graphics Controller (rev 03)
>> 00:1b.0 Audio device: Intel Corporation NM10/ICH7 Family High Definitio=
n
>> Audio Controller (rev 02)
>> 00:1c.0 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port=
 1
>> (rev 02)
>> 00:1c.1 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port=
 2
>> (rev 02)
>> 00:1d.0 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
>> Controller #1 (rev 02)
>> 00:1d.1 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
>> Controller #2 (rev 02)
>> 00:1d.2 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
>> Controller #3 (rev 02)
>> 00:1d.3 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
>> Controller #4 (rev 02)
>> 00:1d.7 USB controller: Intel Corporation NM10/ICH7 Family USB2 EHCI
>> Controller (rev 02)
>> 00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev e2)
>> 00:1f.0 ISA bridge: Intel Corporation 82801GBM (ICH7-M) LPC Interface B=
ridge
>> (rev 02)
>> 00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE Contr=
oller
>> (rev 02)
>> 00:1f.3 SMBus: Intel Corporation NM10/ICH7 Family SMBus Controller (rev=
 02)
> This is good. So ICH7, ICH8 and ICH9 would be type4, while ICH6 remains
> as type3.
>
