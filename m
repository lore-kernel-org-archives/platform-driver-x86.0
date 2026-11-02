Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793596836;
	b=qhM/Npg6I46sLOo093dTixKuxIXvcYeBS2SsWIlWysBFPifF8+mEkmSvpBCog51eU157
	 KaBCe0pDNkZVtoHknse/o/+ceVAvDny77SLoZUVwrCOCKgPVxgBAqv1ebaXahmvaU9AKx
	 rNtQhhSVPr9vxiZYf60xw5/AL5iyieAnkWRNnqe+utjs4nxsYfur1eqXrS8n+0/NbwaXr
	 0F6xohIYtP8xePoiDzO3ayOVTTWwKnMyMTmVK0vnxyqLiETPMnfFCZ8j3nLqgHRmiTegm
	 9CfWfOLcValy4dFXeIvwnlvbJaTkas1e8fsYe2qf9ieA7hk09TIi0XuQrsz/iDOxJgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793596836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/zwzuMjB7gMZZdnl+QUTbXm9u/vvQ4/5aNpnbuGEhsc=;
	b=ppggvL1E2p/Zun/FYs5N3NituABnxypC+miyFlbUvyJk4w3KPBScklXTds14VTm+Bdn9
	 JZ+CLlGm5hFlEUACd1DRqe6wFFzobMw6bjiikYrqh6Xks8yIrvpBEMoGGoAVn942nHtqo
	 hpd/17FC8Y2yNQLE9CUcLOph+rcZRwJl99L9gdkJ0cJ/5QE6PzO4Soh9K4zRlEMJJ3eo/
	 eIEOxuESFLP52XRbTniX+JYN5IvSNHAKJMF77pjWd/a/ztDHPUm75ivsEotxdzXkIx7L5
	 gRfUUKUWCHmpzNWMy+Y9YTh63K0EDiYdarwQtMXpckLoc7xY8TmmdLx5nuPWXwONgAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vo49LZvh;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA84606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 05:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA84606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vo49LZvh
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so4467756c88.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 21:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793596835; x=1794201635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zwzuMjB7gMZZdnl+QUTbXm9u/vvQ4/5aNpnbuGEhsc=;
        b=Vo49LZvhrDxJdWH6w2S5A/mz7matrio1Zhz75mMO3pR2jDUp0Q+uwgFubywXf8xwps
         MvWct44OH8AXQY0GNpiDZSn70/AwEEhNsJPqAt9EYnBxnjbXPY5ZHzRWs2l/QABeFpOR
         8FrAciAZrMK+RG/k6Y4wnOHYM6cPN2C1LH0dP65jbewn2bDS+u/LEe7o/nBUwJbJR8VY
         rY1cohnFXPu4Hv2IsrTrpsP5Hh4K72g5UylqPX3AWesKQbRL8rX6JcbOzCwDNEe8CO9G
         1BWyDOlLOje/zKRP8OtLootb85L8l6hHZHhh9VOhLVs5AHYEPSDmZUyBv2D3c/AXfiDP
         lUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793596835; x=1794201635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/zwzuMjB7gMZZdnl+QUTbXm9u/vvQ4/5aNpnbuGEhsc=;
        b=AL7RoAnOaunOjrgYSk3FWy1gyIlley67XROP2D3v8wHFlv4NGvtnjT86UTydcwonJS
         nbYHLiDCfwk1Xk+6REGVg2E3z2dtD42MQLvRFe606Vgwf7Iyjm8wH6vy0RXtTcfznUI8
         rf6S0Na8dWA7OPZ5WqtMJRS1el3YbJ2jSErxm2UuwQIhix9hmTxKT5H3Fv+QAGF9JdhJ
         ArGaT3jBiD3eFxd9janzHvVgthyOyxa21Jf/sGvbpkg1JlwtEMWDmIR24nd3OpRPmx3d
         pp3k74sm2OqlqSCfeqeS06Ft5syyIDiaqih3RceC1u1DjEDwk0scY/zJNohGHUsJRNxX
         ba/A==
X-Forwarded-Encrypted: i=1; AKwUvBzT70gPeJynejADvwYTF2gpjX5BuVXqrqvE6TNEChMZESJeLb5FNxE1CGoLxQ7RpU3nKg5CPxzgoTD+9imbSjCq/ZcK@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/o8m8tJdjY0AWnjJuu+3IEjSI5dkik6i8R/u0uH7We9WtWHOD
	F3ObJC4KWM71/IdDDCSVzd5jK9V6DSxyH85rP6r/+fgMPTiMkPjLmybt
X-Gm-Gg: AYBFou27pgVoNGWxjLMgLB58RqKAlJAi6MGJ8tdQrE76P/x9RxGhzaSQ8cR7OYQhxa7
	OTbZPqtf6oBqF+PoJYYQc7Gm1yg1SFYZpQafm4PGh+TsTmp7IWSHb5DVXDZ3gzmOXIxJ0l2p9nP
	8gahO1z4Z20es1ZcFOvjIkb0nx1N1dn0EirqY/NfNl+mp3HUgq4TlrxeeSA3vUtkAqBfW0QjASf
	aT1sEitaQ0rh9og+S5mZ4hZ7ZGnrUf4MZcn8zsN2yUi8ZVgCww1ZNQcaUrc8XkfczFVgWaD10hV
	UZahFbSnoW+sg1icDV88fD9RgMBX3xfkAGIzN7XGQqN1cqTnyoXL8N+GcS2OptsWFEFlW8/jzPQ
	mTLs53Yny5lxQD/1/63DQYQe87J9/mkwSUUgpwB7MyWIRgrgx+0amDmY+kqZlngT9GLCrhdFfyA
	h+QAfQU1+tWOpmabNjl9yu9NwQzF8cZEgzpsPI3RMbcjdMn6pW6XPXQN/JcHSDr40dQ1Y3FvGsJ
	d7sypiD8tww7aeA9+G5I8z5TQ4slad1dC6wkE/3U2ECo7nZXmIYfxhrZyY0fHQxW8aOkhQT6bem
	zf8lF/UjCQGS4cprFhSsSnSqQkCfxLJXNK+5SK+kZcWYg8QyUNEOnDXu+tC5OBXDk9FWUx6zvAK
	9wYVcnQIiSYFF
X-Received: by 2002:a05:701b:450e:10b0:14c:637d:682d with SMTP id a92af1059eb24-1ac5d69f6a1mr13396116c88.43.1793596835016;
        Sun, 01 Nov 2026 21:20:35 -0800 (PST)
Received: from chitransh.. ([2401:4900:ce8f:24db:d8b:eb50:5958:cbb3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm29741471c88.14.2026.11.01.21.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:20:34 -0800 (PST)
From: chitranshmandhaniya@gmail.com
To: W_Armin@gmx.de
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: Re: [PATCH] platform/x86: dell-wmi-ddv: switch sensor mutex to devm_mutex_init()
Date: Mon,  2 Nov 2026 10:49:58 +0530
Message-ID: <20261102051958.339982-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e3d30656-0040-4993-a3cc-fac474909cf7@gmx.de>
References: <e3d30656-0040-4993-a3cc-fac474909cf7@gmx.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Hi Armin,

Thank you for the review.  You are right, the sensor cache lifetime
can end before the device lifetime when dell_wmi_ddv_channel_create()
fails, so tying the mutex to devres is not appropriate here.

I will drop this patch.

Thanks,
Chitransh
---
