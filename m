Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCD630E85B
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775463359; cv=none; b=DvW4NoJ1rp+0McQ+pc++NhNAsAeJVgVLymhS7Gd3/chNMTF3sAeuKdqGqmXSloqMSFIqgDZ9bdZ6QM3fpIdsLfaqRJfp6hX/BNLZWIru2xt0Oiycy3GBB+ph+vxeoy4hKJPdp/stPOtpTonxrTbuuBwaTAAMLTkH/O625EOFf8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775463359; c=relaxed/simple;
	bh=BXSCMDcWSCT1X/PPmkFaDuuMIcNq+ICC4sZrvIHudAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAKzshGIg7hhQQEjCPSJ1R6/faQhW452jJVIWOPjiL9U4YmiaxP3IaqHMpngioo47F7HYKF1eH1tmrP6DRxSubMoVXlhvXXlB23HAA7f5x2s05I8jakfm9gbNNF/fCq3DZhYNNqG42hSbn9sQ8xgoUB26RSYsbCvyrO6EQj1AC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2ea06Yy; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2ea06Yy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9b1df1a6b3so452628166b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775463356; x=1776068156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jZf5cnrrkq8dx84bXNNVnhn1yv8NNVpaiRpnVq4qxg=;
        b=S2ea06Yy4PC/Kxv6wqGbCms7lGd+1VzdgRRiIPgg8O/MvojuCMKJ80prqtyvsen0D8
         aNhmboBi7cgMJHmKl5JPdDaDzFgw6f8i0N5CjG4970Eiw8P+azmUeCpK3wbUwNf7FD/y
         /0Zt1cAdXPSWYPF6P2CnP0K3CcDrD8M4H4QRJDyYxfqvBbXy3HnUSP6YZWmtG2oz3ikF
         AsncQvbrc90d8qg2PA4Z9zptxtkOMoxO8hJXTT9XS/o5sfxsQcqf1nMvPWFGQNzBZsLF
         TQnPEmTLmqhymCF4k9C1Y5tyaoWeLptqU6KJ796FZZc1dUldz9JXmOOi0OxUBOs8cIbw
         8oOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775463356; x=1776068156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jZf5cnrrkq8dx84bXNNVnhn1yv8NNVpaiRpnVq4qxg=;
        b=Wqv5t2fJo6zXGnbc7iXmdel95Czp7yjw1r6XlKsZKJDZiVTCPlDTUMgplR7aGAW/4T
         /UlQZtwkX5OwV7NZjmAWXgow6HlIAODdsuUvLZepP7lxnIJ2ANhSvAI8gNyYsf5nC/1J
         td9rppkI0RVsYtjpByr7oJg3t7yHvaD9aZ6Z+eZI5vmMaSzPnIN3R05ei/vPgx6xaO6g
         TOf++MANL5ZRwivuDfXkK9vKK8GXtyGFFMQBotNM6J1bG4+czlsgX9vuTHiX8j8ixaUD
         aK6VvVHoRvn8pfumlz0MS6n4Ke3tz0cU5TvoPCmKthO2c4HzmRvpk5s2bIJ4CWIRD5ZQ
         Gl/g==
X-Forwarded-Encrypted: i=1; AJvYcCWbqoJVD0b3r1sU2onuWvrr1hLKY5KfpGZYELQ3T2H+02mbRMSb9r9wIlzeAi4HBvVHCtxCUnpai6jrXOG2jkYgU+hA@vger.kernel.org
X-Gm-Message-State: AOJu0Yymk9EEbr8+D0MchmRZobHtY9R5WCMxEv0DE9GbWSOQD0Sruo42
	YxCPj8JnyvkgZLmRgx6uc4F9Lun6BdaFM3rzdIjzmzZddSmxV70IzdkMG0Nl9PoZfMGVxq9y04g
	vVaAjuD8=
