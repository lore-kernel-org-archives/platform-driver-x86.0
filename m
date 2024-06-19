Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C14181
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Jun 2024 00:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718755714; cv=none; b=Q99LMXTzq93T/84WDlblyh5kalQb+//aV6sIjv7LQQosuDnVg0lgpjwu8pPxTZBp21jE6vQp3yLXkgwQKW0mztNaZjEjDWh14iJMVBV4ofMKQZuVh0g5Q6F2EqRGLHJs0pN2QAVKg2dCmZF5p+sxRAV3BnBZNuUBrJIc5ZCvCBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718755714; c=relaxed/simple;
	bh=koV2V0dTnpeKZ273ejOea8wTs/oIARJnLSxE2o/fzNo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/tu4bDsGQcR28URif9iiTSiOem2kpYUPJ6hTWL8qPuBiAzv+5FtmhU2V8YjeO9oHVz88Ci8jtLRE0wyI3izbeg/A/98n4X+I1SE63DbYHOz280Uh2rYMCVK5jpPG1El378yq4rQNYPbNS39CR8XsoXvlxYKrUPCj0oMdAjrcnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcP8emI4; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcP8emI4"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso1182148a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Jun 2024 17:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718755711; x=1719360511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PBxvvMAuIztKB8Mttyf1Uv1zubjcy6/TA5rfQ0OoFo8=;
        b=WcP8emI4A5tZdZxhnZHBAUZRFT0zyOpROL9GWnBrmH5jXXtmxUDLoz8wWTqHPZ6sHy
         M2E+n23xjenl8akxN3oCGgjglpKcWkj2RlBh2ahSFyW4BtUmgu5UGiHtluw99NLJTl8V
         Nj2xrkgKzsE8ttNNr8mI5Y7MRA9Xub3RlPDXflG++rsr28aIeuu9NNVZftlblINxpV48
         VAmxsaJGK1Hncm0egyFfG3rYXb4LRRXpBUSPx6aCYEhdOy4FUYytiO9Bdw1pVZmm1wOM
         yg4vAIe74AFheeF6bYMdoEaClniA5S9D4Oyg6k8+ZaQIIAbLVYnUYnf3jt7Nv0zpWLC3
         mxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718755711; x=1719360511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBxvvMAuIztKB8Mttyf1Uv1zubjcy6/TA5rfQ0OoFo8=;
        b=K8Dh0gxUdkIPfgxDe3iCkU5Jq+4FCuaAAL4T/qBvlGbfHkHYHJUIjjRI9x08YwTu0a
         UKHiC/gNHZz0wUgLsr7C7uFnFoMsUVqs8EVJr5Y9EoVn784mvI+jj9/YUmn8QIrMfPKB
         Zg0YfkTNx0ldeUZjPpwkpU/aw61jvaIKT+Ex8k7SSgRD/6A0h21OtYB3GrbZJj6kz8Ji
         eOSJFjVuMsgojPsG53QsgavbR6DpZBKFWskOOXDDPmX8hImo/knyMQY8t/nZaSpExzJZ
         TFgMHhen8w68BSXhafPZOzaDYn8UuhCUFlHY3KDj7CF5P9xHdbyybk7mzvkiVDiMYuO1
         fwfA==
X-Gm-Message-State: AOJu0YyLbGte0uSCu42ZEGqyKXaqdix8nBWXlc/t62VE4Ziw2V5HHEU5
	MtZ4OJcDljjVnmMXV27HoEjqP7I/HR76/UMAJsde7E0RMYp+o9mK
X-Google-Smtp-Source: AGHT+IHgxALgrwyqIdTdxbVTnGJTLdLsZzwupQeztCh918wlbBzyis6ncwNNkcKaOhfxG4G9Rwzaog==
X-Received: by 2002:a50:cc91:0:b0:57c:de6e:75d9 with SMTP id 4fb4d7f45d1cf-57d07eaab98mr441629a12.32.1718755710409;
        Tue, 18 Jun 2024 17:08:30 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72cdf68sm8013546a12.20.2024.06.18.17.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 17:08:29 -0700 (PDT)
Message-ID: <37df194d-e50a-4c3f-bfd6-6c6507317e14@gmail.com>
Date: Wed, 19 Jun 2024 02:08:28 +0200
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
 <bb8ddd94-53e7-4824-94c6-f2ebff7d93ea@gmail.com>
 <c6f4cbb7-ced0-4dfd-8d58-42878a47329c@gmx.de>
