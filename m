Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5C22D2496
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774199672; cv=none; b=QQ8hS3/WHU6oLOxOEEnSWDiUE6rEONwA/y6tNz1hLYxZAVqILfy9Y5bcqu/u9upR9FlPS6Vsk9ullhvLqbSCtD7DiHM2B/4uHVocNPC77aUybav0fiN74e8Yf5B3RtZV44Q5Z28X2mb+7fZR/L1tLOzUgwrBeD8gBMh1p/Vmwro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774199672; c=relaxed/simple;
	bh=DPf3TEP7Li9DnbBdYm7B9sgg0w9UPwHOKvtMeiKbEjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/MudTaDeQfDakp89sKJjxFF7B5b6FlFel7lr4rV/8BJHTrzOVafs+2DuK/Cy/z6cGAo7Ibl1sQqFlEkh7KkF1LFGR1+nOJ5Sx4bTPVHUM1VuJPLLYS1QubnRkOAQ76g0uXKa59ArW0IJBVt4wfcEVJqS7r9Uxgkf6UUkuKuwfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLSrLjaV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLSrLjaV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad617d5b80so22022945ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 10:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774199670; x=1774804470; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCMcfD3RvQYXvN3hP+I1yqQGTEdR7WKcKwjHZ0PUTU4=;
        b=TLSrLjaVs2zXZ+YVDPx33ka8f+XKms/v51OEOQ2A4GAbDSl+Rigud4IwOw/nedv5A9
         LBVqvx59k9Fl7P2flX5B5WnOeR1Gld4H8fQ9uF2cRy+ZonrzqkD5iKGepqp4upF80/G+
         kyUXkik3u8m4UeVhmBt5X0BC2Zhu0X07IIA4awlWTwiqqlqmun5CpMn4poJFaeIZv5GM
         xrpGfqqALYELi3XEDq5qs5wttPgVMlxdhZBUPm/4EEUPmJpVhvp3Ljp6s1o0J9/9nUvI
         Y0rrZUp+SxUHU+rzWMKqEqHFi6B9y75wjYjLQuqMa4ZHrZ8FMBgEM/ok9vrP73+Xs4++
         LoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774199670; x=1774804470;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCMcfD3RvQYXvN3hP+I1yqQGTEdR7WKcKwjHZ0PUTU4=;
        b=kUYM3RkVhZxphM5LmQxsk1MDgD8yDJmhIc+XRcjQ91FjkXAyvw5XxxLY+YP1JSy4Px
         BYq+0zacT/u/CZIyl8+BBE6dnnTZ7DPVb0RIZq9Rx3NavbaZTG8dc8fWFmLu/1Sm4Bg5
         yfdNbPa9nMdd6tiPVR+FQq30zT0vckkdRvQHZw7en5F9Fs/n+kpYvDWC2ocP4YkhKs1x
         TX+X5g2GcYoJCe1Qy9XTyQBVK5qtE5saVDX2mmk2yvURyitA+2i+qlsDS1BD5tMy5O06
         n1eYF7EK466vH35SmAmL80LTEZ6SGryLb7bMrOEjb/vnElq16X2jFhnQ2QIee6ywTMb0
         e21Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKk9Ya9fM/wQHbdhIOudYYmg0S6j0HDBvVwDKZVR7I5VJbDD9G/+f1phR6Srmu0TsiDdSJcyfmhe8CZ8kVJ0YMncra@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/dvFGt3VXD4SDAnwbvmk9StlILihaHq0sBRheeqFWY3Zikq5D
	a/LGkzVaybzh9Q32QQiYxCFuBPkcptXxOmQePRcj9GuWpEDue3PW/dEi7st+7f2i
X-Gm-Gg: ATEYQzxzk+zOyQwO9gOucyOHw61TK108saWDYV1cELLxuSe9DNe6WGVuXp3xHbs9kJK
	j+Dx63EPValFBwtwTRLiZBpxgGHksL3G6+En3luR4HCaM0fvmTzbG2Jg55OBbVHsAeNb6QDbBgR
	XgHtsUPFar4P9Xx+nKM26zN3Y4eq5Ch5LEnT5yaoq8EG2CvOf8jMBRErxsCQKBWiWxDf3RmRSus
	7Q7zpoKnREklAUPrkrB4QS6sXiMYrQY9OV7tR623Sh9Jp7YVMDI+ZwTgcBJnYFAZkeF2aeMDALj
	M0EFqkU8uuKCbQXYyBHSxw3nzkDHERfr8baHySia9S7fU7ZfE7vOxR/gQcCqycCpTtN1bWBWerl
	yN285Bsx8W6ZdLeUrIIKyeOcWPCP8dnDr7poFZ0JFA/eaPWVervjk2Edqd+KmjyO3be5FAljCrF
	HBppvr+rtUaQDRK/Zx6dL32v1VMfwuXYZJSt99lHp+iFN7+P2887qfqKYSLsOf4ouh0tuDgiiZv
	citiTJSTiXeTTkwo5+9
