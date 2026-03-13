Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEF12FD1B3
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 12:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404327; cv=none; b=NMJDY5xtl/LRFvCFswZnSfgZfq1O0VGrnucEAe1QYtLQgzl+jqiB0yQVQCQGtAcKb+qF6epTTr7Fp6rNuQM+qAR9t7fwCv/+kkaMRvsrHNP27mk2puXXWp07Yz9SGNWF8NrkkUUM41lr7S8QzfATTu0pLVO6rOW/9TWXxkNNWQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404327; c=relaxed/simple;
	bh=V+lC6EjJY4lOyB1rR22LNtAT1Vlotp4LU45DmHO/UY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOq19vr1/FYYYqSmhGEgui8K7ZfkmHhHpP1efppNa2lpMi1lsJSUudcsod2sSRMzj7HU3gBF4bF6g0r2r+GjxI8gx1tMOsFH9EmTv1AeC45/jW7yHc0J+WFzt0Rziv36gBz58gJIchqxNH43e1Ygwqa2rR6Kmcsq4fsCJqLrnC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMR8E5Hy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMR8E5Hy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439ac15f35fso1883013f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 05:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773404324; x=1774009124; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4vDJxFgdwUwROzjUq7xJrFddmidfBuen5YK8xbhB4mk=;
        b=GMR8E5HyNWdXKxTRba2IiHoZhNE+5btYwPZDw0/cTqNmOTfNzBOpLA2F8LesAOXF+5
         vRUgrKWQXowArBxEWDPyzs6P6Ivyqv1X7sPh31HDl7TIZuBJW1uOiesfnrEKPmm2lrl5
         l+QR4YDjF/fSjqlzI2XCeEXkerfiEp9FQ5jJqj0DONkYgAxdRNE7Gc9RtBXH8hNnprKz
         l3ZJYfSBAU1iscXZ0tYZmKF5Sw/Z7E3+U5fD7qTecGk7hO86iXmp7ve90H7Epq4t4wkw
         ntiR55WsLNGl5LPMJA13FyCl1SpzhEkV7yNQBA0MFtPEVirejGA0DdnYPy7iccTYX2p5
         OJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773404324; x=1774009124;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4vDJxFgdwUwROzjUq7xJrFddmidfBuen5YK8xbhB4mk=;
        b=RP3ZZyPfBpUQ1G60a+ZAVdKzj+QXpp2aPDszsGnZVd0y/g+9S4+GxGjPag/SJuxwEN
         98V6RYuwN+zG3iJLmIMOvMbOL0phJsdxlxGKLw9i4Gt1Zrmc/AxtdINjKGkDbXBpE7e2
         xaX2l9FuMnwZYbxRr7/QLVuUyMkwyEn8oGAYqFyNzqCsB+fFyVv7PBRcaFa6uZ8qU2bg
         7PLIIukgDV6A4+CSMqqHwOaIWMzpcS3e2W4J10D/UWFHFzu3Hk6RVIt+X0RC6yFJwarG
         0QMs5GpfcTit3Tt8NMbN1xYonz1NHVjP5vws6YTpsWT7a8JsK67ttIVmjC8ElDOIxtLO
         9Ayw==
X-Forwarded-Encrypted: i=1; AJvYcCXK+QXu2+zgO4puCvfuVnPeoDGDSGEXbJ5QWNktU32dzrW56C8TnYXpJgRDmNzF+DF6vx8biiTHw+G8EufMEQeadCvw@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7pi+aGbdns0xHALHTt/YiV97006rfKJEL1h0EA4RPdTi4NzU
	JsyGGwLHP7vADSLjRv7BRw8A2TUIkDXY0Qe3JI3vOelfYnb04rOc2VLxUKyvmGM7qGE=
