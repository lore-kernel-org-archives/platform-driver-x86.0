Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689EB3E6DE1
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 23:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050993; cv=none; b=O+WIdFiuBa/O00NbaLWUkaCrVaPwmZTZtT5SMESxx0BuX08E2K/4VeSnWjcseu7TKbeF27bDj4nNaV5O1rUsziHGpXjHZwutoEZ4onrQc5M1hM9H6V7I55Gw1Tv3RUy8yacKS2dY7grzNnpZqgEY8FpQrAApu46WJiCrsNRtfd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050993; c=relaxed/simple;
	bh=/ayxj6Iq3ZtFC4pNNAHwYAhIzJBpO1wGwBIQTtXpUYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQc0VHqSKHlAJusYweEZnsudFWixGXe2dakJ3dj2bFacBM4cQy2/ZSWEjei5afcrHxZwIB11BwN3k2P6ossWbBtl8CzLX/cx8dh6hMg69sdc81dWqEtgeD77lULhWkgUYv3nu56a1NDILZRUqXJPe5BLdW0M/NPymFWB9E+phHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nOSp18OB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nOSp18OB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853a485721so2620125e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774050973; x=1774655773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlLxB5XuF7wDeRYUxBFcZ01DQMhckho1l6xRy+06+vo=;
        b=nOSp18OBTXIBSFHceC6RGD+lmeql2n+Iqj/UzOUHkkI95t1i11dBX86sF6xWbGJGaQ
         YvJipr+OD+Jectp/bCRWUQJqvZKrFGCxlUkFKI3sHadDK+bt0EbBzXXx6v2PdYCHVRNa
         J/hDCMZPEVjRBTWbTF6/1gYGl2a2S9QNGZzZfV1OX4jEe9cFw6Z92wivMYv8g+IewUZd
         Tlw22VK6puIuphmjyIMhNif8MbSBNZsQu7qXKpAsxnNzMMMOmBHUWBuC0NshhfDWKPYK
         huphq7IM9tiapmYkSsXwYajc8Kkzhztpi2Hs7ZTOk8xsqISucFcJvAGaD4tGLLJkNgmw
         rg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774050973; x=1774655773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wlLxB5XuF7wDeRYUxBFcZ01DQMhckho1l6xRy+06+vo=;
        b=UbiE+MFtrzTKvklVlxVijL9lMn3PyvJC4EWL0BFZJUgEYiqDmmCSZwd4LofFNFMcvT
         iyNGb5crhMm3TraEZmvEKKrmlbflwAL5y1RMJfR+haFTFH81J3TNP0v/lbOGmMQGZz8r
         1G5D4AkJ+F7ycIlISg5wj73X70zxTUSDz0luL/41ITruKlcNDlZiSawrJb/kxqVphrQ9
         cw2YWYwII6udoFCOSwbOdalBDFiy+xrDS/fsOW8AnPdeF0hW23TtkLl1QmbkcBB55zPn
         mvqWFZxFtC2WIiCs0oqO47FJ4SbA3NphBzEzsr+2TqNllhCLl3pLGhnUMfDftfWE3ou/
         ljUw==
X-Gm-Message-State: AOJu0YyZkfEjtQoTkLpvAj2OxAAwXAZs8197Aor4DD950rr4/ifQVC6T
	wLRE1wpct7frUcsqTHrB++Im/s77W7x+acnBve44ZX5hEoRD1+G1odVowVdBBne+e6c=
X-Gm-Gg: ATEYQzwqOA20X5xkY6h5Er6fah/lmV+1Ge1z/GKYm6MWGCWRNV1XDAKTD64BRr1PwvA
	CuVJ3NnbAz2AahHDHtf+6fMKfCDWskoqBb2mlNRyxTYcO9f9Y2FqwF39higG636i5MkrbCG/UNX
	FVLf3ZMlmQov7CtgUBwXVnVCUo9bhoJ18X0R9yb4yZvaZcGm5Iep/mucH8pgWdzT+Z91idsZMMw
	12sssJJkEDicAnFrI/ZmHucveOhvIGTAAO26d1b9RNZoM7zPNL80/g86Bxi5bS6nClw84SEW4Ph
	pRfXG+n7SeTs0g1B2RGR2Y3mFjU335LD1f+R1sWZl1UuXUH/0gF1WNbKCp1Dxr2ov3lx+skWwOd
	fcmjhVyyCB059uDSOgLLyRitfEp38hfYi4p/4lb0Bh9tYnLQLLOPIz3NgvZ9+UjOcR4sCwvEdqh
	TpDaoyEZbSY2BtVb9Ss0lcRKQiBLDLXW3OW/UusWU1xVn8Mmqaro5dvuNp
X-Received: by 2002:a05:600c:1d29:b0:483:887:6e32 with SMTP id 5b1f17b1804b1-486ff02fb18mr50977025e9.8.1774050973143;
        Fri, 20 Mar 2026 16:56:13 -0700 (PDT)
Received: from fridge ([195.174.58.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm9663418f8f.27.2026.03.20.16.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:56:12 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 4/5] platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
Date: Sat, 21 Mar 2026 02:55:56 +0300
Message-ID: <20260320235557.56298-5-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320235557.56298-1-emreleno@gmail.com>
References: <20260320235557.56298-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpu_delta was declared as u8 and computed as the difference of two u8
fan RPM values from the firmware fan table. If gpu_rpm < cpu_rpm, the
subtraction wraps around modulo 256, producing a large positive value
(e.g. 10 - 20 = 246 as u8). This value is then added to every
requested fan speed in hp_wmi_fan_speed_set(), causing the GPU fan to
be clamped to U8_MAX on almost every write.

The fan table originates from an undocumented WMI interface; a
firmware bug or unexpected layout could produce this condition.

Change gpu_delta to int and perform the subtraction in signed
arithmetic. On underflow, emit a warning and treat the delta as zero
so the GPU fan tracks the CPU fan directly rather than saturating.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index a29f34588055..b8f22d70e996 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2530,8 +2530,8 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 {
 	u8 fan_data[128] = { 0 };
 	struct victus_s_fan_table *fan_table;
-	u8 min_rpm, max_rpm, gpu_delta;
-	int ret;
+	u8 min_rpm, max_rpm;
+	int gpu_delta, ret;
 
 	/* Default behaviour on hwmon init is automatic mode */
 	priv->mode = PWM_MODE_AUTO;
@@ -2553,10 +2553,15 @@ static int hp_wmi_setup_fan_settings(struct hp_wmi_hwmon_priv *priv)
 
 	min_rpm = fan_table->entries[0].cpu_rpm;
 	max_rpm = fan_table->entries[fan_table->header.num_entries - 1].cpu_rpm;
-	gpu_delta = fan_table->entries[0].gpu_rpm - fan_table->entries[0].cpu_rpm;
+	gpu_delta = (int)fan_table->entries[0].gpu_rpm -
+		    (int)fan_table->entries[0].cpu_rpm;
+	if (gpu_delta < 0) {
+		pr_warn("fan table has gpu_rpm < cpu_rpm, ignoring gpu delta\n");
+		gpu_delta = 0;
+	}
 	priv->min_rpm = min_rpm;
 	priv->max_rpm = max_rpm;
-	priv->gpu_delta = gpu_delta;
+	priv->gpu_delta = (u8)gpu_delta;
 
 	return 0;
 }
-- 
2.53.0

