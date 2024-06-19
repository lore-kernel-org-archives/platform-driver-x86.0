Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A692B9AF
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jun 2024 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718784026; cv=none; b=AD5cyycvKdwgvxISpPSLQP3ChSpTldrKGBBBRIgiC5WGKhhyqm4o2LrlEtwFgY5q0ikZQBRBDDbfvudqWzFna7Jl51bm8Q6I9i4smJBnF58BfQD9tCQ1+RPXO1E2GOltcKEo853N1d3EmOKMwnelarv1vfbBqx4wn2HxJJKtt/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718784026; c=relaxed/simple;
	bh=9BWaEzl2s+tZUs+3hzp5nYr4+Zq1VQ498vSdxmKHyC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eESd4QQF30hb6hnwc/IlpoTC1aiNijKZBhEALqYGoqTZupNK2asHKMt70uBMu//5XIMsCMUJVuIblDzsn30i3qahtzHuYfuHw7P72NnZcSxisOSkzk9LWxoKBKXIlvFrvDolOTMA7p+yWbVymLPrJVNsH/8u6aKmLhQf3gXA+r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqBoqYOl; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqBoqYOl"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6fb696d2d8so21038766b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jun 2024 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718784022; x=1719388822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wwy7nER3SDMTI18u7b9FfqaZG6xBL+pJLMJrJ5ZArvY=;
        b=XqBoqYOlV8eRZDtYOSctPcqlXWljeM8qDnznJj7OBGvDcEuVa9g3m8tYHPPKxzVNhz
         vUA5r0D7SCcVa48L68pDkuCRgCAuQwcxGI+t/zm94/ySI2Yvavh8CLVR1bMOdPIF4IqZ
         o7/LuB/QLsfwgtIsFfISqEbK4WKn+4f9F1VDTVbjyXxr8z/vYP415xzB0pUUEVIKEhPd
         YSg9GCjzLxqJSAIYya+BS6VzMSRZSb4SCibkeXKwqU6uCzbFm0BPieNp37dhPhesXJSF
         YUrB7POVL/wmC8Lwr+btD/DAvAElUyLUEbbqyP1dx8fFUilfbgFqB1zcmSAwgPa96jtl
         1nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718784022; x=1719388822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wwy7nER3SDMTI18u7b9FfqaZG6xBL+pJLMJrJ5ZArvY=;
        b=FP/9nz4A2Y5uP+F+PgdmB5ENE8L2mI+rhJ/HBvkRX2R/9ywA+6Rp+iRN7CY5/7mY/E
         tslI37Z3KIDO0Bj3Cl/U08MS7b4wFwIqvuJpxajdXK3IgQJEgH8NPALK2oyUlKuh+A/h
         R0XEG47/uEKKEYpBGoCz3pyLIOj8TmQXR6DUTygvfIYPvCNtYMuJ/R8oiXf41Wc1bEYO
         acfZJqa7yVglijJHC9oQwCOuVUeE8hLPWFsrsUa3wbRbBpPyjO9Mfswfv6fbgowo70hd
         llzYCH31B+1l50eK2L6Y+OooP1GxHWrAcgfuAvE/g+zzyr0WfzSh/EW7E9ym5Se5bWJ4
         UCUA==
X-Gm-Message-State: AOJu0Yy/ZGCONuFoXasoKuCftUj/C/l7U3HaU0Sy6U0CnCzMSITJQS4L
	X4Yo71b6MkgSPqaE3n/TgNLlno8pdk/ZfElecET/ajhlkK0uSvW+
X-Google-Smtp-Source: AGHT+IGis+64zPcNH3ArFXht5UoRTwIW8ZXFhtdTo8rr5WqD3qOsnVBDTAm9cAgiuIgpusw0xzznLg==
X-Received: by 2002:a17:907:c78c:b0:a6f:6063:6bab with SMTP id a640c23a62f3a-a6fab607200mr137303666b.16.1718784021993;
        Wed, 19 Jun 2024 01:00:21 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db5c27sm652458266b.64.2024.06.19.01.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 01:00:21 -0700 (PDT)
Message-ID: <3f3b63a3-7d6b-4f84-929c-41c9998f256d@gmail.com>
Date: Wed, 19 Jun 2024 10:00:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO
 UX VGN-UX390N
