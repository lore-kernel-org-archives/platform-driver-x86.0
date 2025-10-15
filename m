Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598F2303CBB
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 01:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492990; cv=none; b=e60zTPf/p1WMTjhj7JXAODVn2k22wBMkwYLBXUBwzYEaRK0u/UHjuVk5ljdM7RfYpVc6cYlVLlgeA5nDafi46FNpxaaf93QHAWpHpvwlWuh232s+LE+5yoMI8+5mSM70J1bl3mvs0EfMYxiyR4HupN3nQlWv+Q9ibkatftuY/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492990; c=relaxed/simple;
	bh=DcsVgjp+3XT5vf3tzd/78q71x32351xBLOp4FpPXNWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZJR51NMdqADcA6qm3fmrDcB5USuslHw3Kk+T7iE3CnbMyFj8+eRyVcdAYw2evvKS89kvKP/zRlfu+C1ugohcVrcCO/t+j30i1rAEQnhmBfHputWA3EKT9TsLvg/NEoqyA+HxHZeKda359kLIFk/838dcwPhj5wLBuiDV3CBA+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgKoPEhX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgKoPEhX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-426edfffc66so284312f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 18:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760492987; x=1761097787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp1Oh+kA/uDr3Cg7dOvF5XXNiOkdYfBW6cY70YaTCCI=;
        b=PgKoPEhXPTk5WnA3ZEe5c4zcOZOvq6oy+aFY+fvGX/Q1iprbD2wbMQUBTqFTQHF7fN
         K0oYYJYm8feB/yUMH6HPjq5xqL8EhZpossnVB1ThDUQ/KB4HCPLh+dlzdIzZWzBjA0hN
         zNVszYD7uWkZNNMtE2zqZXRcF2n2FoQDJKNwUYajEpaVWlyFLWeTPl7g7fH9+QeCoO1w
         NSBktSbZy3p2Rgw+tetQCb+ME+NlZ/h7PVYeCl5WsIViJb3Ahhdcy0ewOID5pv8HGbyV
         LIi4Y2D3QLuy1dwQ14kTWm+6U0bcec5JLajd5jxT+Jq72MiiFBnYf8IRpy80p1ifGqfQ
         Y9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492987; x=1761097787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jp1Oh+kA/uDr3Cg7dOvF5XXNiOkdYfBW6cY70YaTCCI=;
        b=WwLtisv2kWigrHX3/caLAhtJ9rebLCVCDBkKX4lllt17Y/W9G86oJSfMB/MXjhvs0K
         dHhoTBrK3+9k4ekL98q/aPPp8Qry2/gByfATQJQuNZnBjm1QBVmscJuDd31KHtGNGTq+
         52Ad7P5h2Tb49paRihOdxJDnvgordc/TomwYat8VEqtmaOF8WafOSa2JdxBcOH5qptWE
         6ZAV43T7/41D6BwEI5ZqjdLHE9AgnYDxhx07tm+zn/jo1fT3IkNhLP9ghzLqYmHEYSQV
         i3PIFzmwK3MF55IN4v1rt2X1Ny1mZwd5ojr21hvS5S+n6ON96L7n8zLZ0sFvQc0Qx+Qr
         s3Pg==
X-Gm-Message-State: AOJu0YwlNWkKrIWnAK5o+XLLNH/s12bEPYfiQO8SmBCP6t1vBCqW1Hbr
	19XCYTHYuwG0wuwVSHrEMljWZ6Y1P1WjDyd9YRtqnMxGtfWUKjKwx9mD
