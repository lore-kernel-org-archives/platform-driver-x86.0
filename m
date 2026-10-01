Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C2A36E49B
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 00:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814939; cv=none; b=OwQ6JOahMZEtJfaNXIl0LAzCnnhjV4tj3RGY9pG84PiXXX2eo/i7YdjcCbUlqgxsyZgRDibq+3sGljrtZ8IKJSI82LGaStmmAx2tsu6+C0GADzsUsijrCWMfO/XcKcgMaQh6QOrjPNy3dKixE5CJXucF8pRgXWAe81BChHfrUYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814939; c=relaxed/simple;
	bh=jj6qnxF3kOem+mzHIYZYoMm04MqHglGF0pSRKCfP7kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IMf7gvujokGxFwNO15po+P8lLPpTShquaA/msmFlxasKoF1eGZTdHRSoHa8ZLRAW04JkJK4hPiH+LZoh0Wn/1F2YTKVGt3GRjXZjQjkVfRwZfpFAwrxv94lV0Z91JKQCRRZIJplWNb5jvijubQ9vzDbbhInaZYJ9jgxjGSEaNDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2iN/qQy; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2iN/qQy"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2e2e0d89e58so8888935ad.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 17:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814934; x=1791419734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=urpwPzRPtIQryIgzQVL+jYmfxTl0UHFGzuznDbOdSHU=;
        b=r2iN/qQyz92ndOnbMCX7Xvzhx4OPxpXrVyRSSo3TIBOZkrzG1Nbz3ASt0+br27zfFS
         ma/uDpCqkcEERTsd6peAMNnpYo7wO8ggee36Z7FLHuZxRvH0dgWMQUcPF6JTbZK+w15H
         jK0bsKrAzmhn9NdoEumsHlc4qzQ1XEbtnjfXSyq3dgMl45Qt43yrz7+Uqgog+S36PLJ0
         Fjal8s6i3bGbOQwDzm3vMtTyv9lRLsBv2ph4aqwSsHcJo2WwDln1qjG6iW5KoCD/N2Vn
         EKduNh0NHwEHe6Qz/khHWqFxmAZyjA3pLa98+BD+y5fZvRRGQq6KyXE6SfTgMi/QMA0a
         Uiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814934; x=1791419734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=urpwPzRPtIQryIgzQVL+jYmfxTl0UHFGzuznDbOdSHU=;
        b=LdUJ1isKPyy9p8bqv6R9sgN8smi+FgUImKg9peXU+Wqg6ff0iw/mNiNp2QMiq1pW8Y
         JQil+upY+6tds4wCa/eCcYSsVb+MRtDThU08FyPxDfVZ6jvA2yAKeEi4ng5Fd9GPlZZf
         5fNg5qpIKavwue7dUVqrznlquV8e0+wxD6kh8+E9ZknFxhPPUU3YBxr4kFLyNf6OGsf7
         8Hv104mMJ7zydZGUj2IDRiBYe/WwlMzYZ4vreNptxGi1RhwLEIba2ym1ffGNIRO0EmeH
         3dNBloU4xBmXQZ8tRD2Y+bn/8ceOlO0IaxPCu8ivxdmA5E2FPdsiBCZajOlX8tcQG6kx
         ICIA==
X-Forwarded-Encrypted: i=1; AKwUvBzyDtgSLB/KeOWvihTd25Lhpqvh0WSJOERtG5B1Fs1UwTcszWXiDBXjuXVBy4MnWpFdJ6dSzx/GBT/W8vjBMODaHGC8@vger.kernel.org
X-Gm-Message-State: AFq9FYII0GXSEWg2KaSpPQkzwBbZme2SfY3oUhairMkNGOWtD7LVGWaR
	arZYCY6/V5S9ohv3lbUaHC3gmrLs2vDGCDbxwzXzWarDXj9HbVoOfvvI