To: Mattia Dongili <malattia@linux.it>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
References: <50d7eef9-17c4-4be2-bb25-37d7b74048cc@gmail.com>
 <686d3c56-b95e-4081-bde2-d36a7c7ab2e9@gmx.de>
 <11bb0fe3-a252-4cdc-9903-dc35af794ddb@gmail.com>
 <694c5973-8f27-4f9a-9da3-829482884ab2@gmx.de> <ZnDhk4YvczQV0JhW@taihen.jp>
 <2c7aeda6-40a5-43e8-ad7d-c1ba4e8ee0c0@gmail.com>
 <617b732c-f044-46ca-a7eb-cade979386c7@gmx.de>
 <bb8ddd94-53e7-4824-94c6-f2ebff7d93ea@gmail.com>
 <c6f4cbb7-ced0-4dfd-8d58-42878a47329c@gmx.de> <ZnKOpP0sSklJh53i@taihen.jp>
Content-Language: en-US, pl, pl-PL
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <ZnKOpP0sSklJh53i@taihen.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/06/2024 09:54, Mattia Dongili wrote:
> On Tue, Jun 18, 2024 at 11:18:12PM +0200, Armin Wolf wrote:
>> Am 18.06.24 um 15:08 schrieb Michał Szczepaniak:
>>
>>> On 18/06/2024 13:47, Armin Wolf wrote:
>>>> Am 18.06.24 um 09:09 schrieb Michał Szczepaniak:
>>>>
>>>>> On 18/06/2024 03:24, Mattia Dongili wrote:
>>>>>> On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
>>>>>>> Am 16.06.24 um 22:34 schrieb Michał Szczepaniak:
>>>>>>>
>>>>>>>> On 16/06/2024 20:18, Armin Wolf wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> can you share the output of "acpidump"? The zoom-out button should
>>>>>>>>> report KEY_ZOOMOUT, can you also share the output of dmesg
>>>>>>>>> after loading the driver with the module parameter "debug=1" and
>>>>>>>>> pressing the buttons?
>>>>>> [...]
>>>>>>>> dmesg:
>>>>>>>> [   19.108393] [  T475] sony_laptop: detected Type3 model
>>>>>>>> [   19.108407] [  T475] sony_laptop: Evaluating _STA
>>>>>>>> [   19.115105] [  T475] sony_laptop: Device disabled
>>>>>>>> [   19.115115] [  T475] sony_laptop: Evaluating _PRS
>>>>>>>> [   19.115145] [  T475] sony_laptop: IO1 at 0xc000 (0x20)
>>>>>>>> [   19.115150] [  T475] sony_laptop: IO1 at 0xc800 (0x20)
>>>>>>>> [   19.115154] [  T475] sony_laptop: IO1 at 0xd000 (0x20)
>>>>>>>> [   19.115157] [  T475] sony_laptop: IO1 at 0xd800 (0x20)
>>>>>>>> [   19.115294] [  T475] input: Sony Vaio Keys as
>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/input/input6
>>>>>>>>
>>>>>>>>
>>>>>>>> [   19.115631] [  T475] input: Sony Vaio Jogdial as
>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/input/input7
>>>>>>>>
>>>>>>>>
>>>>>>>> [   19.118777] [  T475] sony_laptop: device allocated minor is 123
>>>>>>>> [   19.118791] [  T475] sony_laptop: I/O port1: 0xc000 (0xc000) +
>>>>>>>> 0x20
>>>>>>>> [   19.118826] [    C0] sony_laptop: event ([ff] [ff]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [   19.118839] [  T475] sony_laptop: IRQ: 6 - triggering: 1 -
>>>>>>>> polarity: 0 - shr: 0
>>>>>>>> [   19.118844] [  T475] sony_laptop: Evaluating _SRS
>>>>>>>> [   19.128310] [    C0] sony_laptop: event ([ff] [ff]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [   19.130430] [  T474] input: Power Button as
>>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
>>>>>>>> [   19.136861] [  T475] sony_laptop: sony_pic_call1(0x82): 0x0e0a
>>>>>>>> [   19.136899] [    C0] sony_laptop: event ([0e] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [   19.136905] [    C0] sony_laptop: unknown event ([0e] [05]) at
>>>>>>>> port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [   19.136927] [  T475] sony_laptop: sony_pic_call2(0x81 - 0xff):
>>>>>>>> 0x000e
>>>>>>>> [   19.136949] [    C0] sony_laptop: event ([00] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [   19.136961] [  T475] sony_laptop: sony_pic_call1(0x82): 0x000b
>>>>>>>> [   19.136988] [    C0] sony_laptop: event ([0e] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [   19.136993] [    C0] sony_laptop: unknown event ([0e] [05]) at
>>>>>>>> port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [   19.137161] [  T475] sony_laptop: SPIC setup done.
>>>>>>>> [   19.137261] [  T475] sony_laptop: method: name: GBRT, args 0
>>>>>>>> [   19.137268] [  T475] sony_laptop: method: name: SBRT, args 1
>>>>>>>> [   19.137272] [  T475] sony_laptop: method: name: GPBR, args 0
>>>>>>>> [   19.137276] [  T475] sony_laptop: method: name: SPBR, args 1
>>>>>>>> [   19.137281] [  T475] sony_laptop: method: name: PWAK, args 0
>>>>>>>> [   19.137285] [  T475] sony_laptop: method: name: PWRN, args 0
>>>>>>>> [   19.137289] [  T475] sony_laptop: method: name: CSXB, args 1
>>>>>>>> [   19.137293] [  T475] sony_laptop: method: name: GWDP, args 0
>>>>>>>> [   19.137298] [  T475] sony_laptop: method: name: SLRS, args 1
>>>>>>>> [   19.137302] [  T475] sony_laptop: method: name: RBMF, args 1
>>>>>>>> [   19.137306] [  T475] sony_laptop: method: name: RSBI, args 1
>>>>>>>> [   19.137310] [  T475] sony_laptop: method: name: CBMF, args 1
>>>>>>>> [   19.137314] [  T475] sony_laptop: method: name: LNPW, args 1
>>>>>>>> [   19.137319] [  T475] sony_laptop: method: name: GLNP, args 0
>>>>>>>> [   19.137323] [  T475] sony_laptop: method: name: SCAM, args 1
>>>>>>>> [   19.137327] [  T475] sony_laptop: method: name: GCAM, args 0
>>>>>>>> [   19.137340] [  T475] sony_laptop: Found brightness_default
>>>>>>>> getter:
>>>>>>>> GPBR
>>>>>>>> [   19.137388] [  T475] sony_laptop: Found brightness_default
>>>>>>>> setter:
>>>>>>>> SPBR
>>>>>>>> [   19.137402] [  T475] sony_laptop: Found lanpower getter: GLNP
>>>>>>>> [   19.137406] [  T475] sony_laptop: Found lanpower setter: LNPW
>>>>>>>> [   19.137423] [  T475] sony_laptop: SNC setup done.
>>>>>>>>
>>>>>>>>
>>>>>>>> and the 3 buttons zoomin, zoom out, the third one
>>>>>>>> [  161.975552] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [  161.975596] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>>> [  161.975681] [    C0] sony_laptop: event ([10] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>
>>>>>>> Zoom in
>>>>>>>
>>>>>>>> [ 162.154768] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [  162.154814] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>>> [  162.154880] [    C0] sony_laptop: event ([00] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>
>>>>>>> Ignored
>>>>>>>
>>>>>>>> [ 163.327457] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [  163.327511] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>>> [  163.327563] [    C0] sony_laptop: event ([20] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>
>>>>>>> Zoom out
>>>>>>>
>>>>>>>> [ 163.516819] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [  163.516856] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>>> [  163.517008] [    C0] sony_laptop: event ([00] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>
>>>>>>> ignored
>>>>>>>
>>>>>>>> [ 165.206657] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [  165.206700] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>>> [  165.206805] [    C0] sony_laptop: event ([01] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>
>>>>>>> Prog 1
>>>>>>>
>>>>>>>> [ 165.365447] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>> [  165.365491] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>>> [  165.365548] [    C0] sony_laptop: event ([00] [05]) at port
>>>>>>>> 0xc000(+0x12)
>>>>>>>>
>>>>>>> ignored
>>>>>>>
>>>>>>>> Sorry i messed up and didn't use reply all, Im still quite new to
>>>>>>>> this
>>>>>>>>
>>>>>>> That ok, mistakes happen :)
>>>>>>>
>>>>>>> I think the reason for you problem with the zoom-out key is that
>>>>>>> when sony-laptop
>>>>>>> iterates through the list of possible key responses, it first
>>>>>>> matches the definition
>>>>>>> for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key data as
>>>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED (also 0x20).
>>>>>>>
>>>>>>> This causes SONYPI_EVENT_PKEY_P1 to be picked instead of
>>>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED.
>>>>>>
>>>>>> That's right. The event mask is the same for programmable and zoom
>>>>>> keys,
>>>>>> thus the conflict.
>>>>>>
>>>>>> { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>>>>> { 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>>>>>
>>>>>>> I am sending this mail to the maintainer of the sony-laptop driver,
>>>>>>> maybe he can help us in this case.
>>>>>>
>>>>>> Heh... I actually have a UX ultra portable laptop somewhere (a UX50
>>>>>> IIRC) but I'm not sure it'll even turn on. Those things are like 15~20
>>>>>> years old now.
>>>>>>
>>>>>> I don't quite remember the idiosyncrasies of this particular model v/s
>>>>>> other models to be quite frank. On the other hand the module has a
>>>>>> 'mask' option that you can use to allow-list only certain sets of
>>>>>> events.
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/platform/x86/sony-laptop.c?h=v6.9.5#n94
>>>>>>
>>>>>>
>>>>>> (I'm glad the help text says "see doc" because I don't see this option
>>>>>> mentioned in the doc...)
>>>>>>
>>>>>> The bitmasks are here:
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/platform/x86/sony-laptop.c?h=v6.9.5#n3365
>>>>>>
>>>>>>
>>>>>>
>>>>> Thanks for response but I'm bit confused now, since they have same
>>>>> event, and i only allow the zoom in/out keys, won't I lose the third
>>>>> key? Am I missing something?
>>>>>
>>>> When using the "mask" module param, you will lose the third key.
>>>>
>>>> I think the underlying issue could be that support for the
>>>> problematic 0x20 SONYPI_EVENT_PKEY_P1 was
>>>> added in commit 1cae71032183 ("sony-laptop: VGN-A317M hotkey
>>>> support"), while support for you VIAO model
>>>> was added in commit 3eb8749a3799 ("sony-laptop: add Type4 model").
>>>>
>>>> Commit 1cae71032183 was added after commit 3eb8749a3799, so i think
>>>> it will be enough to introduce a
>>>> separate copy of sonypi_pkeyev[] without the conflicting 0x20
>>>> SONYPI_EVENT_PKEY_P1 definition.
>>>> This separate copy can then be used by the type3_events[] definition
>>>> (which is used on you model).
>>>>
>>>> If the maintainer agrees with this approach, i can create a patch for
>>>> you to test. Are you able to
>>>> compile kernel modules on your device?
>>>>
>>>> Thanks,
>>>> Armin Wolf
>>>>
>>> I am using opensuse on the device, I can just add patch in the obs so
>>> yeah rebuilding kernel is no issue, I could do the patch myself but I
>>> don't know how to make it device-specific.
>>>
>>> Thanks for help!
>>
>> Nice, can you test the attached patch and report back if it works?
>>
>> Thanks,
>> Armin Wolf
> 
>>  From 7c44c1d15f859647f19e5e2d9874432bb3a5cb92 Mon Sep 17 00:00:00 2001
>> From: Armin Wolf <W_Armin@gmx.de>
>> Date: Tue, 18 Jun 2024 23:09:36 +0200
>> Subject: [PATCH] platform/x86: sony-laptop: Fix SONYPI_EVENT_ZOOM_OUT_PRESSED
>>   on Sony VAIO UX VGN-UX390N
>>
>> It turns out that on type 3 models, the definitions for the programmable
>> keys partially conflict with the definitions for the zoom keys.
>>
>> This causes SONYPI_EVENT_ZOOM_OUT_PRESSED on the Sony VAIO UX VGN-UX390N
>> to be reported as SONYPI_EVENT_PKEY_P1. Fix this by providing a separate
>> definition for type3 models without the conflicting key entry.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/sony-laptop.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
>> index 3e94fdd1ea52..0e1d099ac06a 100644
>> --- a/drivers/platform/x86/sony-laptop.c
>> +++ b/drivers/platform/x86/sony-laptop.c
>> @@ -3451,6 +3451,13 @@ static struct sonypi_event sonypi_pkeyev[] = {
>>   	{ 0, 0 }
>>   };
>>   
>> +static struct sonypi_event sonypi_pkeyev_type3[] = {
>> +	{ 0x01, SONYPI_EVENT_PKEY_P1 },
>> +	{ 0x02, SONYPI_EVENT_PKEY_P2 },
>> +	{ 0x04, SONYPI_EVENT_PKEY_P3 },
>> +	{ 0, 0 }
>> +};
>> +
>>   /* The set of possible bluetooth events */
>>   static struct sonypi_event sonypi_blueev[] = {
>>   	{ 0x55, SONYPI_EVENT_BLUETOOTH_PRESSED },
>> @@ -3572,7 +3579,7 @@ static struct sonypi_eventtypes type3_events[] = {
>>   	{ 0x31, SONYPI_MEMORYSTICK_MASK, sonypi_memorystickev },
>>   	{ 0x41, SONYPI_BATTERY_MASK, sonypi_batteryev },
>>   	{ 0x31, SONYPI_PKEY_MASK, sonypi_pkeyev },
>> -	{ 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>> +	{ 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev_type3 },
> 
> Based on the commits you found, the conflicting event was added for the
> VGN-A series (a Type3 model). This change is effectively removing the P1
> button handling for them.
> 
> See 3eb8749a37990b505ab94466038c067444bbd7eb and later
> e93c8a6819b217f4f4a490f67f26e02ff6b23b44: there used to be a Type4 model
> that was meant to keep some of the events separate from Type3 models.
> Perhaps reintroducing the distinction is going to serve us better in
> this case?
> The IRQ handler can be shared between Type3/4, but the events
> can be in separate arrays, one for type3 and one for type4.
> 
> What do you think?
> Alternatively you could just swap the pkeysev lists based on the former
> type3/4 distinction, i.e.
> 
> +       pcidev = pci_get_device(PCI_VENDOR_ID_INTEL,
> +                       PCI_DEVICE_ID_INTEL_ICH6_1, NULL);
> +       if (pcidev) {
> +               dev->control = &spic_types[2];
> +               goto out;
> +       }
> +
> +       pcidev = pci_get_device(PCI_VENDOR_ID_INTEL,
> +                       PCI_DEVICE_ID_INTEL_ICH7_1, NULL);
> +       if (pcidev) {
> +               dev->control = &spic_types[3];
> +               goto out;
> +       }
> +
> +       pcidev = pci_get_device(PCI_VENDOR_ID_INTEL,
> +                       PCI_DEVICE_ID_INTEL_ICH8_4, NULL);
> +       if (pcidev) {
> +               dev->control = &spic_types[3];
> +               goto out;
> +       }
> 
> (and maybe include also ICH9 as type4).
> 
> The output of `lspci` from the UX390 could also help making sure we get
> the right distinction.
> 
>>   	{ 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>   	{ 0x05, SONYPI_CAPTURE_MASK, sonypi_captureev },
>>   	{ 0x05, SONYPI_PKEY_MASK, sonypi_volumeev },
> 
I am here to deliver!

Not sure which one you need so here are the main internal ones (minus 
wifi etc)

00:00.0 Host bridge: Intel Corporation Mobile 945GM/PM/GMS, 943/940GML 
and 945GT Express Memory Controller Hub (rev 03)
00:02.0 VGA compatible controller: Intel Corporation Mobile 945GM/GMS, 
943/940GML Express Integrated Graphics Controller (rev 03)
00:02.1 Display controller: Intel Corporation Mobile 945GM/GMS/GME, 
943/940GML Express Integrated Graphics Controller (rev 03)
00:1b.0 Audio device: Intel Corporation NM10/ICH7 Family High Definition 
Audio Controller (rev 02)
00:1c.0 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port 
1 (rev 02)
00:1c.1 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port 
2 (rev 02)
00:1d.0 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI 
Controller #1 (rev 02)
00:1d.1 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI 
Controller #2 (rev 02)
00:1d.2 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI 
Controller #3 (rev 02)
00:1d.3 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI 
Controller #4 (rev 02)
00:1d.7 USB controller: Intel Corporation NM10/ICH7 Family USB2 EHCI 
Controller (rev 02)
00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev e2)
00:1f.0 ISA bridge: Intel Corporation 82801GBM (ICH7-M) LPC Interface 
Bridge (rev 02)
00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE 
Controller (rev 02)
00:1f.3 SMBus: Intel Corporation NM10/ICH7 Family SMBus Controller (rev 02)