Content-Language: en-US, pl, pl-PL
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <c6f4cbb7-ced0-4dfd-8d58-42878a47329c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/06/2024 23:18, Armin Wolf wrote:
> Am 18.06.24 um 15:08 schrieb Michał Szczepaniak:
> 
>> On 18/06/2024 13:47, Armin Wolf wrote:
>>> Am 18.06.24 um 09:09 schrieb Michał Szczepaniak:
>>>
>>>> On 18/06/2024 03:24, Mattia Dongili wrote:
>>>>> On Mon, Jun 17, 2024 at 12:48:13AM +0200, Armin Wolf wrote:
>>>>>> Am 16.06.24 um 22:34 schrieb Michał Szczepaniak:
>>>>>>
>>>>>>> On 16/06/2024 20:18, Armin Wolf wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> can you share the output of "acpidump"? The zoom-out button should
>>>>>>>> report KEY_ZOOMOUT, can you also share the output of dmesg
>>>>>>>> after loading the driver with the module parameter "debug=1" and
>>>>>>>> pressing the buttons?
>>>>> [...]
>>>>>>> dmesg:
>>>>>>> [   19.108393] [  T475] sony_laptop: detected Type3 model
>>>>>>> [   19.108407] [  T475] sony_laptop: Evaluating _STA
>>>>>>> [   19.115105] [  T475] sony_laptop: Device disabled
>>>>>>> [   19.115115] [  T475] sony_laptop: Evaluating _PRS
>>>>>>> [   19.115145] [  T475] sony_laptop: IO1 at 0xc000 (0x20)
>>>>>>> [   19.115150] [  T475] sony_laptop: IO1 at 0xc800 (0x20)
>>>>>>> [   19.115154] [  T475] sony_laptop: IO1 at 0xd000 (0x20)
>>>>>>> [   19.115157] [  T475] sony_laptop: IO1 at 0xd800 (0x20)
>>>>>>> [   19.115294] [  T475] input: Sony Vaio Keys as
>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/input/input6
>>>>>>>
>>>>>>>
>>>>>>> [   19.115631] [  T475] input: Sony Vaio Jogdial as
>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/SNY6001:00/input/input7
>>>>>>>
>>>>>>>
>>>>>>> [   19.118777] [  T475] sony_laptop: device allocated minor is 123
>>>>>>> [   19.118791] [  T475] sony_laptop: I/O port1: 0xc000 (0xc000) +
>>>>>>> 0x20
>>>>>>> [   19.118826] [    C0] sony_laptop: event ([ff] [ff]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [   19.118839] [  T475] sony_laptop: IRQ: 6 - triggering: 1 -
>>>>>>> polarity: 0 - shr: 0
>>>>>>> [   19.118844] [  T475] sony_laptop: Evaluating _SRS
>>>>>>> [   19.128310] [    C0] sony_laptop: event ([ff] [ff]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [   19.130430] [  T474] input: Power Button as
>>>>>>> /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
>>>>>>> [   19.136861] [  T475] sony_laptop: sony_pic_call1(0x82): 0x0e0a
>>>>>>> [   19.136899] [    C0] sony_laptop: event ([0e] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [   19.136905] [    C0] sony_laptop: unknown event ([0e] [05]) at
>>>>>>> port
>>>>>>> 0xc000(+0x12)
>>>>>>> [   19.136927] [  T475] sony_laptop: sony_pic_call2(0x81 - 0xff):
>>>>>>> 0x000e
>>>>>>> [   19.136949] [    C0] sony_laptop: event ([00] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [   19.136961] [  T475] sony_laptop: sony_pic_call1(0x82): 0x000b
>>>>>>> [   19.136988] [    C0] sony_laptop: event ([0e] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [   19.136993] [    C0] sony_laptop: unknown event ([0e] [05]) at
>>>>>>> port
>>>>>>> 0xc000(+0x12)
>>>>>>> [   19.137161] [  T475] sony_laptop: SPIC setup done.
>>>>>>> [   19.137261] [  T475] sony_laptop: method: name: GBRT, args 0
>>>>>>> [   19.137268] [  T475] sony_laptop: method: name: SBRT, args 1
>>>>>>> [   19.137272] [  T475] sony_laptop: method: name: GPBR, args 0
>>>>>>> [   19.137276] [  T475] sony_laptop: method: name: SPBR, args 1
>>>>>>> [   19.137281] [  T475] sony_laptop: method: name: PWAK, args 0
>>>>>>> [   19.137285] [  T475] sony_laptop: method: name: PWRN, args 0
>>>>>>> [   19.137289] [  T475] sony_laptop: method: name: CSXB, args 1
>>>>>>> [   19.137293] [  T475] sony_laptop: method: name: GWDP, args 0
>>>>>>> [   19.137298] [  T475] sony_laptop: method: name: SLRS, args 1
>>>>>>> [   19.137302] [  T475] sony_laptop: method: name: RBMF, args 1
>>>>>>> [   19.137306] [  T475] sony_laptop: method: name: RSBI, args 1
>>>>>>> [   19.137310] [  T475] sony_laptop: method: name: CBMF, args 1
>>>>>>> [   19.137314] [  T475] sony_laptop: method: name: LNPW, args 1
>>>>>>> [   19.137319] [  T475] sony_laptop: method: name: GLNP, args 0
>>>>>>> [   19.137323] [  T475] sony_laptop: method: name: SCAM, args 1
>>>>>>> [   19.137327] [  T475] sony_laptop: method: name: GCAM, args 0
>>>>>>> [   19.137340] [  T475] sony_laptop: Found brightness_default
>>>>>>> getter:
>>>>>>> GPBR
>>>>>>> [   19.137388] [  T475] sony_laptop: Found brightness_default
>>>>>>> setter:
>>>>>>> SPBR
>>>>>>> [   19.137402] [  T475] sony_laptop: Found lanpower getter: GLNP
>>>>>>> [   19.137406] [  T475] sony_laptop: Found lanpower setter: LNPW
>>>>>>> [   19.137423] [  T475] sony_laptop: SNC setup done.
>>>>>>>
>>>>>>>
>>>>>>> and the 3 buttons zoomin, zoom out, the third one
>>>>>>> [  161.975552] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [  161.975596] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>> [  161.975681] [    C0] sony_laptop: event ([10] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>
>>>>>> Zoom in
>>>>>>
>>>>>>> [ 162.154768] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [  162.154814] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>> [  162.154880] [    C0] sony_laptop: event ([00] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>
>>>>>> Ignored
>>>>>>
>>>>>>> [ 163.327457] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [  163.327511] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>> [  163.327563] [    C0] sony_laptop: event ([20] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>
>>>>>> Zoom out
>>>>>>
>>>>>>> [ 163.516819] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [  163.516856] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>> [  163.517008] [    C0] sony_laptop: event ([00] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>
>>>>>> ignored
>>>>>>
>>>>>>> [ 165.206657] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [  165.206700] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>> [  165.206805] [    C0] sony_laptop: event ([01] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>
>>>>>> Prog 1
>>>>>>
>>>>>>> [ 165.365447] [    C0] sony_laptop: event ([5c] [31]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>> [  165.365491] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
>>>>>>> [  165.365548] [    C0] sony_laptop: event ([00] [05]) at port
>>>>>>> 0xc000(+0x12)
>>>>>>>
>>>>>> ignored
>>>>>>
>>>>>>> Sorry i messed up and didn't use reply all, Im still quite new to
>>>>>>> this
>>>>>>>
>>>>>> That ok, mistakes happen :)
>>>>>>
>>>>>> I think the reason for you problem with the zoom-out key is that
>>>>>> when sony-laptop
>>>>>> iterates through the list of possible key responses, it first
>>>>>> matches the definition
>>>>>> for SONYPI_EVENT_PKEY_P1 (0x20), which has the same key data as
>>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED (also 0x20).
>>>>>>
>>>>>> This causes SONYPI_EVENT_PKEY_P1 to be picked instead of
>>>>>> SONYPI_EVENT_ZOOM_OUT_PRESSED.
>>>>>
>>>>> That's right. The event mask is the same for programmable and zoom
>>>>> keys,
>>>>> thus the conflict.
>>>>>
>>>>> { 0x05, SONYPI_PKEY_MASK, sonypi_pkeyev },
>>>>> { 0x05, SONYPI_ZOOM_MASK, sonypi_zoomev },
>>>>>
>>>>>> I am sending this mail to the maintainer of the sony-laptop driver,
>>>>>> maybe he can help us in this case.
>>>>>
>>>>> Heh... I actually have a UX ultra portable laptop somewhere (a UX50
>>>>> IIRC) but I'm not sure it'll even turn on. Those things are like 15~20
>>>>> years old now.
>>>>>
>>>>> I don't quite remember the idiosyncrasies of this particular model v/s
>>>>> other models to be quite frank. On the other hand the module has a
>>>>> 'mask' option that you can use to allow-list only certain sets of
>>>>> events.
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/platform/x86/sony-laptop.c?h=v6.9.5#n94
>>>>>
>>>>>
>>>>> (I'm glad the help text says "see doc" because I don't see this option
>>>>> mentioned in the doc...)
>>>>>
>>>>> The bitmasks are here:
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/platform/x86/sony-laptop.c?h=v6.9.5#n3365
>>>>>
>>>>>
>>>>>
>>>> Thanks for response but I'm bit confused now, since they have same
>>>> event, and i only allow the zoom in/out keys, won't I lose the third
>>>> key? Am I missing something?
>>>>
>>> When using the "mask" module param, you will lose the third key.
>>>
>>> I think the underlying issue could be that support for the
>>> problematic 0x20 SONYPI_EVENT_PKEY_P1 was
>>> added in commit 1cae71032183 ("sony-laptop: VGN-A317M hotkey
>>> support"), while support for you VIAO model
>>> was added in commit 3eb8749a3799 ("sony-laptop: add Type4 model").
>>>
>>> Commit 1cae71032183 was added after commit 3eb8749a3799, so i think
>>> it will be enough to introduce a
>>> separate copy of sonypi_pkeyev[] without the conflicting 0x20
>>> SONYPI_EVENT_PKEY_P1 definition.
>>> This separate copy can then be used by the type3_events[] definition
>>> (which is used on you model).
>>>
>>> If the maintainer agrees with this approach, i can create a patch for
>>> you to test. Are you able to
>>> compile kernel modules on your device?
>>>
>>> Thanks,
>>> Armin Wolf
>>>
>> I am using opensuse on the device, I can just add patch in the obs so
>> yeah rebuilding kernel is no issue, I could do the patch myself but I
>> don't know how to make it device-specific.
>>
>> Thanks for help!
> 
> Nice, can you test the attached patch and report back if it works?
> 
> Thanks,
> Armin Wolf
Took me a sec to build but here we are:

dmesg:
[   87.131983] [    C0] sony_laptop: event ([5c] [31]) at port 0xc000(+0x12)
[   87.132025] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
[   87.132175] [    C0] sony_laptop: event ([10] [05]) at port 0xc000(+0x12)
[   87.254860] [    C0] sony_laptop: event ([5c] [31]) at port 0xc000(+0x12)
[   87.254901] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
[   87.255053] [    C0] sony_laptop: event ([00] [05]) at port 0xc000(+0x12)
[   91.458548] [    C0] sony_laptop: event ([5c] [31]) at port 0xc000(+0x12)
[   91.458589] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
[   91.458742] [    C0] sony_laptop: event ([20] [05]) at port 0xc000(+0x12)
[   91.673571] [    C0] sony_laptop: event ([5c] [31]) at port 0xc000(+0x12)
[   91.673609] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
[   91.673760] [    C0] sony_laptop: event ([00] [05]) at port 0xc000(+0x12)
[  104.730797] [    C0] sony_laptop: event ([5c] [31]) at port 0xc000(+0x12)
[  104.730839] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
[  104.730907] [    C0] sony_laptop: event ([01] [05]) at port 0xc000(+0x12)
[  104.904877] [    C0] sony_laptop: event ([5c] [31]) at port 0xc000(+0x12)
[  104.904917] [    C0] sony_laptop: sony_pic_call1(0xa0): 0x5c0a
[  104.904986] [    C0] sony_laptop: event ([00] [05]) at port 0xc000(+0x12)

evtest:
Event: time 1718755430.426219, type 4 (EV_MSC), code 4 (MSC_SCAN), value 31
Event: time 1718755430.426219, type 1 (EV_KEY), code 418 (KEY_ZOOMIN), 
value 1
Event: time 1718755430.426219, -------------- SYN_REPORT ------------
Event: time 1718755430.437524, type 1 (EV_KEY), code 418 (KEY_ZOOMIN), 
value 0
Event: time 1718755430.437524, -------------- SYN_REPORT ------------
Event: time 1718755432.919837, type 4 (EV_MSC), code 4 (MSC_SCAN), value 32
Event: time 1718755432.919837, type 1 (EV_KEY), code 419 (KEY_ZOOMOUT), 
value 1
Event: time 1718755432.919837, -------------- SYN_REPORT ------------
Event: time 1718755432.930858, type 1 (EV_KEY), code 419 (KEY_ZOOMOUT), 
value 0
Event: time 1718755432.930858, -------------- SYN_REPORT ------------
Event: time 1718755436.729119, type 4 (EV_MSC), code 4 (MSC_SCAN), value 19
Event: time 1718755436.729119, type 1 (EV_KEY), code 148 (KEY_PROG1), 
value 1
Event: time 1718755436.729119, -------------- SYN_REPORT ------------
Event: time 1718755436.740856, type 1 (EV_KEY), code 148 (KEY_PROG1), 
value 0
Event: time 1718755436.740856, -------------- SYN_REPORT ------------


seems like its indeed working! I assume you'll take care of submitting 
patches and all that but I have still one question remaining as I'm not 
quite sure how to map the zoomin/out to usable keys so I would really 
appreciate help with that.

But in general I'm suuuper thankful for your help! Thank you very much!


