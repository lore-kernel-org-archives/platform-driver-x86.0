Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D973431F8
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Jul 2026 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782987246; cv=none; b=c53kzSnA9eokwClOeeZkCQsuxRwF+q+beHk/DidErkNd6+XUhYt0rZHyoOnhsfmnicgcW2dYoTKnqlGQFQBb6u3MY1mjxcCPB+fircmFGO+fCZqTA2Z9qe/mPKlY5v5K24M3FTTu/s3slxenRLuIEinNZtVvkX0MYlNxq2nF7tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782987246; c=relaxed/simple;
	bh=kREVzh/VkCX94Vs2sqfDEQKvzgMVt2hTyXNqRRxwBug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i7KZ3bqtNZ8LXitb6eQAczTNr9DcKwIb0+La2yYRiR57Ty92mpezlk67Af/swNIhG4hhCTOmgJfT98YfpbreDiUijtgstDneSNcLvW3Z3B/3lbRBv3l1XzkmW0ul0VYqjZI8xDwKnot8RJ5ZzhWn+pMun2OJESaE0Q5KBi0Ze3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jq587EgF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jq587EgF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c7ab2b9dceso3033925ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2026 03:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782987243; x=1783592043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOtxSUhRtXEnyoWPlJ8ZKra2o7XCs4p8LV9SbEd7+y8=;
        b=jq587EgFlmnuxaxVdSDHwd/waoxwdioEXxNmMT9w6wLuP1fbL2ihffhvDHk8VsAKPX
         daHDYdG65rFkE2HpNTQjkZbJPWXp0uFDsawJNXJpUyKWKxbhGA/thPSZM41upT3gJqW+
         /ThqYXni8kGAom5cTs3s+8NM5kSXxPP5T1wLhM6BLrKlzojfoA1UMiNCv007kFUkHpVA
         CCtqE8W2NwKVBilQ/7QFohO937Rxrw9JKQIDcfqwBfyM8h9n8wpipj7LiEkTzbvHRvy/
         gug47/gbwXMnUkayAW+kBz13hP7+Aj3UFotEwAK84t0dlSKALf9RH00bZuiuc0CYJRcB
         KyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782987243; x=1783592043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vOtxSUhRtXEnyoWPlJ8ZKra2o7XCs4p8LV9SbEd7+y8=;
        b=GmFSGF4QdMXhzid5ZWlICf36U3bG/iYy5LsVXOijUzl3J+voJxocYi5X8xboTPZTUT
         HrK2Q8Ovhn17a+hlRAVTHAb+WOL8stFlFhCVpQXkrTR8tepl2s39P9KHjrWOeoUEkfhv
         f7HxB6N+987xwR8Dmy+O2tY6mxm7mMQkKx1jjqeSzBacHsHSE6pZ8xfdzlB04qhWJJje
         8pcHfr1iSXkpBvu/MRKVdIMIWZKHOvD4mi30TNMtaZbZe2D4cM+H+0DeNTNkc23Tjiz1
         M8ifrapZvRccDgzmINYu+DHjsXHdGUE6qfO+ix58JG1tSZ2CBfMj9tog8l60hj9K0gkU
         S80Q==
X-Gm-Message-State: AOJu0YxBm+t2e+D72YqW+fqPFXT6tLOW0E5qUUYfIwVxyF4nDlCdjKFt
	yig4Y9ILbgy7EFABgEHIbN2Ng1oeDE/mi57zPqwMqjlq49d0UbBKO5I8
