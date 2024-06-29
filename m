Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D5B224CE
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Jun 2024 20:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719691653; cv=none; b=kLnmfgluTqwetUIiW9sDfaqasCbV645gqX/AWZZuxyALthEpBgW/knyQiYEVvtxKLJU7uV7jYruH1MZVywzXzjnA5LG+X26T0C+tzGStSj47kfQFdLSREkA9/sGoLDUjUoHJbeYmBz0Gsuq84lfySC4qJuI4DvCnk42BhZts22k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719691653; c=relaxed/simple;
	bh=Fhb6uEeZfLgcGku/hCdPIzaeBRtx3IaRwqqi1cgmIog=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=F9UGHlOPX+1ZCE58nWYysjiJ6geEwI+JZXGV64hu1Qk5w3+h/toIvX5thEYF1Z18WsxowW/n1wnHFpi4NagQeUfogon89D7nmiKLlLRpTlr6zcJvpV41q2SKVs4hR1KsujHxvyCZjFJqIBnZjvbQNGzpi5lTjI/nkDxV9OI5Ha0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=BkOZfRiB; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="BkOZfRiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719691645; x=1720296445; i=w_armin@gmx.de;
	bh=Fhb6uEeZfLgcGku/hCdPIzaeBRtx3IaRwqqi1cgmIog=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BkOZfRiBVlAN4CcOJ8sHJIwO9GMpEAHzbMPnyMSX9W2qHpUv6HPkud+PYVDwIP3F
	 RQxhfAMnwBh6uatSF9YHuNu4lWgJUfxdPOenLQR8/BHDtMnO7dqDgLNxsT2TAxo2x
	 AQXiYqH5XCO5d6qoCvrg+99+jnWLB9LJ5uvXlg268AxS49XvgzfXiEvU8S9r5LTjb
	 SWCafiLSXg3F4DNxk+v6gnIpxj+fzDb4iRuDD+Rd3GYb7O1jFlbARwp6iKCKDvqVB
	 EVPkTtnh8ZuS8st/M68yI9KTlpHAmyTMXBkRj7ov7fgWLwhmHTYKiLJb8t+cK1B7I
	 U2K92PYrj0dFI5QdDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5GE1-1sGGN62WEH-013U7t; Sat, 29
 Jun 2024 22:07:25 +0200
Message-ID: <af6fd27a-76bd-472d-a773-d25d23ad15c9@gmx.de>
Date: Sat, 29 Jun 2024 22:07:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
From: Armin Wolf <W_Armin@gmx.de>
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
 <dac93fe5-a72d-43dc-a7b2-c203f4c3156c@gmx.de>
