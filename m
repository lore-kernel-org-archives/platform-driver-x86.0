Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2B208D0
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 00:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782173550; cv=none; b=CS/e+L6i4PT78bZ0KrMedvm+l/lPSuVIIYPUKV+OHaOIvdgPMogpQTYHg+sVL1hrTaBF/93BB/6YcEfkWKsDDXJihJjPQPealuspqE2ayEaHCMrWrR8JUAxuner7W6LAcjJSlcYXRm0iKlXdkRb/Abw/PskW7sbtW1VSOCLyqWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782173550; c=relaxed/simple;
	bh=aqUuOAR7Z0bWhjbvt4WGNMXF5MW+syLLuMUTRbgkroA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLFrZXnZCGQb3dTao6UMf9XdyTapG5qb3kRHZaqEfcx1DnpAY1hXvtUBn04J98kKyNF4OCXCYzQ8QhumjE6EFKoP2doguMoHC4oXB6waDgqP5sM5E5BtxwyehGep4KuRFYSmuDJPgTfgTD3Q769Qj8JFGbZ6OrIyAOl8cmfuYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X844jIeH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X844jIeH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490a76757e5so31461235e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jun 2026 17:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782173547; x=1782778347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqUuOAR7Z0bWhjbvt4WGNMXF5MW+syLLuMUTRbgkroA=;
        b=X844jIeH0e1P4UsQ9YK2uPpYVF2XPAEMca3EB2YGROgPi2eyJSdbHYqkLDErV/g2Hd
         6INjYTA+XCN/Y+ekAhJP9pfFyb4SOzrDbelAX9tc7PVkXfe0MPeBimF0xmb+kxC8ryes
         n5I2C23g8Uj9LBszmdlZMvRcAG0XEUrQGmKP37lInGKN2SbEvYnpJ17phYEku6VvV2Az
         xrwG72WLUkw5jGwRBRQyP/T+qNEzx1B/xUCYgktIH5EiIyxj3T28GaVhERl28AeLxvlz
         ccAdeXLZ1hY0clGelDKqchh4HKdqlZko5lfmKK62NK8i0Q1Af5P47zB8Ip1FswRoEGy1
         qB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782173547; x=1782778347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aqUuOAR7Z0bWhjbvt4WGNMXF5MW+syLLuMUTRbgkroA=;
        b=QiiaYa+/JrR/gmXfPLu5ePPhFt9iMuGRMt9yAwyGWZ690v+HMwuHl0Pkc2z+ZTTQNo
         wxlgiDvHCTdEwFExWGjHfsX7ib/Xr4MxQm9DMVLnXsp2X22+EplDedQ5UptOSMBHpT7Y
         C43pIjomj5Xg+N0i2bjTTwM5Uf0OWzZrxTRgINF7QcdscrvHuLZZhUHe21MrCnmgg0Ru
         VK5Mt4oSyRgNwgRXQxkKja+FcCR4PP/mxRsglGz1hKhBVC8vnN3c1tqpuVtDmXyP+IO9
         kle7WYTL8C2kPT/V+heIghQTjg4DdraMb5A8OFWLII/3JHLTnxn3XeN7fknWe09AFsEy
         Ew0Q==
X-Gm-Message-State: AOJu0YzoV8OEZdAKP4ksuja9jpdCUWFSsRCUd2p/gju7tXgjq6yyWr7b
	0G2a0WF3K5SLi/TqBhCp3Ed7eEnUGQhSd/cAh1GMqFacpwFeJ9XmKxpC
X-Gm-Gg: AfdE7ckBOXQfALa5OQdm0MFlBoq/pYnzt4nMJZcl9oxqtJSOQnA/1tmysgIWtu8TFQe
	AOhf8NBWjEabgr2uT5zMkPcjkT/Uy1Cpcc+nFUmqZzja8VBCjoUceg8cNbT5kwh4+w3vZgTWnvk
	6xhrr3zgEP2kZf8uHfiJ5zEu/U6OzbJqb46cuYI3dAQf8HNhhBJ7kiFyp7cVDI3oNJhdhKmIcNJ
	TdZAUduYqQlbz28P01C5OUaUUz298XN1yXCINgx3gBgBdr+uPfOObxRIW3YV24+pFcEJFjb4Q9H
	9mMqJ/D5wxrJrMQa+hcChl90qMxBCspYxyfWB3y7tlEhGgecu4iJ5+dOzCJhcs+djPaD5euvTqx
	g2YRvOEGj3WlwRM3TDtuYuZg75/B0QuDqoqzxN4Ry9IKArddaM1d8wcLSK7NQiCezTuUC+5tI0e
	ABp1M8Jyc7B1L5L830rK+Ccw==
X-Received: by 2002:a05:600d:6452:10b0:492:3d05:5639 with SMTP id 5b1f17b1804b1-4925b3bec0bmr3248305e9.36.1782173547166;
        Mon, 22 Jun 2026 17:12:27 -0700 (PDT)
Received: from user ([104.28.162.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923cbe7sm237235985e9.8.2026.06.22.17.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 17:12:26 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
Date: Tue, 23 Jun 2026 03:12:24 +0300
Message-ID: <20260623001224.7838-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <412e1b09-a442-4156-bf21-216ad8177096@gmx.de>
References: <412e1b09-a442-4156-bf21-216ad8177096@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin,

I compiled the kernel while dropping
HL_FLAG_AUTOREMOVE_SUPPLIER and the kernel
functioned normally, all my hotkeys worked
and i couldn't find any memory leak or issue
with KASAN, so in my testing it seems safe to
drop HL_FLAG_AUTOREMOVE_SUPPLIER.

Best regards,
yahia
