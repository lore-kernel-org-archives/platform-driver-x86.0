Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F914223705
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767101788; cv=none; b=aBT1f4S6y7iRBT1ETHVMqYTDfYMh7aOm+vjOCarHn3jQJucIQKN+y+2sTilApmvtv1N/MHFD0mTIIQuVKrsKQ44PJuRuanwv3m4eA5I8XoqtgXSQwIodnzYWe9Fn1SSMb3f/jcEUv7xtwDZMH5V6e7okbIyA990lzhfumgMu4tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767101788; c=relaxed/simple;
	bh=l9izueDpxNKw8ghIsaOSlDgG5LyfKRa3Z4yNycrU74w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fItsQfHsWcKEyrJTXvCBnCEtwGBG00KmLzSy0uQ0i+t6RVLnuOWyCab5sPUWcmm+MuaYGDuYpDbf5V7WZamCewQVvCj0aU0JW7MBhLGrHaGh1H6bkMMUiIc6dZGrygY93Z6dUD7Iq0LgVlphOX+16DZ0Gf1W6B+QAayduwLVz7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7iLwPEM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7iLwPEM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4327778df7fso1941622f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 05:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767101785; x=1767706585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NigMU7Jyvzt25hDWt7R+m8tOm6KCuQkybWue6UkKjD4=;
        b=g7iLwPEMi/YV8udD1iPKOoC9kkyT6dHpc774Xt1KnW/2yO5p8LORhn/H2gfXckq5AE
         EdFI9R/4/vILyNrApkuBmcpMivAjoiZ+xpw+s90ZTUFViN4kuCQTpjSozn6n8/BTpN9N
         KxTsxAPsgCYmj58oEoiP6SRb9Y2AGyPkh51QFRoNDo3/hndzOyxk+nVAR27vBptaBqyp
         LqtrIvCeYJ3cb/cu+YhRF1RXJNkwn83UqwboOkIy9NVFU/zxU6qvFWiRE4bM+U8P/c2m
         QMOZrQYgPePXyrvDfC9WEfPxUNze5pZZsQJkvn3sfGak78eMnAeZwzeoMZzoc3MuT1mz
         mfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767101785; x=1767706585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NigMU7Jyvzt25hDWt7R+m8tOm6KCuQkybWue6UkKjD4=;
        b=dDTnZbBwf0NpGR2zykGllXTRgQ97ZYaojipVkaIKewpgI/pJZp5lufBVvmrvF02exj
         DpU491+HL+45BoluGFDSclOnYjaV1ixdkLjNbwPtaoSvyZEkTXZFQj/BvVajiqQS5XH7
         +2oHZ5b/i0ifIHlvMalZ6ypBiwI7/O+aUWY2lsLJ8kwD2AyxvFgyLBlufH2+dQ8uMyZo
         OpArjJhyv8BQS15Ld2D5ZaV6qQGZkcMcfwp/Jh2AAUZeV7l1a3jCSqg9PiNEbEA1jqZy
         fUkioH5/Pr2ieApsrLSREjjitcREgknSAexYi8SY9lem5iCPRdMfAGxAT3yuwazjSeyP
         wLwg==
X-Forwarded-Encrypted: i=1; AJvYcCV0rtGbNIiSlNR0dUnPQuQeyP231WU8xBHF0ArT7JmhRy6zfztDDJAIu9Ld2ZuiKgogJjuCoukziOd9cmQb+sYfGVvG@vger.kernel.org
X-Gm-Message-State: AOJu0YxylfeJFZCLWWuEp7YB8o0L6oSJD5xsWygiEgEp7cf1Dean2fGu
	CTB+4GJ/4LhuG5BCYoWWPtFbJLInN8woTiE0SqIWM00N3XHco2/g/Jef
