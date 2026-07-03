Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE22D3DD520
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jul 2026 14:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783087896; cv=none; b=Zu44ak4htEgu4YfxO+OwsfwEbkeyY9uE5nKvXr7n0nLMtnyJ8oitwyYACOmckAEiIsimhvM9Gnywt2eIqXzuhyYHH3kEHKI1Na8lsT943ekqVm7GautIk8ZqGIt0CVFYY4gcPgNUO5PwhMsYDGVJpW7yISD31VsHTVVJQvELe5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783087896; c=relaxed/simple;
	bh=XFguk+/29BmKnygKi86AdinFHkPeP2Rz3S+/Z8GHQNc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mWEokth1bOxMkZ8SOw2ubYQaoTTIEr9rdXo1ZHl4EdVy0j0unOSEiTNssqMDeuArtCc21jppR83J7pPz6VlQtOdOthbOCIKj1roMzfDmzB7xImSrYZm1bNh0EyBHylI9995W208PWfKeBLSnTskUGvtFloW9auiqxhZzuVImgPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q1mfpm5P; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q1mfpm5P"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b7612475so5931035e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2026 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783087893; x=1783692693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ni8iUi7jACzIQAQDv2pQjWB3ArBVYn1ELAUGfxQKnY8=;
        b=q1mfpm5PDeEshAO8kkqhv/CIslldqVFl18/8aZGRP3cnl4BmELOtNUaxY6L1WKlNvs
         nLI1X7SdeRw3Osd0IlAyN2v8AOQaJzqWUWwBFdTmCt6C6Pg1f8dC1UEpnVfJgnFzup32
         ef2JrPQ8FxzU0G77VGXWr1MpuDs8M3qLpgwqHenWK2AH4Gos7U5qNv+MpgxQNSkGMl3L
         mfJWUSwH7ffnkD0PbELdwfItZN7mDap733IaRIV4ijFw2pfrIJ1WqPIzJm2gWFM8n//f
         q0h/gSPSTTVqrhi3oDfDRlhAM+2O+utLHkmqnES6JwJcEjFgQ8NMTBnafyXOhUZrwOeZ
         Ep3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783087893; x=1783692693;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ni8iUi7jACzIQAQDv2pQjWB3ArBVYn1ELAUGfxQKnY8=;
        b=Na+HiOMYAyZFT5Fx8omqeuDbUZNUA0egHeBUoVEyl8LiGcmUkd+QxQ3HE3ZDACop8v
         k9FoL+m0JBYrdJfOdYojW3khb9DR8BLrJhw7yxe7E+6aGBo1/9Jc6N5o2SRxasVABETz
         yxUtV/h3AG7Hq3ouvagdTyPp+mul7F1rl0ZnmHWnv9crlToKLOa7wQZGr0jtlOKZV7p4
         fVHm+ww8lLCf4flHY2a84smLUUZdGmO0Lzjunr6f+Z11sEP6ZYrDBQTpSwrk54bMoyGZ
         PKFIS53ntkECGlg9BqzlP5tNEOQvRDK2146lWhiTItWGObbJDe/SDWpeohNQV4PCVMfR
         l33g==
X-Forwarded-Encrypted: i=1; AFNElJ/3CF9baoAQCCMnLBcwJfWqIOpAVBEjyd9YTEiIM49B1duAq2+qUbBpIyQAnnjiytARHlpboYIwHLR/zbbaD7wF1/8h@vger.kernel.org
X-Gm-Message-State: AOJu0YxMa04G483R2zs3O3HI61/HAs5rat7EoHlQg7EKxQ/Z1tvrOXIn
	TZJDA6U15yabyLAQ7GQ/gErHDK7yA8zbKpRjMt67HH0aCzHcAeGKUArQinVxb3O1c9w=