Content-Language: en-US
In-Reply-To: <dac93fe5-a72d-43dc-a7b2-c203f4c3156c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qJdhRc0g/m0RlwrdaAA/ntc+S6R/v4ZTt5BJwQxMpl3XnZTq6hj
 elUi4fdDd1KFwA6mbvEeHWKaRxgy2iWPs2an2PeDghYmmUGQvT1AK2Tb91I4jNSxRyesrAv
 uH8V+0GbKOU/t8N5fkJpunHIyPIMf6+zfTGhbBYwEw3S7D4OyVSKk01a8VkVX0+ltFx1+Ev
 pnHd4iR7hgOm1Enmu41ug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GZm5EzFN/gY=;GQ+81EJCXBe0bWw8UuYhuVF8SN4
 8MUO2DS/4Q1o2DETW7rimJFvOqbV0YEnUJ/ZX4MPKW5wWM9ud9fVX0gCvKBnIDGZ3P+aMlW+B
 Pi4T6uh0qtSpjUR93gvDyPf1L9uY1Zj4iZSIUV5bex7cg2GT6B6gM8qMuglyRr2EQHE/opey5
 juyDg85ayzdsJv/JcKZuykjNVJKNVx+kOB0iniCaxeFe6H8k13DT5rUTDWtg9IrUlW5DTN2k5
 GFjMXXXfwgZh9zNv/6kGxoQBO7xleytDoz46xey5NdNjhzrFxproLNH0gR6NJ1NDfVTX/PH7Z
 SWhnPmhYHBN0RBMXSs5gkIC8HtIHshNWihk/cVoAyvjQb+R6EezM15ViC1wUKyr/Zgir6y4U+
 9fa6RmXhUejzTMXgUyx5Wh4yKCtopi91cyX8yP9pwLvr9hDC9uY0qNTrkO5aNDoMaD/ocK8n3
 qmSO8v/RQtFwVRZwvISnqAjyCbXgXnU2YqmToa5YwaU3IVd1ePvUB6AoUuPKR/k3iME86cJjV
 ejzs8+UdgDg7P0C5TgdKzG4z1Gp3xlMDgNj2SxFjGqIpA9a8BGV7NMrDbfeIMF7mzb1iuA6Ct
 hCK0O9AUHsYfIjgfnBTYFjRgbDbHXIz4+gZkMkFcm3JACuydqvv22PujwNBb6eOEvKwD3r33n
 Gl2YTc+J4OQanVr9ZMG5rc4S12M9f8zvBtqPGeciF8P70zBT4gkIBPN5zF7cTzy7o+parGz7X
 a8BXOU0wuw6MN0wHh/DRSvYLEP1+bnJh++UzD4mizgORASV9RccqIIfGzfKK/AWaYI5tDvkBF
 4TRyRFo1SdzYoBSionD6v4kbwcUyIdR0waR9BStdOsPnY=

Am 19.06.24 um 14:02 schrieb Armin Wolf:

> Am 19.06.24 um 10:16 schrieb Mattia Dongili:
>
>> On Wed, Jun 19, 2024 at 10:00:18AM +0200, Micha=C5=82 Szczepaniak wrote=
:
>>> On 19/06/2024 09:54, Mattia Dongili wrote:
>>>> On Tue, Jun 18, 2024 at 11:18:12PM +0200, Armin Wolf wrote:
>>>>> Am 18.06.24 um 15:08 schrieb Micha=C5=82 Szczepaniak:
>>>>>
>>>>>> On 18/06/2024 13:47, Armin Wolf wrote:
>>>>>>> Am 18.06.24 um 09:09 schrieb Micha=C5=82 Szczepaniak:
>>>>>>>
>>>>>>>> On 18/06/2024 03:24, Mattia Dongili wrote:
>>>>>>>>> On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
>>>>>>>>>> Am 16.06.24 um 22:34 schrieb Micha=C5=82 Szczepaniak:
>>>>>>>>>>
>>>>>>>>>>> On 16/06/2024 20:18, Armin Wolf wrote:
>>>>>>>>>>>> Hi,
>>>>>>>>>>>>
>>>>>>>>>>>> can you share the output of "acpidump"? The zoom-out button
>>>>>>>>>>>> should
>>>>>>>>>>>> report KEY_ZOOMOUT, can you also share the output of dmesg
>>>>>>>>>>>> after loading the driver with the module parameter
>>>>>>>>>>>> "debug=3D1" and
>>>>>>>>>>>> pressing the buttons?
>>>>>>>>> [...]
>>>>>>>>>>> dmesg:
>>>>>>>>>>> [=C2=A0=C2=A0 19.108393] [=C2=A0 T475] sony_laptop: detected T=
ype3 model
>>>>>>>>>>> [=C2=A0=C2=A0 19.108407] [=C2=A0 T475] sony_laptop: Evaluating=
 _STA
>>>>>>>>>>> [=C2=A0=C2=A0 19.115105] [=C2=A0 T475] sony_laptop: Device dis=
abled
>>>>>>>>>>> [=C2=A0=C2=A0 19.115115] [=C2=A0 T475] sony_laptop: Evaluating=
 _PRS
