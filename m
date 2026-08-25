Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C263955EB
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 11:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787657886; cv=none; b=uYcBZYETF9aA1F/K8WZdqZMZwA7A3eHW/SdqAsZ3P4MyPRgBrdxqKuzFpFu0nhjrLzdigBhTRIWF9ZppHW1kfpvS5PVKUzYZWH0ujdMadyXYB+r2xuoiUwusBTV+Ogp7Yw2n7mhGOpJXh/IK4iFa9BZt6MIlwy61A0momd+O+mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787657886; c=relaxed/simple;
	bh=ybZNKPxpc5CS+XBA72EufS8cCM7ukMTwYZpurs/ut/s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XXfidXLgZbubp5MSVZe+jJCCrXMUH+ZZuFzmvsP4myBOf7bpGf1A8HG300I64RgyPlLzzX4P46jqiSvpRpY9O+OIA+nSlPYnj9vf60dVC89joWKJ+Dd5tUEY28ql+K0W3JQRB3JPip5abGsTdTf/EtIXpOkC5dtC1WtMs7Ez7pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgH8EWbX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgH8EWbX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b966dd74so21311135e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 04:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787657883; x=1788262683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRmKH/P6kAbnpwhxSkmrnkLhmVjncAC2YVbg/qRWRU8=;
        b=EgH8EWbXlc20QvC7YHewG7FnHLFZSmiEcxzWcta/p8b0m0C4SKA/BdzsO9cbftzkyH
         d6JtIb4QQPwFayiF+vQ6Ru1Hna/SVMXZMd0zUA0NlJnX/1D8pow94Ee14l+LZqxSqe2l
         m4PAW0gXBTwcFV8C5lX6WVNAh3HZNwBjIAU3vZk79Y2ZdG5nWWsBobfnKk8GAo7N6m9D
         Nxoxl6L2Ax/oWBEvst46HlQgtLKtD2plXL2esks4S7NDWACzXmknHZYdEmtAoKJeELPE
         9Wsa06g/Cn0BMf39ZNfXevzqX94ZKabyUn28Ryvve200v0CUgytwVFWgQ37QrN4V1/6V
         AHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787657883; x=1788262683;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRmKH/P6kAbnpwhxSkmrnkLhmVjncAC2YVbg/qRWRU8=;
        b=ONBphGPWQITZT2dFsvo/JYKsfY6zu9MLiLF9cBUFqj9SUIXkWiHrfRhZgi92EFuEzX
         umzkoCc9LhEJrTu0pM2R8hQvKaiq93oFGDxv2G5I0ew+IeBkx/hBEoxPp3I9dOBHbAOc
         cu1bnc2MPEMaTvPfrLb67VyPjFo50i7QgZk+ME5KtqiZU0Jqt70vHj0aw3ue/WF7Mzvn
         hqrKAF9/AfpBzU70DJUmnfAntJkxLEYXqO3118STdeK86u8URXg2Yf55mNDApXA8SXLH
         t6+6oavjGL7VqP6vXPid5XqBn+IE5WhFr//CD/TqNzyRHbJyQxw77JNA/YYH72HuSzpJ
         znnw==
X-Gm-Message-State: AFuF++kO7zMu4vvYP4+IiQ3Pgy/aVWx5jSy3gE4rQhwjmxOOmvtGxIVT
	UacXBylZ9eJb8sIXb2CWEpauCokmVHFY4RWcmbtcAmHXlG5Hik5Fq3e/
X-Gm-Gg: AR+sD11Xxl4SB47MZqF3WTl63u4jRit1llHfqcDFT/7YdlQRXoxUk1b3iVxB0M5SJjF
	1h/moTEyRu6kHLToAik201dt0LcyG83aF9748L6ler7VJZnkrX2ks1J1HpGzymGxNuYxWLK+Zea
	/YqhpntMDiBnVMwEUthOihSjRM6OOulnRGnrRNafHewi3ow1vZunOjcKgRmUq63m+auRiy+e47m
	aLS/XRYNh1v0DK2Vfdtl0Ld5WW7Fr/E73vnqraFiJh9sGH+ZZ3RuC+H74zZCbi/O9Y04BykTE39
	4RgZTbo85/VrcbmdFk2vYYCrfFhcnYOKt1skn9phm+dxzz4ZbKfprB33KGMQYpPMnSjPNyFNVXk
	ei6jZ6v20bO6xJ+pup60qAhgf8ymPXp2TiFnKeVrYQRSkyA2GfULAjSGgyt048EznVIBgYoDzEr
	mn2HWCl4fChyuG0rfnfknCes5mPTTzR5ce2SxsRzGZ/eOm8w6XRbWTC+oFR88ziBommHOmniC3B
	rXbGmteIvoVciIxVf1UZeSgbvb2tPE=
