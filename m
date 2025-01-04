Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D6B433B3;
	Sat,  4 Jan 2025 08:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735980924; cv=none; b=rrx04vEXz7Y/sIADD4LSwhNaQTJaBeiZJq/TNVYmHtvmzUkb8D2k76CsaqzlMt5Qth5N/lkJrejiPPaIv/HJXr+/cRJoL2eTTHQcOPb8gzB8/uyVGSJ93jNhoCSfZXnKl0vx8BrdvD8/f98yoe/Lixcs8s/MN2+vA+zblfiMVXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735980924; c=relaxed/simple;
	bh=T3zLbaU5n/7+VfUxdn5sk3LG0ICs3zpKwqsjbWHY0Ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W31+MZUdPGt1k+50nC8iC7OJXyagprBgBHTqaZA00rZB4HKNv3ZFM8j0UMX755/hx0+C40EkMgZl0ZfzU81QYP7AKuMvAJo73Z2jBpidcKmadjjUxSdVasYZ30UuPXspireva4vTeQBPAVwvRS6rsuFkdYfUZ51smUDP4VEeQNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCVY9xIa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCVY9xIa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2162c0f6a39so189419575ad.0;
        Sat, 04 Jan 2025 00:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735980922; x=1736585722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CDzMXLxnbjwR/+ogZUNMnZgXM3wP9SzQQEno8Vk+oVA=;
        b=kCVY9xIadx8pIFFi2GAy5cGPb99vlDivaeVs8vq/hIY0agioMVjlfZMJl3H3/ys1yc
         aDV/WkgdhZa29iuNtCHRXKljecUm2zQDg35I+/WTvtzoPJZt9gJf8ACSbCI2oko+tJx1
         1HLtN6Tt1+dePaagC1Un4ti1tiL2r93IYhBJy/Fpg1g36xraYXMr9YpGBdzMXWXfilbL
         f2vPNtDlPbGQErwYABi4Z3V49vsVcva8UmCB3HSRisfzcvKpMR80SqU/y67chwVItIS8
         wxZNHZ96cdsPwr91Y7p7648N0Yt8N5kDuXJZBQ3cNOESgISnUHnPC+W5Biz07OfoUseS
         HAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735980922; x=1736585722;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDzMXLxnbjwR/+ogZUNMnZgXM3wP9SzQQEno8Vk+oVA=;
        b=w1x196rDU6gTs45qT/Fg3B01C8F22PcsWZ1y+H4C8s0I9IZpwRXd5zrmrdcSxD5QNn
         hWhYqb+UJk7HKfJ6kvjAPb5Qrg0F8V5rO0hETYhviTAKH+ecKAlvJx602yagz0r3KWbY
         Aa5jgeBdQwhLjolkgJHoXpS+TVFrcYQw5LpQ2ltl+PsS6zpQKe0RTAdStSWWx1wJyF5x
         WGuucIylZJyiTb7nqLh7LgHAyFEa3bpRlUSZjaEc3r0fpxr7J6sIRZN0pKMizp96ZCKb
         UQPLkn8G0inoBLESjO6j6WJX6xAsXYmX2Aune7n7roiSWYNwy51ZpkhxqU3Fx8a5falX
         otZA==
X-Forwarded-Encrypted: i=1; AJvYcCUclihCGgiBWFZgcUKNxyY/KkqmeDPjE2qRZoxCChYN2L6dJ9OpcmbrkTnop/IwqaSCciuAQnPyEoRpLTI=@vger.kernel.org, AJvYcCVOY3eqoj4KvG3OQCNBlYvrfOA/AOShcQV+CfdcAFl9pEdoB/3NUVxhjlpzpz4pGN6KJHuHH/mtE21Gqbd66Rbgkj8niw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEFeuEdv7qEUSER65Cuz2iGdV8KIVbMz4XZi5n2WvDDLgglX5m
	logrcsMKnN7Mi+b7UqTo2Jhet23PaCe9RrK65aygt/wFjIqZVdgC
