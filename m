Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F438372B26;
	Wed,  8 Jul 2026 04:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783484153; cv=none; b=huhRnMsYYpB8I9smxG69+QYEzRADfa3gxbFFKh/MJvX/KSBqosCBdh/4X4dpmXgcVvTDjM/xcbgDyIBgkhwuyFX70SfMWaVRlZeaZfrHmHdsCDtMVQUiEHr74CyJ7qVo2sXjEIzgwxtGYbUaz6wplmeqtHSLt8HuMHzyOtCb2Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783484153; c=relaxed/simple;
	bh=cFfOKIDda/MMKV18N4C+Zf06TIvYFaqYX4SHx20aOZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4eZ8YewqoFYY7xxD9yxuwftRyDOcWJqTn166QBgGhBKThVxPufQNdwazwZwFA5cLU6Ia913PZnws6ewMqFCHPU4FCiZF2bQDJ9jctYY1Gkyj6KEFPF6DqzNmSc5+t7MTR7llDjiPXqDgwi8yx5gUeYUe3jSVsP5cpaw6QNZ0pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=NsEo3Mcl; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="NsEo3Mcl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1783484108;
	bh=1gNKxJ0zDNbm1CcNVKPI0fwsPQ92OZL8/QuRRZ20dU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=NsEo3MclCpdJaONAtFD456/hvO3Uxe6SyYeYJ7sr6uh79mLwRCjttkG2E48xcMdm2
	 cUVoWCbTzJ8Wd+0RlQRCjKPDO1R6dat7WFEiyGmKGppCutYWCKca6VVFj8NdFSe/20
	 m1UaVdjwFKQqz9JSWjrPyKwqXQBgt/BT41xdhcXk=
X-QQ-mid: esmtpsz11t1783484079t327108fb
X-QQ-Originating-IP: uLuv8NyVFfBep07NDN6bY5OsrbXXAmgnB7T5T3Fz3RE=
Received: from [10.20.12.112] ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 08 Jul 2026 12:14:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8671151912138788091
EX-QQ-RecipientCnt: 9
Message-ID: <9E24E598526FA2CD+f70e445c-e32c-4c1f-9001-1b19be021838@uniontech.com>
Date: Wed, 8 Jul 2026 12:14:37 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: think-lmi: Fix "Call Trace" error warning
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>, ilpojarvinen@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, raoxu@uniontech.com, shaoyang@uniontech.com
References: <20260707091555.71007-1-goutongchen@uniontech.com>
 <e314eebf-06ed-44e5-9cd1-35d60d02df8c@app.fastmail.com>
Reply-To: e314eebf-06ed-44e5-9cd1-35d60d02df8c@app.fastmail.com
From: Gou Tongchen <goutongchen@uniontech.com>
In-Reply-To: <e314eebf-06ed-44e5-9cd1-35d60d02df8c@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: MtnV5/DUURsJE5CkXrUwr01Law6EmC2PEn66F94KeGFkFXc79PXuIoVQ
	iTfzaN3qbR5Q8sxMlcePJiM/N3p5NSfPO4OxJPy/EvMECiIfgkymdb+O54lN+WG7EaUUdsk
	7c9zsUZJ7HXPRRoQMoedaAp9tVeDeo5rlxsmw7XDeRORW/JHYnEsZLnRYx5dvOYHG0vUi59
	KbZKUfh6grJnvEOTkA9/seJDfj+7zKYhe6UXRKQWAe3I8xIu8BA5XRiGspML0Ba85dgx4A9
	0Kiq27tRbb6EHwzwWgbWoX9q0aN8koUcFXPOEfbzcBz54P9rcF8gdhkFW/RYQZg4zJ2yukh
	PyXhAH1iQyQ5nrQo9nejbe3V3YM5TjL4W0thZuiMWK0SMzVh7wvi6rxUMoFVWxlRTDgftPe
	kFrum7NUR7Ml4yJI9xvlqv7XujBVOiqcM2Qq/kfQDyIFyvveyeHvcf5NQPKVXHZnMjhNh7c
	A1AgpDolOn0hGyYIRcZ/p3+U5fRjJA6TzpGpIzk8GTFgyStHFDTtT5dQ54Gan8QFbgGvTQ3
	1/9pxix43vyn3lIzsth4ife5fvzJ6092+Ff5vYZCRmRCUu89uKFZ538Uii0G83hz7zrB/mY
	mtkunPZ79TvtAdbpsp85YF1sWX4y97ciM9bUzGiY29pHuR6lj9m0BSiztULVw17e2M/5aqt
	yTd58ZHzA0tXF5qtiE4obuWZ5DnThwT49b1+RqzITHTiY+75K1EnSH355RUQWIt7/KZOrrh
	pRaP6ByUXJE1aTSwB7InZQjuBbAikGXeSuVizuO7cG8Yn00ZUvWE3gfnfWJInBama3f99wf
	j8FaIU83cPLsnboHVgOt6lT/jxPS0OFauYgIav1LAT2JCTrnT6C13pa1MfYRHUBZEaHpK7k
	PjGsN8He3u4DoKOTmz3F1HPm1MgDEMlqssRQqY0MvhqDFI3exnxxrN4Js0g/PnJE2r+jN5B
	AC/FXjW39Dz/iADgmoCu/pjZrQcRhvHyOZgpg62a/AfKl3qDVqUGTXwpH/TFdVsyM5BG7mb
	ppG7m3hvf0XRGzwsA492P9XRRUaW57wUsfDUzuV9CH7gsXoxSxabwlDxVb7WYgOruptJXHd
	OGlBS43v52Ep79YRoacc1s4Ocb7EckWQjjIlmmqwLaeyAYcGktOfNSF2y6YW/Pv8Q==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0


