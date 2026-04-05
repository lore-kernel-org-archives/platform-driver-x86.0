Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D9F6A001
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 00:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775348118; cv=none; b=s4t80sUpJQE0aJ1w7MDbApXmn/L9ta8tOxtmi8Vs9oqUQBP1HW3SeeA2kxW07tQPbm8YB8QOKvd+gCor3SrqnX89EkhLYU5zfhWWPxLroVaZBeYtSi1FlXMd1K8wUEGRlT/UYWKPnQ2VEhTsmYuqcCw4n18OWQr8NlVu1Vh3ywo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775348118; c=relaxed/simple;
	bh=BqF5Ej2M5OJWzngrc4HxVEbLJx8wJq7qVUOlYU9Jnj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuIsTn0WCvtTLFgONrOQl8rQuYxSQtALSvi1gvsPgXhh+s43R7Z8o/VJd70EqcKIMfJvBnd2GvJmjNPZ4CJ134WtBCLpHTdaH/m6safS34F5qLE92I78voFWFcQIkMrBfQy7TjLPsAlgIbZ1bs9WRRYKF2eCcknU0PPY9PSR+Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y3nQGDc5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y3nQGDc5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d03db7f87so1573328f8f.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775348115; x=1775952915; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tyH1td2yG3Lr3A+EaOSUNG+8Njer1sxg1R+RRdpnOs0=;
        b=Y3nQGDc57odxB0UXDTnPxuBw5c65qOfFZHmsm2o3VInrSZxPoBpyKo85iReSCEoioW
         UgyNG0N6ua4jEvRytolbhK70uoiX3L9qk6Tcf2kVAW7+CUsNIlK+mGRD61QkJv1BnUH3
         Ufdmt9u3Bal2/q4UhDKFOUct9+DZr3HlCbwEkMU5C3502b5mAerMwMTbvEZVHn1IRwRU
         wfYBP2akHJ5SzrES8DfkOd8lhOyDyIkGcJjAZJq3Rpnt6umAqJ0dyyIcynJGPHfurhOs
         MlXJAEzea9g7FfENWLb3wkFaOpcITT/ayKo7Jwh9TCVf6CWlLSIrXgyx8VzN391oWT+W
         evmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775348115; x=1775952915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyH1td2yG3Lr3A+EaOSUNG+8Njer1sxg1R+RRdpnOs0=;
        b=LHQc+vsq0sxWLT2MTze01YdIQOoCx0DdCt5OLVo/uI7x/ogeIiodfp9fLVDWvQKHrI
         NpdmyDiSBLRa9z8dPDKwLIe2V+Nt2VLsHi40ncKhTzEBZi4mqzLQN+TVatcAPB8rLiuE
         1R5QiwocEb2xvf+ybWBCB0oszj4N9pqqAdP1sxVhhjIiQBEUHulPsevFvTKm623wyWSF
         7I1wEooKUhNz9t1eTVHjHs2erCFSk9yh8Pue3RESe6kE0qgjjJUAp9dug1LbgMIUXOXU
         HIFmaNPERaTEef20rVcdabJM/PupOFbNgu0hzYdyKoEXpL1Dm9ahiIvkMFuihzK/i+ma
         xvfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6HHICQuE3lWX+dNzElz8OV2t7L8Al33Gty5TCveZIBY4X3ts4ZNwQCgXdkDXYXv41vhK140TP33JA65kQT27ef935@vger.kernel.org
X-Gm-Message-State: AOJu0YzYmbkUMEYKUB4Vcy4sGuVVI3PmPL/0K8tXtPajDGG786/EO/5B
	Uf6YUGOYSOHSH8+eOYLIyRZfOSZTmP7FJjqKSc26db68Pj2x4/VwIlNwHMFmGEFxMTM=
X-Gm-Gg: AeBDiev4NF5XXogtcLDpCjYRi2aHVDuGkBEMZkSBq8Quor1jVds/x+NWIc31hC1O+lx
	kYibwBNDmppe/1d0LM00jjH/tBgvFk+GqgdPKklBM+a58TTLo2sV/LhShDzXvVubG81FOLXYJuU
	7uIXLDYCwSacwZiRqysTccwfr9+1j+mgmPKSUs0fqf3n+zP6mkvNEk2wiDHUKQ2AX1e/vyKgSUT
	TMyB7t2+3cwWN+iq9qgGtwIx7jHholfrwPOtOiiBhPfQZuBecLSAL1J1MFHuebhmFby8ZKmCxaO
	pd6aeamOnMzA9P/d8ki7VviYWo+0B1Sr7ddz5VkD4X/3B3At4BD15tJZZT50xWhSXif2iJs37jp
	k7FsZQJ868Zv9QrCiGRFvT3ERt3LPBOTf4kXiMh3ApJWqEDQpXAjuIc1A8z2gH3CEUg+Mc8Mt2w
	0zJDJUnnJFjEabTZYWkQnyr0lW85HefFsCQp0=
X-Received: by 2002:a5d:5d0f:0:b0:43b:3d54:3154 with SMTP id ffacd0b85a97d-43d29277113mr11674528f8f.7.1775348114416;
        Sat, 04 Apr 2026 17:15:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.125.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a720dsm28453399f8f.4.2026.04.04.17.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:15:13 -0700 (PDT)
Message-ID: <c0cb35d7-3fcf-477a-9268-70f379a76637@linaro.org>
Date: Sun, 5 Apr 2026 01:15:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
To: Aleksandrs Vinarskis <alex@vinarskis.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
> +    items:
> +      - description: ADC channel for sys_therm0
> +      - description: ADC channel for sys_therm1
> +      - description: ADC channel for sys_therm2
> +      - description: ADC channel for sys_therm3
> +      - description: ADC channel for sys_therm4
> +      - description: ADC channel for sys_therm5
> +      - description: ADC channel for sys_therm6
> +
> +  io-channel-names:
> +    items:
> +      - const: sys_therm0
> +      - const: sys_therm1
> +      - const: sys_therm2
> +      - const: sys_therm3
> +      - const: sys_therm4
> +      - const: sys_therm5
> +      - const: sys_therm6

I agree with the number of io-channels but, having fixed names is I feel 
not correct.

io-channel-names:
   minItems: 7
   maxItems: 7

Does the same thing but lets you name the channels at the source and the 
sync wrt what they do.