X-Gm-Gg: ATEYQzyt8rVppvHORPUU0FgcXm4Lm2FwMcI2vEvYxTCQdzHch+e6ZQTqP8lFRFQNLqw
	H0nSmnH8Sv07vFzF7HzC8VB03shbEX855ComG8l6x8D7NziOHN8hNEW0kC8uvukw0o+ljUumgJJ
	0VcOMkaKRNuhTpVw1Mhq/mI1J5bPMyFxOOBbYT8dN6HTcb44AtLl0zxJbdnOISABJVHESxDbBDD
	nSSOdIo44QNS+wWGGR0/guaQRVl5bT8VfdVpT8y2mljLfPK8WTPV1wuNEUWEkrcuaGZAv6fdLQc
	QQ1/1VQXznsYnV6L3sFv+0wnUP1wfswK6TrdYP6oTXJR13sGfScr3DNL5eoBgvzr7X8OePnzrF3
	JhlsmmFhwLKLCijXuXDMoAOhQf60AyH2hPdTQ1IAQAbk0PS4oIqHRxXzxepyV4/hpZGYGRVtgUG
	6PPe9CcfNOMhXnQUf/XeacaUMPHx6Oc15kH+c=
X-Received: by 2002:a5d:64e7:0:b0:439:b59e:5e6a with SMTP id ffacd0b85a97d-43a04d816cemr6178617f8f.14.1773404324041;
        Fri, 13 Mar 2026 05:18:44 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.176.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19ac5fsm17764848f8f.1.2026.03.13.05.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:18:43 -0700 (PDT)
Message-ID: <132116be-2964-4b98-be2b-1baae5bfb58e@linaro.org>
Date: Fri, 13 Mar 2026 12:18:47 +0000
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
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/03/2026 10:29, Anvesh Jain P wrote:
> From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the EC.
> 
> ---
> Changes in v4:
>    - Fix fan count calculation to use min() instead of max() to correctly
>      cap fan_cnt at EC_MAX_FAN_CNT.
>    - Remove unnecessary mutex lock/unlock.
>    - Disable fan debug mode on ec module removal.
>    - Fix issue reported by kernel test robot.
>    - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
>    - Add board-specific compatible strings as per review comments.
>    - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/
> 
> Changes in v3:
>    - Revamp the bindings and driver to support generic ec specification
>      that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
>    - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
>    - Add ec node to Glymur CRDs.
>    - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
>    - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/
> 
> ---
> Maya Matuszczyk (1):
>        dt-bindings: embedded-controller: Add EC bindings for Qualcomm reference devices
> 
> Sibi Sankar (4):
>        platform: arm64: Add driver for EC found on Qualcomm reference devices
>        arm64: dts: qcom: glymur-crd: Add Embedded controller node
>        arm64: dts: qcom: x1-crd: Add Embedded controller node
>        arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node
> 
>   .../embedded-controller/qcom,hamoa-ec.yaml         |  56 +++
>   MAINTAINERS                                        |   8 +
>   arch/arm64/boot/dts/qcom/glymur-crd.dts            |  22 +
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
>   arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
>   drivers/platform/arm64/Kconfig                     |  12 +
>   drivers/platform/arm64/Makefile                    |   1 +
>   drivers/platform/arm64/qcom-hamoa-ec.c             | 468 +++++++++++++++++++++
>   8 files changed, 599 insertions(+)
> ---
> base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
> change-id: 20260309-v04-add-driver-for-ec-3fa478f264d9
> 
> Best regards,


echo 'file qcom-hamoa-ec.c +p' > /sys/kernel/debug/dynamic_debug/control
echo 6-0076 > /sys/bus/i2c/drivers/qcom-hamoa-ec/unbind
echo 6-0076 > /sys/bus/i2c/drivers/qcom-hamoa-ec/bind
dmesg | tail -n 15

[   27.301126] qcom-hamoa-ec 6-0076: EC Version 0.35.0
[   27.311768] qcom-hamoa-ec 6-0076: Fan count: 0 Fan Type: 0 Thermistor 
Mask: 0

?

---
bod
