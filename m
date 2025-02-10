Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340A9252906
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Feb 2025 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199023; cv=none; b=oFNFoeeNGlM+BuxhIDFkALS/P3TxaZCL+CdXRZrn92iC/Nh5gKo+ziuz/q0gLhNkd/8c/vtJ3DAo+Urq7io6GgXKAOx4rQkj2f1du4eUuuiUteIko/npiMt+mfuid3P21ONBoiR5axav543S0PTXawYode7yaC3PRsPi+GgqXsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199023; c=relaxed/simple;
	bh=iAwQLDOIv8+9R8kO8fwAJAG9mycJA8DrXUGu7DeZJe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tE1AapobkXrEQvgucv9IrJuH7baisY4110Jo89gw21RIBkrTZ/P1hr/chuc/FFetCgTU0v1xfHHlz6WmmMzSSmclcRzib5+yyy7ovIXSDrM6b+fXy/DfYswKmPjK/XBE+TQXye5kAc5FjyLGF7EOdZ/dY9v/5QDLCFZJzxut9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7KVEXkG; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7KVEXkG"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f0444b478so63403815ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Feb 2025 06:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739199020; x=1739803820; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F6WQ5ygikr4qz5412rdFjWwDTcjtVUuZA/MDE/mxffA=;
        b=C7KVEXkGhV4XSXcjJ+tQCoKjiOEx9NFAfySnwQHuKuKtvTVQ1fDbVqtAy22mQH+CUo
         oBjRGjFE/pJhpKbPCe1VGYYDo8UOvAYs4LP7ox6uNOGglIFi322jYEEKzjRRy6Fw7srP
         iG5zibeLaMCN7NM0etoHSscNxlpzUt6uAt7rpo1Chi2lX5OyYQjURrWr9kCv8OEWCRDz
         Vm4lIiubQCFHAQcYMHCxQakBqWVz6Hb0pTkrtrMIIBAJoTmZHcc9k/3ZyOUR88GmycZt
         nRbWMLKsfsPY9RO7YMQiY4V8XLLalqPFHovZBFmU2m8OOeXJkgFsYboX6y6cROsZnmAk
         2LkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199020; x=1739803820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6WQ5ygikr4qz5412rdFjWwDTcjtVUuZA/MDE/mxffA=;
        b=rHpk3yNM6P0EptKv8XJ+ch1AO6altIGksX0MK3RpfZ6ZRDPkBZUAs1R+MpZ12jMjUX
         2RNqXgZZUkD6RukyiSqUprbbtLM7zIdzpc4mJL4XBI+TrOMh22EqFc98DgYXPxglhAMf
         tY779uzKaGKa7FuEZvaWWrHHXn0lB8E1dKSt0fQBBD0KYnwxH7fZMmSkHw1dGe8UJQ5H
         SpPnC6wuyCAVdZEfhXWWY2KSydT+HeEBHO8VC6yk/Be7b5DFli3GWiFDbLEt4rcxlpMp
         xporsWImznYDxoedEfSdcUXvW8Z0Gbq0iUYft8GqzF9XnrBlLw32QHioEK47bWM91ZN6
         6Gvw==
X-Forwarded-Encrypted: i=1; AJvYcCVh0m1CWlkaHZbcVqDyMpgtVjG/jL4DIhafgB30UHvQRDodGe6uvPXDjd/qikh1wZ7MM7UJL7NvHCUEEHCAC1/s5iEh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79VHPfKS74091uzmTMjqIlZDE0kHbX+PX8gbNu7yxIhb0IZfO
	r8cBAQBx0vCPBVC3B2IkA49QCOKWzPcnA/YQZNtKCf8Pe87bvrNEqlolYw==
X-Gm-Gg: ASbGncvF+wv+XxFG+Sv3QN95H9zX72p3ZquX916Y0aMIISYwNKMQx05RNrCGBO8NcgB
	MS5gdOK+rVuHeVXI2Pl06LdUUan544OFh1G/La91E35KecGqtlCzKwxerWTaG2FFvURlwgcqCg7
	F6Y507iwrBw7illmNZfU8nIf3j1G6Em+T+8JNqF9A4A8ddcfDWZGf4aGlGm60P5ZXULQ+to+p4f
	JZyLiTdHtOQtMM+VS2agc6yuaH4eus/RCZU14AJ8kFM1BlDco5tVQxcV9qfQ/8wFy0yomyUylS4
	qJuiDycyO+PPz4cd/eMebMxaWMlReqN1w6bsmxmz8hjU9aDtF5gAuCt9zZsxI1Za
X-Google-Smtp-Source: AGHT+IHTbWy+sa3la7KpXjJhKhTbcdjHzzvwGzSDGgN695HMc4WrkHzrayxx+FGPQaU6oDRtOI/4yQ==
X-Received: by 2002:a17:902:cf11:b0:21a:7cbe:3a9a with SMTP id d9443c01a7336-21f4e6ba756mr240134145ad.14.1739199020219;
        Mon, 10 Feb 2025 06:50:20 -0800 (PST)
Received: from ?IPV6:2409:40f4:a4:4dc6:236b:72be:5c03:5c13? ([2409:40f4:a4:4dc6:236b:72be:5c03:5c13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d529sm80253225ad.145.2025.02.10.06.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 06:50:19 -0800 (PST)
Message-ID: <5c88b97e-d345-4b0d-9bc2-b8abff3a6513@gmail.com>
Date: Mon, 10 Feb 2025 20:20:08 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need help fixing turbo button and power profiles on Acer Predator
 Helios Neo 16 (PHN16-72)
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
References: <e0f625f4-9c55-4021-ba43-668edb9fe80d@gmail.com>
 <083e0184-19e9-4473-bebf-5536b3d5ec10@gmx.de>
 <4d281c36-4996-4518-9db3-e11780f6fbfe@gmail.com>
 <e430d262-8c1e-4c8f-88eb-98a71117e8bf@gmx.de>
Content-Language: en-US
From: Sourajyoti Basak <basak.sb2006@gmail.com>
In-Reply-To: <e430d262-8c1e-4c8f-88eb-98a71117e8bf@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/25 6:11 pm, Armin Wolf wrote:

> Alright, the values seem useless to me, so we have to try something 
> different.
> 
> Can you dual-boot into Windows? If yes then you can use wmie2 (https:// 
> github.com/vinaypamnani/wmie2) to execute WMI methods.
> 
> I this case i would like you to execute the "GetGamingFanBehavior" 
> method of the "AcerGamingFunction" object located inside the root/WMI 
> namespace.
> This method take a single parameter called "gmInput". Please check what 
> happens if "gmInput" is set to 0, 1, 4, 8 and 16 and share the result of 
> each
> method call.
> 
> Thanks,
> Armin Wolf
> 

Hi Armin,

I ran the `GetGamingFanBehavior` function with the inputs you requested. 
Here are the results:


+-------+--------+
| Input | Output |
+-------+--------+
|     0 |      2 |
|     1 |    256 |
|     4 |   8192 |
|     8 |  16384 |
|    16 |      0 |
+-------+--------+


Best regards,
Sourajyoti Basak