X-Gm-Gg: AeBDiescJBWjy4GqQuCn3eFcV9SKchC5GHx7wnzF0b8WvEMeNWjsXPfIBm1Tah/YiOA
	c3qWI1II05eOS1leo5+KUw3c5oP4QGJp+EUrudwDKXx9YVNYhpkqEhGqr6OQ9Z/6ik82WikZ4Hf
	v4L4GeO80Z58gIBAPtrlj+tEnIhgeyQ2ocrs7yDQpv+jkdQXGuChGkuU0WoGwGdnrItlFE9n6ea
	4E4OQ74XgeXSgTmS7pa1Hkj5UfCAFT9xlLJLfbG6ziF+XymN7T3iOmnI7niooUe3DnU6+aq1qrf
	S4RqJa2TzalOXQm+WoQWUtEdFU8fQ0owym8ANWIKAUdTTcT4GRFHRhHq2aZHHbIKmTGrjJ86mqt
	OZJjcDOVbfFFd1Zb2VmpxxQslYPwArKy6lLKG8GIZ/CyF0lERMo7+C0qEvnNMdhUHFjfqz/NvY0
	8IZrLK9Y7zDLV71ByPdmiJnQuk9FuKSDLNYtXdIIXY9I2xpdgksFtmng2wuDg897zKN6QNlWwfA
	fYaVW81xILexSfj95l4tOtbO3HqwXawS8cZhlYZjeRRDPGiqmAsa7fxlQVwTeJPmWgDQ4lh1vv/
	mMxBqqBZsbnrLw==
X-Received: by 2002:a17:906:2092:b0:b9b:1b9f:8397 with SMTP id a640c23a62f3a-b9c67b4d146mr344896366b.31.1775463355810;
        Mon, 06 Apr 2026 01:15:55 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d36f16sm3491001a12.3.2026.04.06.01.15.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 01:15:54 -0700 (PDT)
Message-ID: <4bef096a-9f0d-4609-a74c-088caf8fba1e@linaro.org>
Date: Mon, 6 Apr 2026 09:15:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: platform: introduce EC for Dell XPS
 13 9345
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-1-c977c3caa81f@vinarskis.com>
 <e69ebf4a-126e-48c7-970b-1ba2a40a4492@linaro.org>
 <21_zFoUYN_HKM8GMSFC7b0uIgOQevyqpWbjtIX1vVP7YtK9tlMgqC3XRgwo35ANlvZ1veGNShZuQFHkKWcf3B_qhjhD90FS7kvR3qCpKzIY=@vinarskis.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <21_zFoUYN_HKM8GMSFC7b0uIgOQevyqpWbjtIX1vVP7YtK9tlMgqC3XRgwo35ANlvZ1veGNShZuQFHkKWcf3B_qhjhD90FS7kvR3qCpKzIY=@vinarskis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2026 21:50, Aleksandrs Vinarskis wrote:
> On Sunday, April 5th, 2026 at 02:05, Bryan O'Donoghue <bryan.odonoghue@linaro.org> wrote:
> 
>> On 04/04/2026 13:55, Aleksandrs Vinarskis wrote:
>>> Add bindings for Embedded Controller (EC) in Dell XPS 13 9345 (platform
>>> codename 'tributo'). It may be partially or fully compatible with EC
>>> found in Snapdragon-based Dell Latitude, Inspiron ('thena').
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
>>> ---
>>>    .../embedded-controller/dell,xps13-9345-ec.yaml    | 91 ++++++++++++++++++++++
>>>    MAINTAINERS                                        |  5 ++
>>>    2 files changed, 96 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..e14dbf2f1a6af8cc7511890fbef08c6c717c0aa6
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
>>
>> I believe the part name of this embedded controller is the "mec5200" so
>> instead of calling it dell,xps13-9345-ec suggest "dell,mec5200"
> 
> Correct, its Microchip MEC5200. I remember reading some series discussion
> about not naming driver after IC its based on, but rather platform its
> used for since driver depends on firmware which is platform specific...
> cannot find that discussion now.
> 
>>
>>> @@ -0,0 +1,91 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/embedded-controller/dell,xps13-9345-ec.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Dell XPS 13 9345 Embedded Controller
>>> +
>>> +maintainers:
>>> +  - Aleksandrs Vinarskis <alex@vinarskis.com>
>>> +
>>> +description:
>>> +  The Dell XPS 13 9345 has an Embedded Controller (EC) which handles thermal
>>> +  and power management. It is communicating with SoC over multiple i2c busses.
>>> +  Among other things, it handles fan speed control, thermal shutdown, peripheral
>>> +  power supply including trackpad, touch-row, display. For these functions, it
>>> +  requires frequently updated thermal readings from onboard thermistors.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: dell,xps13-9345-ec
>>
>> Ditto the compat - name it after the IC not the laptop its a "mec5200"
>> or "mec5200-ec" - I suspect the -ec postfix is a tautology the ec bit in
>> "mec" probably captures.
> 
> I'm not sure I agree regarding the compatible, its supposed to be as exact as
> possible. "dell,mec5200" will not allow us to differentiate between EC drivers
> of "tributo" and "thena" for example.
> 
> Suggestion:
> - Schema filename to be generalized "dell,mec5200-ec.yaml"
> - Driver filename to be generalized "dell-mec5200-ec.c"
> - Config to be generalized "EC_DELL_MEC5200"
> - Compatible to stay specific "dell,xps13-9345-ec", with fallback to
>    "dell,mec5200-ec".
> 
> I would also keep "-ec" to stay consistent with naming convention of
> existing drivers and bindings.
> 
> Let me know if this would work for you.
> 
> Alex

