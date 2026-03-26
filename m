Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1881F351C10
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566722; cv=none; b=Ukzz7ho0Dc3TlYIwS9t5v9IPuyyjje0hvM1H1IM4ULa6/jV4yhKthrLwmp0sNtsbXYPor2WPrQWyfAjtuQB4JHoAf/3gDgzXJZCUIe5+xHz8dKKAwsv2ZKKN4AxX5roj7Xf6t7LVTG1KxUshxYUFZIuAZ56BPOMWYEhWVI9fyJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566722; c=relaxed/simple;
	bh=K+AmH6uNRG+7A1J9LZNzt7+JaTmY42V47ueykQUe/Xc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYYQJKkJN1BmkjKmfuwkRN5n0p9tq6DOqDWUqkiyhaq5LVktw5T9A0gNlw1KtIr7dirPwOM8D8aHuIESdWlJyEe/Ztw9oe6B/8rIKk3WyZc5idhe9dWzgLZgDKcPdYlPsDhp+RGqiH52lONjqS+zFDi9A2xgqV1R7OtVE8MkmlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U521ICKK; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U521ICKK"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-79ab3e26cceso13368907b3.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 16:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774566720; x=1775171520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1j8lzZoc0P5Ygbunqje4X/HjCJ1j8htOSchckU7Arkk=;
        b=U521ICKKwndUr7tJVBS/ezNvE2AGZ0ASsorDneQSFNtzZWa8x3ks+xzLqpj07nTaZr
         GJzE7X1QpRliS/B86fquZ3NI41L1lTiHJMmM+SsCsk7d6WPZTNjNcdDWMCR1Q4WIbMYM
         d+j3tT9Ib5cyuwhiSgk4ouFrw2y2v+7qdBbBtOovO0YiI6wpPYPZcvKpGRMWe4K3/GcX
         Zf57D6MqtCninWtQVY5SSjIfvUVBO2gZ34jqvhd53oPMFjTWW9lbS+3ynl5IRh6XlbyK
         C0376KJbarNCi3Snarhsk0OiVRmOBs97jG3NHFAFp3UE1tSuJxlH1RxlAE9LUE1fvWgO
         +d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774566720; x=1775171520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1j8lzZoc0P5Ygbunqje4X/HjCJ1j8htOSchckU7Arkk=;
        b=rCwd92dnY90MecSAfU7mRFuO5dqRr4+4AO3PqZIBBpuoVMcgaFb5F1pSdU4m9lyltj
         tNA8hZIxxSwmSyr77LoesimQ/dRkqQTde0jTOFLWwCufhrrjObAXTMugdu+oUKAoZGIL
         oPDuNI8FccS1RBzlcX9zPaGkOUBMh2NZhyrpYHd0ELKTHqgfGV+3Rtx+y5jnqxGxjmlR
         G2Uv8pCdSLtS2+3kszwOM63stvKFpZaA/hrBHyVTuELEPYLVLopU0m+qbG4PSkSQ5WO6
         n4AXSyCA8qT09oiGYnUPSx134jOht4ZHih+kmSfHksqmRmL4QZgVLHXPVqa+bARkLz6J
         XZDg==
X-Gm-Message-State: AOJu0YwdjEFzJkF22SJiDLK8IwITmLU/CSsTM30M103I6hrGVbCOk2ih
	xFDgho5Vr00Q/lkqvtzG+XHN53TnZuDCvMZgqs0R+T8+ND85WkDY1Wsb
X-Gm-Gg: ATEYQzz6ShZPfV0Rkt42NdqpGpWtlWKEW1KGLwL4PIAh8SoiN7/1uznuTdQX1cldMUL
	+g3Bu1AYpqr6Kc5v8G1FvAVpVPir130r6VvigChVVnHwiy699lhrXHHzKxSrSbutWdHwTjCMUup
	zv12IncXF9v7A9kjAqU4WBJUmJqCHjHjmh5Vgge/nJbEaHLKYVyf/3EdV6yBfGZCf1kr7/kecEk
	uXEvxL1wHJhfuJH90D8goMvbPIflQmoxkZ+TmF1UGuPTngDN4Usup0oHpG0Zq5Yj1s0REocuS6f
	HsfxzBJ252Xoe3ie0PTRnG/kruLHBRvmIODE2inT+s9yyeMu2bZIfOo6/M7NJBVUhBZads1hbxN
	xRGjibrk47wYsQ/44lEVu6KUdeDZE+jK8Bwn/sbUOiNvIFg/pV9byXGV3WqlAtjN8DkiiZSAGEZ
	aIAcLe26QUpuG4ver8Sbya/+tBRjHlmfMgvWA3ep3V7w0C+BtyZY99VTEWjh0TH9rrwz8WIWv93
	PC5s/Pxx7Zlx1N6fWMwv1xb
X-Received: by 2002:a05:690c:60c6:b0:79a:d2ba:3c24 with SMTP id 00721157ae682-79bde0e66b5mr2037137b3.41.1774566720157;
        Thu, 26 Mar 2026 16:12:00 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79b1e3fc9fdsm20925527b3.38.2026.03.26.16.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:11:59 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 2/2] platform/x86: asus-wmi: Refactor control flow
Date: Thu, 26 Mar 2026 18:11:54 -0500
Message-ID: <20260326231154.856729-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326231154.856729-1-ethantidmore06@gmail.com>
References: <20260326231154.856729-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor control flow in update_screenpad_bl_status() to avoid
unnecessary if statements and error checking.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 80144c412b90..f8e389c54fe4 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4422,25 +4422,17 @@ static int read_screenpad_brightness(struct backlight_device *bd)
 static int update_screenpad_bl_status(struct backlight_device *bd)
 {
 	u32 ctrl_param = bd->props.brightness;
-	int err = 0;
+	int err;
 
-	if (bd->props.power) {
-		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
-		if (err < 0)
-			return err;
+	if (!bd->props.power)
+		return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
 
-		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
-		if (err < 0)
-			return err;
-	}
 
-	if (!bd->props.power) {
-		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
-		if (err < 0)
-			return err;
-	}
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
+	if (err < 0)
+		return err;
 
-	return err;
+	return asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
 }
 
 static const struct backlight_ops asus_screenpad_bl_ops = {
-- 
2.53.0