>>>>>>>>>>> [=C2=A0=C2=A0 19.115145] [=C2=A0 T475] sony_laptop: IO1 at 0xc=
000 (0x20)
>>>>>>>>>>> [=C2=A0=C2=A0 19.115150] [=C2=A0 T475] sony_laptop: IO1 at 0xc=
800 (0x20)
>>>>>>>>>>> [=C2=A0=C2=A0 19.115154] [=C2=A0 T475] sony_laptop: IO1 at 0xd=
000 (0x20)
>>>>>>>>>>> [=C2=A0=C2=A0 19.115157] [=C2=A0 T475] sony_laptop: IO1 at 0xd=
800 (0x20)
>>>>>>>>>>> [=C2=A0=C2=A0 19.115294] [=C2=A0 T475] input: Sony Vaio Keys a=
s
>>>>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:=
00/input/input6
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> [=C2=A0=C2=A0 19.115631] [=C2=A0 T475] input: Sony Vaio Jogdia=
l as
>>>>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:=
00/input/input7
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> [=C2=A0=C2=A0 19.118777] [=C2=A0 T475] sony_laptop: device all=
ocated minor
>>>>>>>>>>> is 123
>>>>>>>>>>> [=C2=A0=C2=A0 19.118791] [=C2=A0 T475] sony_laptop: I/O port1:=
 0xc000
>>>>>>>>>>> (0xc000) +
>>>>>>>>>>> 0x20
>>>>>>>>>>> [=C2=A0=C2=A0 19.118826] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([ff] [ff]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0=C2=A0 19.118839] [=C2=A0 T475] sony_laptop: IRQ: 6 - t=
riggering: 1 -
>>>>>>>>>>> polarity: 0 - shr: 0
>>>>>>>>>>> [=C2=A0=C2=A0 19.118844] [=C2=A0 T475] sony_laptop: Evaluating=
 _SRS
>>>>>>>>>>> [=C2=A0=C2=A0 19.128310] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([ff] [ff]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0=C2=A0 19.130430] [=C2=A0 T474] input: Power Button as
>>>>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
>>>>>>>>>>> [=C2=A0=C2=A0 19.136861] [=C2=A0 T475] sony_laptop: sony_pic_c=
all1(0x82):
>>>>>>>>>>> 0x0e0a
>>>>>>>>>>> [=C2=A0=C2=A0 19.136899] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([0e] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0=C2=A0 19.136905] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
unknown event ([0e]
>>>>>>>>>>> [05]) at
>>>>>>>>>>> port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0=C2=A0 19.136927] [=C2=A0 T475] sony_laptop: sony_pic_c=
all2(0x81 -
>>>>>>>>>>> 0xff):
>>>>>>>>>>> 0x000e
>>>>>>>>>>> [=C2=A0=C2=A0 19.136949] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([00] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0=C2=A0 19.136961] [=C2=A0 T475] sony_laptop: sony_pic_c=
all1(0x82):
>>>>>>>>>>> 0x000b
>>>>>>>>>>> [=C2=A0=C2=A0 19.136988] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
event ([0e] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0=C2=A0 19.136993] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: =
unknown event ([0e]
>>>>>>>>>>> [05]) at
>>>>>>>>>>> port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0=C2=A0 19.137161] [=C2=A0 T475] sony_laptop: SPIC setup=
 done.