To me including the laptop model in the IC name, when our best 
information is that this same chip is used on both Thena variants isn't 
very logical.

The thing is the IC not the platform it resides on.

But if you think the firmware is specific to each platform - something 
like dell-mec5200-ec, dell,mec5200-xps13-9345-ec makes sense to me.

> 
>>
>>> +
>>> +  reg:
>>> +    const: 0x3b
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  io-channels:
>>> +    description:
>>> +      ADC channels connected to the 7 onboard thermistors on PMK8550.
>>> +      EC requires frequent thermal readings of these channels to perform
>>> +      automated fan speed control.
>>> +    items:
>>> +      - description: ADC channel for sys_therm0
>>> +      - description: ADC channel for sys_therm1
>>> +      - description: ADC channel for sys_therm2
>>> +      - description: ADC channel for sys_therm3
>>> +      - description: ADC channel for sys_therm4
>>> +      - description: ADC channel for sys_therm5
>>> +      - description: ADC channel for sys_therm6
>>> +
>>> +  io-channel-names:
>>> +    items:
>>> +      - const: sys_therm0
>>> +      - const: sys_therm1
>>> +      - const: sys_therm2
>>> +      - const: sys_therm3
>>> +      - const: sys_therm4
>>> +      - const: sys_therm5
>>> +      - const: sys_therm6
>>
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - io-channels
>>> +  - io-channel-names
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        embedded-controller@3b {
>>> +            compatible = "dell,xps13-9345-ec";
>>> +            reg = <0x3b>;
>>> +            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
>>> +
>>> +            io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
>>> +                          <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
>>> +            io-channel-names = "sys_therm0",
>>> +                               "sys_therm1",
>>> +                               "sys_therm2",
>>> +                               "sys_therm3",
>>> +                               "sys_therm4",
>>> +                               "sys_therm5",
>>> +                               "sys_therm6";
>>> +        };
>>> +    };
>>> +...
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 96e0781f2201b41b976dfa69efd44d62c4ff0058..a5d175559f4468dfe363b319a1b08d3425f4d712 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -7236,6 +7236,11 @@ S:	Maintained
>>>    F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
>>>    F:	drivers/platform/x86/dell/dell-wmi-sysman/
>>>
>>> +DELL XPS EMBEDDED CONTROLLER DRIVER
>>> +M:	Aleksandrs Vinarskis <alex@vinarskis.com>
>>> +S:	Maintained
>>> +F:	Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec.yaml
>>> +
>>>    DELTA AHE-50DC FAN CONTROL MODULE DRIVER
>>>    M:	Zev Weiss <zev@bewilderbeest.net>
>>>    L:	linux-hwmon@vger.kernel.org
>>>
>>
>>