X-Gm-Gg: ASbGncualbVtZEgRC+7O9qp/K5rv7MHBygcaJOAOebU6tm9dM4FslpYPP4nVRf3ZaIS
	UzLHItlD89GY4a8tKCo44+aZbxex3MsfuTk9V1f9cqJAudNnSbW+6s4DkmO1CKxCPCDawdRUDLn
	7lv+FgT7pVEfoYdBKLlEWcXpVfsKtp69Up9lfKUuVtsJfMEa2SjKdHR9r3KjD4W/N9LMS9Bj11K
	RX2Vvyai060lXTylaM36BFm6cQ5ub0JDIUupPywmO8B7uJ+PkWXaBbhmva8wbY6xVobA+n4eH4B
	RlRGO5jIhgwyvIkEcC5K8SEaMZXx/88AEu35fEwQZMFCSUCQgd4keOTjIxJ5TcsyL3d7OBuDi53
	ThtzYtAi6rXmn0IYe1AKTJRc9qfFpS58EXB0jSe5GGwQ36A==
X-Google-Smtp-Source: AGHT+IE663GatkF1V10Gf+ZoAiRHCCjU3ek6A78eJLYGsRmydhMUwKV60giGSrhdOpN9Iw02OIBZYQ==
X-Received: by 2002:a05:6000:2891:b0:403:8633:b7e3 with SMTP id ffacd0b85a97d-4266e7d461emr19439536f8f.30.1760492986636;
        Tue, 14 Oct 2025 18:49:46 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm27368995f8f.10.2025.10.14.18.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:49:46 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v14 8/9] platform/x86: asus-wmi: rename ASUS_WMI_DEVID_PPT_FPPT
Date: Wed, 15 Oct 2025 03:47:35 +0200
Message-ID: <20251015014736.1402045-9-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015014736.1402045-1-benato.denis96@gmail.com>
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As pointed out in [1], in order to maintain a naming consistency with
ASUS_WMI_DEVID_PPT_PL2_SPPT and ASUS_WMI_DEVID_PPT_PL1_SPL
rename ASUS_WMI_DEVID_PPT_FPPT to ASUS_WMI_DEVID_PPT_PL3_FPPT.

[1] https://lore.kernel.org/all/cad7b458-5a7a-4975-94a1-d0c74f6f3de5@oracle.com/

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 drivers/platform/x86/asus-wmi.c            | 4 ++--
 include/linux/platform_data/x86/asus-wmi.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 3727ae00133d..8b5ac4636623 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1211,7 +1211,7 @@ static ssize_t ppt_fppt_store(struct device *dev,
 	if (value < PPT_TOTAL_MIN || value > PPT_TOTAL_MAX)
 		return -EINVAL;
 
-	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_FPPT, value, &result);
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_PL3_FPPT, value, &result);
 	if (err) {
 		pr_warn("Failed to set ppt_fppt: %d\n", err);
 		return err;
@@ -4595,7 +4595,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 	else if (attr == &dev_attr_ppt_pl1_spl.attr)
 		devid = ASUS_WMI_DEVID_PPT_PL1_SPL;
 	else if (attr == &dev_attr_ppt_fppt.attr)
-		devid = ASUS_WMI_DEVID_PPT_FPPT;
+		devid = ASUS_WMI_DEVID_PPT_PL3_FPPT;
 	else if (attr == &dev_attr_ppt_apu_sppt.attr)
 		devid = ASUS_WMI_DEVID_PPT_APU_SPPT;
 	else if (attr == &dev_attr_ppt_platform_sppt.attr)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 260796fee301..3d236f8498d8 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -108,7 +108,7 @@
 #define ASUS_WMI_DEVID_PPT_PL1_SPL		0x001200A3
 #define ASUS_WMI_DEVID_PPT_APU_SPPT		0x001200B0
 #define ASUS_WMI_DEVID_PPT_PLAT_SPPT	0x001200B1
-#define ASUS_WMI_DEVID_PPT_FPPT			0x001200C1
+#define ASUS_WMI_DEVID_PPT_PL3_FPPT		0x001200C1
 #define ASUS_WMI_DEVID_NV_DYN_BOOST		0x001200C0
 #define ASUS_WMI_DEVID_NV_THERM_TARGET	0x001200C2
 
-- 
2.51.0

