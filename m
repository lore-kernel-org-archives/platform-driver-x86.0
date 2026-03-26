Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75F22D8376
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Mar 2026 02:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774493145; cv=none; b=r8fyw9mcWxpG2XtEKjd9osIBycmESjjOABlFzPmbqBRTEQTGATB0hLJ37ok8V9tQ/Q4LgnawJPM8gSi2+jdfnAts/FA2tbsRdOEX5ZHlnUbeYInxq9qMKHBXXvRFrCgz1asLR3OWb/asgesHHo+HBP06iZbLW+7ykjpr6jUm29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774493145; c=relaxed/simple;
	bh=ih37SNi06IoAHf7qsL4oAH1Ny2YjjprNP3j+rRR/V+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EpI/ZcsnZhLBFtUCzlAy6m4yDFNmfhDocp73b2r6E2Pgw6eyQYDLGsRA+ea3T3aOBf9SsIPmR8/G+iYH9hncUl4Pl4b1TWUWC/2qd/9glQffoQXraxsoMtuSzUdP2yKM1rD8mgFWJTtmXJxYprpESjTr1OvwzY1C8FZFhRXOUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFQJ0TZ3; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFQJ0TZ3"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso332243a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Mar 2026 19:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774493143; x=1775097943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvhCQDk3ciCMOwVqf6gs4VS8DOqJPXMl1prNHK+3NPU=;
        b=CFQJ0TZ3UVhLOV1T+rUBpo8wRR+QsUr6r0O5ZFvynEOpszbqWUfweRi6YDtf6lQDJa
         wxC/S5m67yMJVQ+vFjDX0l+iuBqrIcLc2HlJj8rlmFsIjN75L03s9ODksVl3+WLXqf81
         wh9Py6ZCA4ZwxvVq04gdFCMNZP1sBexJaq2I1BjS4d4xP5D4mJHYaCl48/GMxKhL7GHw
         exUBZoj7ZbLdxJJmYLZrUhzKBgnnG4Qo00L39uXTcvApSazWBJxO3D5B6UU4nxu0rPVq
         N9xjL8X+PqfGKChjVyvGiN2oJ+7g6SLkkPgP8y4cimIMnqkF6DTaQD/+bWLe8a+yIntB
         SCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774493143; x=1775097943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvhCQDk3ciCMOwVqf6gs4VS8DOqJPXMl1prNHK+3NPU=;
        b=VxIyjKp+0Y3WLZ5ryJe7CO4S4g4u7OC0qpfi19s9+VEMolTqgHCSS8vWZv4kp7MI2o
         JjVyurCrFxUglCEnjfnAviyJpJ3aWpr+DFd2+icXrLIkgTiudjd4lCs7K2m3/GOqsmfy
         M1385O/laEAah9dYRI4367mTxPotZ25TYRuRJkWdzSd0ELyjkuCIC0S0V9mxlpn5z9ZQ
         /AQ/jtrnBI9DPv5GJFVwdUSaInelLOCk4Oe73Wv28HHTdjworpTYcn02Nmv9B6K2nSXP
         v771EGrCsP/pz5e/UF6JtgFAW7eC6wYz8R3+pSYi/dI7OUGlYz5DSXlobsfCZK4TlFXB
         Pfhg==
X-Gm-Message-State: AOJu0YzYlc/9EvDlmU8nIlwXSoKoJ3dWy7RsngLI8n2PkYZSy5qGLQtr
	NJVdCLoQ+4nkCHDkFg4QW0rwWeQT+Cc7IvBGXHW6+ZGHx/1XrVMh/jNwBBB7cDx6
X-Gm-Gg: ATEYQzx7lo0nmot57ZFDdFiOuwgCE39tjrs5SfA18Th0coUSm07oorGjHOYkjgwiPZI
	iUdDVmbtAo/T3tljmTdCBFVd1XJL0/uIeuxdXaAckPh61Fh+4mYtmMods9IuB81u99tt8jeTPdn
	Avdq5KyaJyNbxdKkAAJNteNgAs1ch/6NRBb08dR1tFjgTIbKA389eijoc8bH0lJT5qajvZlFH05
	RPfW50wkLU0k7pDqAhG78sPiTtX+qHLf5nDH7AM55OncVihck5S4z7vVohk222klhCE/AM4zyJO
	sJfERusxrNAbf/TYVELtk/UUxFsunstNNiSfLmoVUbT1+s3DskPFJib0YviAD0W4unzObSSt3u3
	cLRq0vdpNna8cfCqdfq/+oDE3vDIsIqEi6qnCa4dhbW3CcGe2614H13EPIVqYb/ECe/px4QZBHc
	mdJnuzdQ4MxksWakGHdKYNLMis0eS3/cVeSzEybhDODnChTcBvWiUMJNQ=
X-Received: by 2002:a17:903:1b24:b0:2ae:a928:f544 with SMTP id d9443c01a7336-2b0b0b0dc2fmr60929495ad.45.1774493142883;
        Wed, 25 Mar 2026 19:45:42 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc87e6cfsm12986025ad.39.2026.03.25.19.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 19:45:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] platform/x86: panasonic-laptop: simplify allocation of sinf
Date: Wed, 25 Mar 2026 19:45:25 -0700
Message-ID: <20260326024525.63258-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change to a flexible array member to allocate once instead of twice.

Allows using __counted_by for extra runtime analysis. Move the counting
variable assignment to right after allocation as required by
__counted_by.

Remove + 1 to allocation. It's already done in the previous line.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: Rebased.
 drivers/platform/x86/panasonic-laptop.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 1337f7c49805..2fe8ff0d32a8 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -246,11 +246,11 @@ struct pcc_acpi {
 	int			ac_brightness;
 	int			dc_brightness;
 	int			current_brightness;
-	u32			*sinf;
 	struct acpi_device	*device;
 	struct input_dev	*input_dev;
 	struct backlight_device	*backlight;
 	struct platform_device	*platform;
+	u32			sinf[] __counted_by(num_sifr);
 };

 /*
@@ -1003,21 +1003,15 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	 */
 	num_sifr++;

-	pcc = kzalloc_obj(struct pcc_acpi);
+	pcc = kzalloc_flex(*pcc, sinf, num_sifr);
 	if (!pcc) {
 		pr_err("Couldn't allocate mem for pcc");
 		return -ENOMEM;
 	}

-	pcc->sinf = kcalloc(num_sifr + 1, sizeof(u32), GFP_KERNEL);
-	if (!pcc->sinf) {
-		result = -ENOMEM;
-		goto out_hotkey;
-	}
-
+	pcc->num_sifr = num_sifr;
 	pcc->device = device;
 	pcc->handle = device->handle;
-	pcc->num_sifr = num_sifr;
 	device->driver_data = pcc;
 	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
 	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
@@ -1025,7 +1019,7 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
 		pr_err("Error installing keyinput handler\n");
-		goto out_sinf;
+		goto out_hotkey;
 	}

 	if (!acpi_pcc_retrieve_biosdata(pcc)) {
@@ -1106,10 +1100,8 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	backlight_device_unregister(pcc->backlight);
 out_input:
 	input_unregister_device(pcc->input_dev);
-out_sinf:
-	device->driver_data = NULL;
-	kfree(pcc->sinf);
 out_hotkey:
+	device->driver_data = NULL;
 	kfree(pcc);

 	return result;
@@ -1139,7 +1131,6 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)

 	device->driver_data = NULL;

-	kfree(pcc->sinf);
 	kfree(pcc);
 }

--
2.53.0

