Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617553;
	b=WnIwNZcJbkuXzZo6EjckYN+ulyivP4KLm2pgkgTglnRLWhYiKNDOyfYWJSwvoGvvAhW8
	 8y0MoMTS7hCdoFKmvpXlEG8s1uwrmhidlVOLjJTmf5w0mO0eOCF3rlXm1ixPXBPrZnIhR
	 5ek1NsmLD4hqUZWroDZyYlpelW5Yf5PvCKsQNsAbIJIm6YiYoxr0mdPnFvquaQAe2Shcw
	 9f/fdK1ytwXD/ToN//qW8JdsfxWxHSS6IL8ijavAXrDNHmqVdrAtAm4UcOThqlIsE2MXf
	 Y7+efRFPR6bJQxnvLAI8KawMa2rFzrfZ25gVZcoip/B9w5RfLT4V2sbt+bzslFeqp5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=JJu+TCMCeoqlcg/tUUedJQVk3HA5Vgks9S+nkJckt/A=;
	b=ArdrVRiGgieFUvPJK0ly8LE0XnGYfxc/NVc/qFFyZARcjpOoTX4rC6hIW8dpuaPFxgy8
	 ep4eQ+J189ES9mY2/4fwbDcp+7GwRImM6Y2LYkawLl7lsLq9J602+RKt4HrzwhFaOxyB6
	 emq8pb3GLaC4aokmnpSFOREJWHFRufwpzsprpu+/QDwxjaa7HeDWbhKUDdz0gDodN0QPt
	 ksrrYs3wkjh2rmSedBPvvYbTC7jJ0xUgZ05oVNCEFkEi2qyRcJI5Cd6Jk2brxTQkr+Hyi
	 /4x99xBc1yQnUbtZk6LWlb9lhiudUHnTunDyTE8QC99WMo06WvuplmmFzpyryV1w6AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6VAAMM9;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20F6606A32E
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 11:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B20F6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T6VAAMM9
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so21506135ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793617552; x=1794222352; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JJu+TCMCeoqlcg/tUUedJQVk3HA5Vgks9S+nkJckt/A=;
        b=T6VAAMM9R4b+esDkm4hYBZfCWg15ogO98FEtGhKKmnEskO8T9VgaCTGdm9K5wUowOv
         hFkZ4tQQM/Sc+HgrD5BC7LF4P5hII6ySBPKMlJl17t3bNgMqcijBdWBPUrJl9OTXPbyY
         LdkvKb80pVpM4ev8/pIA03+kkYfEiyBDm2/QPtcgMr6q5oNVTOmlDosEUD5gJEPiofFk
         Ycn3ZBsKMQ9ioKlpnneDRSkRaFBazj1PBdpmh7nnjl6FW+PYeVaw/Zm7tPJDFRAFM5qR
         tjtFMcDUa/ljwHJl430WBtTDSi/+gqvqw7LOe8fnqnFZuNfpcB/QSkPkNH4DmB6r57qD
         UU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617552; x=1794222352;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJu+TCMCeoqlcg/tUUedJQVk3HA5Vgks9S+nkJckt/A=;
        b=xwXOTDzAdIfKECuQxPQzhVN12Q4T7n7kINUkb8LKL0m34C/b3gLl9nMeQr6qG5zwsr
         c+j9XiU3ypFLTaj2dP9rp5B8Dq4xEPwi7sIEfbfg8qO1Ab4Y4QuIaO+6gyIyjvUQXZmq
         iyDILdORHbSq8r1my8K8luHHp3PMuqFg2swiufePSUaqALED0UTaptbRV5l/Ep4aIaxm
         Z0EGF8o54z6wxF6DoHvbCeZRy5agx+6Xje4zlSg5XQ8++efnL/A2+x4QluXUyZG6zSVs
         r+ggEGuqSpHU+XBVZK92gVqEdaEsZXp3MEyYWDGNR8FEoi5BgjwEhYhCXxx6YvvINm7r
         eIeg==
X-Forwarded-Encrypted: i=1; AKwUvBwwEs+yXoMhMyJYKJ7cZEJ9UteXbLHhrh5ns1dfvn95/S3TX3BLwV/vtHPKaa4MGUiDvtV2BcBpJc6nvHvT8DorYjOy@vger.kernel.org
X-Gm-Message-State: APuU4Z/Le40yBdCSLHKSZ1JL//mUM2Fj6J1rmQZ/TEFlQubsudUFoKev
	Fn2FLlTPOw111u+wScgkhk+3zXktDXZa1ERyVfPpGYI4JflXzveYZ1dE
X-Gm-Gg: AYBFou06XrlAQ6sjf8UPGPCXgi3GnR/8fdVuyARh5UTqbBZXb/1fW4r67qUbUbU3dRc
	SutfWWOg7wNKI1bBrlo44ZtXlngmrQU7HMJMIEK2FU8sbor0YEcQNdU1vxUKlS+Z7ELz2wBv1GU
	VbLZuRmijRjNMXVgFVdgmRf4vRbzu+x22vr59fjgDx22X0UFeWdKSxbQYR+uastEKDFf/pGkONv
	aSFt/++zI1d96INugP32KGiLdRx4r8vFb5/pXmQP1ymXhABeBKhFwA265Hnvj0pV7/cIlHs8usF
	1J0p8mhLNQCytqHm2uVGFGZatMffimZ936Y5ysGEK0rY5ZlZOCBfWpqDEY1AnmaiwO8vLXdqXBE
	rVCaP/30T8Zp2bvyTHw315HAxuypA0ByLXNv7bLDaSCmvnu+vo7sTVH+OcgT1Ery7RiPhzsC5nm
	Vh6SOOTjk+Hou9/yz33mCfakuKkNRXsMb2kzwyD2d8Pa+DQWDBryi3m0g9/4HX+HMX6HSAHEpcV
	s+96/M5FrW7obK0wFC4olKXo8e6hs78V1RxXyS2LbmkuUuQF2rIVHB5IUwxh6ud0lHkDpj/X8tc
	og9/0KVC63qbUaPdpJR1BJBi0dilrdzGg5yI1L5g3/MjV28XbBfLm76G3Xbh+3P5X6l/2w==
