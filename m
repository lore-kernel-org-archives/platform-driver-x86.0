Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E07E2FB626
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Sep 2025 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717441; cv=none; b=SDnSE23Gbgi26xAY2gNQe5QBdopQ/CwvlMTIukmgCL+jshfSRC+BMjTCJt2DjMm/OPkqA6FNghMYQ+EaxLPscbqSkGIn+IZB5RFq3OUXqbaUFQvtmaNtCJC/nFrlSeC8AiGif6CHRBqo3XpUkmu3qZfqsU0aepKwnBVYBluSNYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717441; c=relaxed/simple;
	bh=BRVffIraDrTcVxvFJdlUUUnJJYHLdGtchn0lCofCxlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfkrq/i0gIjtH/SU3rOsP1ZDSovdpQlsX4gR8WHUt+EnyWTEmfIi8l0SD9f48mtJ3nf/JmbFLqdhSjWh2nuXRXvdvtSOqYJN1el1frKVIt8b+6nrd6FrFF7vZQdjoI/XUfDjq3hskt57MHQKJ0WI3pyISG6Wx3BjqwGq8xqUWKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLsPWZpO; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLsPWZpO"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso10438835e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Sep 2025 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756717437; x=1757322237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLxQeBkb7pg30Hm1b4BwH3XF1UA4XXnA9/e/abfa5DU=;
        b=uLsPWZpO019pbS6/8j8oIeTYmgvvc0Ex3Jaa+l0/de6ZS0cox4UQD8OmLDE9g4lidC
         VdVG/JIYaHK8wonXs2kyiOId1/FJRwxzbS9SPmNKlWxdx28wcFexYlFalBwiCGVSa1Fv
         qv4ggfNjlB7jWQNTz2rBnAmEvuAE86tioWV1tnb3yqAmmWDxvrZDlu9em/6bEZSJBoEZ
         a2weE2PMsHZyhb1/uX9ngo/SqovPnAJobqXXsEJMUIs+wS5a0N6WuAf5rq2EOiGqyjPw
         AUZOUc0rWcO1msp0xKiZoC84VHXPWRSddvx1GZHSHY6nWeuG+dO6pZQFv1KiTARIsBtu
         khQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717437; x=1757322237;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MLxQeBkb7pg30Hm1b4BwH3XF1UA4XXnA9/e/abfa5DU=;
        b=G+J/gb7ds72p73MTDempKqOOzF+cE5p6tmYtTxFBlNHMtA6zpsVaJaDAb2c2xdv1T4
         XUR01/62qGWge5a2Lifqz6W72mLJ3mautTsUV/OOFSiTsBQa/S3PU7PLnWm+8NBDTrje
         nPbwEdjAW15XpY0ELGc+3xPW7ukcmUkscn+pGIKaRpTNNe81AzEEtTTCeNhkKY+drEft
         dEMwHrMiFCT5YaKVN59h0wesax+yRBagV5+ftkFPj7WvHB3cHAXZoqoQAUNQAcqpXWJv
         t45ArQvmDdCWPelK6F8/5txlGP6A1NBjvCBmDZiINUjywEa0XqYKASGEGeinWftrV6PG
         zYyw==
X-Forwarded-Encrypted: i=1; AJvYcCVM9vM9d2USgFCVMMVDMWVhTx+Gpft5vO3+MCygwYU5pFyhkC9kWc2Ltli8VAeuNOf4YKBPxBrJQ/9qkO/a9RF5Mmup@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq90LltRTzZWhWOkIma2GtJ9FhERwPOGzO42r+7M2ImVuh+2cL
	Xxo9KlwhfCE64nFge4rAseCUtrnr/nHSs+sPCSI4fYck9nNuS9rfSE1+dtOCWwjRuWp9/JV/okR
	s4ebznww=