X-Received: by 2002:a05:600d:7:b0:499:db6e:40a5 with SMTP id 5b1f17b1804b1-499db6e4107mr6228165e9.4.1787657882980;
        Tue, 25 Aug 2026 04:38:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ee5:c860:8ad5:2b44:195c:f38a? ([2a01:e0a:ee5:c860:8ad5:2b44:195c:f38a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482dd853b9asm1308425f8f.1.2026.08.25.04.38.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 04:38:02 -0700 (PDT)
Message-ID: <985b98f7-04a3-449b-ab6e-7f23e29e4b43@gmail.com>
Date: Tue, 25 Aug 2026 13:38:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ponali <ponali2k@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: fix unclear usage of
 bd->props.power
To: Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org, luke@ljones.dev, deor001@gmail.com,
 benato.denis96@gmail.com, Salvatore Bonaccorso <carnil@debian.org>,
 ponali2k@gmail.com
References: <20260819205353.1651888-1-denis.benato@linux.dev>
 <19443596-887f-4f06-ba74-c75637d6913f@linux.dev>
Content-Language: en-US
In-Reply-To: <19443596-887f-4f06-ba74-c75637d6913f@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


I have applied your small patch, based on the diff you gave me, and the 
ASUS ScreenPad display has started working.


I'm not sure what commit I was supposed to patch though, so I guessed 
9bd6ec. I had to patch it manually because the line numbers weren't 
matching, and you sent me the output of git diff directly instead of the 
contents of a git patch file.



The custom compiled kernel created couldn't handle the brightness 
correctly, only the power:

On KDE Plasma, changing the brightness is possible, but the maximum 
brightness was set to be darker than usual.

On both brightnessctl and sysfs, writing to the brightness value would 
change both brightness and actual_brightness, but no changes would 
appear on the backlight.


Booting to a disk image of pre-6.12.90 linux with XFCE has the same 
exact issues, but then after booting back to my normal 6.12.90 system, 
the maximum brightness came back to what it used to be.


I hope this heisenbug only happened because i simply patched the wrong 
commit.



On 19/08/2026 10:55 PM, Denis Benato wrote:
> On 8/19/26 22:53, Denis Benato wrote:
>> The bd->props.power is checked in parts of the driver correctly comparing with
>> BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props.power
>> and !bd->props.power, moreover in certain checks the logic has been
>> inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wrong
>> usage and the inconsistencies by using proper comparisons.
> Can someone having the regression please try this out please?
>> Fixes: 130d29c5627c ("platform/x86: asus-wmi: adjust screenpad power/brightness handling")
>> Closes:https://lore.kernel.org/all/178362762638.911488.8564892548331679884@eldamar.lan/
>> Closes:https://lore.kernel.org/all/ea9c63d1-4776-49d5-9dc4-6c09498f99c9@linux.dev/
>> Signed-off-by: Denis Benato<denis.benato@linux.dev>
>> ---
>>   drivers/platform/x86/asus-wmi.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 8610663b8269..3600dddd8f36 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -4500,7 +4500,8 @@ static int update_screenpad_bl_status(struct backlight_device *bd)
>>   	u32 ctrl_param = bd->props.brightness;
>>   	int err = 0;
>>   
>> -	if (bd->props.power) {
>> +	switch (bd->props.power) {
>> +	case BACKLIGHT_POWER_ON:
>>   		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
>>   		if (err < 0)
>>   			return err;
>> @@ -4508,12 +4509,17 @@ static int update_screenpad_bl_status(struct backlight_device *bd)
>>   		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
>>   		if (err < 0)
>>   			return err;
>> -	}
>> +		break;
>>   
>> -	if (!bd->props.power) {
>> +	case BACKLIGHT_POWER_OFF:
>>   		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>>   		if (err < 0)
>>   			return err;
>> +		break;
>> +
>> +	default:
>> +		pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.power);
>> +		return -EINVAL;
>>   	}
>>   
>>   	return err;


Regards,

Ponali

