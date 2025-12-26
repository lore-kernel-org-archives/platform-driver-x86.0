Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594751DA61B
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 11:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766749587; cv=none; b=LBXcLIKwqkAOk2H9vN44KgGi5U70PssKwGgn+41cFjG9+lVj8XuMP7tfgVIxE3L7Dgrax3sr+hQKQ3D6PrnpYE5wTDHVh8uBwVohlgLNHlQiY8//MtPYNrDB3Rb8A7ie7qlRcMqSTm5ADwdlGjid2oPbbtLUY5eR0rhHcSX2twY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766749587; c=relaxed/simple;
	bh=mYj3NFitgQcbWCi6fxjX/h+9NqkTjaNyFIN45jOUzmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heygBOedZiLfFOhhiyVVfW8VRSB7bNVmQbkNaEboyAp3I1nh1ndgEU/6qNc58SmU37EWhxCWAnHM2fTJ7TZmGU2yNkntd5MT900+uN3Ncp6/765IrzI7rvZu56AvS3GaafUbqFTnY/+5hTTmv3+hqTe1oonwUYDxPAUOSf0SgbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH0huELg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH0huELg"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fbc305552so5848041f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 03:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766749584; x=1767354384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HYGIJTr5l4uH2QdBFtEIfA/O+ovw4NOiZJ116amoyuU=;
        b=fH0huELgDqr8bFOTiPv3TKrB1kkqRMaNn1FOIF2NtWlW+5pRlDvGBDZGGBElW55BlM
         klINVK6o+pJ9PrBPMt+dP3hpSwCHhddf/RlBKhq3+sIygBPUMPYGHuH0cibodOuhvZSw
         jenqgC8bAjBePvTVzFSOU4oUWgifHzG3RMihvNDyVLDFFhVLPqATHEMET8jU9xQy1vfw
         fMNKBgHKJEsSX7eXFKXlHiJsiX33tXUYpRinx6O3kq6yEkxT0LhD+a35hZRi4UGRmFTm
         PHiXNXtrIyqjzqpQgU7VM3uIxS8UimZ9lqmj1T3kgZ+dZtrb+UJVjocTPO0gkSy69rvl
         +w+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766749584; x=1767354384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYGIJTr5l4uH2QdBFtEIfA/O+ovw4NOiZJ116amoyuU=;
        b=Yc3dr+1s7CNRqgav+q8qhQX5t69tIbpd7lsssgCcg/zrE0cetyWT5g8Jwi6xtnGbmM
         LZKQ1iHxK6OrN2uTtyiaNRuAXFgTus+i9GHOlZg3POmVUoeHe1SMLvEdbJlPj4uLh9n6
         7anX35pYYFXbmGEHjn+D3j2EC+LbvSdXokjYY24055qACazIXna7+MislT1sjk4s0YZM
         z5BYH4VJaDJVLYdWJ3BeCVTRrAw/XaVifieb1ZO2oJwDa3v53rBySsttJcA3rZdjZE4s
         eBB1QIbNOYITTSRarAQ3Wh5KeyNFKf+SnUKa/j3PtW1eU9H7CWd+7XBf4fvHTln0ZCIv
         iW+g==
X-Gm-Message-State: AOJu0YxXUaHcbuiDKdaGCY9cKBbF8Zd6h868f6FjBVyp2ynTItskOxgz
	KTPsIPU+0djn1kbrZM2p3t5cm1NStUvrPlWXuVMKaNEUV3jAIDINq6HW
