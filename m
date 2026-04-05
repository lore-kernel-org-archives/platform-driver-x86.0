Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EA51CAB3
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 00:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775347538; cv=none; b=WH1AlxZ6VOs7/KHMRdsTq+5v2G4Kt1KU6cGBNVUMyr96PVR0io+riFJWjiv3yC8ggGt45GlmeytiZABhDD1HqTIQhApXuKk2TGxH25oM7Zk9Ph0HyLCYoeKqp8AbAkgrhOUCu0xEQj/EueXJW0PEu2sRa/ZEV1GdVPUkC+qFyFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775347538; c=relaxed/simple;
	bh=eD839NDE5H9CmiRueWDchOB7qjzUfCxB7uRTtrbIfqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AenuDmSguVzoM10xF6/GeWg1QSkD/DLYoVwclVUrtxIoJJTQ202MunkLFzWMQp5pJczY56oSzw/PkgeLltK12w4DEb/SlfOoEY6f+5QqRTgbyNaBvP+qh5fUFwiWNCXOVlCi4admls+o+p62BZZbVuif1EKCs19nDkvlXVg42Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSc9op4s; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSc9op4s"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d029f346eso2617142f8f.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 17:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775347535; x=1775952335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F6niN5rHkfj9+STb1B7vVxgC82p/xl+UfQX44Fsubjc=;
        b=KSc9op4syQgcWg5K/WIYliDjKhLBUE1VZfpebjg67BwohCmo8TlFKJ5/o5lnfRg/+9
         MPSfKq707P4/9mVGWAclfd8T523hI9L/E1TzdSFo8ECHak34kXwylZr0kArCWKwoP4Gi
         DDtzXja/n9GRKjg80QGf2G9pZi1BzYzqg0FTUTsMvwBoJWWGFqgvsIK6wB1TfvXWSQAn
         zFRw8XUoDR1zjZATC+piFhooZ+jdCg72Hi1Fn/F1KSaF1MyXT/Dh/o8fPs1bN3Fze9IB
         10DO5cXzBPnLEI9bOFJ6WS0B+KNwUSGKlfXLD3G9D7OgXYm4cf9TDR9C0TfUdzllJz8M
         p5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775347535; x=1775952335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6niN5rHkfj9+STb1B7vVxgC82p/xl+UfQX44Fsubjc=;
        b=lQFZVxl1mfkMAUgnzod6vbQ71UWRrj7wqAfIQ6B7kgNiH8XearkO8ksEqXbm1McGyQ
         ZPcH3v6ceb9EhiuqQ6ZgazaF5ibPT5ZiOyyWKMA3YJymI9cwZXvCZNvXWUKbe6HXtACt
         BCIJhRBkkNemXUsrLhdZza6MqDXEEOdO5I12YZg3YDDjdFO0kJOJsmY1ukANtg/C10Pr
         IKbNMURscewoUbWJzDeoLeV/s894DV/q/TFyZKpg5P9wqka8iEQfyLxPxYs1DtNtL2GX
         SmRq+6H4yFt+Ui2oZpuhFQ/A6ZFt67OcnS5Xu4JZudsUnEMfAJ+d2m5xoncP8S4rHPZP
         oyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3rhR3dGLoK/RrDU/DOH7zvuCMnex0fTUvU2MQd7VDGdpowod1317hgOtDDQKF/g1fbN0GUjo/3C4NHLdJ/MuAn2Jd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Ddy4i6X4jKP4sMLM/6dj0ZciyIpy13K0RAZbbKWhf3zf0cDm
	12+2a8Zg/u6NQsprDfziYsZM0hM1e8xr7h48dfgGqL+QE87gLhzZ78h87pLuJtHyTFw=
