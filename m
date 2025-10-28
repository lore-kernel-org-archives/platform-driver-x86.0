Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27667340A51
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Oct 2025 18:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761675011; cv=none; b=LYkA4dTlGZKnxRlPtAPVkQLBfYtMpiR0Sa+USxknKC9iayQmSI1KoGeGyL1ZBhUmvuATVxgwuRj4RREhn6iGP62xrgk2b2Yik62ZMiThHpBF97DvKgSEZUgXxHho11T50wjGsbeYU0QiqIcSSvkBtHC0CMlkMtdimAg3YpBmVyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761675011; c=relaxed/simple;
	bh=uSUbl7xYmXs21tUPfi1JSz7wlqW9pe5nEGCQmgCQBwM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuwwuO3tRAp5mCUSpqlVl953liQ4Jbh5ySkNcO3yufLts6Win5XAB6TXPFrgtaIEMSx8wEbD2jJ7FWPNgnBQQ5ndGwJgYaF273iXZvGQhZhE8j/xi1KMvmZbxjB6m9eAuY4NP+mdc4F//TnDHOOYM2xid/MGsMj2ApMnJr1sApM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmhhimQX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmhhimQX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4298b49f103so2226579f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Oct 2025 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761675007; x=1762279807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1bf7O6qD6pyoi5mQKiDO49WRuqlvg7ySasyy9Hdupzs=;
        b=JmhhimQXe03M2Er0FLwCuYmlGYyXZpcxBm2oLeGf1lzR9R0VcygzgH/e5yCyRsGCQI
         ZuDUiKH6tYDwGsK3IIgD3SVJhDKCOinAqwRQ7yNTILlvZNOVDX5V6cac+P+2/vM190dv
         n+nNnTsS+q+BcT3nGRb4APdtak83MITDVk2bBBOr++exYtK/gsli47eKWAuhEdTjAdE6
         ErCoIBXGvbSb+sDmpUhbY8HQOYnNy5qvDBnoFhmxa3ohxuCtyFGgtmkX69PHOuOU///a
         GcvSUbKRyhrstszEIVnuVYpxAv93BVxzaKT2K/JIBxy846yP9abkvRhvkvJX8TOSiZJ0
         kDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761675007; x=1762279807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1bf7O6qD6pyoi5mQKiDO49WRuqlvg7ySasyy9Hdupzs=;
        b=Ed5EGjVe07q7yeNSlJOEqvIx7P5rqzGccb4R+hkSeq+Q3O9S9U/LhV0euN+okM6KBp
         4XWZ5e1RBOC6ke+vcP/qrzkAayVV9OtCSoNxuTV4eU7bwyAdQJc7CSPiRfhVOvw/SkR3
         sePahOvUQpitDE/woj0BnAgnpoA0IPywgI8r0Vc7jhfW0pHG2aqZzqMGF8YJqwR4ulNs
         zMbO0qBPScAuRYLOMvO/1DQ6gEiHK6x4aYe+1sn99p0bRMyz/0BRi8UENcUmH450SAHS
         gnA28X1G/8Dc3nsygMdv4fTKFqcPBxuAsh2vHxN1PxvxkqJOn8MpjDJuUL8H2Ptr/Apm
         PQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCUu1wIa0G1pUGrP4Z6XC+bWZSjsExKZcATeWF+QO/Uk9ZCannQNiZu4VXnewCPbVDG0H9Da9N1+yw9SOcFVPzTEiUat@vger.kernel.org
X-Gm-Message-State: AOJu0YyF+3RgMJlMMc5MHPSMJIQORfU1mXfaB1pJMH+AKlA9gpLAbHa2
	XPgdz6EcAWQrN61+IiS3ustCdBNr9fz2f5TQ4mibO7Qb9fRBy+A6r4+p
X-Gm-Gg: ASbGncviQFpF5rTsaOyROopYuLzdHe7ku+2coJtisWG5069ohSNbLZSmHdFOmBmz0XG
	oO16d9gEYCC0+7Y/5YebnGNlvLXf5PTk2HXciGoYdVce5tGAjQTCvwt/+5zBcbcPB3U51LdR+4K
	UF0htbryecazrZyugIgJgt8ts6ksgjen1twMvfZ/cm9PU6ihIHdqVBWX692yDZPn69I4NuLsiBI
	Q70KkEWuF+C3R128i5xZ9vZrVoJIl5NcYm53a9XfVfJkmnHcOOUL0vY3hFymK2FvLEfBNDF/kts
	JBCUYKjB+hOyxDF3ZN6bkH9TAses8zSNGPuJAoczht9iWurSjonX1zkHPunIJEVHWIrMQZ80VSC
	xZgNIM2Esb8sMVDfCLkA/U/JuK6TI2iNe3dagydY7RK13JHUWdCkaBuVBrRPLKkDjj6qdfZHfNt
	IfMbjZttfcEqX2rYKuuzJgqOAqYSy0ejZ6jDTGPu2zG8ovLze/Y/qjbw==
X-Google-Smtp-Source: AGHT+IEFHgPaq0qext4HFNUofyr/NDNb0DKgPyi347E/iNoCCS1FLhcKMe+kdFKCV/27Upe7+HsZ6A==
X-Received: by 2002:a05:6000:2f85:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-429a7e7c1a7mr4625274f8f.40.1761675007242;
        Tue, 28 Oct 2025 11:10:07 -0700 (PDT)
Received: from localhost.localdomain (178-221-6-74.dynamic.isp.telekom.rs. [178.221.6.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df5c9sm21650411f8f.41.2025.10.28.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 11:10:06 -0700 (PDT)
From: Lazar Aleksic <kripticni.dev@gmail.com>
To: kripticni.dev@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform: x86: Kconfig: fix minor typo in help for WIRELESS_HOTKEY
Date: Tue, 28 Oct 2025 19:09:05 +0100
Message-ID: <20251028180956.10753-1-kripticni.dev@gmail.com>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a misspelling of Xiaomi

Signed-off-by: Lazar Aleksic <kripticni.dev@gmail.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 46e62feeda3c..c122016d82f1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -432,7 +432,7 @@ config WIRELESS_HOTKEY
 	depends on INPUT
 	help
 	 This driver provides supports for the wireless buttons found on some AMD,
-	 HP, & Xioami laptops.
+	 HP, & Xiaomi laptops.
 	 On such systems the driver should load automatically (via ACPI alias).
 
 	 To compile this driver as a module, choose M here: the module will
-- 
2.49.1

