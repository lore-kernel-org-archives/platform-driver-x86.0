Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D21A00DF
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716125; cv=none; b=gmOAnAKExP0FNWFesthd0zInpjVw0ExjAe2eWjoJBCudqqEO1MV1fUlnzNt4elLmYpb0gzg21Hh0+Q6twl3a8BEG6EJkIbcqyuyNjnRYNq+I8xmsfGgc6jFCSobtqVZwOz2p314SsJRz000kMmWXX1xHpCtB2rsb9h2xkYBcg50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716125; c=relaxed/simple;
	bh=UN6LN0qbGgqbjUYepDf8bwqNT4NHYOYez3syxZGCQZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UgBKYKymOuOO1ZDjrJKKRSuf6ZQmtwF+6Edj9n7AFChE2ya4OCGpoZI+DmHBDd/nzfFH8DaFG1T8usPEq9kyVPqQSF9N9FHus2vaeK0QGJ4h4Gnra0ytANVyNtJCK2EdRPACeKFUmldKKbbsIuEtIl7zqG9tLp+r9ZPCVa83/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLtqXmSt; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLtqXmSt"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso7266499a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 06:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718716122; x=1719320922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ida4YpSVcxuASsL/fYZ7IPpF4Zf7Immmwifck/T8Xw=;
        b=hLtqXmStadaCkydz2jQjF71pZwDRVtLviY2YJc8KfynWe4xTczFE2Sznz1+AF+dKpn
         CuS7ImOUyuW10yE5qCu4eA40nYrTmaSNCZxoHJJENoBPfs67xojmcDf/Pu26cn3g5BUu
         tci4rVhGt7cT5ox37DPAieHTVXD4q83RVzxqMVS3aLK6gNNJF4eVx93jsveRm/iu5tqL
         QcSDbZVVNIs5B0K+q0QmqjN5nYgmM51krTaYpauEFJdsWhrG4XnFzuZnHXR688/BUWZh
         xNPi8wJtfZYdWUNIFh3pBTgRuLq2S08z10aKQiJQ09CDszNy6ROjgAi8SZxvBjsTfjmX
         Xh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718716122; x=1719320922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ida4YpSVcxuASsL/fYZ7IPpF4Zf7Immmwifck/T8Xw=;
        b=JYHkc0rNKdWwgMNK170UdJYnAuFVY1y+s22Yt6N7t0nvVbe55igwiGRjutXvZVRzbV
         7hU3vy/67LB9ghupTaC5lDV1UdfoK693ZjUNUh/YJLLkL593xKW1g4h3/Pq2vBd1t6Tp
         gpjyXmIOd1p38kztTqHeh/svWaNoiMN38cayWKR7BVbniO4T/yEUxHMCm9Z60brpdsMY
         21clsh6zb0vN7BQnmGHA8B5Fx2YUZNyWG1Khp7PhjqxylyzUg5lR06+IwuLgPgFFN7db
         ZqfNA4au1/zK7vdxAa2MMaPtaqQ1sgQptn5Y0UKnBTKKv3ieGa2yaQLYQHuiPyroN7aI
         LWZg==
X-Gm-Message-State: AOJu0YzPs/M1tVtAyZHacW7jhVA/CassABSBsi3Fdi/ld1/r3a2nGOQ0
	GFgkGDCCq8/mjaWJLAM61K9v5VuZoSTrFayNLd0jOrsxO3CZ7vVw
X-Google-Smtp-Source: AGHT+IGvDvW1l2vNyiwqkp0nsi77Ai3gMr3Fli9O2Qq0DnYT067mriKwA2p4x3xdjW4l237y3KAodw==
X-Received: by 2002:a50:8d54:0:b0:57c:5996:cfc7 with SMTP id 4fb4d7f45d1cf-57cbd8f2a16mr8139379a12.30.1718716121761;
        Tue, 18 Jun 2024 06:08:41 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72ce067sm7794243a12.9.2024.06.18.06.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:08:41 -0700 (PDT)
Message-ID: <bb8ddd94-53e7-4824-94c6-f2ebff7d93ea@gmail.com>
Date: Tue, 18 Jun 2024 15:08:40 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
To: Armin Wolf <W_Armin@gmx.de>, Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org
References: <50d7eef9-17c4-4be2-bb25-37d7b74048cc@gmail.com>
 <686d3c56-b95e-4081-bde2-d36a7c7ab2e9@gmx.de>
 <11bb0fe3-a252-4cdc-9903-dc35af794ddb@gmail.com>
 <694c5973-8f27-4f9a-9da3-829482884ab2@gmx.de> <ZnDhk4YvczQV0JhW@taihen.jp>
 <2c7aeda6-40a5-43e8-ad7d-c1ba4e8ee0c0@gmail.com>
 <617b732c-f044-46ca-a7eb-cade979386c7@gmx.de>