X-Gm-Gg: AeBDievSBS5jZfn643aSRrMB8PDX7tU52SR3EzqxOkR3X6LST3TrDEX1x2WpJPfu1Wh
	+xovhZQWDNZPMPVOvX+GoACuUs6E5iaTuyFVycc2QHgoexpDZKfZzbaTGwWxE0wL7E7NK6ZfEls
	YBdCwOclCv+Hs6P4PmT0nSERmaAsYnr2CnpUYL9av8tzefWJtipI6CQJBReUcMHidk+K+jxANOm
	JHyy9Y/SnGIVjTeg3AxfVklW0eJOE+/PP9hudpRjLbtmGCv213SVnUxZGMBS+E0NTCdIzjYh88s
	gwf9IA6kZ3T+cUrc4AeoCG0RIqbAuEfe5UhScWh6crM9Xnvfn8ZzTc8sHK5Qsxy5PtRNaS4R9+O
	8afAslKBotptQLaUWBVR8CS1Zn1a8Z3+Vbo51+tuu8dwclsAgrcVbFocdABB1vbFutc5i5716Wn
	d4oGSVQIfmKKCwz4eSJGxFJOpQTmbGGJtiT8Y=
X-Received: by 2002:a05:6000:2c0c:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-43d2927ffe4mr11556544f8f.6.1775347535109;
        Sat, 04 Apr 2026 17:05:35 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.125.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d27a8sm28693271f8f.17.2026.04.04.17.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:05:34 -0700 (PDT)
Message-ID: <e69ebf4a-126e-48c7-970b-1ba2a40a4492@linaro.org>
Date: Sun, 5 Apr 2026 01:05:33 +0100
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
> Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
> codename 'tributo'). It may be partially or fully compatible with EC
> found in Snapdragon-based Dell Latitude, Inspiron ('thena').
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>   .../embedded-controller/dell,xps13-9345-ec.yaml    | 91 ++++++++++++++++++++++
>   MAINTAINERS                                        |  5 ++
>   2 files changed, 96 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e14dbf2f1a6af8cc7511890fbef08c6c717c0aa6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml

I believe the part name of this embedded controller is the "mec5200" so 
instead of calling it dell,xps13-9345-ec suggest "dell,mec5200"

> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345-ec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dell XPS 13 9345 Embedded Controller
> +
> +maintainers:
> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
> +
> +description:
> +  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles thermal
> +  and power management. It is communicating with SoC over multiple i2c busses.
> +  Among other things, it handles fan speed control, thermal shutdown, peripheral
> +  power supply including trackpad, touch-row, display. For these functions, it
> +  requires frequently updated thermal readings from onboard thermistors.
> +
> +properties:
> +  compatible:
> +    const: dell,xps13-9345-ec

Ditto the compat - name it after the IC not the laptop its a "mec5200" 
or "mec5200-ec" - I suspect the -ec postfix is a tautology the ec bit in 
"mec" probably captures.

> +
> +  reg:
> +    const: 0x3b
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  io-channels:
> +    description:
> +      ADC channels connected to the 7 onboard thermistors on PMK8550.
> +      EC requires frequent thermal readings of these channels to perform
> +      automated fan speed control.
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


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - io-channels
> +  - io-channel-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        embedded-controller@3b {
> +            compatible = "dell,xps13-9345-ec";
> +            reg = <0x3b>;
> +            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
> +
> +            io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> +            io-channel-names = "sys_therm0",
> +                               "sys_therm1",
> +                               "sys_therm2",
> +                               "sys_therm3",
> +                               "sys_therm4",
> +                               "sys_therm5",
> +                               "sys_therm6";
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e0781f2201b41b976dfa69efd44d62c4ff0058..a5d175559f4468dfe363b319a1b08d3425f4d712 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7236,6 +7236,11 @@ S:	Maintained
>   F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
>   F:	drivers/platform/x86/dell/dell-wmi-sysman/
>   
> +DELL XPS EMBEDDED CONTROLLER DRIVER
> +M:	Aleksandrs Vinarskis <alex@vinarskis.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
> +
>   DELTA AHE-50DC FAN CONTROL MODULE DRIVER
>   M:	Zev Weiss <zev@bewilderbeest.net>
>   L:	linux-hwmon@vger.kernel.org
> 