X-Gm-Gg: AfdE7cmIII9Z19nM43WBaxxeIriYGR4jKFZiQTio5gl7XtSCNo5GeTI5zKib3mn/0rr
	ybRouAloyOcdtTWU1DArOqP1vfvKhKcx+v2s8vsQErUqbA9urXsIlQ8yVbjlEx2UtMgB+ybcVXq
	wA8o+czZXUNNHM/yIlb3CKOaF0iGNc92oLYAz4Wc1umHX+pdvqQAiOFoPvbpuFJb4Abued6iAG5
	cGF+H4e1zlvhG6p7nhmjbFfoUbqhFZ74LeicsErbAdZiPkfLnDZwtyXBIS417bOGEHaIID2TGY0
	peYqOgYR0zX0jCVjOvLW8ShWUePjLr5rGOJDCUL6sNuCRUGhTYpxOLvQqemn4VDJ72kRw1/dnhc
	8UiXZTMBXA6Ii1ZGz5qxXP8JBSXtDqOBtSD8PtoLQnutyaXvApLRvTAbzIikUlpzyBLAKXgDxBM
	x990Yx6JwoEA+xX00sJ6mF8XMC29svI4nF03bcbPFNRZnN1B4lpNi7oM1gK3Q5q/P3a6U7MKutY
	PtKnqQPA/BXvp4sOjc2JTPQJ2rr1tWRbus7ZtWY8cYVMZV+44VSM9jBXmvgfXR303d9hrY74PDF
	+vzc1858Vfaq/Iu3E9i9lQGVXNbxb2GQUpYRrw==
X-Received: by 2002:a17:903:41c7:b0:2c9:c5bf:2873 with SMTP id d9443c01a7336-2ca7e677577mr36096625ad.2.1782987243219;
        Thu, 02 Jul 2026 03:14:03 -0700 (PDT)
Received: from midnightair ([2401:4900:1c94:62e8:bc10:77d0:2fda:415d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c88659bsm9567615c88.15.2026.07.02.03.13.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jul 2026 03:14:02 -0700 (PDT)
From: Anas Khan <anxkhn28@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Anas Khan <anxkhn28@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: update stale thinkwiki.org URLs
Date: Thu,  2 Jul 2026 15:43:56 +0530
Message-ID: <20260702101356.62694-1-anxkhn28@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The three thinkwiki.org references in thinkpad_acpi.c redirect to the
canonical www.thinkwiki.org host. Update them to the current URLs.

Signed-off-by: Anas Khan <anxkhn28@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 445e1403308e..c57f46cfbcbe 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -7826,7 +7826,7 @@ static struct ibm_struct volume_driver_data = {
  *	does so, its initial value is meaningless (0x07).
  *
  *	For firmware bugs, refer to:
- *	https://thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
+ *	https://www.thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
  *
  * 	----
  *
@@ -7851,7 +7851,7 @@ static struct ibm_struct volume_driver_data = {
  *	mode.
  *
  *	For firmware bugs, refer to:
- *	https://thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
+ *	https://www.thinkwiki.org/wiki/Embedded_Controller_Firmware#Firmware_Issues
  *
  *	----
  *
@@ -11754,7 +11754,7 @@ static int __must_check __init get_thinkpad_model_data(
 	 * X32 or newer, all Z series;  Some models must have an
 	 * up-to-date BIOS or they will not be detected.
 	 *
-	 * See https://thinkwiki.org/wiki/List_of_DMI_IDs
+	 * See https://www.thinkwiki.org/wiki/List_of_DMI_IDs
 	 */
 	while ((dev = dmi_find_device(DMI_DEV_TYPE_OEM_STRING, NULL, dev))) {
 		if (sscanf(dev->name,
@@ -12289,8 +12289,8 @@ MODULE_DEVICE_TABLE(acpi, ibm_htk_device_ids);
 /*
  * DMI matching for module autoloading
  *
- * See https://thinkwiki.org/wiki/List_of_DMI_IDs
- * See https://thinkwiki.org/wiki/BIOS_Upgrade_Downloads
+ * See https://www.thinkwiki.org/wiki/List_of_DMI_IDs
+ * See https://www.thinkwiki.org/wiki/BIOS_Upgrade_Downloads
  *
  * Only models listed in thinkwiki will be supported, so add yours
  * if it is not there yet.
-- 
2.54.0

