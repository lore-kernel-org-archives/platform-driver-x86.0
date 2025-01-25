Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66CD205E16;
	Sat, 25 Jan 2025 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737775674; cv=none; b=NcrCJ3E1oxJDONgj99EhbLbFA6Up5w7DrBSNwnDIRpAMCx8UuvVswlBZapQkXcbTDMIeyzvxGZGc7k/VxxMq7v3Qadh04g3ywTtTTZ05iEjv+H0FDigHb9ACZ5jWzNudPgvbNCsucBZvDbyfACO7FReJvemoMqQFdGZokpN8Fao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737775674; c=relaxed/simple;
	bh=hSd9bNcaQZwM4MfIVp2CWQoHIc/E5DKLRSqnY+y0FXA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=cS1lS1HZj9dCepW4AEtEE7litZacl0z9x6o0LQxRo3a8Eh5HzSYpP2xdL1wCfjod73cxkE83CTKI7CpP1NKd3M7s+JeB0RmwEdWvWexSflcuxogYh5NtHLGu64hSh6zbcsl60+RcLrHorA9yDkT4kTZ25t1Hq65S64T2gMZ7u48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmZrLIop; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmZrLIop"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-860af3331feso2030835241.1;
        Fri, 24 Jan 2025 19:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737775671; x=1738380471; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKZyX3M2AvcMPTG32gqq+OlQQHWiF3X4loTwwHWLMnM=;
        b=KmZrLIophGcumRTJ/JNBPbZOywadZ62TjvR+ypLV69G8AFN9LPmK6txvN8B6tMzjm+
         Nvfu0wFaZ0GWQy8e+DZinZbCxczWBRSOWrmNPfv27D0Gj4q7prLHd0RYp3J47UxeUwqW
         QWWkDmjI33iJed9UzRAqNA8G41rkFuxiLV4NVMNB4B9XUUudlC6eJfWOyBWecNhiu4hO
         l/AUzBzsd3ZPwiB3/1FzIGcuSz5/4bd6U3RluerrmgfmfNjxqjc0uCp8AXNKLy7w6ovf
         wfry+2k54f8ju4wRgQhL28SQrI4q/XROHc9tqJiWNjHs9F1vT2MIaWnx9PTCe5Tku4ES
         wnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737775671; x=1738380471;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rKZyX3M2AvcMPTG32gqq+OlQQHWiF3X4loTwwHWLMnM=;
        b=Hqmdd7XYSB1Vqoi9wZxi645o+zyJyDRP5gzt6UyqmkR0q0e1agipTh/V42DFhNhara
         Rd90FM4hTVUxwEs92N2gcz5e3/P9DIbmU784LDx1hN+gRCW/Ib2aWy7xGRGgFj6gt8pX
         xMSMWOIGyiLKBb64QN6zA1ZCVAYfRwJppZaWII4bKCxpJGRPG5ZNiW0vOCMFnzaw0vBF
         kkWjAG5xbhX+z5vwPJS1J+kNzrhyV+D2bgv1AGOVumYM1d2HJp/zLcUtcB/75Pbp00Wg
         +CptSjrxQf+B92H1ZZdp8x8Elu2JrNknLMIiWFK+0fhkTTbjBG8lkqyj4uWB+DnnZc4a
         +1mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXHftx2FPM33kCz+ShhD2szEPWER1yfdY3AqAFSozrxFF4YYP7ymSrxxz5QhU8FVfEAQ5m8cy1B5oSR2nJu9dHdFM7Ew==@vger.kernel.org, AJvYcCX7d+DXsNHhpVp4da9rYP6fk41EIscK27k6tyeheaCW8ceLrByjwxkvy+e1inbzPCT0UGxGjM+TH4qLRmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpX/BxNW58mrlkmp6ck645Sa8uYLln37e84v/bEi4dNIuMfamk
	qw6TP1vYfFsXLXIvRD42iSY9FewRJdqIe1P1hMijhXojQmhiJ6meGOcFKw==
X-Gm-Gg: ASbGncscRvnweMmrVGyf8hBO1yfp6UBY7/+TG1o5gkYkMesj6MPFw5+tybNTAmtcxYz
	Jwbdt3D+poJVVbVAjIse8Dzg6zTuF9LbjZaHytNRJmgYfrrH6qao27LCfC3H56kLUG1hRASisXr
	ZFv110dS01bLckS5m9SC6KASje4DjZeyyFPUu1FrUVdYTB+zJeR1RKU4VStxefATU3IWE8M/Hk+
	KroJbQ77Duyv080J+TH5AGK6Ki8VXIIoQZrSZRP8V1VL58gHZ/HD8+lkioP9FKV+qvGJY+c
