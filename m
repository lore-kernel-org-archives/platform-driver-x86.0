Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1CC8DF;
	Fri, 27 Dec 2024 23:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735341624; cv=none; b=jUTXK+R/ZJUCiBAo9NlaNIkbHNheKnEjpNeQvYgUOPIzriHrs41CngNCSDsC5CJAm8NWMDwE//AZgTS7RUR8BwCITNKh9bkM7ZwfL1vsjUn9OV/0mJWukRWsl0A4WMhIrZ4RG8uI7wyUmagTGIebykLuXgcZUwPjfI/gyBu77Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735341624; c=relaxed/simple;
	bh=DtdIjNi5SmZ3ICYjN9r1koy0o2YaEk6RdtyV0k/nmsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/BFvJcL9JEWvvAe40MLT0QdSmt7IwHjM3vAMGelmDLwGPmZOcfAauSCTpjB9k7KB3rac9K0VaGMWCpuqOt665SUb7EfuGsX/YnfsCs24N6rIJA6ENrRCUEtfHtk/P8v8Z8X7CuY/XZoovpWvpl+hiUbMdHFR6IJystPU8AJc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Evy0Xq3V; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Evy0Xq3V"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21670dce0a7so29493285ad.1;
        Fri, 27 Dec 2024 15:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735341622; x=1735946422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O+qpERGQ2resnOQkPDO4Vf/ogrIj37On1iFQNWG1F5k=;
        b=Evy0Xq3VFn24JQsSvu0ZEcKW5VNlnVOMSvXCcGS7nFq7JsJl67BCmLmUrvpoQehsqc
         G7p9i4QdH3Xs8EUjqEpglcKtsQ07dQLtqfHnJdbAePVHe08Mif6DNZPLBGypHMDIBg5P
         0BLH23QzPIOqpqTBr8UDydpiAwB7ujVclh0BXN9pQBuRxY5dAWiKm6c3tTarT8sq+Hbl
         zKqBhOgh7dXvImeS3Kyz9m5IYJXwLi9WD7zqNKYuxWbNWSe9c8sYekzMeh7wGFo00Kg6
         Vh3Sl3drsxoiqvvOhxZL+5jPx1W3ZxSjwaTbc8oRfo+/C1yOIUGsqdj+AKGlXLoH+RI6
         GKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735341622; x=1735946422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+qpERGQ2resnOQkPDO4Vf/ogrIj37On1iFQNWG1F5k=;
        b=MrlxnjKN4YAoaF6CX59jQGqZNY4+R2oEB+KGgFs6Fv4uvu9frXUDRP54z26FNp4qfA
         cSLyGaN5Gxjms8I4FDkjwdh/9QkPk8e1YiBiR9F0BrFgERIyycWqjsI1bFDrpvTQc6Kr
         HX8chRYFXadiH7BkopUSPtAcWGiBMkG9CW/g23C1/nC1yHgf9vEqzdCz8Ipoue7Eo767
         73Lf43sstrFA3odylmwl4Ia1gLHv1wxYNIhCrLxUAMvMt1fwMDh9wsWRe9NJy7KIga9N
         oCHWKIjYZKekNYutkEJ0p0yEDZDRD0pT5oMicefkGImDiOgloi7tHVSVMwnJHal5omMO
         fE0g==
X-Forwarded-Encrypted: i=1; AJvYcCUehuu4tQyiF58Og89yQe3PBn8VcsomOSShkqTGde1IWP6V1q6QymZp2rD8cVl1/dEGOVka0HSQwkY=@vger.kernel.org, AJvYcCW+Z9lKQp+0gMBPMB5gfl8Ii131sejY/ZB7Z5fyu0gSZVPnsoT1KSzQ4DBTQL6DOQdKZCd5DokPTeL3KUwW@vger.kernel.org, AJvYcCXkOGrUDjjgK60KJ8K9atIdxl82T+RLWigWdwUBXUVosg17ja0SEsbps3fJ2tIWuxTEMyeJbM1tDxhoGoY5F12oHN3Gvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4k0U/YvgK5+7HczMl32SVpupW2i13SVcUSc6P1xo1STxyWVxf
	V7fW+AfJHK89CsK0Dr2QLoNk/tAVht5T3jyDDe5BxndSC6gqHUrD
