Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E467D3F4138
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811542; cv=none; b=pPV0s3I15PFjesZpeTLdUti/zecs1hvPsQN3MvIJmY5WQxMlu2LAHlb0/HkK07LdRcZFQBAmEyNQylwQXjO6a3is+79iYlRVOvSaXghs7HVLecxpGBilwWCtkV0yjZl4py3DwaNZT21TX4NET6Un+WPYZIo1vBNi3a7+sz2nVSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811542; c=relaxed/simple;
	bh=U1y/HpcEnSt1qhxjQZGShnUcZAfJkJ4y+tK3gTBIDF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dcPvDtV0QSgJKZJEyMloxS813tw2Sy8ioWGbJDOK6rKQM5j4d0z5T0gzzdRneII0dNERMiKbMbWv8E0YVweCu6K0tylM5ww/278OedAyqHjBgv1SUnlvz5sHM3O9bMaR5LEctOWCX5nIHAVua9WVZC2kNzLNsBIvjnHi1DCxSco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TEW4zxPT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TEW4zxPT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45fd464d51fso2403312f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 02:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811538; x=1783416338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=scT8+RARwhOuIO/1NB3ccqnPqf2VPa71YkQYnutKRCY=;
        b=TEW4zxPTEEojwf9RgtVnDItLCoLd4EjxgNIQlOXCpnYNqQEjBiB6xAr8VGXI/pEIVf
         fQ7iRDx1OLJOflPeyWsPen7yThhZK5JsmdIZh6qljYEa7TmHyajmq8fo+04ursYKeRrV
         oed4FVVqcY1s7x1QyYXmItTi+PYXWN+Yrkz7SJEe6nffrYX4jVB8b6NabM41Z2MaqXhM
         YgF98TmR/DDlZDDyxeTZ7Q5vlXsGGRaz0hT2h3LyrFaLmDCMi2I2UdvehbqHayf6czPs
         BC2sQYw0gXm8ZkHCLg6aDUkygCJD9QuInivzXYTUCfjbLOFUdpTpZxEpi8Ki/FuOUNH5
         TYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811538; x=1783416338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=scT8+RARwhOuIO/1NB3ccqnPqf2VPa71YkQYnutKRCY=;
        b=gLMpyxWpch8qWqqiQ/aVBIk26QrH/Csv5q6i2V3zLMw/++TPivHchy7qi0m7gVCsju
         OPQYzd33d2cz7YGxwB/Ti5EktryB2chbDNhXc5vvdgmN82ZwJCXCJzyDx1bYftMzIWpe
         Ul0z2kORB0RSThtXWhEOfTasB57A/3izGjz1FkIJNJ6AlswalELjJynbu9YspYWuQxPl
         g4GYTpXM+06bnk89UZ++ptvqbfSgiWepVWMMByo+RXQxvYwgQkrVLQWMrCszSNPpDWu0
         OiLBv+5QppsnJdDNMe9Q6fS+nVtveFsXcbGN3kqQ2KoPPM+4UWNTyaWTMZNrVVfFK/ku
         CQ/A==
X-Forwarded-Encrypted: i=1; AHgh+RpkqfuPd+rDm3CkvFDZL2mAifKh5GBLu1EtSQ6owLQkzjP1K480Zw9Oir/TZ7o6Gw9U303TA+nt3qWpuW2xdw2H0fmg@vger.kernel.org
X-Gm-Message-State: AOJu0YxmALAPWI2hO4OyprKaNuoT7spypbJn8dsLkpX/84x/pzxGcPPl
	KRL7VWM1q8c+GkBfVSNn8ZJM7VAsd6f4PlQd6VaGwQWAeMCCuuXVNtxez/BvoNHRNHY=
X-Gm-Gg: AfdE7cnbHVrwEQ/0r10JTWrzGWaPUkhWFcZ1KlKd7l35gWPq1q/VNyY9F5gAUIc8a9c
	nXQRBf10tpcu1BFzjRXJmp1UFI+sJrmyPPNP3TV4mr7Ex+XAFTH2M8XZjl5mcFrsbUgm8ELXN/g
	1hJuf7JnIQ3CwRo+geFwSVqTHEa6p9PfH0O/FXca9XMNhdUVZDWdIP/468b7VtoQ3VMSUzXJ9sc
	+7Uq9TxS7ffXCHkz8avzW0noSTi9bvatxd6eJr07oMQcv2RgA5wJUpSDzE3uQcmDG51JubhqPLZ
	8H9qOvovhFg8OUcQtm9dlvZkdY5/d6Fq4l9WMCPuCVxvCEtl9J6QRdIMt6grYV7we8sKCnq3bIA
	2Ep/P9gA6tvDhhJ8hyxQITZiGtEmWotPzDxLd1jgVjzkvyB2EYXoeLqoulgDM+uqMoc75NfP1QX
	xOAVla7i3py+dU91Sh5rnqEA4ShG7qzf+YvKgv0+VaMptQ76qahYPZij9R2jFZG1VGMssvStQeb
	DhI
X-Received: by 2002:a05:6000:2992:20b0:470:7fdf:61fa with SMTP id ffacd0b85a97d-47552f3345emr2565541f8f.38.1782811538346;
        Tue, 30 Jun 2026 02:25:38 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47563d195b3sm6435911f8f.8.2026.06.30.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:37 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 09/17] platform/x86: x86-android-tablets: Add include defining struct dmi_system_id
Date: Tue, 30 Jun 2026 11:24:28 +0200
Message-ID: <32928d9ee47cefc7dfc4c385c06bd5e598b0fca1.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=U1y/HpcEnSt1qhxjQZGShnUcZAfJkJ4y+tK3gTBIDF8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4teEOixvqpjWUVjCR1VYP/SkPuvIghPK7i3+ zvWZlo0hj6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLXgAKCRCPgPtYfRL+ TsDHB/9fue5x/XpmFqWYgfJsYcsBvPKkRzfiKTnHZC7NTU9DH8LyZkpP0FLyzY9V18GX9ICwqy6 /yl7XRDaBWH4FNVgfbY2lKQwMYj3phD6nlg5MfwB0JF4lBDI95AXS1XbpWSohrBZRmEPUaMMMLZ AaHDuY0ieXJRrprr2HUd+23qDX/N37ydlnMIap+2sSCzDNwYu5udKG/C5aQkKj9gslgVXn1kcfe w4TL86h1vgJKv0sTSk7tbRTYc5jbQ0Jn6DJlI6UpgJIet+CfWfuAUI5etspeeDKO1UuTs/7iNEW sCyZOg0yE2zf90D401OXi4zOM9rMdE7uMth9ohix4u69fkDQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/i2c.h> includes <linux/mod_devicetable.h> transitively
which ensures that struct dmi_system_id is defined in
drivers/platform/x86/x86-android-tablets/x86-android-tablets.h. However
this include in <linux/i2c.h> will be replaced by one for i2c_device_id
only. To ensure that dmi_system_id is available add the include for that
explicitly.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/ad0c801eb9c5814bd2430f1e8c370fee82742897.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/platform/x86/x86-android-tablets/x86-android-tablets.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 2498390958ad..c756961ae5fd 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/irqdomain_defs.h>
+#include <linux/device-id/dmi.h>
 #include <linux/spi/spi.h>
 
 struct gpio_desc;
-- 
2.47.3

