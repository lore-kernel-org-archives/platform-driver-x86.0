Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CA3D952C
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jul 2026 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074758; cv=none; b=Z4cGreKo8ctUhCP3Isfb5FzqHbehdGQdZs/fSUmNjqwnBVM0oyvADYxKHGIWcxuYpulZyksdP6WiMNLYS+hA5UjaCqz9Pr4lJknpPVCkL2FQPXAdoZp0MmLNGkwbnIDzHgepIryseaoHSM6mc0CC84fNIupj++UapUE8m5k6tz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074758; c=relaxed/simple;
	bh=D5ijQV3bUdGx6RAeOYDDyhV2oxFHO7V4Y7ge4JRyKaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h1Zv57PO+hjzu5jerJDodn5vCFbwCg+C92CSpKTfLlJVao6Y+BrV2Lq6JOM0ePmI8Zc6oPVIe/U7O5v1h14Uhu3F/BYPdtOE8KVSqC0On1htc1LQslvArV6+9BiCzufselbILy6/YQkVf7WrzG7E37Yp1BueSpoTktlTWd2UgX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGbcWFTh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oGbcWFTh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-476d8e647e9so378203f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2026 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783074754; x=1783679554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXqnKE5BVSq5meuyy3aSxrzRU5PavHRibtLm4NqA0hs=;
        b=oGbcWFTheGuatgzxnFFH6wuCsl5Qb0XbSOH9emVtGr4Wp/p5s+9UGaT95T1+QNp7ON
         OjOMktfU4yUNmVI4+pIrLqLCBkk0FE6P4Ta8ytqAkknc2s4WZtR6c7+C0imbjlcez0X8
         dASoyUvGlF1CG5/vebFc49OJPPn9VTc5aabfhIRDhy/GDoAyyIWjFAI+P5FQzJ9B60nZ
         cqVW28q5hG/KiFo1ghr7nsW6YugyyvvIqIvRN86V9ioulgmGEL7vt/p/LuKHkfsYfxtB
         RyvccYfrVkfssvIPiALGePd+e2g2UY8nuXHA9rk48upBsR+KjS3nV6PCFR1ckRIp3CpU
         +nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074754; x=1783679554;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXqnKE5BVSq5meuyy3aSxrzRU5PavHRibtLm4NqA0hs=;
        b=hHl6SepwbWO39d/7bWHC3wQc1M1o+VF6q7gNSRWAAvKpAAGYI2uin1GJr8ZBdgWKDU
         R/qhvpDrMvVhPUfZkKuhnmZx3CHUGsfetB3vGHOn7VM1wu9W9kn64oRNXKgpaml87qA2
         res0u1QBfpNJfpiGTRDlOi9+dWqmJqkcs5PcgHh3QfuNjiDWKCqhSfTXylmBxbqPr+u7
         4KKMfRTSCkVV60a0O3fDalmYViFbiXKGD8XATxrhFp5VN0qhljknmf7XA/lKAfqt5Zj8
         NPwip91fw2EMQR1V9I74XU5ByGTEe5+prK9jiQvZsrQXV7C40tQIO86JvryoYZUnLCaF
         kNLg==
X-Forwarded-Encrypted: i=1; AHgh+RqAbLgpu93VcUzwwYUocVxB7eaMDzbUMbowXnp/g9uuZrgKINS8q+N7DDiy7h/sagxNk4N0YveD4BgyP4JxMNfHu0ZA@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv1ZI5f+4SQVc7wTSLVTe+WDBZjv1USOBo/kUh3OW5n6ge8b/m
	e5ntS0M1B5VdMNKQZUNVrkXyef0yQ5SSF4MVfEUFtXOvxE3ROEU2AM8MlXRW/H8aUIc=
X-Gm-Gg: AfdE7cks8Ud/zAPGntpPMoGZ2ncd3/eTTUJoM5qT9/PxEPN7aC5IHSoHGqGeUP2Gp/x
	CPM5EpJJ1kIercOAbgesRkgpHgSVlS8B00vNhtG1xHmW8Yos2rJWcQEWwP3xrLpRyClx0RZWVKD
	F+zxU3OVxthbTAtL/oQoZgfU5CNa1GH+gzu7IRTtbyngflIN7vXfaZnoBsHpJirMVN1L2RUailg
	UjGZEGBDk2nUfeMrsDfIERnkvYbX4hvKYSrWwqKS0vsoB3ubhwMuaQAmPtdIdg6KvfCrhy81mJq
	AGrJQed731JOBsrjA8VXG6F/CVsrkMJKJkge4/TcmeRivHMoeD2RKPQPchkp3d0Ffu2G8KMrAc4
	IPOPKACYG2QQPeoayXvU81zhrsBBMdeXa18E51ChFF7GnUlYL1tlM0YV0u2FLrVIkd0dL2K24gu
	i0bxAGA/ClpU/GFWYjNUgEKLz0av3vVPhFZQU7S/zXaBd4/9Fjo+tzxWLI5ti9pm1hGiGUye2Qn
	pSlyo8=
X-Received: by 2002:a05:6000:601:b0:476:5eec:309c with SMTP id ffacd0b85a97d-4775a7cb888mr13583163f8f.24.1783074753843;
        Fri, 03 Jul 2026 03:32:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9b13:921f:4f13:6cbb? ([2a01:e0a:106d:1080:9b13:921f:4f13:6cbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4ad4sm18103306f8f.11.2026.07.03.03.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:32:33 -0700 (PDT)
Message-ID: <5edfa760-b5b1-4f0e-8a14-2a39d2b99090@linaro.org>
Date: Fri, 3 Jul 2026 12:32:32 +0200
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
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
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
In-Reply-To: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/1/26 12:37, Daniel Lezcano wrote:
> Hi,
> 
> This series extends the Lenovo ThinkPad T14s embedded controller driver
> with environmental monitoring capabilities and integrates the exposed
> sensors into the Linux thermal framework.
> 
> The EC provides access to several platform temperature sensors
> covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
> module and SSD. These sensors are currently used by the firmware for
> thermal management but are not exposed to Linux.
> 
> The first patch adds hwmon support for the EC temperature sensors.
> 
> The second patch exposes the EC as a thermal sensor provider in the
> device tree and defines thermal zones for the keyboard skin
> temperature and the charging circuitry temperature. This allows the
> generic thermal framework to react to EC-reported temperatures and
> apply standard Linux thermal mitigation policies.
> 
> As the EC protocol is not fully decoded, the passive trip points
> get/set actions are missing, so it is not possible to program a
> threshold and receive an interrupt when crossed the way up or
> down. Consequently, the thermal zone related to the charging circuitry
> is polled every two seconds until we can set the trip points in the
> EC.
> 
> This series fixes critical thermal issues happening on this platform
> where a kernel compilation, or heavy workloads, lead to a system
> reboot.
> 
> Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).
> 
> Thanks,
> 
> Daniel
> 
> ---
>   Changelog:
> 	v3:
> 	 - Removed event based because trip point are not yet well supported
> 	 - Added an empty line after variable declaration (Ilpo Järvinen)
> 	 - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
> 	 - Made switch consistent (Ilpo Järvinen)
> 	v2:
> 	 - Fixed patch 1 subject prefix
> 	 - Removed the fan information part
> 	 - Added HWMON_T_ALARM
> 	 - Fixed DT change description to reflect what it does really
> 
> Daniel Lezcano (2):
>    platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
>      temperatures
>    arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
>      and charging sensors
> 
>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++++-
>   drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
>   2 files changed, 197 insertions(+), 1 deletion(-)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