X-Received: by 2002:a17:903:46c8:b0:2e9:842d:3c34 with SMTP id d9443c01a7336-2eb364962ddmr86453655ad.13.1793617551989;
        Mon, 02 Nov 2026 03:05:51 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:5bd4:8bc0:479b:e7d0? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392add5dsm25973225ad.68.2026.11.02.03.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:05:50 -0800 (PST)
Message-ID: <85017b4a-434a-436d-80a2-89cb20a9c6bc@gmail.com>
Date: Mon, 2 Nov 2026 19:05:46 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: 7z0423arsenova <7z0423arsenova@proton.me>
Cc: Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20261031204357.157958-1-7z0423arsenova@proton.me>
 <f8970847-89c1-4c5c-bb15-2181f1c8f7b5@gmail.com>
 <BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/26 22:06, 7z0423arsenova wrote:
> On 11/1/26 12:28, Mingyou Chen wrote:
>> Feel free to test the patch series on your machine.
>>
>> Here's an example quirk of your machine.
> Thanks! I tested v15 with your example quirk on the Redmi G 2022
> (TM2135, BIOS RMGAD6T0P1313), on AC power. I applied patches 2, 3, 5
> and 6 (the ones touching bitland-mifs-wmi.c) to the file from
> mainline as of 2026-10-29, which is the same blob as in your
> base-commit (dd1648b7de77), and built it as an out-of-tree module for
> Arch's 7.2.11-arch1-1. power-profiles-daemon was stopped during the
> tests.
>
> The quirk is picked up. Writing balanced-performance or performance
> no longer fails with -ENODATA, Set replies with function 0 are
> accepted, event 0x16 is handled, and the profile values match the
> firmware except for performance.
>
> Writing each profile to /sys/firmware/acpi/platform_profile (first
> run; a second run gave the same events):
>
>    value  written               read back             event 0x16
>    0x02   low-power             low-power             0x02
>    0x01   balanced              balanced              0x01
>    0x03   balanced-performance  balanced-performance  0x03
>    0x04   performance           performance           none
>
> Every write of 0x01, 0x02 or 0x03 was followed within 2 ms by event
> 0x16 carrying the new value (10 of 10 writes over the two runs).
> After writing 0x04 there was no event in the following 5 s in either
> run, yet the mode reads back as 0x04.
>
>  From the ASL (not measured): after a Set, WMAA calls THMD, which sends
> the 0x16 event, but THMD only handles EC modes 0 to 3. With GPUT 1 or
> 3, Set 0x0800 turns 0x04 into EC mode 3 if the adapter is 330 W or
> more, and rejects it with 0xE000 below that. With any other GPUT and
> an adapter above 100 W, 0x04 is written to the EC as is. That matches
> what I see here, so GPUT is presumably neither 1 nor 3 on this
> machine, and 0x04 leaves the EC in a mode the firmware does not
> define. I have not measured what the EC actually does in that state.
>
> 0x03 (EC mode 0) is already the firmware's highest mode here, so for
> TM2135 I would use LOW_POWER 0x02, BALANCED 0x01 and PERFORMANCE
> 0x03, without a BALANCED_PERFORMANCE entry. The Fn+K cycle then reads
> as low-power, balanced, performance, and the three
> power-profiles-daemon profiles map onto the three firmware modes.
>
> Fn+K on the built-in keyboard makes the firmware cycle the mode by
> itself, quiet -> balanced -> performance -> quiet, and each step sends
> 0x16 with value 2, 1 or 3 (in the ASL this cycle is _Q0D). v15
> handles these events; the in-tree 7.2.11 driver logs "Unknown event:
> id=0x16" and drops them.
>
> On the KEY_PERFORMANCE question in your cover letter: on this machine
> 0x16 is not only a key event. The firmware also sends it after every
> successful profile write, so reporting it as a key would produce a
> key press for every write, not just for Fn+K.

Thanks for the information.

>
> The other attributes still do not work on TM2135 with the quirk.
> Reading gpu_mode returns -EPROTO, and kb_mode and the hwmon inputs
> return -ENODATA. The keyboard LED is registered with brightness
> 4294967235 (-ENODATA read as unsigned), and unloading the module logs
> "Setting an LED's brightness failed (-95)". From the ASL, the
> firmware only implements Get commands 0x0800 to 0x0B00, and Get
> 0x0900 returns fan data here. I did not write to gpu_mode, kb_mode or
> fan_boost.
This is currently not focused on this patch series.
>
> Would you like to fold a TM2135 entry with these values into v16, or
> should I send it as a separate patch on top of the series? Either way
> I can test the next version here and send a Tested-by.
I won't include it (the TM2135 quirks entry for your machine) in v16, 
you should send a separate patch.
>
> Thanks,
> Arsenova
