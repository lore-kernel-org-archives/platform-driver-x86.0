Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5576025
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2026 06:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783751034; cv=none; b=eDfxIaw+7Aj54xhiE/iGl+L/N66aw6nlxMiEiXK7uiO1TlLQI5fqagq6LoVHyskJ8rsuUWTvLPmigi1lY1Qq7sJLV6qxTCojolnnRX4n9cOZ1Cfj9JQkSK0zsmWgomivUxAI1abI7ro4kpUcAfs48/5GfJ34UHKtDCYwRtiMV0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783751034; c=relaxed/simple;
	bh=S1/0jwBMfcPVFdbh/v4avu7b0dUuZhaQPjurjiCKQkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FpvigsihrhMKPMvvrCCs/jz4hSK9Yd1MjH4Ieq/iRY6IUc2Q/j/7D9qqgVaRJkrodBeoSLpmmTKhid3zcXqja542LqCjelOMwfDIGQW/kZnvLPDhB4yFaZ4NFfZJQYvYgjF1L4gMHW3hdZi1ap3wHk0FCdHKBYs4WOMu95pqKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lalTUBvC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lalTUBvC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cae1a3a744so11037555ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 23:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783751032; x=1784355832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XkRstM7R8Vg66nTgVC4msTuOth2Fa5G6vugexDMuMcA=;
        b=lalTUBvCpgJXpjePq6VrYiX4K7GeSyr5xJrnLcyrftAaoxj4o4snesDObypzSN4zB+
         6Ad0dTJ4z/cKf9bWp43rSIu7yyRnFlsxIbCTV+7i/fQoNWuHrDomimb+2kOvjaT1rNJE
         /U54QYHyIvLeowSE559oSSUi9ZReCVVLyVC/n0R+nWnUdqAVch0VRqWhQNv9RXvRq6tT
         jr3jLIsgNaTi/S9obogJtSyo751uvUfI0QYtE8wVn5sKlJmko7qfcYK38S4a5gErEEdj
         CwiyfTIJO/K0xugMDVVHIkn/rUD++JJWJu9TsLYS8EIf9hSKp6hvXWVw8BaE8hToEYFD
         GPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783751032; x=1784355832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkRstM7R8Vg66nTgVC4msTuOth2Fa5G6vugexDMuMcA=;
        b=BsCyqIBDo6pHFclYaYV6xQFefbHtrHgHTXG2kgOX8VcBLVSyP8J6TbeZJWDNQ35jIo
         f1jCXkHrWK5udFI8PxcNyYOnq//KF0aLDQTy5M8MpDHNzsX+hS25fAPZJtLjT3CPZm/3
         CJCz7L/baGLAPoF5kjGscYohHoyPE9n+zDkz9nYf5QHyXuf2KXcDDIAFuempKsdslvwF
         6hXbsFQHbnj0ZJQRCK74oAjWf3m5zsI78TKfkd+cWLpW71E8IAPiJ+ccMpoD1xeJdt7q
         JLnqHB/eOxfdnXKwqAuUigvEDhIxw8ytLhqGUpbifAVneLHAYrqASfGEPeDYmZEWc9CY
         VumA==
X-Gm-Message-State: AOJu0Yzb64kSrt6nKyv+8s4PWutyRtg12CXhrggG8g4M+YfrDyOa9pP3
	JJt43mVBkZloFXkPdn+caL9BCXQLx4rdkOFqU9RlEmzz3W/w+BjUNvrk
X-Gm-Gg: AfdE7ckZglCnV+P39B365BeTr4fwRL8L49S9SBcxwyRy4dNxAPjGh1MpOb/e3iBTqPF
	b/58Yt/8gcO8zIKltWpI7a43kOnmRm0eOBzAMtp3ryGiTOOMan/DIBZfYPXwGOefoAGhna0YOJd
	aIyr1UghM1nkB6uv1y4piSV/vgucRK1ZVj3UQ4+Efp4dwE7EFE27WpXGlXKy2Hex2nQUaTBXktG
	HaBi3hnpqf8rTpOM/BATHZoBfA2QpOKN8i3a4ruUc2OzWcsOQj7kDO451wFvpKo4Xj+jmJvO8AV
	YN1PcET9Bp8ePrJVun7Ryq9bvnHL11ZOJsxIiB200yeUWIhqnRCFSMy7zzM2H2q3r0M/RPv4sui
	e+hanAtk6NVy81wJ2RcKeowRyHqK3QyzxSQmqvKAoon5xYhZZw78O2Gg9tu/vIDSo2w2zvJYUjK
	xjZ8nnE/H7SxJS2vcsb5PuMgnTXK0wWS/1wI25jf8=
X-Received: by 2002:a05:6a21:d83:b0:3c1:fbf:1e2e with SMTP id adf61e73a8af0-3c110a12318mr1877132637.10.1783751032179;
        Fri, 10 Jul 2026 23:23:52 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:a02c:24ed:3127:342c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca79aff904dsm4103117a12.6.2026.07.10.23.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 23:23:51 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	oliver@email.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Fix USB-C Security probe failure on unsupported platforms
Date: Sat, 11 Jul 2026 15:22:49 +0900
Message-ID: <20260711062249.503264-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On systems where the USCS ACPI method is absent, acpi_evalf() returns
AE_NOT_FOUND which maps to -EIO. This caused tpacpi_usbc_security_init()
to propagate the error and thinkpad_acpi failed to probe entirely on
unsupported platforms.

Fix this by checking for USCS method presence with acpi_has_method() before
attempting to call it, returning -ENODEV immediately if absent.
This follows the same pattern used by other subdrivers in thinkpad_acpi.c.

Fixes: 67e8d1e9cacd ("platform/x86: thinkpad_acpi: Add USB-C Security (USCS) support")
Reported-by: Oliver Lin <oliver@email.com>
Closes: https://lore.kernel.org/platform-driver-x86/239c8162-e1e6-4b49-8292-35547c5a525c@liuxiaozhen.dev/
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 91db4c8eeac2..85ed506516f0 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -11368,6 +11368,9 @@ static int tpacpi_usbc_security_init(struct ibm_init_struct *iibm)
 {
 	int err;
 
+	if (!acpi_has_method(hkey_handle, "USCS"))
+		return -ENODEV;
+
 	err = usbc_security_query(&tp_features.usbc_security_enabled);
 	if (err == -ENODEV)
 		return 0;
-- 
2.51.0