X-Gm-Gg: AY/fxX4sZ6s4wJ8rypWDFHYdk3lD1ryHcgS/AStwQxwCAJ3dU2XcfalH/Qu5uOqDhEv
	4kQnJKHe9diDo860PK03hjuNoJ8wxJyzse3smDlbqBr3WyyEavqWPpF+ruyXSwUWY1ZpqAA2fHV
	cJgjX0gFVJInq8ukJxq9bSnBQmrgbwns75iJE8SoQXDr3QZkoREXsIjfq11zuj3DHVT0JNKhDCA
	54qeZKzqEIomWhzsAQ6wFSopizegg52kV0dtGrSq/a7rj3d6GmOZr4rUU8DNiJueqh0IIH97Vzl
	AbCLXSnIJ7PDq5eO8WAGbggNFwtHgpl2oFzIYfpN8KMi23F4blgrym8+ihafO0U6ppNuMzOOEoz
	Z3y++P+THhgApUFFCKL+aT8lo0DPTzgVP9LWgvueeu4PzYpNnaI2LACLKIbc9/EQglni+TuIhCk
	gOGIT3wtcUBlmWcwwNDnFPOKh5nzRPlajs1A==
X-Google-Smtp-Source: AGHT+IGVmXym6FCinebPBwGdIkomuxkyRsTjk4JpcNBT9tZH/AJ10WKomnymBiam6PSBOljgcUFj9w==
X-Received: by 2002:a05:6000:26c2:b0:430:f850:9444 with SMTP id ffacd0b85a97d-4324e4c729amr23345087f8f.1.1766749583492;
        Fri, 26 Dec 2025 03:46:23 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325d10cc48sm35448544f8f.16.2025.12.26.03.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Dec 2025 03:46:23 -0800 (PST)
Message-ID: <1aada2dd-c689-4e29-a47e-ab5c82f21b89@gmail.com>
Date: Fri, 26 Dec 2025 12:46:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: asus-armoury: add keyboard control
 firmware attributes
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Mateusz Schyboll <dragonn@op.pl>
References: <20251225143007.2684239-1-denis.benato@linux.dev>
 <20251225143007.2684239-4-denis.benato@linux.dev>
 <3b2d6500-0f54-42bc-bc9d-3bbe0fbef5c8@kernel.org>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <3b2d6500-0f54-42bc-bc9d-3bbe0fbef5c8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/26/25 12:06, Krzysztof Kozlowski wrote:
> On 25/12/2025 15:30, Denis Benato wrote:
>> +ASUS_ATTR_GROUP_BOOL(kbd_leds_shutdown, "kbd_leds_shutdown",
>> +		     "Keyboard backlight while system is shutdown");
>> +
>>  static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>>  						struct kobj_attribute *attr,
>>  						const char *buf, size_t count)
>> @@ -867,6 +1043,35 @@ static bool has_valid_limit(const char *name, const struct power_limits *limits)
>>  	return limit_value > 0;
>>  }
>>  
>> +static struct asus_armoury_kbd_status *asus_init_kbd_state(void)
>> +{
>> +	int err;
>> +	u32 kbd_status;
>> +	struct asus_armoury_kbd_status *kbd_state __free(kfree) = NULL;
> This is an undesired syntax explicitly documented as one to avoid. You
> need here proper assignment, not NULL. Please don't use cleanup.h if you
> do not intend to follow it because it does not make the code simpler.
Hello and thank you for your feedback!

I have used __free here to match a previous comment from Ilpo:
https://lore.kernel.org/all/25bd0c90-2de0-ef66-c18d-661180b71fd4@linux.intel.com/
and I figured that since this is the same exact pattern as that it would have made
sense to use it.

May I ask you to elaborate further please? If there is a more effective way to take
advantage of cleanup.h I will very much consider it.
>> +
>> +	err = armoury_get_devstate(NULL, &kbd_status, ASUS_WMI_DEVID_TUF_RGB_STATE);
>> +	if (err) {
>> +		pr_err("ACPI does not support keyboard power control: %d\n", err);
>> +		return ERR_PTR(-ENODEV);
>> +	}
>> +
>> +	pr_info("Detected keyboard backlight support\n");
> This does not look like useful printk message. Drivers should be silent
> on success:
> https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
> https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79
>
I will remove the detected keyboard and make the pr_err a pr_info,
is this okay?

Thank you again,
Denis
> Best regards,
> Krzysztof