X-Gm-Gg: ASbGncsP+FVkh0IYDUl6oCq748wBMCKIIV0LyOc4N7P+WaYDoeWLNSRQGebrGXFB4Ox
	lApw0pyktqRko7LZ7DJ99BqT6PHzOOOQdsQJynJS2lelqT/bJHzIsCiAgy1WJ8+/QEO+gtxYN/0
	DtXwNNO4Vrv0Jxad5qangahNZXbh7frbPvagdQVYjdeDS6g46KVYWXBjZyEXsC+clcs8sWDcrdg
	wpxVWBLFXFTlyYaNa9C1RXyOuzZsEOyi5SKBOfWUsQg+7+ZnjXJUCZEkZm1Kek93m6vBcJ2gZNk
	SKYNuuXB+92OR1Kr/mDEZs1Tru5OAVYvtzRlSMTZErM5HhtZPPcONNtdikmZVQhR6aAQBgmThou
	YfWGmuhHc5hZOTq3x3KA9qny89D9SwHLmW5A54bU7gqIBKwf/gNBAe+QmqPM2ob7svk3OdOHP3d
	nbgxcfDnM=
X-Google-Smtp-Source: AGHT+IFRon1/4eAXp3QDGK+LmMCItN7KW9fmyhhUSOX/aEte7rl35eC/lBri5/0sH+daAyHsLqfoNA==
X-Received: by 2002:a05:600c:4692:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-45b855983f8mr46646315e9.20.1756717437302;
        Mon, 01 Sep 2025 02:03:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a? ([2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7d9548edsm93591505e9.5.2025.09.01.02.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:03:56 -0700 (PDT)
Message-ID: <d39a0299-bbda-4284-b7ab-81648a787305@linaro.org>
Date: Mon, 1 Sep 2025 11:03:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] platform: arm64: thinkpad-t14s-ec: new driver
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2025 23:28, Sebastian Reichel wrote:
> Introduce driver for the ThinkPad T14s Gen6 Snapdragon EC. In theory
> it seems to be compatible with the ThinkPad ACPI driver, but these
> devices are booted with device tree. As the name implies, the existing
> ThinkPad ACPI driver only supports the ACPI interface. Looking at
> the implementation, the ACPI DSDT contains many mapping functions
> to translate the low level I2C messages into the interface used by
> the ThinkPad ACPI driver. Adding DT support to the ThinkPad ACPI driver
> would require adding all those translation functions, which would add
> more or less the same amount of code as writing a separate driver using
> the low level interface directly. I don't think it's sensible to make
> the existing ACPI driver even more complicated, so I went for a separate
> driver.
> 
> I managed to get system LEDs, audio LEDs, extra keys and the keyboard
> backlight control working. The EC also seems to be used for some thermal
> bits, which I haven't looked into deeply. As far as I understand most
> thermal and fan control is handled by a different controller
> (0x36@i2c5) anyways.
> 
> Apart from that the EC is involved in proper system suspend, which
> is something I do not yet understand (I don't have any documentation
> apart from the dis-assembled DSDT and existing ACPI driver). Right
> now I disabled wake capabilities for the IRQ, since it would wake
> up the system when closing the LID. Hopefully a way to mask specific
> events will be found in the future.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> Sebastian Reichel (3):
>        dt-bindings: platform: Add Lenovo Thinkpad T14s EC
>        platform: arm64: thinkpad-t14s-ec: new driver
>        arm64: dts: qcom: x1e80100-t14s: add EC
> 
>   .../bindings/platform/lenovo,thinkpad-t14s-ec.yaml |  49 ++
>   MAINTAINERS                                        |   6 +
>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  23 +
>   drivers/platform/arm64/Kconfig                     |  20 +
>   drivers/platform/arm64/Makefile                    |   1 +
>   drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 597 +++++++++++++++++++++
>   6 files changed, 696 insertions(+)
> ---
> base-commit: c8bc81a52d5a2ac2e4b257ae123677cf94112755
> change-id: 20250831-thinkpad-t14s-ec-ddeb23dbdafb
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED

All worked :-)

Thanks !

Neil
