Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E4A25B30D
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 01:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784077446; cv=none; b=fMQrObRSW97o+m7p6RxRzmFPNkwpHmuUgj3k4SwCJkiXSCpPN14jriJWu3nryOa1Rv9SXnoQNKxa0UiJHzkl+zLNW451uZmgIb8KWHz/qyIoPvsAzMFXjBamZRi2OtBNUimrDWq7wbnbKMIS4YDAMG/rJsPvrTPRjvBOTOehmrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784077446; c=relaxed/simple;
	bh=odsHPKGRkXpnbVJrCXqgvkItzFXDUdiBxoNTUL5323Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D19FFp/s4swgOXnTbEBY4QThPwMFpSinkTmRL037x/279WsiwfizhEcrK2gD0g/q0lnm7ffMIwIRtDg3e+FSJMZ924Xd9Ej1mpDmbmgzeYRiLKLVB1Adog0HSPoYJKWrQDA7OdKk+6OJJHgEjZBnns6oIf9gK8BTAsVBdw3say4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqDGo7wB; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqDGo7wB"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-667971437d6so7879427d50.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2026 18:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784077440; x=1784682240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T92TVFn6rhO6HmCv2F8f/L0PpErBRmmCEWcKmmWl3MY=;
        b=OqDGo7wBNlHBZFvfh5AoXJbhq86Ke1h0h2Md1W26ibZiZ2tuAZZd/3hq5kjBXEMMwW
         kkvXUo76NCBpdk7F12eSWpIfvNM+wc6A8k2DPhncy/twSXb4XF9XUVtAO7ZsDi0DcAS2
         Qr2idux/+0K5jJPFyEuPgN6I5xK+U9ajpgZ1BW68AIa0btKFQOri3XW1zqXDF8OZ4VpO
         KelqnKGEm2aQpAWS8ubPtNqwKrRsqJwS7xjDcrJn/2yjDlonpiVKWhe2mSNk9QPfbGRl
         EAw7q/EmH1L2B70xPZ3pksyM4oxdKQ1OpGh2mNMYKAPce5m+EL8yHSJK9gje1XUxStnR
         gkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784077440; x=1784682240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T92TVFn6rhO6HmCv2F8f/L0PpErBRmmCEWcKmmWl3MY=;
        b=mD6Idxk6UDRwSoZZxgUGGdY7ZYjfHKD4F6snwdM9RNaIZ9YEwE9+0EyOJ4IxA6XONH
         RQ8BgI5AFOWnr4dlkYMJtYjTy/7QMiRd8gDIcmOXiADTOKR94DvOQ65xhXsftFFLJYf2
         yoTemjQ5T46/n8wz9jfikCYvzdCAC6S8tEGXYUI0SAKYPk8RiiybEqNh+sa8q9FXcWEF
         gvhjQBHlH7gt6Wxxk9UdLo3AWc6KobyJov723DOI4CiZ1xE928pDSO+oX7CKmc56xU7V
         KMMwoEEvTyhZIPhvoPI3zfxYGM6NXJgdpOBIRTNhlQCORCdEaCmn/9xuWAKnJ//+K2iI
         Fh3w==
X-Gm-Message-State: AOJu0Yw9TdAQRy+nBAnGqRI4sSi6/fYxof4/3MrSgVAxoqrIuMpFiDrB
	t7gsDSzT7IqWqnVsOEWHQl8WR03N05qJSoKdpk9kSsE+RsdlsxaR1ZkLwQgWXms4XzM=
X-Gm-Gg: AfdE7ckXm2dBWo3FMtw1SCO6MkdMXzWRj3IyV14MoocCa+1AVQ9cpUS2OangY56aYmP
	ve4rI84iAu3reWubUqdTuOD7AY3w27Ny2UKq3Iz70oyixNmqwSenIFKIkBiui7jQCia+Vps7Q8x
	FmRP2ImKfqqE38AcABjmqfd3g/hnFaPiW0vmCpaOQ7wMXskrQPTUWJzv3R6ncUrNUrWw4oMp7SW
	N/7ml1VlM+y+IyGdVRvpXClYl0afHnxnEmfPcRUj6gA+8pkGsHfXf6iVzYvI78ajWfKXBz1gbTN
	Yae9KffuQShTFDUUmV9jUPLGgco8Df+6qffvrGxmW/AD3LOZwm8bzmz6H+C423KoJjPKS25iIND
	DNla5Jbr5xVHKFmiT2GqkRXeuPbxKxxry/Y5z7qidgtSzgW0nMLRlpPi88p5ZqZI37oJ5y0OSvo
	AQs0aARSfgGKxs3rJi3jKvANdk2xcFw3dWbd+u+1ltCq0B+y6F
X-Received: by 2002:a05:690e:488a:b0:667:d3e3:170f with SMTP id 956f58d0204a3-66813398a5amr609793d50.67.1784077439997;
        Tue, 14 Jul 2026 18:03:59 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([103.161.144.215])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-667874c2d15sm17602863d50.0.2026.07.14.18.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:03:59 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	oliver@liuxiaozhen.dev
Cc: platform-driver-x86@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v2] platform/x86: thinkpad_acpi: Fix USB-C Security probe failure on unsupported platforms
Date: Wed, 15 Jul 2026 10:02:05 +0900
Message-ID: <20260715010205.514132-1-vishnuocv@gmail.com>
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
Reported-by: Oliver Lin <oliver@liuxiaozhen.dev>
Closes: https://lore.kernel.org/platform-driver-x86/239c8162-e1e6-4b49-8292-35547c5a525c@liuxiaozhen.dev/
Tested-by: Oliver Lin <oliver@liuxiaozhen.dev>
Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes since v1:
- Fix incorrect email address for Oliver Lin
- Add Tested-by from Oliver Lin confirming fix works on ThinkPad P15 Gen 1
  and ThinkPad P50s
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