>>>>>>>>>>> [=C2=A0=C2=A0 19.137261] [=C2=A0 T475] sony_laptop: method: na=
me: GBRT, args 0
>>>>>>>>>>> [=C2=A0=C2=A0 19.137268] [=C2=A0 T475] sony_laptop: method: na=
me: SBRT, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137272] [=C2=A0 T475] sony_laptop: method: na=
me: GPBR, args 0
>>>>>>>>>>> [=C2=A0=C2=A0 19.137276] [=C2=A0 T475] sony_laptop: method: na=
me: SPBR, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137281] [=C2=A0 T475] sony_laptop: method: na=
me: PWAK, args 0
>>>>>>>>>>> [=C2=A0=C2=A0 19.137285] [=C2=A0 T475] sony_laptop: method: na=
me: PWRN, args 0
>>>>>>>>>>> [=C2=A0=C2=A0 19.137289] [=C2=A0 T475] sony_laptop: method: na=
me: CSXB, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137293] [=C2=A0 T475] sony_laptop: method: na=
me: GWDP, args 0
>>>>>>>>>>> [=C2=A0=C2=A0 19.137298] [=C2=A0 T475] sony_laptop: method: na=
me: SLRS, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137302] [=C2=A0 T475] sony_laptop: method: na=
me: RBMF, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137306] [=C2=A0 T475] sony_laptop: method: na=
me: RSBI, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137310] [=C2=A0 T475] sony_laptop: method: na=
me: CBMF, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137314] [=C2=A0 T475] sony_laptop: method: na=
me: LNPW, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137319] [=C2=A0 T475] sony_laptop: method: na=
me: GLNP, args 0
>>>>>>>>>>> [=C2=A0=C2=A0 19.137323] [=C2=A0 T475] sony_laptop: method: na=
me: SCAM, args 1
>>>>>>>>>>> [=C2=A0=C2=A0 19.137327] [=C2=A0 T475] sony_laptop: method: na=
me: GCAM, args 0
>>>>>>>>>>> [=C2=A0=C2=A0 19.137340] [=C2=A0 T475] sony_laptop: Found brig=
htness_default
>>>>>>>>>>> getter:
>>>>>>>>>>> GPBR
>>>>>>>>>>> [=C2=A0=C2=A0 19.137388] [=C2=A0 T475] sony_laptop: Found brig=
htness_default
>>>>>>>>>>> setter:
>>>>>>>>>>> SPBR
>>>>>>>>>>> [=C2=A0=C2=A0 19.137402] [=C2=A0 T475] sony_laptop: Found lanp=
ower getter:
>>>>>>>>>>> GLNP
>>>>>>>>>>> [=C2=A0=C2=A0 19.137406] [=C2=A0 T475] sony_laptop: Found lanp=
ower setter:
>>>>>>>>>>> LNPW
>>>>>>>>>>> [=C2=A0=C2=A0 19.137423] [=C2=A0 T475] sony_laptop: SNC setup =
done.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> and the 3 buttons zoomin, zoom out, the third one
>>>>>>>>>>> [=C2=A0 161.975552] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([5c] [31]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0 161.975596] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_=
pic_call1(0xa0):
>>>>>>>>>>> 0x5c0a
>>>>>>>>>>> [=C2=A0 161.975681] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([10] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> Zoom in
>>>>>>>>>>
>>>>>>>>>>> [ 162.154768] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c]=
 [31]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0 162.154814] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_=
pic_call1(0xa0):
>>>>>>>>>>> 0x5c0a
>>>>>>>>>>> [=C2=A0 162.154880] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([00] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> Ignored
>>>>>>>>>>
>>>>>>>>>>> [ 163.327457] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c]=
 [31]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0 163.327511] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_=
pic_call1(0xa0):
>>>>>>>>>>> 0x5c0a
>>>>>>>>>>> [=C2=A0 163.327563] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([20] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> Zoom out
>>>>>>>>>>
>>>>>>>>>>> [ 163.516819] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c]=
 [31]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0 163.516856] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_=
pic_call1(0xa0):
>>>>>>>>>>> 0x5c0a
>>>>>>>>>>> [=C2=A0 163.517008] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([00] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> ignored
>>>>>>>>>>
>>>>>>>>>>> [ 165.206657] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c]=
 [31]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0 165.206700] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_=
