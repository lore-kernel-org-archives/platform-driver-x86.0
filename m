Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63C33191A7
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Dec 2025 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765178410; cv=none; b=iy7gRj8MpHlzsd3QWJDl58SDU8Qh3HQBzwYaZVLBZVUk/aY+5Fw+pmAdkUwtHtEDAUJ2FLFSZwREFyFUzuD/Q7S8tE1yJsIpjDB9dp92MS016uGtwZF1JFwivqiwfjK0RMzMgojwYGgCt/47M0eursBtMLlRRNpUvGDOcGQg/uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765178410; c=relaxed/simple;
	bh=G2ydOBXIsgrCi9GOTge/kQi7St4VlBJ/LD3MeqIFgeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3ebwLsUyiElddrvI60bdUt3LL0DrOEPWj5UwmmaI9+M825P/BWknwMemXpCTKAu9E7kdp/J6PMzFItKYgd7CsDREwfYiBje58DYvCcE0/5dY7XAegJZD8/7xFoaT6K82EmB7CulJqjnLrEyJIRPA2SdsVf1gbT3TAU5jeh9sPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RELWu6zl; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RELWu6zl"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aad4823079so3644662b3a.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 07 Dec 2025 23:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765178404; x=1765783204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2GFn+qaf7JROxyUHN2tFYlg0931mXfThboEl/PA02I=;
        b=RELWu6zl6YIOueQziLaIUEI558lmMOoAffL3cmsUOY6acZKb/1/7lSkTZ2kmFmiCfL
         pJQJIpP0VhbZjD2OlVGAUQgbDQFfP96eKAcS1ljRuuXbm8LNZ/2FeNfFocA72MTuMm4t
         NUy5YcdqTuU+/su4dNMg2nKOOuaV9e+woeiN1rTjROTVLDdL+Tw2evnu3l6W4EwEG5Oa
         mf6e53xT55dX0bSQP8rIqMIWh47j7FOzazTNs/KDlrGZXVb0JtHhLuca3Vkstv19obUn
         FBk0JksynQvgPpu1xyKncPoDVZHWAC6Cjt5fXRLFgTpEgsX1HPNpiijTjNQYxdtJsPSk
         4bpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765178404; x=1765783204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2GFn+qaf7JROxyUHN2tFYlg0931mXfThboEl/PA02I=;
        b=d8WKvwhctliCJKuDHc1/WtiCUKQgX0esCr6kTSz8fGbw+ArrOLiwCxTamUi3OvAY8g
         uYan+FEw1h4fe6CarCb0FkMB1v7xLhwmCzp7YSIS1Qh0tlrSUpBWCljdLOWLci3bSewf
         bpWfOK7YOscHisr1cqb5cjR9BvbVI1grhhgPKmCr5oI4IGPOUE0HwGQBVrhR+OsGJ68N
         J6AwjGXhVGOd1j4mCbRzqBbtmLDf9Z07rbWx8bp97CFR/cQ4EdUwhZNoU89WFmzAe1kN
         rxaif/Wz0q/Jo1gwdLgpHijalyXyAsuyr1B2cPg+/fzRWeEoyNjLRpNn/L65wRHK80Fg
         RajA==
X-Gm-Message-State: AOJu0YzdEGkllKN0z3ZAHDOrUOyXyFawMNwF3NqfyhqtxdhSF6Hol955
	HMgl4YiOP9zj7Tb+Ncj+uajDmwijG9r9oy93mmS6o6gE/ty3aGg22c7I
X-Gm-Gg: ASbGncvCwMKvwkGADtNNVigj322bnmNRXup5tz+RYG1xZJliigJg0wENryuL/NkkxXI
	969hPHXX7/LrgwgbynlDeMDyTEOdYDQ5AsgDr6lamsBnOl4t+mfha8yAipdwfkpAHNlmagllafq
	TWjwpLknIikJdr2ObAADrQT2ziUCyNj464P3bQ5HC8WBTLuubw6n7Hbu9McV/URCpUcMN+F/wIo
	HUHTigHD1EJ6XhPidmgbG59UHnbdgoR7pZ9VdwC5Hx8UischXGBRQD6+soQlPlUrlTyvvnHWAJE
	r+EGRQXXPy7mQ5Df6CgTXLE2M1OciCdCZ/ogOxtroHk9vMPoxn13Xu6fyZksrZB7gH8Jek5EljQ
	6lMOSMIPnU6R8V3c0d5Xj9ee1huEJ9su2iHSZvFUI7DwDivppUr6/K26iZGqwGIU5Df3BVtlJR6
	jnjx/vYKZDn+yWeMrGw3i4Vq1pBpuKLJI9nb4l6dhZHV0YZLK8KK/rTfbMyihW34a7y0c=
X-Google-Smtp-Source: AGHT+IEVKjRPfpWmz0pcAQmm/JfRACi5Mf+MRdEk29dAwVQIYVJ83mtPVTN6043KjitYmganidcQ/g==
X-Received: by 2002:a05:6a20:1581:b0:364:1339:9fdd with SMTP id adf61e73a8af0-3661802a100mr7076406637.59.1765178402497;
        Sun, 07 Dec 2025 23:20:02 -0800 (PST)
