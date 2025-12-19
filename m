Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A1E33E37D
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766172427; cv=none; b=BTQ2NyafKrub9RTPW7qR5NFg2MSy0KY4S/Kchtc3AeuPLypBe4KvqkqqTOo8rDDDbyqGrF56IUIOKKZR+F371N3JJzrcgDabfkuWoR+vsJUurBVbl28EsijeCYjkibn382aXrGkVpRwNjJNltpXCq6XI2LjXKA/fMwhauNI9cbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766172427; c=relaxed/simple;
	bh=k8mZy/7yVU2Ufqg1SNQ09M+d2/3IpCiWvdHzzLcqN/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+NxROo+J1EHwt0k/GxNeU4DMbU6Fjj7uj/06pTz4DAz8LhbgBHAAP/Kqw0JEsVc7Adqb1AKkk49aF5ajnsFxTIT1m+Y5OwzAWgrZOL4OkoKmjqj3JbU2DHiBMRg6kkBTzCi11UU7uxHXlbxFvUV9WKqwPtvRiiBxtikO/a8+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgqvxHys; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgqvxHys"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47774d3536dso17822315e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Dec 2025 11:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766172424; x=1766777224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kxkkJnPi9GBxxRfQSUamkMaS41d/etdoL+kweUhQKE=;
        b=dgqvxHyscE8x5odAA7E78z5K7MNsroQg+/L9I/uZ9yWC24/bjxq70etDClDf4FCLk0
         qqmhy6JyjnLKZIijjALs5CzjUtBa+pLkMJQMsYNfThiW62tD5qNoA5Teikg+IJxRPqbC
         jnrKPFHjSq5LC/ybxe2LpyzD5y0RCfyN4I5OimlmV1CI8SGKDjW9qCf3yMjbngP1mQPV
         DeAt3Lr0DPx0FVjBkFX33r38fLqrVCAqyTzKXp9TN5bs/Pg84iKaqrvJ3yY7oi5vBbZL
         tHX9lXv9XBFe+ycMNpP4oBPbjRB/cW7pqxKnFRyunBYAcGcNZnL5W1FocrqVwvbkdfd7
         uHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766172424; x=1766777224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kxkkJnPi9GBxxRfQSUamkMaS41d/etdoL+kweUhQKE=;
        b=PXsGOfzxjfKEc5lJWJVKzpheDsuOJ4p0J2ezYIg+KRWs/019tbuuGMvYdipmsaArLf
         9l6DqP8x5BN0/qYkGLNFE6VmmWqr7vRKBXqZJHDD3p16Gb/biOVRkP5w9KvHZmUGTCyu
         UuRmT92ftt1MrAoRZEY7IWq96cZG614zPYLXoY2I9DWvDoywBnuSMQuH+7/t+i5PitYC
         vBA8QN/l6Juo2lyWmPyn8FzqDpA6WmmCbrAxIXA1pzYwoimvkE2v+UAJgNxB7rzDlGGd
         5w3yzA3FshQMDpTokWX710ZKRkwkUtsykIiQSfbmf1DFqpTkrc/6Aa2x2/JVfMFmzxVN
         dZZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4aY9O0YbJrkQfQrSi1z17ovMuCs2Z4pMEB9SQMEymCqg1XLs/0IrY6RfV5HkuRyJdHhbKoQcX3pWg0ck0loSUz+27@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXGIK06Xke1UZCAtawd/sIKIvYJDCaHTAJqPsWPczNT+pnRK7
	ra50VFplppZouGgnlMCcdJpAo37Swr5ONtPYXX4Mx5IMz23LbMy0NhcQ
X-Gm-Gg: AY/fxX5puAaUQReR1HhkzJEtlKaY2ok5XBXILLJ+cNFyjsyYL3ox90hrhOKWlCC3VUd
	AJN9BMc3sDrU4XEZuahVZsZKTWtnhVX3Ea9DSR3tj4VGuZ74ePgWWMRMwhhk3oeLK3TpRzAIzPq
	sIQMNk6IFcYrTY2bpTUzDLx9kQVCmjujnyIFq0YFM+TrssqLADfcian/jnifzG1T4fg5/Ps5pNw
	Mmg8CdAM7PmQTFCZecnUyHkEwpvDvImTzVwEU7L56bZHNEqJwxxYDFXRng4ITOQFS2/XZkcOvR6
	iYe6v0hIq4gjzt6IpMJoQbjS/pRjJBYfLL9oyTzDxsC218U4iuEXn1EZuth8GBr77VMLzBrpQPe
	mjJGRZpoUxmW2EbeFh2opYe7yHmCeGzyiQQl2Paufed2BjCd/lOgCd8Km0bYeNCHN9x37SmpHv8
	Q8rCFx1AvEGAJaF/Hirqn2tVknEJ97LBbxU0rbkNU1HtzIiCiYZa1ucrJekYepZwkgXi4Po/K+u
	2eTPH/E
X-Google-Smtp-Source: AGHT+IHqqrUl2vSl0/wNfOnsIYZIIhJ1dpHJbH2MQVzIZ0EaTbpy5rMArQU7ewGjw++aIHXKYVdtyg==
X-Received: by 2002:a05:600c:4f08:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-47d18b83218mr39401345e9.1.1766172423809;
        Fri, 19 Dec 2025 11:27:03 -0800 (PST)
Received: from [192.168.1.10] (92.40.201.212.threembb.co.uk. [92.40.201.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193e329asm57197755e9.15.2025.12.19.11.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 11:27:03 -0800 (PST)
Message-ID: <d4a87f75-92a3-4c09-9f9c-e906f0b7ae70@gmail.com>
Date: Fri, 19 Dec 2025 19:27:01 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: Krzysztof Kozlowski <krzk@kernel.org>, jerome.debretagne@gmail.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-5-7bcf83c1504a@gmail.com>
 <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
Content-Language: en-GB
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2025 17:47, Krzysztof Kozlowski wrote:
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> How exactly is this copyrighted by Qualcomm? I don't think Qualcomm ever
> prepared DTS for this, so can you point us to the original work?

As mentioned in the commit message, this device is very similar to 
Microsoft Romulus (Surface Laptop 7).

Its associated device tree (x1e80100-microsoft-romulus.dtsi) was used as 
a starting point for SP11, and so I felt it would be courteous to keep 
the original copyright notice there.

If this isn't appropriate, then that's fair enough and we can remove it.

-- 
Best regards,
Dale