X-Gm-Gg: ASbGncvfEHuRli6fbxhWQCYorqDXfL8jFv/ChDfqPT0orXXfF4MHn/nxVD9II/BGbc3
	3Vq5cPvgcdCFXqVh8h9QHrZ1mABzw6EFgtHUjGMyUiWEqXpGRxRhqMTQMDSC3rZSkPQ94PaQnvT
	kvOlCOOgONqEsc5HqnqDyPxnhm6Z3WMHON61FGVnRzh8g/5i0ih4ZtMU1ACGBraKLXZyoVXiUEo
	rH6qhYtesYkvn1rweI6hlbKcg9VMXgX4H+P5U6XlSuoXJum2EJOLfaFRQ==
X-Google-Smtp-Source: AGHT+IGvCbbVjUx9cTuj7OjGOoeeQ7WTmTQOxM84YRBd+W4jDNCs/6yPJl1MgHq4zbHPqXPk/qZ0KA==
X-Received: by 2002:a05:6a21:3382:b0:1e1:9e9f:ae4 with SMTP id adf61e73a8af0-1e5e1e87c5bmr64254760637.13.1735980921820;
        Sat, 04 Jan 2025 00:55:21 -0800 (PST)
Received: from [192.168.2.16] ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e32f7ea0sm25316395a12.78.2025.01.04.00.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 00:55:21 -0800 (PST)
Message-ID: <6a9385e6-8c5a-4d08-8ff9-728ac40792d2@gmail.com>
Date: Sat, 4 Jan 2025 17:55:17 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: acer-wmi: improve platform profile handling
To: Armin Wolf <W_Armin@gmx.de>, Hridesh MG <hridesh699@gmail.com>,
 Kurt Borja <kuurtb@gmail.com>
Cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241231140442.10076-1-hridesh699@gmail.com>
 <12ce2a4d-6a27-471e-b330-996753ff1bfb@gmx.de>
 <CALiyAon3r=VXFNZw7is4VWZoRnFFbrUUvLB9XeW+xkMLjXDyRA@mail.gmail.com>
 <tftomtw456sevajiid76bgenmxl2s5ycv4sckfgl7mdjbs5hxb@5vs36lxjtaxc>
 <CALiyAokg_-Mc2R_OL03AF32=EPcFS1+RYoA9G6r8iJj9ZEMtmA@mail.gmail.com>
 <20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de>
Content-Language: en-US
Reply-To: 20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de
From: SungHwan Jung <onenowy@gmail.com>
In-Reply-To: <20e3ac66-b040-49a9-ab00-0adcfdaed2ff@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/4/25 06:07, Armin Wolf wrote:

> That is some very important information right here. The platform-profile
> documentation states:
> 
>     "Specifically when selecting a high performance profile the actual
> achieved
>      performance may be limited by various factors such as: the heat
> generated
>      by other components, room temperature, free air flow at the bottom
> of a
>      laptop, etc. It is explicitly NOT a goal of this API to let
> userspace know
>      about any sub-optimal conditions which are impeding reaching the
> requested
>      performance level."
> 
> I think the AC handling is unnecessary in this case as the hardware
> seems to accept different profiles
> even when not running on AC. This would simplify the platform profile
> cycling inside the driver and
> allow us to use platform_profile_cycle().
> 
> I wonder if this special behavior of the acer-wmi driver is documented
> somewhere. I am asking this since
> this has a great potential to confuse users.
The acer_thermal_profile_change function was made for predator phn16-71
and tested with some predator laptop series.

These predator series have the mode button that toggles between turbo or
non-turbo or cycles each modes. And the predator sense app restricts
these predator series to Eco and Balanced mode on battery.
So this function includes on_AC to reflect these behaviors.(mentioned on
comments)

platform_profile_cycle() is suitable for cycle mode by
cycle_gaming_thermal_profile parameter and if there is no reason to
restrict thermal profiles on battery, we don't need to handle on_AC. But
I'm not sure why the manufacturer restricts the thermal profiles on
battery on windows.

Thanks,
SungHwan Jung
> 
> Thanks,
> Armin Wolf

