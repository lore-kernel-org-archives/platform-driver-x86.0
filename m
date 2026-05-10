Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA8F286D56
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387152; cv=none; b=BREzM8+MRt99F+yORfFMSqXp0zAGn2ZDPnpBJSE6s/nGbYimMOgYiHIF0aUaMd/Ej4bgx8ms7CAePy8KUOAq+4m4olK1RoeB2xFpYG32gBOO73wssXixOTCgUJOpSxEVD/WIS6RUmXUoZg7b4DvVPE7L14tqCVkkuaK+wI3Y8QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387152; c=relaxed/simple;
	bh=as/Y6rgrCLbxvFJK4woRt4WCiXpZGU5Bmcl75dpz1Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhgKUTrCNn+0upIfwuSQywW8y0YBNfivaKuTiR0uKhU5NQV9Cm0+VqzWsKzYy7WdwfOKCl10dcL1xjqqPjOkCcTlomyy/eojnoC21m8tWo5z+XSISZ7R/pdIPhYuLK1bRZZjG3qgMj39zOvhjW3r3r8HITDwqwTajW18fTBXN5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiMikodo; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiMikodo"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso3537044eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387150; x=1778991950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Epvlpqxnk7CA+C9ymJCfGqy8SHrtqDJZ4fsM6TY9RM=;
        b=hiMikodo+8X16zCDJhpb9ONw7FFkUK6p1I02t7t7D+rdTBojVfKB7EMhf6chktd5QL
         qJIGTi3GM+2rPp4sCDrM/5Hhfkjml6g4q1Yv+0Yw3spHzj7LSQB3wmak+19XCtLakP1T
         agxCvmtEGcg1dgXeJJafeEMIklEICP//FtrqQxb/Har4i79knh4iBBy0OrU5nIhjxonk
         eub3nXLAqQrNT/EYCTKJuzAPJJyzmh+bHccFIpky5aqIIiMUzl98Ytj2ffqo0ftOzBRj
         nvK0sAPGZImtK0UQd9NZnxpBBkHxJq6IWYtbSHAGLKp+mQRTQ1X7OZm/wb5d/r+iXCQ7
         OMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387150; x=1778991950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Epvlpqxnk7CA+C9ymJCfGqy8SHrtqDJZ4fsM6TY9RM=;
        b=PXBVDMIp+fpmkWg9Volm2UVS1H5YAZ/8M1r6+7J61XuUaQqqPMN+ZYWo8ROpvANXrp
         ey/HylGR2x8BOyUmj3WzNGEMs5N/lCdyhB2bkg75B3PBzN7BYxdG89BQdOYz13BRkbjY
         J5MHOLgmoqN3KH0o0QrPu2U3JU0abKzOWUFtsGIeGjl3SMmRvOXAehEavPsUP2btRc72
         +3rBh1WGHMOlnNQdeuOOKE4OfhiLNsb/pOtpaF0+CgLxOMxiLaOJB7/AES3msM/LKiUV
         weZvQtg5db4tuviXSdzeT9m8WWsMP7cGaOINXdPpMOH2zZY9rcI1sXbTwCqFgPdfk3mn
         iAeg==
X-Forwarded-Encrypted: i=1; AFNElJ+HSZZDAxfrIhaRRo4xNk4BU4abiGquDJkDfOTQO+Y83KtHwAMTWp306LOKeEmvTfHg0X6qUHOB8GTDE0QU0a3nmBrl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2WWhm57f6LhgJkJSooFs70hQRfcVL1NOvAjlma1ZMaxbMZqnR
	lHwxCT8yv+kFsMtaMVpcf2yjLWvGlol2ygEwOaK8XN5Dmnq3FilpVwhs
X-Gm-Gg: Acq92OHUQXlZdgJxLu/86E04uPqxXRD+J/bC4RWcWjDHkBK8TeGllhtj+0myRbp9dsI
	hHPX99GXcbRoKAWjYGdenaUL22svj4c/zTEjvnUFHPBCp10sgE+Pb1jmGh3KkC6ebDtYWX3cLAB
	eaNvj+ZuGcS0vNbAP7KvDnZA139BypVJQ7ANAyfwKCkho9jp/kqCGZ5kmeeBpJOcWalohUjlkjY
	TU2o+zMp+TlKppMwje8vqnN6o28hV8cTCGXTHvuQbBAr1OoBG873EPSYvrexh7OqOJsB8kScjSB
	65Ew3WviuomdZ0grief8wBVeMf28Gp4lKM1npg8WJKa3hp+4bj3CeISIqfy+EW8vMbOkcpqjiQC
	scCxJAlP+EU9dKf0KYP6S0b5ULtTtKFhvu3ZFCAIbg8o3NRCCXp231XeZ8zA1D69TStAyDfSoEK
	OLOwMeG8kcxn7p8uvDXxvToYsKAPJhCEBEDz3K4tvR7H/7uQSQENMUCH1At2Cw7jfPCRy8jlctA
	CDY
X-Received: by 2002:a05:7301:2c84:b0:2ed:e14:7f5b with SMTP id 5a478bee46e88-2f54b797cf9mr9088145eec.31.1778387150168;
        Sat, 09 May 2026 21:25:50 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:49 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v12 01/16] platform/x86: lenovo-wmi-helpers: Fix memory leak in lwmi_dev_evaluate_int()
Date: Sun, 10 May 2026 04:25:31 +0000
Message-ID: <20260510042546.436874-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

lwmi_dev_evaluate_int() leaks output.pointer when retval == NULL (found
by sashiko.dev [1]).

Fix it by moving `ret_obj = output.pointer' outside of the `if (retval)'
block so that it is always freed by the __free cleanup callback.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: e521d16e76cd ("platform/x86: Add lenovo-wmi-helpers")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7379defac500..018d7642e2bd 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -46,7 +46,6 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval)
 {
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *ret_obj __free(kfree) = NULL;
 	struct acpi_buffer input = { size, buf };
 	acpi_status status;
 
@@ -55,8 +54,9 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
+	union acpi_object *ret_obj __free(kfree) = output.pointer;
+
 	if (retval) {
-		ret_obj = output.pointer;
 		if (!ret_obj)
 			return -ENODATA;
 
-- 
2.53.0

