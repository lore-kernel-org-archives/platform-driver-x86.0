Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636001836CD
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 May 2024 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716998736; cv=none; b=daeC3i4KLJ/W+sUwTPuvEHIw8h+/8kbp2Vn3YEm9JmTF+IWRSUcB5I4Xq1ucwRFcB6YjyC3CMel2egmCyx5bv7kgAXkyxLVk5abii5HbpVbFCxdW5lMMAyVXg52Ew8P8hnx266LPfcYYY5XaESDGKdeuJElHGhPBv7aV/FfSmpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716998736; c=relaxed/simple;
	bh=5EqQiL0r6nrlB8yB3smf+mNsb51Fy6uJGMh8nFFXn3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBYDEK9p5VZ7elJ8l9vJILTdSemTydViqfQMxz9wILeyhDq9POjeZDGXwKKnbYYsR/HYi+QF1FMnamFH1UJkRVdkCcNqoga7Tl8mPTS6f7MhnL7HYy9IBIcfBdPkKpCC+tzwRJ0jxrbbx5o+nexL9k2KbwxG4esY/bf+IofqVrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zz3xb9b+; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zz3xb9b+"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42121d28664so11240515e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 May 2024 09:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716998733; x=1717603533; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qzg/EUp61JlYQ5Fn3RoqiX5YzTeWEt7sibQ+Ig9ys7c=;
        b=zz3xb9b+8hH7dFFsUJuhdXgxwesTvJgzyqx6yn84U6iWHcaJtdB3WDxuPMZojS5UZO
         upI6/oQMfBEi7R/K/c1eCmsQ29GYcswvzB164F6tTOjbtcCCFSNIkPgOrwciuWn7Ays1
         qRThpvEo6KnTrAlt5Jsz9fm8R94VPwkJNfBr97EypnL6nvKZ63s+wFO2NVsElrZ4qFW6
         Mp+K9Ef28LkRJz1lFoNuWvOvY+7i+TMpfCnIMzQFND0obzGVmpdkKckBRWKgPkcLcfG5
         rAubOIc5FIMv9x6DEVf3AfwE0CptqkAmt2VZmQX32LzPcOxehxko/2srlVTR9iVuXviS
         VDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716998733; x=1717603533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzg/EUp61JlYQ5Fn3RoqiX5YzTeWEt7sibQ+Ig9ys7c=;
        b=vOP/5y1U0IlPAHuuGMLwZrzWmfJN77h/dAqAVlYg6dxExKKDHZMq3kikBJdpSXr92a
         jY6tr3DAjnIx/x+GamNA852nxHHOgaajCjfsPXq1ue06Hkpy/7L22iWMCAFvTGUqbbBa
         1UYnKWU6zjDB1J52M2UrludvNfgyZWvwioGoT1YDaD1LvnZzpZDtIYXfNgNO3lg45/8r
         /+Oc9ALmBkuRwxOsqzFjeLq0JsPf8S4fnvujg4znh8dR3m2FHN4KFeRvXAGPED9idpNp
         Y3mLWGcWrcMSjtMpmKKf0M7oz29K5wshA8E3BNhGu/MSLREVzUGblqO7qtbO8Y80kOo9
         Uc4A==
X-Forwarded-Encrypted: i=1; AJvYcCXIKoa2ybWGeV02rOAVs5y6OgfVJBpc6xctNzxpH3gKKIMgEQjcoZL6xHFxnCgTwSwSWwEJHd0CB9oK1YknniFCCI84VwiE1mFdkuHLMEpXMs2zlQ==
X-Gm-Message-State: AOJu0YzRwbLsx6VQUKBpa9hxQ3/1A2bczrZRFmpE3hzGyt0H/eNmB8nA
	iU2saZUW9Ayp8FIiLpvgawCD4ZmfIJmnZ92+M5rASWONkmkx0vglT05UZpiE2dw=
X-Google-Smtp-Source: AGHT+IFn5yfhHaTTN+Su9cNWOuzz33Y8aCh2kF8VjN3dvPJFe21uC4x828bSQeCJe0tkWLUWOBFKRA==
X-Received: by 2002:a05:600c:3145:b0:419:f9ae:e50 with SMTP id 5b1f17b1804b1-42108a2145bmr119611935e9.37.1716998732678;
        Wed, 29 May 2024 09:05:32 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089ccfacsm181684255e9.45.2024.05.29.09.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 09:05:31 -0700 (PDT)
Message-ID: <6326960a-ba5a-430c-a423-571a0a4a8502@linaro.org>
Date: Wed, 29 May 2024 17:05:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: sdm845: describe connections of
 USB/DP port
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Nikita Travkin <nikita@trvn.ru>
References: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
 <20240528-yoga-ec-driver-v4-5-4fa8dfaae7b6@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240528-yoga-ec-driver-v4-5-4fa8dfaae7b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2024 21:44, Dmitry Baryshkov wrote:
> Describe links between the first USB3 host and the DisplayPort that is
> routed to the same pins.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 53 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 26b1638c76f9..5276ab0433b6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