X-Gm-Gg: ASbGnctywNGZMBvvb00BSuGi+zvIwneeh/F0PRNLbC9d+sT6XlSl6lNjU0SXtcmxafI
	vDIb9Gp8EYnuYjl85EeVSvEKoFEKhdHVr7r8hy/jmMF9R/Lvs6Nd2PBfDLHOo6pDFN9pMuwAlPJ
	EEf2S5xxAeMSNu1CXqBlQ4B68j5uWsh1n5nD4sIrCIUaEi7urzDKMUYKj8W5dRvVzyabjrWKnOn
	bEyTsc0dWJXIej0BURRETgnEBBgRcG9arkcOsuPWnQHobl+ipxuK6x7L6nT9mBjsEuDhbts3ZZC
	PHx3dEI=
X-Google-Smtp-Source: AGHT+IHqb8pNpIbG3PYJ26xeLxhXEpGhEK/8UQmsYi3zTfiTsjJvT6mgB2y7vMQ7rs+UN7aBriLvmw==
X-Received: by 2002:a17:902:e809:b0:215:603e:2141 with SMTP id d9443c01a7336-219e6ea0218mr429283015ad.19.1735341621902;
        Fri, 27 Dec 2024 15:20:21 -0800 (PST)
Received: from m2-ThinkPad-X1-2-in-1-Gen-10.. ([2404:7a80:b9a1:7100:363c:fe:83f1:cbf9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdddcsm140156935ad.158.2024.12.27.15.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 15:20:21 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	hmh@hmh.eng.br,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] platform/x86: thinkpad-acpi: Add support for hotkey 0x1401
Date: Sat, 28 Dec 2024 08:18:40 +0900
Message-ID: <20241227231840.21334-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F8 mode key on Lenovo 2025 platforms use a different key code.
Adding support for the new keycode 0x1401.

Tested on X1 Carbon Gen 13 and X1 2-in-1 Gen 10.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
 Documentation/admin-guide/laptops/thinkpad-acpi.rst | 10 +++++++---
 drivers/platform/x86/thinkpad_acpi.c                |  4 +++-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 7f674a6cfa8a..4ab0fef7d440 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -445,8 +445,10 @@ event	code	Key		Notes
 0x1008	0x07	FN+F8		IBM: toggle screen expand
 				Lenovo: configure UltraNav,
 				or toggle screen expand.
-				On newer platforms (2024+)
-				replaced by 0x131f (see below)
+				On 2024 platforms replaced by
+				0x131f (see below) and on newer
+				platforms (2025 +) keycode is
+				replaced by 0x1401 (see below).
 
 0x1009	0x08	FN+F9		-
 
@@ -506,9 +508,11 @@ event	code	Key		Notes
 
 0x1019	0x18	unknown
 
-0x131f	...	FN+F8	        Platform Mode change.
+0x131f	...	FN+F8		Platform Mode change (2024 systems).
 				Implemented in driver.
 
+0x1401	...	FN+F8		Platform Mode change (2025 + systems).
+				Implemented in driver.
 ...	...	...
 
 0x1020	0x1F	unknown
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 6371a9f765c1..2cfb2ac3f465 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -184,7 +184,8 @@ enum tpacpi_hkey_event_t {
 						   */
 	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
 	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
-	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile */
+	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
+	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
 
 	/* Reasons for waking up from S3/S4 */
 	TP_HKEY_EV_WKUP_S3_UNDOCK	= 0x2304, /* undock requested, S3 */
@@ -11200,6 +11201,7 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
 		return true;
 	case TP_HKEY_EV_PROFILE_TOGGLE:
+	case TP_HKEY_EV_PROFILE_TOGGLE2:
 		platform_profile_cycle();
 		return true;
 	}
-- 
2.45.2