On 7/7/26 21:31, Mark Pearson wrote:
Hi
> Hi
>
> On Tue, Jul 7, 2026, at 5:15 AM, goutongchen@uniontech.com wrote:
>> From: goutongchen <goutongchen@uniontech.com>
>>
>> The maximum BIOS password length returned by the Lenovo platform BIOS/WMI
>> exceeded the size assumed by the think_lmi driver's internal static
>> buffer, causing the driver to trigger a WARN_ON() during self-checks.
>>
>> Increase TLMI_PWD_BUFSIZE from 128 to 256 to eliminate the recurring
>> Call Trace warnings.
>>
>> Here is the kernel warning triggered by the bug:
>>
>>    kernel: WARNING: CPU: 4 PID: 665 at drivers/platform/x86/think-lmi.c:326
>>    kernel:        tlmi_get_pwd_settings.constprop.0+0xe6/0x130 [think_lmi]
>>    kernel: Call Trace:
>>    kernel:  tlmi_analyze+0x31c/0x640 [think_lmi]
>>    ...
>>
>> Fixes: 651b57dd4087 ("platform/x86: Move Lenovo files into lenovo subdir")
> Minor - but I don't think this is really the culprit :)
Gou Tongchen - Because it was initially discovered on an older kernel 
version, the path hadn't been changed at that time.
>
>> Signed-off-by: goutongchen <goutongchen@uniontech.com>
>> ---
>>   drivers/platform/x86/lenovo/think-lmi.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/think-lmi.h
>> b/drivers/platform/x86/lenovo/think-lmi.h
>> index 017644323d46..d643cf3b81b0 100644
>> --- a/drivers/platform/x86/lenovo/think-lmi.h
>> +++ b/drivers/platform/x86/lenovo/think-lmi.h
>> @@ -8,7 +8,7 @@
>>
>>   #define TLMI_SETTINGS_COUNT  256
>>   #define TLMI_SETTINGS_MAXLEN 512
>> -#define TLMI_PWD_BUFSIZE     129
>> +#define TLMI_PWD_BUFSIZE     256
>>   #define TLMI_LANG_MAXLEN       4
>>   #define TLMI_INDEX_MAX        32
>>
>> -- 
>> 2.20.1
> Which platform are you seeing this on please? The maxlen for passwords from the BIOS is supposed to be 128 so I'm intrigued as to where you're seeing different. It maybe should be fixed in a platform BIOS?
>
> Mark

The hardware platform is a Lenovo X7h with a Hygon 4 CPU. The specific model and BIOS version are as follows:

kernel: DMI: KaiTian /LXKT-HG4M-X7, BIOS W0WKT1FA 11/18/2025

I found through kernel log printing that the BIOS returned a password length of 255, so I increased TLMI_PWD_BUFSIZE to 256.

Thanks.

Gou Tongchen

>