pic_call1(0xa0):
>>>>>>>>>>> 0x5c0a
>>>>>>>>>>> [=C2=A0 165.206805] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([01] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>> Prog 1
>>>>>>>>>>
>>>>>>>>>>> [ 165.365447] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event ([5c]=
 [31]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>> [=C2=A0 165.365491] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: sony_=
pic_call1(0xa0):
>>>>>>>>>>> 0x5c0a
>>>>>>>>>>> [=C2=A0 165.365548] [=C2=A0=C2=A0=C2=A0 C0] sony_laptop: event=
 ([00] [05]) at port
>>>>>>>>>>> 0xc000(+0x12)
>>>>>>>>>>>
>>>>>>>>>> ignored
>>>>>>>>>>
>>>>>>>>>>> Sorry i messed up and didn't use reply all, Im still quite
>>>>>>>>>>> new to
>>>>>>>>>>> this
>>>>>>>>>>>
>>>>>>>>>> That ok, mistakes happen :)
>>>>>>>>>>
>>>>>>>>>> I think the reason for you problem with the zoom-out key is tha=
t
>>>>>>>>>> when sony-laptop
>>>>>>>>>> iterates through the list of possible key responses, it first
>>>>>>>>>> matches the definition
>>>>>>>>>> for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key data as
>>>>>>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED (also 0x20).
>>>>>>>>>>
>>>>>>>>>> This causes SONYPI_EVENT_PKEY_P1 to be picked instead of
>>>>>>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED.
>>>>>>>>> That's right. The event mask is the same for programmable and
>>>>>>>>> zoom
>>>>>>>>> keys,
>>>>>>>>> thus the conflict.
>>>>>>>>>
>>>>>>>>> { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>>>>>>>> { 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>>>>>>>>
>>>>>>>>>> I am sending this mail to the maintainer of the sony-laptop
>>>>>>>>>> driver,
>>>>>>>>>> maybe he can help us in this case.
>>>>>>>>> Heh... I actually have a UX ultra portable laptop somewhere (a
>>>>>>>>> UX50
>>>>>>>>> IIRC) but I'm not sure it'll even turn on. Those things are
>>>>>>>>> like 15~20
>>>>>>>>> years old now.
>>>>>>>>>
>>>>>>>>> I don't quite remember the idiosyncrasies of this particular
>>>>>>>>> model v/s
>>>>>>>>> other models to be quite frank. On the other hand the module
>>>>>>>>> has a
>>>>>>>>> 'mask' option that you can use to allow-list only certain sets o=
f
>>>>>>>>> events.
>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
/tree/drivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n94
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> (I'm glad the help text says "see doc" because I don't see
>>>>>>>>> this option
>>>>>>>>> mentioned in the doc...)
>>>>>>>>>
>>>>>>>>> The bitmasks are here:
>>>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git=
/tree/drivers/platform/x86/sony-laptop.c?h=3Dv6.9.5#n3365
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>> Thanks for response but I'm bit confused now, since they have sam=
e
>>>>>>>> event, and i only allow the zoom in/out keys, won't I lose the
>>>>>>>> third
>>>>>>>> key? Am I missing something?
>>>>>>>>
>>>>>>> When using the "mask" module param, you will lose the third key.
>>>>>>>
>>>>>>> I think the underlying issue could be that support for the
>>>>>>> problematic 0x20 SONYPI_EVENT_PKEY_P1 was
>>>>>>> added in commit 1cae71032183 ("sony-laptop: VGN-A317M hotkey
>>>>>>> support"), while support for you VIAO model
>>>>>>> was added in commit 3eb8749a3799 ("sony-laptop: add Type4 model").
>>>>>>>
>>>>>>> Commit 1cae71032183 was added after commit 3eb8749a3799, so i thin=
k
>>>>>>> it will be enough to introduce a
>>>>>>> separate copy of sonypi_pkeyev[] without the conflicting 0x20
>>>>>>> SONYPI_EVENT_PKEY_P1 definition.
>>>>>>> This separate copy can then be used by the type3_events[]
>>>>>>> definition
>>>>>>> (which is used on you model).
>>>>>>>
>>>>>>> If the maintainer agrees with this approach, i can create a
>>>>>>> patch for
>>>>>>> you to test. Are you able to
>>>>>>> compile kernel modules on your device?
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Armin Wolf
>>>>>>>
>>>>>> I am using opensuse on the device, I can just add patch in the
>>>>>> obs so
>>>>>> yeah rebuilding kernel is no issue, I could do the patch myself
>>>>>> but I
>>>>>> don't know how to make it device-specific.
>>>>>>
>>>>>> Thanks for help!
>>>>> Nice, can you test the attached patch and report back if it works?
>>>>>
>>>>> Thanks,
>>>>> Armin Wolf
>>>>> =C2=A0 From 7c44c1d15f859647f19e5e2d9874432bb3a5cb92 Mon Sep 17
>>>>> 00:00:00 2001
>>>>> From: Armin Wolf <W_Armin@gmx.de>
>>>>> Date: Tue, 18 Jun 2024 23:09:36 +0200
>>>>> Subject: [PATCH] platform/x86: sony-laptop: Fix
>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED
>>>>> =C2=A0=C2=A0 on Sony VAIO UX VGN-UX390N
>>>>>
>>>>> It turns out that on type 3 models, the definitions for the
>>>>> programmable
>>>>> keys partially conflict with the definitions for the zoom keys.
>>>>>
>>>>> This causes SONYPI_EVENT_ZOOM_OUT_PRESSED on the Sony VAIO UX
>>>>> VGN-UX390N
>>>>> to be reported as SONYPI_EVENT_PKEY_P1. Fix this by providing a
>>>>> separate
>>>>> definition for type3 models without the conflicting key entry.
>>>>>
>>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>>> ---
>>>>> =C2=A0=C2=A0 drivers/platform/x86/sony-laptop.c | 9 ++++++++-
>>>>> =C2=A0=C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/sony-laptop.c
>>>>> b/drivers/platform/x86/sony-laptop.c
>>>>> index 3e94fdd1ea52..0e1d099ac06a 100644
>>>>> --- a/drivers/platform/x86/sony-laptop.c
>>>>> +++ b/drivers/platform/x86/sony-laptop.c
>>>>> @@ -3451,6 +3451,13 @@ static struct sonypi_event sonypi_pkeyev[] =
=3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0, 0 }
>>>>> =C2=A0=C2=A0 };
>>>>> +static struct sonypi_event sonypi_pkeyev_type3[] =3D {
>>>>> +=C2=A0=C2=A0=C2=A0 { 0x01, SONYPI_EVENT_PKEY_P1 },
>>>>> +=C2=A0=C2=A0=C2=A0 { 0x02, SONYPI_EVENT_PKEY_P2 },
>>>>> +=C2=A0=C2=A0=C2=A0 { 0x04, SONYPI_EVENT_PKEY_P3 },
>>>>> +=C2=A0=C2=A0=C2=A0 { 0, 0 }
>>>>> +};
>>>>> +
>>>>> =C2=A0=C2=A0 /* The set of possible bluetooth events */
>>>>> =C2=A0=C2=A0 static struct sonypi_event sonypi_blueev[] =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x55, SONYPI_EVENT_BLUETOOTH_=
PRESSED },
>>>>> @@ -3572,7 +3579,7 @@ static struct sonypi_eventtypes
>>>>> type3_events[] =3D {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x31, SONYPI_MEMORYSTICK_MASK=
, sonypi_memorystickev },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x41, SONYPI_BATTERY_MASK, so=
nypi_batteryev },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x31, SONYPI_PKEY_MASK, sonyp=
i_pkeyev },
>>>>> -=C2=A0=C2=A0=C2=A0 { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>>>> +=C2=A0=C2=A0=C2=A0 { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev_type3 },
>>>> Based on the commits you found, the conflicting event was added for
>>>> the
>>>> VGN-A series (a Type3 model). This change is effectively removing
>>>> the P1
>>>> button handling for them.
>>>>
>>>> See 3eb8749a37990b505ab94466038c067444bbd7eb and later
>>>> e93c8a6819b217f4f4a490f67f26e02ff6b23b44: there used to be a Type4
>>>> model
>>>> that was meant to keep some of the events separate from Type3 models.
>>>> Perhaps reintroducing the distinction is going to serve us better in
>>>> this case?
>>>> The IRQ handler can be shared between Type3/4, but the events
>>>> can be in separate arrays, one for type3 and one for type4.
>>>>
>>>> What do you think?
>
> Sounds good, however there seem to be even more conflicting key
> entries inside the type 3 key definitions.
> Since you are the maintainer of the driver, i would prefer if you
> would handle this.
>
> Thanks,
> Armin Wolf
>
Any progress so far?

Armin Wolf

>>>> Alternatively you could just swap the pkeysev lists based on the
>>>> former
>>>> type3/4 distinction, i.e.
>>>>
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcidev =3D pci_get_device(PCI_V=
ENDOR_ID_INTEL,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_DEV=
ICE_ID_INTEL_ICH6_1, NULL);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pcidev) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev->control =3D &spic_types[2];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto out;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcidev =3D pci_get_device(PCI_V=
ENDOR_ID_INTEL,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_DEV=
ICE_ID_INTEL_ICH7_1, NULL);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pcidev) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev->control =3D &spic_types[3];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto out;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pcidev =3D pci_get_device(PCI_V=
ENDOR_ID_INTEL,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_DEV=
ICE_ID_INTEL_ICH8_4, NULL);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pcidev) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev->control =3D &spic_types[3];
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto out;
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>
>>>> (and maybe include also ICH9 as type4).
>>>>
>>>> The output of `lspci` from the UX390 could also help making sure we
>>>> get
>>>> the right distinction.
>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x05, SONYPI_ZOOM_MASK, sonyp=
i_zoomev },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x05, SONYPI_CAPTURE_MASK, so=
nypi_captureev },
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { 0x05, SONYPI_PKEY_MASK, sonyp=
i_volumeev },
>>> I am here to deliver!
>>>
>>> Not sure which one you need so here are the main internal ones
>>> (minus wifi
>>> etc)
>>>
>>> 00:00.0 Host bridge: Intel Corporation Mobile 945GM/PM/GMS,
>>> 943/940GML and
>>> 945GT Express Memory Controller Hub (rev 03)
>>> 00:02.0 VGA compatible controller: Intel Corporation Mobile 945GM/GMS,
>>> 943/940GML Express Integrated Graphics Controller (rev 03)
>>> 00:02.1 Display controller: Intel Corporation Mobile 945GM/GMS/GME,
>>> 943/940GML Express Integrated Graphics Controller (rev 03)
>>> 00:1b.0 Audio device: Intel Corporation NM10/ICH7 Family High
>>> Definition
>>> Audio Controller (rev 02)
>>> 00:1c.0 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express
>>> Port 1
>>> (rev 02)
>>> 00:1c.1 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express
>>> Port 2
>>> (rev 02)
>>> 00:1d.0 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
>>> Controller #1 (rev 02)
>>> 00:1d.1 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
>>> Controller #2 (rev 02)
>>> 00:1d.2 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
>>> Controller #3 (rev 02)
>>> 00:1d.3 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI
>>> Controller #4 (rev 02)
>>> 00:1d.7 USB controller: Intel Corporation NM10/ICH7 Family USB2 EHCI
>>> Controller (rev 02)
>>> 00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev e2)
>>> 00:1f.0 ISA bridge: Intel Corporation 82801GBM (ICH7-M) LPC
>>> Interface Bridge
>>> (rev 02)
>>> 00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE
>>> Controller
>>> (rev 02)
>>> 00:1f.3 SMBus: Intel Corporation NM10/ICH7 Family SMBus Controller
>>> (rev 02)
>> This is good. So ICH7, ICH8 and ICH9 would be type4, while ICH6 remains
>> as type3.
>>
>