Content-Language: en-US, pl, pl-PL
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <617b732c-f044-46ca-a7eb-cade979386c7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/06/2024 13:47, Armin Wolf wrote:
> Am 18.06.24 um 09:09 schrieb Michał Szczepaniak:
> 
>> On 18/06/2024 03:24, Mattia Dongili wrote:
>>> On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
>>>> Am 16.06.24 um 22:34 schrieb Michał Szczepaniak:
>>>>
>>>>> On 16/06/2024 20:18, Armin Wolf wrote:
>>>>>> Hi,
>>>>>>
>>>>>> can you share the output of "acpidump"? The zoom-out button should
>>>>>> report KEY_ZOOMOUT, can you also share the output of dmesg
>>>>>> after loading the driver with the module parameter "debug=1" and
>>>>>> pressing the buttons?
>>> [...]
>>>>> dmesg:
>>>>> [   19.108393] [  T475] sony_laptop: detected Type3 model
>>>>> [   19.108407] [  T475] sony_laptop: Evaluating _STA
>>>>> [   19.115105] [  T475] sony_laptop: Device disabled
>>>>> [   19.115115] [  T475] sony_laptop: Evaluating _PRS
>>>>> [   19.115145] [  T475] sony_laptop: IO1 at 0xc000 (0x20)
>>>>> [   19.115150] [  T475] sony_laptop: IO1 at 0xc800 (0x20)
>>>>> [   19.115154] [  T475] sony_laptop: IO1 at 0xd000 (0x20)
>>>>> [   19.115157] [  T475] sony_laptop: IO1 at 0xd800 (0x20)
>>>>> [   19.115294] [  T475] input: Sony Vaio Keys as
>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/input/input6
>>>>>
>>>>> [   19.115631] [  T475] input: Sony Vaio Jogdial as
>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/input/input7
>>>>>
>>>>> [   19.118777] [  T475] sony_laptop: device allocated minor is 123
>>>>> [   19.118791] [  T475] sony_laptop: I/O port1: 0xc000 (0xc000) + 0x20
>>>>> [   19.118826] [    C0] sony_laptop: event ([ff] [ff]) at port
>>>>> 0xc000(+0x12)
>>>>> [   19.118839] [  T475] sony_laptop: IRQ: 6 - triggering: 1 -
>>>>> polarity: 0 - shr: 0
>>>>> [   19.118844] [  T475] sony_laptop: Evaluating _SRS
>>>>> [   19.128310] [    C0] sony_laptop: event ([ff] [ff]) at port
>>>>> 0xc000(+0x12)
>>>>> [   19.130430] [  T474] input: Power Button as
>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
>>>>> [   19.136861] [  T475] sony_laptop: sony_pic_call1(0x82): 0x0e0a
>>>>> [   19.136899] [    C0] sony_laptop: event ([0e] [05]) at port
>>>>> 0xc000(+0x12)
>>>>> [   19.136905] [    C0] sony_laptop: unknown event ([0e] [05]) at port
>>>>> 0xc000(+0x12)
>>>>> [   19.136927] [  T475] sony_laptop: sony_pic_call2(0x81 - 0xff):
>>>>> 0x000e
>>>>> [   19.136949] [    C0] sony_laptop: event ([00] [05]) at port
>>>>> 0xc000(+0x12)
>>>>> [   19.136961] [  T475] sony_laptop: sony_pic_call1(0x82): 0x000b
>>>>> [   19.136988] [    C0] sony_laptop: event ([0e] [05]) at port
>>>>> 0xc000(+0x12)
>>>>> [   19.136993] [    C0] sony_laptop: unknown event ([0e] [05]) at port
>>>>> 0xc000(+0x12)
>>>>> [   19.137161] [  T475] sony_laptop: SPIC setup done.
>>>>> [   19.137261] [  T475] sony_laptop: method: name: GBRT, args 0
>>>>> [   19.137268] [  T475] sony_laptop: method: name: SBRT, args 1
>>>>> [   19.137272] [  T475] sony_laptop: method: name: GPBR, args 0
>>>>> [   19.137276] [  T475] sony_laptop: method: name: SPBR, args 1
>>>>> [   19.137281] [  T475] sony_laptop: method: name: PWAK, args 0
>>>>> [   19.137285] [  T475] sony_laptop: method: name: PWRN, args 0
>>>>> [   19.137289] [  T475] sony_laptop: method: name: CSXB, args 1
>>>>> [   19.137293] [  T475] sony_laptop: method: name: GWDP, args 0
>>>>> [   19.137298] [  T475] sony_laptop: method: name: SLRS, args 1
>>>>> [   19.137302] [  T475] sony_laptop: method: name: RBMF, args 1
>>>>> [   19.137306] [  T475] sony_laptop: method: name: RSBI, args 1
>>>>> [   19.137310] [  T475] sony_laptop: method: name: CBMF, args 1
>>>>> [   19.137314] [  T475] sony_laptop: method: name: LNPW, args 1
>>>>> [   19.137319] [  T475] sony_laptop: method: name: GLNP, args 0
>>>>> [   19.137323] [  T475] sony_laptop: method: name: SCAM, args 1
>>>>> [   19.137327] [  T475] sony_laptop: method: name: GCAM, args 0
>>>>> [   19.137340] [  T475] sony_laptop: Found brightness_default getter:
>>>>> GPBR
>>>>> [   19.137388] [  T475] sony_laptop: Found brightness_default setter:
>>>>> SPBR
>>>>> [   19.137402] [  T475] sony_laptop: Found lanpower getter: GLNP
>>>>> [   19.137406] [  T475] sony_laptop: Found lanpower setter: LNPW
>>>>> [   19.137423] [  T475] sony_laptop: SNC setup done.
>>>>>
>>>>>
>>>>> and the 3 buttons zoomin, zoom out, the third one
>>>>> [  161.975552] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>> 0xc000(+0x12)
>>>>> [  161.975596] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>> [  161.975681] [    C0] sony_laptop: event ([10] [05]) at port
>>>>> 0xc000(+0x12)
>>>>
>>>> Zoom in
>>>>
>>>>> [ 162.154768] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>> 0xc000(+0x12)
>>>>> [  162.154814] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>> [  162.154880] [    C0] sony_laptop: event ([00] [05]) at port
>>>>> 0xc000(+0x12)
>>>>
>>>> Ignored
>>>>
>>>>> [ 163.327457] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>> 0xc000(+0x12)
>>>>> [  163.327511] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>> [  163.327563] [    C0] sony_laptop: event ([20] [05]) at port
>>>>> 0xc000(+0x12)
>>>>
>>>> Zoom out
>>>>
>>>>> [ 163.516819] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>> 0xc000(+0x12)
>>>>> [  163.516856] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>> [  163.517008] [    C0] sony_laptop: event ([00] [05]) at port
>>>>> 0xc000(+0x12)
>>>>
>>>> ignored
>>>>
>>>>> [ 165.206657] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>> 0xc000(+0x12)
>>>>> [  165.206700] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>> [  165.206805] [    C0] sony_laptop: event ([01] [05]) at port
>>>>> 0xc000(+0x12)
>>>>
>>>> Prog 1
>>>>
>>>>> [ 165.365447] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>> 0xc000(+0x12)
>>>>> [  165.365491] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>> [  165.365548] [    C0] sony_laptop: event ([00] [05]) at port
>>>>> 0xc000(+0x12)
>>>>>
>>>> ignored
>>>>
>>>>> Sorry i messed up and didn't use reply all, Im still quite new to this
>>>>>
>>>> That ok, mistakes happen :)
>>>>
>>>> I think the reason for you problem with the zoom-out key is that
>>>> when sony-laptop
>>>> iterates through the list of possible key responses, it first
>>>> matches the definition
>>>> for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key data as
>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED (also 0x20).
>>>>
>>>> This causes SONYPI_EVENT_PKEY_P1 to be picked instead of
>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED.
>>>
>>> That's right. The event mask is the same for programmable and zoom keys,
>>> thus the conflict.
>>>
>>> { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>> { 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>>
>>>> I am sending this mail to the maintainer of the sony-laptop driver,
>>>> maybe he can help us in this case.
>>>
>>> Heh... I actually have a UX ultra portable laptop somewhere (a UX50
>>> IIRC) but I'm not sure it'll even turn on. Those things are like 15~20
>>> years old now.
>>>
>>> I don't quite remember the idiosyncrasies of this particular model v/s
>>> other models to be quite frank. On the other hand the module has a
>>> 'mask' option that you can use to allow-list only certain sets of
>>> events.
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/platform/x86/sony-laptop.c?h=v6.9.5#n94
>>>
>>> (I'm glad the help text says "see doc" because I don't see this option
>>> mentioned in the doc...)
>>>
>>> The bitmasks are here:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/platform/x86/sony-laptop.c?h=v6.9.5#n3365
>>>
>>>
>> Thanks for response but I'm bit confused now, since they have same
>> event, and i only allow the zoom in/out keys, won't I lose the third
>> key? Am I missing something?
>>
> When using the "mask" module param, you will lose the third key.
> 
> I think the underlying issue could be that support for the problematic 
> 0x20 SONYPI_EVENT_PKEY_P1 was
> added in commit 1cae71032183 ("sony-laptop: VGN-A317M hotkey support"), 
> while support for you VIAO model
> was added in commit 3eb8749a3799 ("sony-laptop: add Type4 model").
> 
> Commit 1cae71032183 was added after commit 3eb8749a3799, so i think it 
> will be enough to introduce a
> separate copy of sonypi_pkeyev[] without the conflicting 0x20 
> SONYPI_EVENT_PKEY_P1 definition.
> This separate copy can then be used by the type3_events[] definition 
> (which is used on you model).
> 
> If the maintainer agrees with this approach, i can create a patch for 
> you to test. Are you able to
> compile kernel modules on your device?
> 
> Thanks,
> Armin Wolf
> 
I am using opensuse on the device, I can just add patch in the obs so 
yeah rebuilding kernel is no issue, I could do the patch myself but I 
don't know how to make it device-specific.

Thanks for help!
