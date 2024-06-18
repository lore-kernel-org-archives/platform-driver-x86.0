Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB2115957E
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718711237; cv=none; b=lvCpBLlJktNylvxiGpogwgXbsRKCif5h0BJYDjX5iyXbFPvbfI+jPWAm4EBSTmz4Xf37uCwrrs+opQc5AIDJqoWrJbpZNwotiqv4h7ONqdaKR1FXyvp1GZpPR+x6bAVg7RdNkUKiXIHqsDdNrmC7FKl33tj/eDlcovdRw2VLm/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718711237; c=relaxed/simple;
	bh=IjY90I8QCdpxsI6jY6SkSeTmy/idQTSIaXa4q4beFvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lr+8phAZqcYC9MKvbBNRz8078EeVkpqNpHp28hRuCSCdvs6XiHJPYXwBRIKsn8y3jhTQcCHec18ZsEIRQgwoIMAClwGvhR6ulBXyr+5g95Hp7i+a84fEyFS7nsVluhpEchWxX3SZtNBPpGJowuNqqWFCXGo+rvD/gX10JEZ0bGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=LDBuaAPi; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="LDBuaAPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718711230; x=1719316030; i=w_armin@gmx.de;
	bh=IjY90I8QCdpxsI6jY6SkSeTmy/idQTSIaXa4q4beFvg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LDBuaAPig9MO0psZWv3nHzHedvChV1n/jcsmTC+juNAwBI+mAUOIkVV1aCrCEmbM
	 G4tN9DZDhZ+Nq3e+cHa9TOiVjgA4RTysn2Y/xrkyV4E4mjq4eZFzWP21QN/CC/9Iv
	 0LuV/CmNeSiXyHCo3lHfveRRd3530kOc2CGZawG0wrhQaPUUlxFsf3mlZIRScI91F
	 NUF/kRQ8pkoREZMuv+dPmBUUMi21At9HeHhWh4tKNOh9TUzvKwgBYU6xuw7jwQFrr
	 xz3rOUSv034HKxZfKK8/UKNjIVZ1AUWhY/2xJJtbFXJS/2EPiRpASBnx/4rjTxlL0
	 JWpulka8oLxgZc/JsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.119.231] ([141.76.183.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MCKFu-1sBFZ147H8-007sNq; Tue, 18
 Jun 2024 13:47:10 +0200
Message-ID: <617b732c-f044-46ca-a7eb-cade979386c7@gmx.de>
Date: Tue, 18 Jun 2024 13:47:09 +0200
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
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2c7aeda6-40a5-43e8-ad7d-c1ba4e8ee0c0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vBEMphENQx2g+daPkfsFUp2DQvJZXU0u0HjGgdFfcOkGwkYRWeN
 TNUidTUzHOM2dyLuCqcqd9J+DoFAvAOPBgQL2S4Q0Ox99bd6hspYS/97hF86fzen7+QHVYu
 sPpgvFwS+yuPQ1bJzhjhZFKMrdCieEuRze413rfSMEuv/IBKwyQXctenEPWk9ss7zODFCOV
 0HDfxA+P4PX9kvj7aYslQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5JJVU60bwbs=;2Z/o9Nh7C3C+8N2QxmVRY0KkvDL
 DxLzG9qgftXJlnGzjBOsYcZVcQOuvfVLU4m7skgV1azskCIDbGxwSn6zDL4tCJqjSoK4WIy2u
 o5vLo0+tpBlIJUEqZULIW3tHWbLMGynBYSeBOArQuiXJSY6DwiVLZhvOVYUF2kfCa2y0RUqSJ
 VxVhfqhVdo7RroAT4QyKkAYCbEy9mAx5ctZETGWXNCBWx98zAeOXdvhANnIvDy5FNM+5GQpm7
 pamp0LETqSx5Chgl2acTQ6IBz0h2EdZjuOgokdu8wKj9LyeSqPqvkJK5KuEBzRHocXC2RcjBj
 YDwMyGpTFPN4MUdWnJgkvzkCAOnnlyTp2Qp5a/kxwBMANOA8BdO0CdaQKIa3nB0yXbfmLhZbg
 PtijDWvTS5Q8p7Tud1XAn5pbwSz9DQytEM5JO0GsedgLGW9MJa8p2hVr/anyYA4eg4Ehx6IpE
 WlMmn2QBK4k5h7vbkx1I86qN8qs0jKUrjyouuXOuU65wazO5Yk3E47UlG80Eoa7YfxFTe/Pkk
 kNV7znV2X1PaT2F+nydu2H1nR1DxQ2MG4CEsSF7UJ13kJ6tu/CGUIHAOqUb36ML7E5nYl88e7
 ZLfhTAvyL1tJCHDl2tAUMI9/oeurcMtsNCXkIlm+u+BQTkLtON4kHIBwemCQVjYBt2RD2S3FP
 ERRkDrNBZtPpmte108Bi46VXv7MfLrV+M+DMY0so2pL/662ZIgVwR65hB6CutWI/17QezZWgn
 qbUYjT1Mu46Q0Q7E/HCDGG708XoG1y/w1vdF2we24r+9Yw6elHT0iaVHTRjUxpEEWCW/mm3MJ
 Z9JkTGvPxqiQBTuUgURhohkNOtLTscz46JXnJrYHhXhPM=

Am 18.06.24 um 09:09 schrieb Micha=C5=82 Szczepaniak:

> On 18/06/2024 03:24, Mattia Dongili wrote:
>> On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
>>> Am 16.06.24 um 22:34 schrieb Micha=C5=82 Szczepaniak:
>>>
>>>> On 16/06/2024 20:18, Armin Wolf wrote:
>>>>> Hi,
>>>>>
>>>>> can you share the output of "acpidump"? The zoom-out button should
>>>>> report KEY_ZOOMOUT, can you also share the output of dmesg
>>>>> after loading the driver with the module parameter "debug=3D1" and
>>>>> pressing the buttons?
>> [...]
>>>> dmesg:
>>>> [=C2=A0=C2=A0 19.108393] [=C2=A0 T475] sony_laptop: detected Type3 mo=
del
>>>> [=C2=A0=C2=A0 19.108407] [=C2=A0 T475] sony_laptop: Evaluating _STA
>>>> [=C2=A0=C2=A0 19.115105] [=C2=A0 T475] sony_laptop: Device disabled
>>>> [=C2=A0=C2=A0 19.115115] [=C2=A0 T475] sony_laptop: Evaluating _PRS
>>>> [=C2=A0=C2=A0 19.115145] [=C2=A0 T475] sony_laptop: IO1 at 0xc000 (0x=
20)
>>>> [=C2=A0=C2=A0 19.115150] [=C2=A0 T475] sony_laptop: IO1 at 0xc800 (0x=
20)
>>>> [=C2=A0=C2=A0 19.115154] [=C2=A0 T475] sony_laptop: IO1 at 0xd000 (0x=
20)
>>>> [=C2=A0=C2=A0 19.115157] [=C2=A0 T475] sony_laptop: IO1 at 0xd800 (0x=
20)
>>>> [=C2=A0=C2=A0 19.115294] [=C2=A0 T475] input: Sony Vaio Keys as
>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/inpu=
t/input6
>>>>
>>>> [=C2=A0=C2=A0 19.115631] [=C2=A0 T475] input: Sony Vaio Jogdial as
>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/inpu=
t/input7
>>>>
>>>> [=C2=A0=C2=A0 19.118777] [=C2=A0 T475] sony_laptop: device allocated =
minor is 123
>>>> [=C2=A0=C2=A0 19.118791] [=C2=A0 T475] sony_laptop: I/O port1: 0xc000=
 (0xc000) + 0x20
>>>> [=C2=A0=C2=A0 19.118826] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event (=
[ff] [ff]) at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0=C2=A0 19.118839] [=C2=A0 T475] sony_laptop: IRQ: 6 - triggeri=
ng: 1 -
>>>> polarity: 0 - shr: 0
>>>> [=C2=A0=C2=A0 19.118844] [=C2=A0 T475] sony_laptop: Evaluating _SRS
>>>> [=C2=A0=C2=A0 19.128310] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event (=
[ff] [ff]) at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0=C2=A0 19.130430] [=C2=A0 T474] input: Power Button as
>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
>>>> [=C2=A0=C2=A0 19.136861] [=C2=A0 T475] sony_laptop: sony_pic_call1(0x=
82): 0x0e0a
>>>> [=C2=A0=C2=A0 19.136899] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event (=
[0e] [05]) at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0=C2=A0 19.136905] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: unknown=
 event ([0e] [05]) at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0=C2=A0 19.136927] [=C2=A0 T475] sony_laptop: sony_pic_call2(0x=
81 - 0xff):
>>>> 0x000e
>>>> [=C2=A0=C2=A0 19.136949] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event (=
[00] [05]) at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0=C2=A0 19.136961] [=C2=A0 T475] sony_laptop: sony_pic_call1(0x=
82): 0x000b
>>>> [=C2=A0=C2=A0 19.136988] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event (=
[0e] [05]) at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0=C2=A0 19.136993] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: unknown=
 event ([0e] [05]) at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0=C2=A0 19.137161] [=C2=A0 T475] sony_laptop: SPIC setup done.