X-Gm-Gg: AYBFou3A6Ezvqbr4EeAYetG8RGjkxif2nODalifdx0aAY00RsRmMOIYbbyRodA9KQCO
	wIX2lmJilodlTZxGk7aTXkv3N7o+W7uyrFTBcV/iBA46yZKuuETgo7pW6r9itXO0c8wG5PavxfK
	Acy5OEfRh9DIhfLlhCgro+o9k3oLurVVYADWCnbfi//BWXvTszBNRrqipIZcsIklp4u8wF5DK70
	dOly33AOacaH9a2gXZE072zImp2lGoxJfk3aGNkhLrmrNwmTngHlRDv6hHGjGTw82MFegXArI5P
	YByCV6AInLtgiiEf5VCQPgJI090yEJ/drGlpAFvf91fG9VjiQ6JROISbgmSzxW8pTcjdYVcaG4n
	ABHIgYaItN1/CpXdYUASUxC0ss2VYFmsyvHXn1fiGs7jFfDG6POgp9Boegk6hC7JHfk7LlCqtu6
	gsMLFsCzIO/IEsavqnP2TIEOMwo/qOgkbcRCXBfPxX5Tw0
X-Received: by 2002:a17:903:120b:b0:2dd:c054:197e with SMTP id d9443c01a7336-2e2e4b48161mr22856335ad.35.1790814933787;
        Wed, 30 Sep 2026 17:35:33 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300a90dc9sm3346925ad.18.2026.09.30.17.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 17:35:33 -0700 (PDT)
Message-ID: <6c2983c0-3191-489f-a65d-b64a3e3b286b@gmail.com>
Date: Thu, 1 Oct 2026 08:35:28 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/5] Merge redmi-wmi into bitland-mifs-wmi
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>, platform-driver-x86@vger.kernel.org,
 ted eric <ericted8810@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
 linux-kernel@vger.kernel.org, Chris Taraszka <chris@miget.com>,
 Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/ig==?=
 =?UTF-8?B?5paH?= <btx342@gmail.com>, powerfullz <wleizc7319@gmail.com>,
 =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe
 <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>
References: <20261001003218.39421-1-qby140326@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261001003218.39421-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 08:32, Mingyou Chen wrote:
> This patch series consolidates the standalone 'redmi-wmi' driver into the
> 'bitland-mifs-wmi' driver to eliminate code duplication and centralize
> the maintenance of overlapping ACPI WMI event streams.
>
> Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
> platforms share the exact same keyboard event stream WMI GUID
> (46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
> the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
> it into discrete type/id/value fields.
>
> Redmi operations were not contained in this patch series, future reverse
> engineering is required.
>
> This series introduce a newly reported mic-mute hotkey definition
> for Redmibooks
> and dropped the previous redmi-wmi driver.
>
> I don't have a Redmi or other Bitland device. So I cannot work on the
> real device.
>
> Features are working properly on my device (Lecoo Bellator N176).
>
> I leave the future reverse engineering work to the community.
>
> v8:
> Correct Ilya Gladyshev's email address in the MAINTAINERS entry
>
> v7:
> Swap low bit and high bit for WMI_EVENT_KBD_BRIGHTNESS
> in bitland_mifs_wmi_keymap
> 0x00800501 -> BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0),
>
> Report KEY_FN_ESC when WMI_EVENT_FNLOCK_STATE events received
> Rename the reserved names
> Use Xmas tree order in bitland_mifs_wmi_notify
> Collect the Tested-by and Reviewed-by tags
>
> v6:
> Drop the wrong Redmi ops
>
> v5:
> Correct Xiaomi DMI vendor name
>
> v4:
> Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
> doesn't support full-speed mode.
>
> Mingyou Chen (5):
>    MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
>    platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
>      the bitland driver
>    platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
>    platform/x86: redmi-wmi: Drop redmi-wmi driver
>    platform/x86: bitland-mifs-wmi: Add per-machine ops table
>
>   MAINTAINERS                             |   7 +-
>   drivers/platform/x86/Kconfig            |  12 --
>   drivers/platform/x86/Makefile           |   1 -
>   drivers/platform/x86/bitland-mifs-wmi.c | 259 +++++++++++++++++-------
>   drivers/platform/x86/redmi-wmi.c        | 154 --------------
>   5 files changed, 195 insertions(+), 238 deletions(-)
>   delete mode 100644 drivers/platform/x86/redmi-wmi.c
>
>
> base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
Apologies, there is a typo in the subject line of the cover letter.
This is version 8 (v8), not v7. The patches in the series are correctly 
labeled v8.
