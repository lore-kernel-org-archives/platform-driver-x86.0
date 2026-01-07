Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB83126C6
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jan 2026 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790467; cv=none; b=Rv+XUUbaGjour2LstFIQHXwgXM6HLgsU7TvdYrlh7LUUWqnxinpAlTktrz4QbXMaFBY4hxI0q635VEM4cmL8DrtfXwy0RDfCCNZ4+lcrJgZYf6Ff3FESmvsHH6RKRuajiObyVPxfkQCfYrRVo/7ma2441pa7KKXaZTAWw/DKl/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790467; c=relaxed/simple;
	bh=9sIb48gzo7zaea43chj376ZbKNW5nydE4/qvvdyuxSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMgcVWcdauBVRdjz7dBKV4uMA8VeA+VT1tivQNQ3qbl2a2pTMdAeFRFZ6VzNJZNfKQBnj+N82NtaquMcauRwTkNbfevYo5PDnarl+EJ+9XRfjYbd8rp0VIR4fWsECq84xhqNrCU5ZBV9vq3yk3WCSREvU06sVVEcF1EZFg4orwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M60YzcXz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M60YzcXz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so9859765e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Jan 2026 04:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767790464; x=1768395264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1ZFsihSM7eUuf7F3kKj8vZvzmYO9Sr6mOcUt9tE0Pw=;
        b=M60YzcXzF6lYY0ALNfuRkqV1Ng20wTF5XWydb02Cgwkd6gokKIYXyUB/Hv+eJjXNeu
         YWEYrPcw0xeqToM6XSHhM1q+OpsGBrn97DUYTR/Z1zoHD/48Org2efa4Rsu6Dgw+rcva
         pU7b0acKge4IA7Dorp5St3/ThFBm/ZPhA7aDorID4rKFU03QWvCLY8gu2QZDfjNoZgAm
         2rCnTVAecaA4xfXwchX1ClnfH646QiJN96gyAvKSrhoN7uX49h9C6Eukz2corkae2Fa3
         3+OKS7+CcTRrQrupOFck/gdT7QXNwxcw0pFcW/siqDUIhsriglGOF4xXbK2/oH+UnjoH
         s6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790464; x=1768395264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1ZFsihSM7eUuf7F3kKj8vZvzmYO9Sr6mOcUt9tE0Pw=;
        b=jepQD613BL2AYPJqH5C1wChOwkAGKn2mXG8A8reyCUS55pEG0cI8cw79KIedQ7WctE
         JNReJGFOBc9nEcokD1LWq3DOHLdQXmhgvN7pckAKm8Umwgp6R2HDrCiOQ5l46F5JeBKi
         anF0WoeBNEkx2C+T4/ag0HWLeHmyWU8TqgLkbS4Dw+/sqYytTJny8AkI8fNwm8Ghlq0c
         dDem9WanSTj08QykYdPXcAcXpYfDlpMyo2v1b/cD8eQg3o5ai9sBjdIPBncsJopGLj4e
         v2nyn3YckQLbXshRc8ut4NVHGHDkh2uFrknZU+mJBPznxsMaKS72fOzPZtTcbVBzZnUV
         SuYg==
X-Forwarded-Encrypted: i=1; AJvYcCXGTG19km1QAL+DmEjrnDd1H+amBtXMBuk+K1AbDQvAiatVcZunqSbYia6iESbKqjrfkPoH/7hrwQqSzPUPah/aqu7U@vger.kernel.org
X-Gm-Message-State: AOJu0YyanSwS3N+tvpyyIQxbx5BRVhU6+hlui84WlPV3E/s+JbIIK+Cs
	RBomkT9WqymPGxOWvkCXuCzQII2ex1Bqjpud8vdwohbNjug0BZP0n5gSecqr9A==
X-Gm-Gg: AY/fxX4XYjZn9o+Xa48iyjdfCstkx4NvuI0/7nr5Ogb5iZOpxnr0MrnLdrIz3eXxND6
	Q5Y4MBWH54Kb+hxH+nTQowZImcXbJt2BtpmGNPxxNM1HWyHYoWo0wz4YynlCa5iLBbcIUTFJy2B
	ONh23xOvR7WoOIGLrsGd2aTI0nGrRojT7itDULaRJHJhhMQWiK2/U3wUtuUZT3jk8GWi3vOu71z
	L/P5frPAQVHRLXm14i+HYK+JiUgUDQrA7x9JopQCIJG09rz5tDAZLQZT9dojCxHu8LdIWZ+C+hj
	cUyRMa6MGAX6Ww6jve8PyYELBlAEnzFlqxnDFkY01iDs/SSwO2uxULrvo4Yli3rqRwSLnLjLTm0
	99EzP+Dvc4wsx2z9Q+HxAbZtIN06BCJR8omILoTeYJ+2N7fklu5dtwJg3D2ynqhtxUrpjQTqRJe
	Z2nABmGAmNKHh9xA9jcayi7EM=