>>>> [=C2=A0=C2=A0 19.137261] [=C2=A0 T475] sony_laptop: method: name: GBR=
T, args 0
>>>> [=C2=A0=C2=A0 19.137268] [=C2=A0 T475] sony_laptop: method: name: SBR=
T, args 1
>>>> [=C2=A0=C2=A0 19.137272] [=C2=A0 T475] sony_laptop: method: name: GPB=
R, args 0
>>>> [=C2=A0=C2=A0 19.137276] [=C2=A0 T475] sony_laptop: method: name: SPB=
R, args 1
>>>> [=C2=A0=C2=A0 19.137281] [=C2=A0 T475] sony_laptop: method: name: PWA=
K, args 0
>>>> [=C2=A0=C2=A0 19.137285] [=C2=A0 T475] sony_laptop: method: name: PWR=
N, args 0
>>>> [=C2=A0=C2=A0 19.137289] [=C2=A0 T475] sony_laptop: method: name: CSX=
B, args 1
>>>> [=C2=A0=C2=A0 19.137293] [=C2=A0 T475] sony_laptop: method: name: GWD=
P, args 0
>>>> [=C2=A0=C2=A0 19.137298] [=C2=A0 T475] sony_laptop: method: name: SLR=
S, args 1
>>>> [=C2=A0=C2=A0 19.137302] [=C2=A0 T475] sony_laptop: method: name: RBM=
F, args 1
>>>> [=C2=A0=C2=A0 19.137306] [=C2=A0 T475] sony_laptop: method: name: RSB=
I, args 1
>>>> [=C2=A0=C2=A0 19.137310] [=C2=A0 T475] sony_laptop: method: name: CBM=
F, args 1
>>>> [=C2=A0=C2=A0 19.137314] [=C2=A0 T475] sony_laptop: method: name: LNP=
W, args 1
>>>> [=C2=A0=C2=A0 19.137319] [=C2=A0 T475] sony_laptop: method: name: GLN=
P, args 0
>>>> [=C2=A0=C2=A0 19.137323] [=C2=A0 T475] sony_laptop: method: name: SCA=
M, args 1
>>>> [=C2=A0=C2=A0 19.137327] [=C2=A0 T475] sony_laptop: method: name: GCA=
M, args 0
>>>> [=C2=A0=C2=A0 19.137340] [=C2=A0 T475] sony_laptop: Found brightness_=
default getter:
>>>> GPBR
>>>> [=C2=A0=C2=A0 19.137388] [=C2=A0 T475] sony_laptop: Found brightness_=
default setter:
>>>> SPBR
>>>> [=C2=A0=C2=A0 19.137402] [=C2=A0 T475] sony_laptop: Found lanpower ge=
tter: GLNP
>>>> [=C2=A0=C2=A0 19.137406] [=C2=A0 T475] sony_laptop: Found lanpower se=
tter: LNPW
>>>> [=C2=A0=C2=A0 19.137423] [=C2=A0 T475] sony_laptop: SNC setup done.
>>>>
>>>>
>>>> and the 3 buttons zoomin, zoom out, the third one
>>>> [=C2=A0 161.975552] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] =
[31]) at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0 161.975596] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_cal=
l1(0xa0): 0x5c0a
>>>> [=C2=A0 161.975681] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([10] =
[05]) at port
>>>> 0xc000(+0x12)
>>>
>>> Zoom in
>>>
>>>> [ 162.154768] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) =
at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0 162.154814] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_cal=
l1(0xa0): 0x5c0a
>>>> [=C2=A0 162.154880] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00] =
[05]) at port
>>>> 0xc000(+0x12)
>>>
>>> Ignored
>>>
>>>> [ 163.327457] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) =
at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0 163.327511] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_cal=
l1(0xa0): 0x5c0a
>>>> [=C2=A0 163.327563] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([20] =
[05]) at port
>>>> 0xc000(+0x12)
>>>
>>> Zoom out
>>>
>>>> [ 163.516819] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) =
at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0 163.516856] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_cal=
l1(0xa0): 0x5c0a
>>>> [=C2=A0 163.517008] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00] =
[05]) at port
>>>> 0xc000(+0x12)
>>>
>>> ignored
>>>
>>>> [ 165.206657] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) =
at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0 165.206700] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_cal=
l1(0xa0): 0x5c0a
>>>> [=C2=A0 165.206805] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([01] =
[05]) at port
>>>> 0xc000(+0x12)
>>>
>>> Prog 1
>>>
>>>> [ 165.365447] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c] [31]) =
at port
>>>> 0xc000(+0x12)
>>>> [=C2=A0 165.365491] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_pic_cal=
l1(0xa0): 0x5c0a
>>>> [=C2=A0 165.365548] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([00] =
[05]) at port
>>>> 0xc000(+0x12)
>>>>
>>> ignored
>>>
>>>> Sorry i messed up and didn't use reply all, Im still quite new to thi=
s
>>>>
>>> That ok, mistakes happen :)
>>>
>>> I think the reason for you problem with the zoom-out key is that
>>> when sony-laptop
>>> iterates through the list of possible key responses, it first
>>> matches the definition
>>> for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key data as
>>> SONYPI_EVENT_ZOOM_OUT_PRESSED (also 0x20).
>>>
>>> This causes SONYPI_EVENT_PKEY_P1 to be picked instead of
>>> SONYPI_EVENT_ZOOM_OUT_PRESSED.
>>
>> That's right. The event mask is the same for programmable and zoom keys=
,
>> thus the conflict.
>>
>> { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>> { 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>
>>> I am sending this mail to the maintainer of the sony-laptop driver,
>>> maybe he can help us in this case.
>>
>> Heh... I actually have a UX ultra portable laptop somewhere (a UX50
>> IIRC) but I'm not sure it'll even turn on. Those things are like 15~20
>> years old now.
>>
>> I don't quite remember the idiosyncrasies of this particular model v/s
>> other models to be quite frank. On the other hand the module has a
>> 'mask' option that you can use to allow-list only certain sets of
>> events.
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/d=
rivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n94
>>
>> (I'm glad the help text says "see doc" because I don't see this option
>> mentioned in the doc...)
>>
>> The bitmasks are here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/d=
rivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n3365
>>
>>
> Thanks for response but I'm bit confused now, since they have same
> event, and i only allow the zoom in/out keys, won't I lose the third
> key? Am I missing something?
>
When using the "mask" module param, you will lose the third key.

I think the underlying issue could be that support for the problematic 0x2=
0 SONYPI_EVENT_PKEY_P1 was
added in commit 1cae71032183 ("sony-laptop: VGN-A317M hotkey support"), wh=
ile support for you VIAO model
was added in commit 3eb8749a3799 ("sony-laptop: add Type4 model").

Commit 1cae71032183 was added after commit 3eb8749a3799, so i think it wil=
l be enough to introduce a
separate copy of sonypi_pkeyev[] without the conflicting 0x20 SONYPI_EVENT=
_PKEY_P1 definition.
This separate copy can then be used by the type3_events[] definition (whic=
h is used on you model).

If the maintainer agrees with this approach, i can create a patch for you =
to test. Are you able to
compile kernel modules on your device?

Thanks,
Armin Wolf