X-Gm-Gg: AfdE7clmoriFgR8F8DhHp4X+B9ZZDqCUoVgJqhgsW0wHUJfXBpamnhcnK9n390DSNkO
	kkTa18xoow4sV1gFNcxpYpM/2HeAJuHf8V/BImUSM2lkFYcic2T+rwCqO8hNV2gUW8PVrXlvG3x
	fM6N/LhAQGs1bIJ3XIXy/LLQrWqaZ0e3dUWu20KiyUPOIpUDU7fMBCB74W3CLRzZ6NFvg250Z6U
	R4ORdd9/KDfMDhuJOyDPck66u+trDuJNPXgMzTxa7v2Rb2dGJ/AE9Nw+fecseichQ4aboPoWt6h
	fEbWLmuSrh23KFDKt+f9PiudD1qMzu6cTF6x/EWXFhNcAG92FzYhvyfS7nGK8ZI2h0WUovN8xh6
	kdyuVBobrveaYlXWrCCHH0q2rpaX/dqV631GAgEava3M1qPlzCGG4PNL/pBHd33XGWWeTW599pI
	DerTBAtDniRR65XQJiv1dQVoLoJpVQ58Ih74ZGRXGKv47WoVmYUHpCDQIv/v/keQZZrKM6
X-Received: by 2002:a05:600c:5286:b0:492:40df:d49c with SMTP id 5b1f17b1804b1-493d0f39e9cmr189465e9.23.1783087893252;
        Fri, 03 Jul 2026 07:11:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9b13:921f:4f13:6cbb? ([2a01:e0a:106d:1080:9b13:921f:4f13:6cbb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bf11eba5sm141272515e9.0.2026.07.03.07.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 07:11:32 -0700 (PDT)
Message-ID: <e04bc2aa-11d8-4e5d-a4b2-bdb5c3f7e8f5@linaro.org>
Date: Fri, 3 Jul 2026 16:11:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/2] Lenovo ThinkPad T14s EC thermal monitoring and
 thermal zone integration
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <5edfa760-b5b1-4f0e-8a14-2a39d2b99090@linaro.org>
 <45736af3-cdd4-4398-8509-a3593af989e1@linaro.org>
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
In-Reply-To: <45736af3-cdd4-4398-8509-a3593af989e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/26 16:09, Neil Armstrong wrote:
> On 7/3/26 12:32, Neil Armstrong wrote:
>> On 7/1/26 12:37, Daniel Lezcano wrote:
>>> Hi,
>>>
>>> This series extends the Lenovo ThinkPad T14s embedded controller driver
>>> with environmental monitoring capabilities and integrates the exposed
>>> sensors into the Linux thermal framework.
>>>
>>> The EC provides access to several platform temperature sensors
>>> covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
>>> module and SSD. These sensors are currently used by the firmware for
>>> thermal management but are not exposed to Linux.
>>>
>>> The first patch adds hwmon support for the EC temperature sensors.
>>>
>>> The second patch exposes the EC as a thermal sensor provider in the
>>> device tree and defines thermal zones for the keyboard skin
>>> temperature and the charging circuitry temperature. This allows the
>>> generic thermal framework to react to EC-reported temperatures and
>>> apply standard Linux thermal mitigation policies.
>>>
>>> As the EC protocol is not fully decoded, the passive trip points
>>> get/set actions are missing, so it is not possible to program a
>>> threshold and receive an interrupt when crossed the way up or
>>> down. Consequently, the thermal zone related to the charging circuitry
>>> is polled every two seconds until we can set the trip points in the
>>> EC.
>>>
>>> This series fixes critical thermal issues happening on this platform
>>> where a kernel compilation, or heavy workloads, lead to a system
>>> reboot.
>>>
>>> Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).
>>>
>>> Thanks,
>>>
>>> Daniel
>>>
>>> ---
>>>   Changelog:
>>>     v3:
>>>      - Removed event based because trip point are not yet well supported
>>>      - Added an empty line after variable declaration (Ilpo Järvinen)
>>>      - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
>>>      - Made switch consistent (Ilpo Järvinen)
>>>     v2:
>>>      - Fixed patch 1 subject prefix
>>>      - Removed the fan information part
>>>      - Added HWMON_T_ALARM
>>>      - Fixed DT change description to reflect what it does really
>>>
>>> Daniel Lezcano (2):
>>>    platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
>>>      temperatures
>>>    arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
>>>      and charging sensors
>>>
>>>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++++-
>>>   drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
>>>   2 files changed, 197 insertions(+), 1 deletion(-)
>>>
>>
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> 
> The charging sensor can go very high aswell and when cpu load is high the charging
> is throttled down, so perhaps it would be nice to also have a thermal zone for the
> charging sensors.

Ignore this sentence as there's already a charging thermal node...

Neil

> 
> On my setup when charging the battery at 60W the charging sensor reports ~63C but
> goes up to 80C when building a kernel, but stays around ~70C if the charger is not
> connected.
> 
> Neil

