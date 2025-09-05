Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AF0283FCF
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Sep 2025 09:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064368; cv=none; b=n+Qe5Qx+3VoXhJtP2ahBi3Zx3MEo6dnhVsC5YPsQ0G/A3hV7SYMDmtEb87XqJIw4/2KW44HPdwnqNSE3XA7N041TEQcHJN8ACsJliY4v8VafBgV03oFCV3JfICqJ5W3fglPq+C+wZIVS3I9Ss2bkkx8sQH2XwRc+y6eEtJWGk10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064368; c=relaxed/simple;
	bh=MEed7gqF7d7fWHQmdGpJUnqCT33bvVFLPAKdB2LPFeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyhmAGmQ/UMCvB0d1AyyIhDZPSDVdPn5SUHyd2PEfl5UcTOeyOEQnQd+CuBXveW2Re5Gw9e7Gpq7fI7NqBXgeW6RYkTBtOWee3Z4hjtMbFJ95B1rgXDm33pdeRlIhsdBDabJEPVxblYKhr6ZWoBoS6UGr9pZlgn1j/bQPaXcNaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gzn44bLQ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gzn44bLQ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so1902842f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Sep 2025 02:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757064365; x=1757669165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1b4J3UsQ3netqUZNC1BP1Y1aZDxDf+RWzn/Hk/C+pw=;
        b=gzn44bLQ32e7vf/erJdOQL/HLt+H0ABMbNBR0cQCSoh2+fCHO7dLmR18g63WBd4/Kv
         Cd3NOlBrGTir3N84gGgjgivjqYmQIB9JUs+PzVYQfqABxlMIhl829WPgosviGZ1tnrwG
         X8u8P+f7fsmjDqcB6Bs2MxyftD/9GrOTGk1LH2ZHcr8m8pmnhpIeEK6ORlWEP+G4nJ25
         T2N2reD+fpEDXJhZiV+b9zj8IBo24bpwAvCh/X2iMCMJltDr2XQtOAAk4LzSLbKpNDkc
         8Xjx2dE7FQDp6OKwALpdsG509oXgl1cWVzHzENuhCcyfZ8BHHSyh58E6KTrBV/jSNOGP
         ABeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064365; x=1757669165;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1b4J3UsQ3netqUZNC1BP1Y1aZDxDf+RWzn/Hk/C+pw=;
        b=VJceK1MYYeXjmvq+VOrNwXCqkfFAqMvvctP2KqhU8ILEDMZsXrTQnZj+CPERFVyR7p
         RJ8BJ2g29MMn5VSPB8quSfTzk6SBtnRQSjCNrQBMYW5dBvTCeqMhhWSDviNkzDDYZw4U
         HOPfYjR3N2XpAkoJAYxzfL9tu6Y0Nfxp8mUZRtkCpRB6LWguLfLyVnw4GXl7ioKZJoQa
         Ia1B2ycF1WZoGGLkHOvJimCa1/U6admuNXTOGYxmPcO8C83/aWfVzDXz/ktDoCuBCcZd
         IGUhiSq4ZT6Nx2Wj+3ZOvMF8+7q4mNfYyo/M8Nb7YkQK97iCvPqiKzlhPpyLTzAgx5cU
         yLqA==
X-Forwarded-Encrypted: i=1; AJvYcCWWqFuwTGbx77uD9nfBiaGt8gnJiTDiIcRe9pCmIVrloRt4RyhKK8COMTeGPST4oxPvYpMlsE17aFVqPPz9Kgkh6jDH@vger.kernel.org
X-Gm-Message-State: AOJu0YyEg2Bz+eQUs03A/mLfQejz9oU28dpq6fjSJf/EmHS7FSTuag1M
	miyYDmdu9p5jDqY0I7cIgsOlxpPhFZziopu3vKX9YX1P46qN/4HQhUrOFat37Fg7LGw=
X-Gm-Gg: ASbGncvrT6lz2gzQhJsbvomjzIHOc2DOt7w3RVwkv7/IkVNdtPNHlfWnig9PtHu0ZNx
	naJTQB7DRtk4i5MnNXXTPq/iOIISglD2bLVlGO3NDr1fMzVCkMrIsx1mEEQtMv5us21//ty526a
	dfHUteSS/gqJkxQouqT4h3OoU3aiDWzIkMwB8tDYQnbWtIB0KDGNJW6MmySsY7EUC2z1wn09PQH
	1c46WnfdjP1sVFrXi0ctEoy1McpEKSe/df2lnGqzKiqgrLC5jugqv0A4vZBRkBkWDrozTdTiki3
	WHQD2d+M5O3c4dw2hQ0IzNu04FqQuxhlNALWTxcCWPYqs1ZU5ruzA3q4qNUajE8jjNfDx3tLlQu
	xC5ZGJi5JAXbn5URg8wD97uyB4tw72eY6YuraD5EcX+Ym2I+tAAbpkos2Oy5CcEXsRTalU0ut0R
	vmzl7t8bc04sWyunWHZjeCC3PJ1M47FA==
X-Google-Smtp-Source: AGHT+IHf2bP4rvj7gdEbkjOaPluyqyvNYQTBLFp/W2bKEoetxcByY2bWU0nZ7KXQEoy+tTKeNkxMLQ==
X-Received: by 2002:a05:6000:22c4:b0:3ce:7673:bb30 with SMTP id ffacd0b85a97d-3e3048266c8mr2128415f8f.14.1757064364653;
        Fri, 05 Sep 2025 02:26:04 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b940bbc0dsm167696195e9.2.2025.09.05.02.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 02:26:03 -0700 (PDT)
Message-ID: <df705089-0554-4044-87c8-d2bd16da3ee8@linaro.org>
Date: Fri, 5 Sep 2025 10:26:00 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-t14s: add EC
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
 <20250905-thinkpad-t14s-ec-v2-3-7da5d70aa423@collabora.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250905-thinkpad-t14s-ec-v2-3-7da5d70aa423@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2025 02:09, Sebastian Reichel wrote:
> Describe ThinkPad Embedded Controller in the T14s device tree,
> which adds LED and special key support.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..f70489aba870289edbcf84ec22fdb004e010868b 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -887,6 +887,24 @@ eusb6_repeater: redriver@4f {
>   	};
>   };
>   
> +&i2c6 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@28 {
> +		compatible = "lenovo,thinkpad-t14s-ec";
> +		reg = <0x28>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> +
>   &i2c7 {
>   	clock-frequency = <400000>;
>   
> @@ -1267,6 +1285,12 @@ &tlmm {
>   			       <72 2>, /* Secure EC I2C connection (?) */
>   			       <238 1>; /* UFS Reset */
>   
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>   	eusb3_reset_n: eusb3-reset-n-state {
>   		pins = "gpio6";
>   		function = "gpio";
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