X-Received: by 2002:a17:902:f605:b0:2b0:49e6:9622 with SMTP id d9443c01a7336-2b0827db766mr83992845ad.37.1774199670356;
        Sun, 22 Mar 2026 10:14:30 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08365a668sm108836125ad.40.2026.03.22.10.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:14:29 -0700 (PDT)
Date: Sun, 22 Mar 2026 22:44:25 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Emre Cecanpunar <emreleno@gmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 4/5] platform/x86: hp-wmi: fix u8 underflow in gpu_delta
 calculation
Message-ID: <acAYzxpaEBbm4GgK@archlinux>
References: <20260320235557.56298-1-emreleno@gmail.com>
 <20260320235557.56298-5-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260320235557.56298-5-emreleno@gmail.com>

On Sat, Mar 21, 2026 at 02:55:56AM +0300, Emre Cecanpunar wrote:
>gpu_delta was declared as u8 and computed as the difference of two u8
>fan RPM values from the firmware fan table. If gpu_rpm < cpu_rpm, the
>subtraction wraps around modulo 256, producing a large positive value
>(e.g. 10 - 20 = 246 as u8). This value is then added to every
>requested fan speed in hp_wmi_fan_speed_set(), causing the GPU fan to
>be clamped to U8_MAX on almost every write.
>
>The fan table originates from an undocumented WMI interface; a
>firmware bug or unexpected layout could produce this condition.
>
>Change gpu_delta to int and perform the subtraction in signed
>arithmetic. On underflow, emit a warning and treat the delta as zero
>so the GPU fan tracks the CPU fan directly rather than saturating.
>
>Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
>---
> drivers/platform/x86/hp/hp-wmi.c | 13 +++++++++----
> 1 file changed, 9 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index a29f34588055..b8f22d70e996 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -2530,8 +2530,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
> {
> 	u8 fan_data[128] = { 0 };
> 	struct victus_s_fan_table *fan_table;
>-	u8 min_rpm, max_rpm, gpu_delta;
>-	int ret;
>+	u8 min_rpm, max_rpm;
>+	int gpu_delta, ret;
>
> 	/* Default behaviour on hwmon init is automatic mode */
> 	priv->mode = PWM_MODE_AUTO;
>@@ -2553,10 +2553,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
>
> 	min_rpm = fan_table->entries[0].cpu_rpm;
> 	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
>-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
>+	gpu_delta = (int)fan_table->entries[0].gpu_rpm -
>+		    (int)fan_table->entries[0].cpu_rpm;
>+	if (gpu_delta < 0) {
>+		pr_warn("fan table has gpu_rpm < cpu_rpm, ignoring gpu delta\n");

Since some boards have CPU_RPM > GPU_RPM in their firmware tables, this
subtraction can naturally result in a negative value. I don't think
we should pr_warn() what is essentially intended hardware behavior.

>+		gpu_delta = 0;
>+	}

Instead of capping gpu_delta to 0, I suggest we update the definition
of 'gpu_delta' in struct hp_wmi_hwmon_priv to an 'int'.

Since hp_wmi_fan_speed_set() already performs the calculation using
signed integer arithmetic:

     gpu_speed = speed + priv->gpu_delta;
     fan_speed[GPU_FAN] = clamp_val(gpu_speed, 0, U8_MAX);

Using a signed 'gpu_delta' will automatically result in the correct 
GPU_RPM without the risk of it clamping at U8_MAX.

> 	priv->min_rpm = min_rpm;
> 	priv->max_rpm = max_rpm;
>-	priv->gpu_delta = gpu_delta;
>+	priv->gpu_delta = (u8)gpu_delta;
>
> 	return 0;
> }
>-- 
>2.53.0
>
