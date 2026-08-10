Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10644288C96
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 00:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786322452; cv=none; b=PogPGO3dYYSqYoXvmsy7P6PGmCb3RuG3GULCxFoeeikbITf55F/TnIXODiP1UL8J4e8HI7YQphWKIVvWSqjqRELqHTE53b3GiJHohp437ZNUjON3NBtLVzqlqAuAr/XzBRU0/HvNYHKsLEWPRZdEgPtxSGMnNe2RjoPrmq2ONk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786322452; c=relaxed/simple;
	bh=a7AsDEfHk7nKlPju3L5aLZ/8JTwtmK4vMDeI0q49a5w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DumMySYgESAO03xdwctHQI3iNx1hjSaF8dL3xsEXQh4Z7BsuKvBNzV8r5zE1jUqMquWFaTRKMHVeAP2fISIMf/HHV6vFDH48c13pN8dNq+7cS4qI48UTj3rRfUXUCgPo/6uqif5u/GZUZ8BAsPoPi8kYbiEiu8PTd9eunJMTerA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuusCpwI; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuusCpwI"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4960fb63c75so671749b6e.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 09 Aug 2026 17:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786322450; x=1786927250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uV5QV9NZ3xjNLUfeZCY4UqlmwUD3a3yASrZSWUswcrw=;
        b=iuusCpwIcN2SBDr+kSxXnxiI3EjDUmza4Hb9816apN2QhDYQmH1aHUB1mjnQX/Q9AC
         BRlScVIhmfhCkvV96//W7dcQlrjVp330JSb1CZmE81MaNhXWeIrh7jPNz/OmEMdlS0ae
         neb7+xAEXGfcoDJ9G0kDFn23T4y8dskzADd+cNMtwYSYR7bKdwLJ789M9W1tn76I0HRr
         sWHWR5piRR97C/s5S7dNnfLUNT21LWK8JC7i1sAwQTPdRS5Ka4gh0eN+2m4W4QhFp+RV
         KA7nDusRrkEfyHwPI41DrHwRqqh2LN/1cl0iP2bB7lhG+psQ94pPiu3koj/8GPnwMrIe
         pPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786322450; x=1786927250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV5QV9NZ3xjNLUfeZCY4UqlmwUD3a3yASrZSWUswcrw=;
        b=pkp7ycQLAXSk+/witeUpWgTYw2CEQX5k/KWRwNyUPSS2Pu4OEv2hU0JpCbGXOBDzws
         co4qe781uZz5KWFYMGMhBRD0trVQ+0lRAdVeHf52o2gxMTkdOyUIMRkRRxL3hIhFCp30
         FNAWpLdZgyNwwUTWOvsxH7zlaS8bknlNxe9pC4zSD2MEYQAbgDjDbezUmoU5T+Vvc5AH
         qNBK389ZJnQT+aiC+v3oVKCN/HbIpwIBd5GKPCSH6U3QAZp9sGZRUvrMiA21lDsW46ny
         B+kbUAScIpkWwjYxUPlVXMz3h9syRfqwN2OLzWrf2o+Jz7awupSALOipjW5OhVPgD5JP
         QbPA==
X-Gm-Message-State: AOJu0Yy698LWzw0HRecGqvjTrY0ykLy+9XRgwRj6EBHjC4XPY2m+da+9
	+7w9skW9WiXQMW74THJl9xl4t7X+8MC7yvnx8Q5kxsx86mt4NZnJgF0=
X-Gm-Gg: AR+sD10HeyRdwRC46PraI2tfHliuqqgFIvidEWaq7LS8EX/DpE6t24A/D0U62EcpohU
	TW+aCfsDdl8uzcp8+1aboA/7NeWphq9zqIrEFMEIidN0Qh/lDtaEInqJFPBL+wy1qKmhT4U4zzS
	wEGT/8h5gLbjb/EWRTsK78Op9I7cyRviKZnFBkND7nekZQtQmlCFLSDJ1vf1kvkbaTriA4ROzgj
	vrxx6WjCHQ51HcBmRxLW47TiobBw5xflMO5FR1dWHNDlSFMwEVTCMfWfF73shOEDi3FcQiGHjjs
	7AKISjBTOdvi6UOiN9m9HJ/3HRoeq5yciP2cL3w7lneqJpRQm2LqFCIi8JnGdLNPXiZgRWnhIkU
	DckAzv9eM88fukjS3//4CB1QzrV54JXFxrfou5nLPNXGPO2glocWUYS+EFMVfKWPCTzj9wdE5EB
	UI2CSOYye2MpD2d9qX1K4SvGi+97F8hkHcis2586Zl615h255XLaSHnA==
X-Received: by 2002:a05:6808:10c5:b0:49a:8f0d:cdd2 with SMTP id 5614622812f47-4b1ab7769bdmr10092852b6e.5.1786322449965;
        Sun, 09 Aug 2026 17:40:49 -0700 (PDT)
Received: from 3511.tail24ee18.ts.net ([2600:1702:7a3e:17b0::3c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b1af63b441sm5132220b6e.14.2026.08.09.17.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 17:40:49 -0700 (PDT)
From: svav2021@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arav Verma <svav2021@gmail.com>
Subject: [PATCH] platform/x86: intel: wmi: Use sysfs_emit and remove dead callbacks
Date: Sun,  9 Aug 2026 19:40:36 -0500
Message-ID: <20260810004044.3636731-1-svav2021@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arav Verma <svav2021@gmail.com>

Modernize firmware_update_request_show by replacing legacy
sprintf() call with sysfs_emit(). When altering string, also
corrected format specifier from %d to %u to match u32 type of
target variable.

Additionally, remove empty .probe and .remove callbacks from
wmi_driver struct, as they were print-only and redundant.

Signed-off-by: Arav Verma <svav2021@gmail.com>
---
 drivers/platform/x86/intel/wmi/sbl-fw-update.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
index 62c9c7f18..7e07cfab2 100644
--- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
+++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
@@ -61,7 +61,7 @@ static ssize_t firmware_update_request_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%d\n", val);
+	return sysfs_emit(buf, "%u\n", val);
 }
 
 static ssize_t firmware_update_request_store(struct device *dev,
@@ -93,18 +93,6 @@ static struct attribute *firmware_update_attrs[] = {
 };
 ATTRIBUTE_GROUPS(firmware_update);
 
-static int intel_wmi_sbl_fw_update_probe(struct wmi_device *wdev,
-					 const void *context)
-{
-	dev_info(&wdev->dev, "Slim Bootloader signaling driver attached\n");
-	return 0;
-}
-
-static void intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
-{
-	dev_info(&wdev->dev, "Slim Bootloader signaling driver removed\n");
-}
-
 static const struct wmi_device_id intel_wmi_sbl_id_table[] = {
 	{ .guid_string = INTEL_WMI_SBL_GUID },
 	{}
@@ -116,8 +104,6 @@ static struct wmi_driver intel_wmi_sbl_fw_update_driver = {
 		.name = "intel-wmi-sbl-fw-update",
 		.dev_groups = firmware_update_groups,
 	},
-	.probe = intel_wmi_sbl_fw_update_probe,
-	.remove = intel_wmi_sbl_fw_update_remove,
 	.id_table = intel_wmi_sbl_id_table,
 	.no_singleton = true,
 };
-- 
2.47.3

