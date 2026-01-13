Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3879E38F942
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 12:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307869; cv=none; b=rW/EKI+X+CusJM5VUlIK5KdaCjsJo5l324CO3OMpEAe66U6FgI0sMSxk+Zl5wcjDfCgGUZ4jSqEmdod2T5bNBlVCPCBpoORttGP6gjYkf/cWxL+iF8L8G88mPwFKOtgCrINsm194xBoy9UBxR72FWtD1J0Nu+6DI63SynmoJcEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307869; c=relaxed/simple;
	bh=N5hJVbraTn9SX38FctttkE7Aunax7JtiyP45LDytGNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eEZPfGGGvokixkhsjsYkMZ9DHirjcUvqC0veZ6qdWyGD9Ao4YV2Y9IywJW7qNNn7iSzieEn2Xr0BUAgsKvS4NsnWg+y+/Kv8wO16Kcjc0YEKjGX6bGvCShue8YW2E1YQbBFJgM7GC6YYfkPjyvPbKvn6451ZyuLv5KD4wxRDfls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5JehJ1N; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5JehJ1N"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81f478e5283so2296390b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Jan 2026 04:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307866; x=1768912666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4+dGJCJp7B1U84LZRTKPB2JbVsYeAN54NQljYdP2Mo=;
        b=Z5JehJ1NDf+KOZhsovsquesUmfGJbbR5kU0qZJO3HRsgHU0Aa2Ks+sb20r8Ov25VYw
         n5MTcxj/DcX9tw13cKTjjvozxLueJjRuAW3oEqQJHhemzAtEZ7YCE3ws3LtGtZhhJ9z4
         y2gk2qgPQ4GZ1kNCByFnlUa1+Ob6+2YrIuWcdPzfvmN5jRS82c+zHObb4CL1kH14TiT4
         hSvA1VMTFkWFAmwU6w0hGsmykEVfF/gX/rCpE0fToUHQnD9cP8in7+jMxFqssQzTAMYL
         MGj84e5t7zuvKhg922u6aeWk2io9vOjH30r/9MoY8ERjyhoy/B1xXEpy3cPL8hhn1KzQ
         yZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307866; x=1768912666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4+dGJCJp7B1U84LZRTKPB2JbVsYeAN54NQljYdP2Mo=;
        b=PsBMwQ4CC8pVOi2T5y6wLeV83JpDeUiK3n5CUra2Lm8LvrPoSwL1mZwvC61OSCc1K2
         egVr/1bJF7XgAqIjKNtC43Py0fHDtYpRLsGS0LbOcIppJccKY3yx5YVqK0xvn0fjAl8f
         913Qjlje4O3nEtKNBDW8udFZ0/oBRYc7e8lUVodGlmB1zxUzXfQx4mRu3ugfNI1ckx20
         /V8MHBXuXhMxMSSzo/S1Mc48uZlZkwmbuM9tsicYSXtTImIuSku5ecBJBUkxavditFj2
         BKEXoWVkrqErFB9nE5vwj8vxIrCfALaDGCp6jypbRIUygzgZtdX2ShdlbwQ7y5j8RAlO
         eNgw==
X-Gm-Message-State: AOJu0YzYHzpikeFKhnwCtQKVIWVUyb4TZGGkS4mGP9XHg/kvPIC4zAdA
	02vTN19W9Em4jutCkcZL/h/JlRcxcfa0pBdPmqTCu0eAvPIL8m+ppWHm
X-Gm-Gg: AY/fxX4rJlkRQmBhIKEbrWq/Kw5jzRi7d8+IqbaDkkUKdGqeoZfOo8k4tOLiVr7/TG4
	tMJkbQZGr1J/tWMaAvQiLx5JGsWvFs8RiId1D5Zco+5WxdDwV3B7lJjmrgkiGhWmjBWCjRS2X2e
	JWNyIcUY2qT1/XNAG8HbdNpkF2oFJ8UHFGvADz1p9nDsbcKrtNxBvhw1SRotEXUTYgncCl51p69
	t2pVLvPER6pkxFCI2o2pwMwNxpnOMW8LJF/gT3rbWckGjJuj8dRsByjIF4H1nsEEYQVLXCyLdG9
	/wsavGBGnBxMHTdhuzpY9EMah+PlzZ0YS0W0uNN128yxLm0jEf24601F4Cis4SKOO1hMrcBJQ8Z
	zh2u4C17n7ABpczCyStt+nJZw5IWOy686coYKr5e0wyL62VZEgMi3sdNgFNr1PKVgROitDleSSK
	REl97f7TuUOQwL5ol2FMQ=
X-Google-Smtp-Source: AGHT+IFoEgWspcaV7rvaNbXOeE2jTdnMp2H9x1BoGwDEAq9YOmf8/ODZ80i/39TlFYonsmiLsEQEEA==
X-Received: by 2002:a05:6a00:9092:b0:81f:3f88:89f3 with SMTP id d2e1a72fcca58-81f3f888cdbmr8953960b3a.3.1768307866445;
        Tue, 13 Jan 2026 04:37:46 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e9dd8fd8dsm11409000b3a.10.2026.01.13.04.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:37:45 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v3 0/3] platform/x86: hp-wmi: Add manual fan support for Victus S laptops
Date: Tue, 13 Jan 2026 18:07:35 +0530
Message-ID: <20260113123738.222244-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230145053.516196-1-krishna.chomal108@gmail.com>
References: <20251230145053.516196-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for manual fan speed control and PWM reporting
for HP Victus S-style laptops.

The first patch is a trivial fix for ordering the include headers.

The second patch refactors the hwmon implementation to use a per-device
private context for state tracking. It implements RPM-to-PWM conversion
using linear interpolation based on the laptop's internal fan tables
retrieved via WMI. It also introduces PWM_MODE_MANUAL, allowing users
to set specific fan speeds.

The third patch addresses a firmware-specific behavior where the
system reverts to "Auto" fan mode after a 120-second timeout if no WMI
fan commands are received. A delayed workqueue is implemented to act
as a keep-alive heartbeat, refreshing the fan state every 90 seconds
to ensure user-selected profiles remain active indefinitely.

Changes in v3:
- Added a new patch (1/3) to sort include headers alphabetically.
- Fixed alignment of multi-line function arguments.
- Refactored GPU fan speed calculation to use signed integers.
- Removed intermediate "ret" variables in hwmon read/write functions.
- Capitalized "PWM" in comments for consistency.
- Renamed "ctx" to "priv" for drvdata throughout the series.
Changes in v2:
- Refactored hp_wmi_apply_fan_settings() to use a "ret" variable and use
  a common path to set fan settings and prepare for keep-alive logic.
- Replaced raw buffer casting with proper fan table structs.
- Converted RPM/PWM macros to static inline functions.
- Renamed internal context variable from "ctx" to "priv" for consistency.
- Renamed delay macro to KEEP_ALIVE_DELAY_SECS.
- Added missing headers and removed redundant NULL checks.

Krishna Chomal (3):
  platform/x86: hp-wmi: order include headers
  platform/x86: hp-wmi: add manual fan control for Victus S models
  platform/x86: hp-wmi: implement fan keep-alive

 drivers/platform/x86/hp/hp-wmi.c | 321 +++++++++++++++++++++++++------
 1 file changed, 266 insertions(+), 55 deletions(-)

-- 
2.52.0