Received: from [10.131.179.186] (zz20234032476F6CA7C6.userreverse.dion.ne.jp. [111.108.167.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a14f40f5sm11683712a12.21.2025.12.07.23.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 23:20:02 -0800 (PST)
Message-ID: <3b785a80-73e6-4def-ae4b-39ccb30dd1b7@gmail.com>
Date: Mon, 8 Dec 2025 16:19:58 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Nitin Joshi1 <njoshi1@lenovo.com>
References: <20251203034032.6018-1-nitjoshi@gmail.com>
 <c8e4a0d2-0641-4e4b-b62a-9c92ec43b3cf@kernel.org>
 <5f295577-ab67-4164-a718-f6fbc8911e67@gmail.com>
 <e259642d-e9f3-4d17-a9a5-68eb2fb34948@app.fastmail.com>
Content-Language: en-US
From: Nitin <nitjoshi@gmail.com>
In-Reply-To: <e259642d-e9f3-4d17-a9a5-68eb2fb34948@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/3/25 22:16, Mark Pearson wrote:
> On Wed, Dec 3, 2025, at 5:18 AM, Nitin wrote:
>> Hi Hans,
>>
>> Thank you for reviewing this patch.
>>
>> On 12/3/25 16:52, Hans de Goede wrote:
>>> Hi,
>>>
>>> Interesting new feature. A few small remarks on the proposed
>>> sysfs API below.
>>>
>>> On 3-Dec-25 4:40 AM, Nitin Joshi wrote:
>>>> Thinkpads are adding the ability to detect and report hardware damage
>>>> status. Add new sysfs interface to identify the impacted component
>>>> with status.
>>>> Initial support is available for the USB-C replaceable connector.
>>>>
>>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>> Signed-off-by: Nitin Joshi<nitjoshi@gmail.com>
>>>> ---
>>>>    .../admin-guide/laptops/thinkpad-acpi.rst     |  26 +++
>>>>    drivers/platform/x86/lenovo/thinkpad_acpi.c   | 179 ++++++++++++++++++
>>>>    2 files changed, 205 insertions(+)
>>>>
>>>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> index 4ab0fef7d440..4a3220529489 100644
>>>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>>>> @@ -54,6 +54,7 @@ detailed description):
>>>>    	- Setting keyboard language
>>>>    	- WWAN Antenna type
>>>>    	- Auxmac
>>>> +	- Hardware damage detection capability
>>>>    
>>>>    A compatibility table by model and feature is maintained on the web
>>>>    site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>>>> @@ -1576,6 +1577,31 @@ percentage level, above which charging will stop.
>>>>    The exact semantics of the attributes may be found in
>>>>    Documentation/ABI/testing/sysfs-class-power.
>>>>    
>>>> +Hardware damage detection capability
>>>> +-----------------
>>>> +
>>>> +sysfs attributes: hwdd_status
>>>> +
>>>> +Thinkpads are adding the ability to detect and report hardware damage.
>>>> +Add new sysfs interface to identify the impacted component.
>>>> +Initial support is available for the USB-C replaceable connector.
>>>> +
>>>> +The available commands are::
>>>> +
>>>> +        cat /sys/devices/platform/thinkpad_acpi/hwdd_status
>>>> +
>>>> +This value displays device type and location of device with damage status.
>>>> +For example:
>>>> +if no damage is detected:
>>>> +  No damage detected
>>>> +if damage detected:
>>>> +  Damage detected:
>>>> +  Device: TYPE-C
>>>> +  Location: Base, Right side, Center port
>>>> +
>>>> +The property is read-only. If feature is not supported then sysfs
>>>> +class is not created.
>>> Nitpick: s/class/attribute/ classes are standardized sysfs
>>> interfaces living under /sys/class/ which this is not.
>> Ack, I will modify it.
>>> Besides the nitpick I'm wondering if we do not want to make
>>> this a little bit more friendly / easy for software to parse ?
>>>
>>> ATM this seems focused on a human directly reading
>>> the output but what if we want some sort of automation,
>>> like e.g. a Linux version of the Lenovo Vantage sw parsing
>>> this in the future?
>>>
>>> Note I've no specific suggestions for how to make this
>>> easier to parse, this is just an observation.
>> Thank you for pointing this out.  I am open for suggestions and will
>> re-check regarding its use case in lenovo vantage in future.
>>
> I'd not considered it from this perspective.
>
> One concern is that it could be multiple devices in multiple location - so breaking it up into too many pieces becomes difficult.
>
> What if we did:
>    hwdd_status - 1 or 0 if damage detected
>    hwdd_detail - list of damaged items with their location (could be multiple). e.g.
>      TYPE-C: Base, Right side, Center port
> If hwdd_status is 0 then hwdd_detail would display "No damage detected"

Thank you, Mark ! I am OK with this suggestion.

Hans / Ilpo - Any comment on this ? Thanks

> Mark

Thank you !

Nitin Joshi