X-Google-Smtp-Source: AGHT+IHO619aXuJjzJS1rhvKLeum+icQgSjIAMlPBgwKVZD1gpwIvdlJ6nV8t19b8GqjXnhqeRVwZw==
X-Received: by 2002:a05:6102:c54:b0:4b5:aa81:7f12 with SMTP id ada2fe7eead31-4b709d1e543mr5704783137.12.1737775671568;
        Fri, 24 Jan 2025 19:27:51 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-864a9af3a3csm741220241.10.2025.01.24.19.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 19:27:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jan 2025 22:27:48 -0500
Message-Id: <D7AU29BV2R4F.1T9EMUILIXZKZ@gmail.com>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 00/14] platform/x86: alienware-wmi driver rework
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, <platform-driver-x86@vger.kernel.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250119220542.3136-1-kuurtb@gmail.com>
 <f60a6e96-cd13-4d2f-9024-2c01f4ad8f0a@gmx.de>
In-Reply-To: <f60a6e96-cd13-4d2f-9024-2c01f4ad8f0a@gmx.de>

On Fri Jan 24, 2025 at 4:18 PM -05, Armin Wolf wrote:
> Am 19.01.25 um 23:05 schrieb Kurt Borja:
>
>> Hi!
>>
>> Based on pdx86/for-next branch. Tested on an Alienware x15 R1.
>
> Nice work!
>
> I think the whole series is now ready to be merged.

Hi Armin,

Thank you so much again for helping me get these series into shape. Your
feedback is very appreciated!

I'm going to rebase this one more time to pick up the fixes branch merge
and this should be ready.=20

Also, I already have an HWMON support and manual fan control patchset
ready, that I'll submit once this gets accepted.

~ Kurt

>
> Thanks,
> Armin Wolf
>
>>
>> ~ Kurt
>> ---
>> v4 -> v5:
>>
>> [01/14]
>>    - Remove mention to visibility methods in commit message
>>
>> [02/14]
>>    - Register driver during module initialization
>>    - Make wmi_device_id tables const
>>    - Add .no_singleton =3D true to WMI drivers
>>
>> [04/14]
>>    - Return -ENOMESG if out_data is true but obj is NULL or not of
>>      ACPI_TYPE_INTEGER.
>>
>> v4: https://lore.kernel.org/platform-driver-x86/20250117081347.8573-1-ku=
urtb@gmail.com/
>>
>> Kurt Borja (14):
>>    platform/x86: alienware-wmi: Add a state container for LED control
>>      feature
>>    platform/x86: alienware-wmi: Add WMI Drivers
>>    platform/x86: alienware-wmi: Add a state container for thermal contro=
l
>>      methods
>>    platform/x86: alienware-wmi: Refactor LED control methods
>>    platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp method=
s
>>    platform/x86: alienware-wmi: Refactor thermal control methods
>>    platform/x86: alienware-wmi: Split DMI table
>>    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>>    platform/x86: Rename alienware-wmi.c
>>    platform/x86: Add alienware-wmi.h
>>    platform/x86: Split the alienware-wmi driver
>>    platform/x86: dell: Modify Makefile alignment
>>    platform/x86: Update alienware-wmi config entries
>>    platform/x86: alienware-wmi: Update header and module information
>>
>>   MAINTAINERS                                   |    4 +-
>>   drivers/platform/x86/dell/Kconfig             |   30 +-
>>   drivers/platform/x86/dell/Makefile            |   45 +-
>>   .../platform/x86/dell/alienware-wmi-base.c    |  488 +++++++
>>   .../platform/x86/dell/alienware-wmi-legacy.c  |  101 ++
>>   .../platform/x86/dell/alienware-wmi-wmax.c    |  774 +++++++++++
>>   drivers/platform/x86/dell/alienware-wmi.c     | 1235 -----------------
>>   drivers/platform/x86/dell/alienware-wmi.h     |  102 ++
>>   8 files changed, 1517 insertions(+), 1262 deletions(-)
>>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>>
>>
>> base-commit: 4055e18bfbb7cf077da2bfd74615604b6ca51c6f

