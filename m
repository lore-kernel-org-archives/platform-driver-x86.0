Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D232F38756F
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 02:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888989; cv=none; b=d9aR2p6776XkSEEQ39zqkb528rYc8YXi89oseK7OEkbLYpXgJ6HwMuorvOP/R783fRe3TJNYQnlTquMLH2X2JydN1HM+1GSskg97czgTfsECLyy+Ue+PIiYyEd975stlRBr4KD3Ci5jXWV0ku2ssDB5e8TSQAmtTFRLVP62OCSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888989; c=relaxed/simple;
	bh=t7uiBdls3lv7OiEXA8iMgDOA6vzogD6b3u5EkKw9yBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rR7TvIM6nrJqPh2Bgb8ONTpm2NpKyvDqEI7A+xcjRQlDAOQZ8q4RcB/vkOwbBVdjV5kX4EPWmQVb/UYFxgPbbaWCgCRR0tpy3l+SmupbhJOMhCOvT0akGsJE0rmqrwvnIY5vwlVOw6DnfijQ7pxa+e3rI7o8wecJFGpDel2me0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AU7IP8Dd; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AU7IP8Dd"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0cf039a45so329633eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Mar 2026 19:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773888987; x=1774493787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3xnuvBTm20lU9ioy0TlmhVylnqjZKhbjidK+UiXkzc=;
        b=AU7IP8Ddm/hqqe4FQ88O3q5nuLLqtSKitlufs9lBPT+3RR30T28E1UeKmRojyoCVNu
         l0Jxb/ORjxobzmNF7+kMS/cmTonfSha9RVDg0+fj1L6jH9eqK903Nt/QVUbC01gAM6T9
         lZgW15nwV80sVoTT8030dn43PYpxsknRpqEBzjhh5R68accQFKb42JQWQynmV8XIIakb
         D/o5Scuu5bmFtBPKJkCZEEDq9tem2fy2iyhmGG4gupirxV9rtWgPH9p2L7aiIOufm4oA
         iL0vHv3JE7RGcMjPU5k/uh+CSvVVpRslVGPPiJoQ3uFxBEN/5Gh9iHz4P0JOjoPgRgfD
         44Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888987; x=1774493787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3xnuvBTm20lU9ioy0TlmhVylnqjZKhbjidK+UiXkzc=;
        b=RvIelazN60qFSZXKKBo1tk7wx8TQG6tlwGvI+CWL6A2pUbrMs6YbEqXb7w11FBANaq
         ldKmwVvtp0gkrlfaeGRjIpZQIWelgECj4d6Q4IKswdrLzKC4zkpdoTr3qz0b3eaczbBQ
         p5u6uCVEFQ97O9SSQBnOI4iF3ghhAYR4IvS9o4gwWL/jrF8TrvxmzO8pl343A0n01p9P
         Bpc5k7SHrkzG95yb5hdXXvo0f9QPT5KpSeGMdrW3WxWsMMb+dva0MAVUeboq3myem5Pd
         OZ9kHjDfdVMCGB9mIYGLQ2m8YSu6MxV0xBkpFkBZ8aGLgzijut8YgixZtQ0UWRi6A6pz
         mKfw==
X-Forwarded-Encrypted: i=1; AJvYcCUW87PO63oQSkUtD/tjM6A+Dhhtq8VQANoiv4HVjjOmDwsoi2soRBtgWOhZpsogfSZymMEDiWPeg7p0cU9sUORs4bxx@vger.kernel.org
X-Gm-Message-State: AOJu0YweruW0kciitDawqN89cDGTbnAHRtdD/P1IHIbLh/yzY5O5hqjk
	ZeDpxHo3lDhZlOTxXJNHj9h/mWkunHbaa9jSsaBbv6H4QKmMEsVJpBKH
X-Gm-Gg: ATEYQzwqoiy9i1SJ9o1WjZrg4y8qWkyHnp7QSZqiqRV8OrNuBotGxrKglV7ycO0lJzD
	PPl4n2NsmI3Q2gTUTzKLgsawsoTn6mkocU0AOoNK1fUIjPvbWN+H3LE6pjQmV2uwLpCSKHseQZQ
	DGKr3ZB1YDQvHv8enBuN7HzhstAgUrNcTx0dQQJNqhQnDCWVG2GRtnTRpmTlZUEKrNEb36y9N80
	qukOzvmOkdNp12AifXt+JlJ6EAPWzA84/AZP7U1Od8ZQxeNvvMsaIwZIXWsR3pU2GToATwVu1mO
	T/ClHAPawvQBd7DFtlsMjTvLB3/V6+UhoIs37oRdROlzuKkl4GTntAg05FQrnpZudlAKjua19sC
	zPdlOjuPkRqNREz65glZcadY+Rw/jAARHZwtV7kF52HJf5EowPUQJeSiNxrlnWkbsu4fmBus27P
	DRfAN0KJE5GyC5Lqu7g1uZGKTaVKSK+LeN5ZFhW9oDnK1bZyL+GwWR4RYC1nvnU+R4pZFGd4z9F
	xcrCf+ocBpQfQ==
X-Received: by 2002:a05:7300:a2ca:b0:2ba:a2fa:84a6 with SMTP id 5a478bee46e88-2c0e5101a34mr2974532eec.24.1773888986579;
        Wed, 18 Mar 2026 19:56:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:5966:2bd9:1ed:e7c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a53fcsm8250983eec.24.2026.03.18.19.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:56:25 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 18 Mar 2026 19:56:17 -0700
Subject: [PATCH v2 1/2] platform/x86: barco-p50-gpio: normalize return
 value of gpio_get
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-barco-p50-gpio-set-v2-1-c0a4a6416163@gmail.com>
References: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
In-Reply-To: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by p50_gpio_get() is normalized
to the [0, 1] range.

Fixes: 86ef402d805d606a ("gpiolib: sanitize the return value of gpio_chip::get()")
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 6f13e81f98fb..360ffd8505d6 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -275,8 +275,11 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	mutex_lock(&p50->lock);
 
 	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
-	if (ret == 0)
+	if (ret == 0) {
 		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
+		if (ret >= 0)
+			ret = !!ret;
+	}
 
 	mutex_unlock(&p50->lock);
 

-- 
2.53.0.851.ga537e3e6e9-goog

