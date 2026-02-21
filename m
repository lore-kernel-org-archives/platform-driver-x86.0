Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDCC313287
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Feb 2026 16:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771691125; cv=none; b=hAed7qGPFYuxtGreXVV5Oc2mC5BC5c/DM7OtwyZzfZ/BcWj8pebVb16kmP/WY+jT6N6DPdKuTDntB+F6w5MPMh7necSgDcO3VMpjqJhHqhRQI+r7HBmGGtWBdcFBi4l2hirGkhzzbqHeOazwkHtKxuz2TfUeZYPfC0X6rVX/AFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771691125; c=relaxed/simple;
	bh=sFKEjzENXJNVnyRaJGFMPRQU81k6/dFpnETRgXUVghs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZBuhExiN/debvRKJ81X3VUK8BW6vKAMlORnZIAk0puLE6NPobBYIcwOjcB2Wm6Fk8I2FpaWIfttZWwdS1FlS5pQKyNAo9km/YV0USFS54wbmjNHeRKmCH3XyaHm2sBX+DvHrVyb7XDYT5EDe3CS9Bd7LSKAG/p+vgPgYmMB7Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTfeOG+i; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTfeOG+i"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7d98c1879so19647265ad.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Feb 2026 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771691124; x=1772295924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=72FnToCet1+aF35ptduMaG37Zb6q/7/K7/efdNYIv+I=;
        b=iTfeOG+i6eQ9eGDqPhfqor9RtNXZYnBlUC8d8vBK/S+/qeayDMIQpO1ddZoMogQxp9
         MejSR7AT+LsRLYegFyxHLoRnDxlveu+HZUfz8eNFYxQVrbgwrlcMSHNyt70/wNHjUYEw
         MqOoMuLcWLZxLTGQ0MxPSESp5JPtqSfgZTJurZ5IUKm/MLBYOtD+MaInKH41eDkHCF7R
         bVutdpcw5SlUF9YKy9rBfFANBuRGoi1JmFXYNhVQeAo6emE2mw0fxCZp3jyb3o84XPl8
         ALnmCPvgq1ObgnY5HIML1LVuV3faE3XxEe9fPqca7+S0ud9V1mnZO+2So9iEf2KTwDOS
         3osw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771691124; x=1772295924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72FnToCet1+aF35ptduMaG37Zb6q/7/K7/efdNYIv+I=;
        b=tOC4vASsBFfX3RqiNlae2inB5VIMkZda4n+46snKSG/6lrTIbBYQJSi/9N7olUNmuV
         fv1sYmpfjOVpeMlEEBBIw48OlKBiy3lnPW11gmICdhLZblPa+O2Rx3DEvxvHcoDtmmdG
         XwcpSYgHruRgU9nwdbbHNR85DuY9w5u4mlqDz5UVoqvSB08A0uFMOTh53YncRqhEiqGu
         aBhhj5YJE2NDWewh9c5PvfRGzu8IwusNHFHXKdSQpjEerqlEmPVtutIKdLLtLhqQ6kzr
         uAsx8BFcjwrmDaVcae8dOVjAy3F1n+Qn88lgmnoEHuvyxa+jZ9zxzkIBgPbcCYJz3KuD
         MDog==
X-Forwarded-Encrypted: i=1; AJvYcCVA/Qd6iIeZx+jVlHEh+T6jfZx9so/Aj7ryWftZKT7P7MUc2PvpF5axyZK6g1p33bLePKQmdIKaIKyyOLQ5A4zb6X3/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/T/zeEh0dripQ/9PGRya3Kc9Luy+Vdo3TKKSRa7GOvB0AyQl3
	a+KH3GXcOaO2C1mkorUoq4lXR/I4kQ07Mq8y6JoU0a9oJ/N7y6U7SQTb
X-Gm-Gg: AZuq6aK0e+qSDGf+o0tNYOsKx2bJgRW3SWYoSs9vX0AYUOEEaMbQRAz0Fy/21+QDVE9
	WvqJNvnhV8GJ091Ntq+TdP5CMLuKFt6hGi5Kio+jYCZi7xfW0GIno2GWKCh2fuxT6pS4JiTMIbm
	pjskYCGGPBVF6ma//wo/ZY2m2fBM5g00PBiJQ6oDubC2O7y5+bwTDsUW4H1Qu1idutR2TQ8BZ0j
	gt2DX4ri1pfusF4x61uL6mYFPiCc2LdjQiZ7mIRdVfCKgdk0D+39FLSD/s/vyLkUoIpAU1z0O8X
	RpLZe0GzAwlEOuttsjrHKNeRY8QE4Iem+8A+2lgQvBWbVuRdFpfpoxnSkpXkk9PSD/GhywV1maD
	52ba1HH1qBQzjBBfjHxWZQ2KKjFoCypevJWVqteN9oP/u/1c2rW4cSpbL5e31CMpvYNLEJBTvmk
	RFEdx/wKg/hfGtGYYdTmO0SISgqV13oNopRtUvcMiy4gjHmanutC5t0kDyemsJRNNmfIe9wtz1t
	j5X094oMGs=
X-Received: by 2002:a17:902:ced0:b0:2a0:d629:903c with SMTP id d9443c01a7336-2ad74516615mr31607075ad.30.1771691123696;
        Sat, 21 Feb 2026 08:25:23 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75028a63sm25901325ad.68.2026.02.21.08.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 08:25:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <61c69c54-5218-4c53-8bc9-4032d2967571@roeck-us.net>
Date: Sat, 21 Feb 2026 08:25:21 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/REQUEST] Support fan control for MSI Prestige 15 A12UC
 (16S8EMS1.107)
To: Lorenzo Ferranti <lorenzoferranti04@gmail.com>, W_Armin@gmx.de
Cc: linux-hwmon@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <CAK-2s0=4PfPXe5GUKY3NSkKZb6Biax6O5kM5SH4t_YhwzLM9EQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAK-2s0=4PfPXe5GUKY3NSkKZb6Biax6O5kM5SH4t_YhwzLM9EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/21/26 07:36, Lorenzo Ferranti wrote:
> Hello,
> 
> I don't know if this is the proper way of asking for a patch for msi_wmi_platform driver.
> 

That is a platform driver. While it registers a hardware monitoring device,
it is not maintained as hardware monitoring subsystem driver. All requests
should be handled on the platform driver mailing list (copied).

Thanks,
Guenter

> Anyway, I recently switched to linux on my MSI laptop. I noticed that the drivers can correctly get my fans RPM, but cannot set them. For example, in the CoolerController app I get the message "The currently installed driver does not support control of this channel".
> 
> I am using an MSI laptop with:
> 
>   * Model: MSI Prestige 15 A12UC
>   *
> 
>     EC Firmware: 16S8EMS1.107
> 
>   *
> 
>     Kernel: 6.18.7
> 
>   *
> 
>     OS: POP!_os
> 
>   *
> 
>     CPU: 12th Gen Intel Core i7-1280P (same as Big-Nicox)
> 
>   *
> 
>     GPU: NVIDIA GeForce RTX 3050 Laptop
> 
> I tried loading msi_wmi_platform with 'force=true', but this does not enable fan control. I also tried looking at the msi-ec driver, but my firmware version is not supported yet (but I am trying to get it supported).
> 
> I would like to request that this firmware ID be added to the supported list for fan control in msi-wmi-platform. I am happy to test experimental patches or provide further debug data to help map the registers safely for this model. I sent dumps of my EC and ACPI, I hope these will be useful.
> 
> Thank you for your work on this driver!
> 