X-Gm-Gg: AY/fxX6fvQO7XIVBj4WUcDf3Gp4n7AIMT4kQwI9BnWc/h20qKMQUdxgpxb0/HzHPGYi
	P1Jc4Kc95c9GYA7UlEWmIuq80ntjhXSigf5P9ilCPSl5HzE3lokWHnIAtqA57B+O8SVs7AH0/aT
	aWDtI89Md+JxvAuuKAMaduOoKSHC4yrl02HD3Y1T4ZeLWgHXET5IafY0lk8ex45ARD4elYcLpGb
	fvTkGh/gSuF4Eb8xKUqcruRTn/VbV/gjIkkgSyUZT7RqkNmVuHYWv3Q/gHjdIuB+FxscOkmTthj
	GhRUN/QYLQ1fmTNF+r3qS6GgOABmNa3wZHU3zpoZNnD11LISTg1YIyrfZsXGd7gGHA/L9j9bMO0
	XZ4mACbQ176fzWPFeO+LzUddVeHqAFworxNLHv99Ds3yhBxn+j8A40qiNGSLRpGwdsbvBvsWsZg
	lJIOeiXOihFhlcAQSU82U3ANw=
X-Google-Smtp-Source: AGHT+IERUhcAg+CUxom0GsCVh1SHgp8k98XIU22/qpsPQLQ5HpqWNzjivxc/Y9KWJfVBoKh6GcJW9w==
X-Received: by 2002:a5d:5f87:0:b0:431:752:6737 with SMTP id ffacd0b85a97d-4324e4fabcemr41553507f8f.30.1767101784642;
        Tue, 30 Dec 2025 05:36:24 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm68723392f8f.7.2025.12.30.05.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:36:24 -0800 (PST)
Message-ID: <1579d5ed-8233-44a5-8e0d-5462fd8b41d4@gmail.com>
Date: Tue, 30 Dec 2025 14:36:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86: asus-wmi: explicitly mark more code
 with CONFIG_ASUS_WMI_DEPRECATED_ATTRS
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <denis.benato@linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schyboll <dragonn@op.pl>
References: <20251225143007.2684239-1-denis.benato@linux.dev>
 <20251225143007.2684239-2-denis.benato@linux.dev>
 <54cc6828-9191-403c-18d5-76f768d70381@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <54cc6828-9191-403c-18d5-76f768d70381@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 12/29/25 11:06, Ilpo Järvinen wrote:
> On Thu, 25 Dec 2025, Denis Benato wrote:
>
>> Be more explicit in code that will be excluded when compiling
>> with CONFIG_ASUS_WMI_DEPRECATED_ATTRS disabled.
> Does this result in build fails or warnings? If that's the case, it should 
> be mentioned in the changelog + Fixes tag added.
Hi,

Sadly no, despite a property in a struct instantiated only once
being forcefully set to false no warning is emitted by neither
clang nor gcc :(
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 4aec7ec69250..a49447eff4f4 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -302,7 +302,11 @@ struct asus_wmi {
>>  	u32 nv_temp_target;
>>  
>>  	u32 kbd_rgb_dev;
>> +
>> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>>  	bool kbd_rgb_state_available;
>> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>> +
>>  	bool oobe_state_available;
>>  
>>  	u8 throttle_thermal_policy_mode;
>> @@ -1060,6 +1064,7 @@ static const struct attribute_group kbd_rgb_mode_group = {
>>  };
>>  
>>  /* TUF Laptop Keyboard RGB State **********************************************/
>> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>>  static ssize_t kbd_rgb_state_store(struct device *dev,
>>  				 struct device_attribute *attr,
>>  				 const char *buf, size_t count)
>> @@ -1106,6 +1111,8 @@ static const struct attribute_group kbd_rgb_state_group = {
>>  	.attrs = kbd_rgb_state_attrs,
>>  };
>>  
>> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>> +
>>  static const struct attribute_group *kbd_rgb_mode_groups[] = {
>>  	NULL,
>>  	NULL,
>> @@ -1861,8 +1868,11 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>>  
>>  	if (asus->kbd_rgb_dev)
>>  		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
>> +
>> +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>>  	if (asus->kbd_rgb_state_available)
>>  		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_state_group;
>> +#endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>>  
>>  	asus->led_workqueue = create_singlethread_workqueue("led_workqueue");
>>  	if (!asus->led_workqueue)
>>