X-Google-Smtp-Source: AGHT+IF7Zi0gv3AWydSEPynSUrmNBWHaZkiYYoLznyQjAwtqZBSf/Fv1/ZtHJsKhxhrOka4SLvcdXA==
X-Received: by 2002:a05:600c:4752:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-47d84b54c47mr24381205e9.18.1767790463539;
        Wed, 07 Jan 2026 04:54:23 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef868sm94841355e9.11.2026.01.07.04.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:54:23 -0800 (PST)
Message-ID: <09936227-9292-4a36-a581-1eb622f3d32e@gmail.com>
Date: Wed, 7 Jan 2026 13:54:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Antheas Kapenekakis <lkml@antheas.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kelsios <K3lsios@proton.me>, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
References: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me>
 <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com>
 <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com>
 <1adcffd1-2381-654d-b9b5-966306758509@linux.intel.com>
 <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
 <d169655b-4e15-fab6-0ce8-7a6bfd6a47a5@linux.intel.com>
 <CAGwozwEE0TXZqKy1W0zPjP=6+oog1ATfGJeLFqyLwr8kMZ56Lg@mail.gmail.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <CAGwozwEE0TXZqKy1W0zPjP=6+oog1ATfGJeLFqyLwr8kMZ56Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 1/7/26 11:45, Antheas Kapenekakis wrote:
> On Wed, 7 Jan 2026 at 12:42, Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>> On Tue, 9 Dec 2025, Antheas Kapenekakis wrote:
>>> On Tue, 9 Dec 2025 at 10:17, Ilpo Järvinen
>>> <ilpo.jarvinen@linux.intel.com> wrote:
>>>> On Sat, 6 Dec 2025, Antheas Kapenekakis wrote:
>>>>> On Sat, 6 Dec 2025 at 00:03, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>>>>> On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
>>>>>>> I would like to report a regression affecting keyboard backlight brightness control on my ASUS ROG Zephyrus G16 (model GU605CW).
>>>>>>>
>>>>>>> Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patchset v10, keyboard *color* control works correctly, but *brightness* control no longer responds at all. The issue is reproducible on every boot. This problem is not present when using patchset v8, where both color and brightness work as expected.
>>>>>>>
>>>>>>> Important detail: the issue occurs even **without** asusctl installed, so it must be within the kernel HID/WMI handling and is unrelated to userspace tools.
>>>>>>>
>>>>>>> Output of dmesg is available here [1], please let me know if any additional information is required.
>>>>>>>
>>>>>>> Thank you for your time and work on supporting these ASUS laptops.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Kelsios
>>>>>>>
>>>>>>> [1] https://pastebin.com/ZFC13Scf
>>>>>> [ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive handshake ack: -32
>>>>>>
>>>>>> Oh yeah, asus_kbd_init no longer works with spurious inits so it broke
>>>>>> devices marked with QUIRK_ROG_NKEY_LEGACY
>>>>>>
>>>>>> There are three ways to approach this. One is to ignore the error...
>>>>>> second is to drop the quirk... third is to check for the usages for ID1, ID2...
>>>>>>
>>>>>> I would tend towards dropping the ID2 init and ignoring the error for
>>>>>> ID1... Unless an EPIPE would cause the device to close
>>>>> Benjamin correctly caught the deviation
>>>> BTW, we want to record this knowledge also into the changelog so that the
>>>> next person who'd want to make the check stricter does not need to guess
>>>> whether it was based on a real observed problem or mere guessing there
>>>> could be a problem.
>>> If we keep the spurious inits, the stricter check will catch them and
>>> throw errors. This is problematic.
>>>
>>> Kelsios, you have a device that allegedly would not work without those
>>> inits. Perhaps you could try removing the legacy quirk from your
>>> device and see if everything is ok?
>>>
>>> If it is, then we have a tested device and a case for removing the
>>> legacy quirk altogether
>> Hi all,
>>
>> Is there any progress on this?
> Hi,
> I plan to revise the patch series and fix this issue next week.
> Currently on holidays
>
> I am unsure how I will tackle this issue, I might make the init not
> fail for 0x5d/0x5e, and try to avoid printing errors if the endpoint
> is missing.
Hello,

I have left the patchset in linux-g14 for people to try.

I estimate some thousands laptops run it at this point, however we had to
stop the driver from aborting probe for things to function otherwise lots
of model would have stopped working:

https://gitlab.com/asus-linux/linux-g14/-/blob/6.18/PATCH-v10-00-11-HID-asus-Fix-ASUS-ROG-Laptop-s-Keyboard-backlight-handling-id1-id2-pr_err.patch?ref_type=heads

There is only one laptop model remaining that display some serious problems
where loading this patchset makes keys unresponsive or repeats some keys
or takes a long time for buttons to register.

I have asked the user to response to this thread, providing instructions
but as you can see he never did.

As an additional note I would say that I plan in the future to mode the asusd implementation
of anime to hid-asus and the handshake on 5e is the perfect entrypoint to check for compatibility
so I guess just pr_info the unsupported feature for the time being.
> Best,
> Antheas
>
>> --
>>  i.
