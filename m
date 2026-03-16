Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B12396594
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667902; cv=none; b=CuEZFmis1bIEKyfIHJbRuM+7rew348NflOk+qnqKAaAI2kb87/yMsIUcLmgfeqSkQFJmGvHXhBXO5pY5xj0quIpaQ4QTwFDqRcDhONaJ69phvhcryWJHVdkoIP61fN0T8xGqRfCf8F22Kj1F5KEWaaBUz0r+5mN5Z7xd0nHnCVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667902; c=relaxed/simple;
	bh=aJqQvVAQBWgcK77WFtfzdrvxuw8KdvubRhFHqAKTjKU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZrEX15fJsOE68Jsj+hG3pqJVUV3vGoihmjjiCZ0pSBB67kPg6zK2htz+Sg1hJ0CS6Pm5ryE71ASw6EcL6jqpoxbjHt8pxeid+GTYzMC3K/HlPFCIDfC0sgk+BKx5pJkvPcXTqTDOGyso4Aap8GBSUCPx1Ov4ZRHdxmqXIY3Y6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hT2xsFfY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hT2xsFfY"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so9018550a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773667899; x=1774272699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AzHXsmeKQOaISuIJx9Az90TCO71/XOPX65E/uc2ZTBQ=;
        b=hT2xsFfY3JpE1z2IjVXFYF4vMux6kTgpLJj8fVubTIi/233mrpa07a7+mEmqQYsVSj
         yoTSrLDm7EWo1fhU+pwp0DbWrQY7sNPbTBMi+DFazOV58D8aPtHHzSDFQ6NshcU/bOOJ
         juz9rrDOfDz0Zqsp7TGYaie41fnDZIRmRSWVC7v/HH6QmgsAfQKn98vTOAFPXEFfw6kn
         bUZZSJax+7PH9LSFgJnlyLcmro195bkNshFEnXhJ3OlzC7N6JfVOBB1WSQpExbXRfnYD
         hhanmQV9LqR6aaSvHEmlQpVLfS+byw8xeJf+fkjhoYsEYBxUakwHZCouHctGDT9jjkRI
         fFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773667899; x=1774272699;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzHXsmeKQOaISuIJx9Az90TCO71/XOPX65E/uc2ZTBQ=;
        b=WyaHgfDfv1eixpfHSdg948WfUU4wxjicSOu6uCSvAr0y1Aoi36wjlDiPkN/TRts8Mn
         SvJBizbC7LfXbvWgo0u6I/xacpekyrbF8xEk6VhtOntrlmYOviuWkZqyvq7p3eW7iTRH
         waszSJD5U2otCClJVwyzIsb08IsztIUrUHbBrDCagU1Xm0+df/vsj1iAhfx9SXSk94HI
         ZNUVPv6lQtWWxAtHTUW7rAh3wAYNo6dd5n+KsJbuPeg7XfGVIqeZgNyX+a8I4KQTxmVj
         FhxOEZuCkZSG7PMcpBWQLXLYKitUjjyz9p/I/6LWsCDhK2j9/pbds6LeKBgoT+eLaM7Q
         NoeA==
X-Forwarded-Encrypted: i=1; AJvYcCWPF/2AxXDL0SPYhM2ezRJGck0+ddRcVUCLsTsFx1h5H9Zu7lbK3G16YreGiWImfZL34lMiT+qpwf1uEq8rkxLM2qpX@vger.kernel.org
X-Gm-Message-State: AOJu0YywjbVNRBqa3zLw9wqftsoSwzRyr36rc6fHFfM9johrFekjWBUs
	VXOFzoV5g0sZ1diZjELmVjNHD7R4v+mH91pzwWtXtC4igZm0/H62xDc4dHE2GPm1dgI=
X-Gm-Gg: ATEYQzyjKXQKP4w1nblKntt5wAfhzWRDHSS0ul2dPA53CqRdIpTdkMmYpkrUBTzyn3Z
	/37QxdFknXhYcZjyw+MMemv5NRXykrL6alMx31MT/XJhyGcunz1xBTzv+KKT16uyZdU5chA6SG0
	NuaJksDgLw12pT++LkDKpV/LoDgEsyI/LGRcqlSOI/Unzru7ZxAjBnTvz27/HJ6lh3rGWRv7nHm
	iGzD+UDDiC9QuLhUeR53KATpSYp3yOvZcFWdtsij+LA3sAuYtCqqmzAYuPpJpAxagUa2GVEWlO9
	YtvSvdcQirmIH7SBn0MbJf6d5nHgkZ/7We8FN43EvR6SWPd8PC6n2PsR2XQeJW3Mj82rb7/2Boq
	Lko7QYaJwa3B74WLB37JzNJse2FxuucPgLunz0yt4XUOIUXHXXOveqCzYWPs3E/3UUfzusX2V69
	t891jg7glU0HTPR0GPJwYSq7sNAzw67EoNfhyg
X-Received: by 2002:a05:6402:2551:b0:664:3344:f9f6 with SMTP id 4fb4d7f45d1cf-66433450781mr6000166a12.8.1773667898857;
        Mon, 16 Mar 2026 06:31:38 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.226.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6635088ffadsm5183190a12.21.2026.03.16.06.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 06:31:38 -0700 (PDT)
Message-ID: <f5d7a5e5-d21b-4be4-8fb9-25c108c1d805@linaro.org>
Date: Mon, 16 Mar 2026 13:31:36 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add driver for EC found on Qualcomm reference
 devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
 <19e8837b-d711-4d0e-ba9c-e9b2c8330969@oss.qualcomm.com>
 <aabf9bfa-aa90-411c-b9f6-706f963a5ab0@linaro.org>
 <azoaku7s3lxgcccc2rrp2bljbvqeitax2bl47k7eemy6uhcr2g@kveqod2tstgk>
 <ca7d675d-139d-4fbd-b57e-5b233a0e2922@linaro.org>
 <bb38d7b7-859d-423a-9837-1b678975bd06@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <bb38d7b7-859d-423a-9837-1b678975bd06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/03/2026 10:22, Anvesh Jain P wrote:
> We need to keep the driver loaded even if zero fans are reported, as it
> is also responsible for sending suspend/resume notifications to the EC.
> Failing the probe would prevent these PM notifications from reaching the EC.
> 
> Instead, I will add a dev_warn message suggesting a firmware upgrade
> when zero fans are found. Let me know your thoughts.

Sure, say something, it seems very odd to just continue on as if 
everything is grand.

---
bod
