Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A371B33D6F9
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 10:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777199275; cv=none; b=pDOBolFAb+RPJVGklE02nHFiVqqVMwLSn9Udb0SisluAc7riSRPH+UQnTI1UN/U/RB13ZfJrKIUSUzHs7IkuY8weceJi/qK/G5ua1h5xnY2gDu2YmmD58tReYfuDZcwZjob+Bisw8c68dEd+vPZe3Y1mI5VvIxHmNvkT77lnVPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777199275; c=relaxed/simple;
	bh=L9ifB2+cy+2LDzEt0ZlP5b8Q2sx5ZkyS3MOtdzgWJDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NQRJl0Xmpgyz7GUaZST9KMbyxRfqeRIvuOn0tav7GZnhvYzNYIkENzE0tGN0jq8t9ug19MTO2WrlxsCpUiigxEoCYG0QHpQ0qMSPDWai9WTtu1W6hZF8rX/phVMa1+oKj28GiDbAQpAuBX0BCXOmV0dOZebFM4C8z3HJsDcQJzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKJ65eGR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKJ65eGR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ab46931cf1so70277995ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 03:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777199274; x=1777804074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yu/AcDmMgQxjjXzwRaT9ZvzbaZFSbVyof8iOxklK4fo=;
        b=SKJ65eGRDCeLUr7mpzPs0veVtJMFd2DT10u7+Gle937ZCDZCQooKlVIt26UpSAMejI
         bPMOlqKa9iJoL3JyA0xPO7uvc/PJLNDKV3/xvZSuzE15EpYqFECbilcFsStAO5chlLQa
         ZpbDHmLO5VCPAONZtriBD51PKDUo1vpd8Rix+JVrhG5eBeOEf46FHBKr7egt2NCU3B93
         HiCU+fKhPo1NvUpSOUoRVLDoPklZhzlFoDJsParloub+af+kUMvpVUzcsSM5oySSJVG7
         h8QPH1g38iCwTDkWK55Luzyy6j/0/kDj5yujRZlHG//f7VRZPVW1OwcZoIe+wOwXqgPh
         9z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777199274; x=1777804074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yu/AcDmMgQxjjXzwRaT9ZvzbaZFSbVyof8iOxklK4fo=;
        b=sy7Q9zhkYA42DDU0Mt0KahCjLhF5sYWlSktxCtChDBw0co90DcJeuGmMPJrU0zBO58
         qIMF86mAN2cGiHeai3LoVdOEd524SSK7zGO+APmDoJMR+nnPY4t6k0WUhpaOIOiTJ/DK
         2V8hCdEuGrWfjWzhIR+B7I8L2TNbAToW1zilOVc5X7srlMgC2uyEUKscw8svKJdFMUkU
         fkze1bW6PMghl/V2dGNq0QskZImRj4txei7JdnnKV045/W3QPnwB2li6bkg71qRfC/Uv
         IctCBLPxlytLpbyV0vjHMj89qnj3aOVEAQ900WhiNuSM5gJZ9W3MY+4LFssfL08+M5u9
         8Y7g==
X-Forwarded-Encrypted: i=1; AFNElJ9L5zhR8h5RBvB9D+I8OuMtH2HPik1M2NF4tK7WHr9f0mjvlCE/Sln1V5l0JWvq5ZPZi/Vn58QgnbhFJgqZ7ALjqdxv@vger.kernel.org
X-Gm-Message-State: AOJu0YzLe+XzbRcIGFXMsTXKyiewqn4k/VvkXfJb3e0FlNHVlUft51lF
	/bcUdpy7tqxwNzB5fQtnN4EpZF+8RBdPc0ShzguD5qJnHIL3utSL3F6d
X-Gm-Gg: AeBDieu7zrMyYHHbFcmkRAr+xs9LwL41xKp4/f7MdejC8uUC0vPJdCpecB1ykPVXbye
	b9TJBUMsKqOKexb7axjVyP78Hs7pjWZ6NxUJY55UDVnfvh53EZp8S9uNBcfM3Xyhw2NnDYLR+8N
	NRCtOWueEk4/klbMf82tdtRwkhAyH1f8lbZ9akveRozUN2JWq7PVV+syEfVcmuw4XxKqgqAzlWi
	WZ4dLgU1n/QOSjrkDfilVXY/LrxA8YIMyZUciZ8TkWKXvakuuaAEOAkTfHjiZ75C64+BDwlK8uN
	7j6/nxmiL1K54XZVP5IWzl2P5jKp+Lt6PlNSNn7bDbEfSanl2AQEWyqWJVnl1TC+H0b8Tsf+Q/W
	6sTNTlvMcLn0lkqgJeE49jdkNRXEsVNzdMEA8aU9X68SxQI/SZ5BmfOASc7bBp4uMkiVv0+ltxG
	c65xdgWfSXAl3bTBKxZiJwypyCXEPtRt7XZzvpzG0R1Nqwkr0=
X-Received: by 2002:a17:903:2c0e:b0:2b2:9a70:3f0a with SMTP id d9443c01a7336-2b5f9da626bmr326085495ad.4.1777199274030;
        Sun, 26 Apr 2026 03:27:54 -0700 (PDT)
Received: from LAPTOP-DV5I1MV.localdomain ([27.19.123.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0db13sm293629615ad.53.2026.04.26.03.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 03:27:53 -0700 (PDT)
From: Yufei CHENG <cd345al@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yufei CHENG <cd345al@gmail.com>
Subject: [PATCH] platform/x86: lenovo-wmi-other: fix uninitialized variable in lenovo wmi-other driver
Date: Sun, 26 Apr 2026 18:27:24 +0800
Message-ID: <20260426102725.3204-1-cd345al@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the flag relax_fan_constraint is set, local variable 'raw'
is never assigned, and lwmi_om_hwmon_write() will pass uninitialized
value to lwmi_om_fan_get_set() resulting in undefined behavior.

This flag allows user to bypass minimum fan RPM divisor rounding,
but assignment to 'raw' only happens in the non-relaxed path.
Fix by defaulting 'raw' to user provided 'val' in the else branch.

Fixes: 51ed34282f63fab5b3996477cc56135eb4de5284
Signed-off-by: Yufei CHENG <cd345al@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa..6c2febe1a 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -349,6 +349,8 @@ static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			 */
 			if (!relax_fan_constraint)
 				raw = val / LWMI_FAN_DIV * LWMI_FAN_DIV;
+			else
+				raw = val;
 
 			err = lwmi_om_fan_get_set(priv, channel, &raw, true);
 			if (err)
-- 
2.43.0

