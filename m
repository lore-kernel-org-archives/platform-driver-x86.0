Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074E13B9D97
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484243; cv=none; b=QmzVxJyJ4YiqzaQN1rZr9lWg+rgU/FMskLqh2wAR7709V6WjyXiVmW1DAYEW1AJOREfBjQVQ+JjdJoepmGAtvFBu/xD14Lx7Doe2W5KriKGBUQbMSv7tNRfxrwZJ8ngSMn7jG4f6/w9vUXgmKSkV1HB/gSbZ0jYhPms+Cn6zBOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484243; c=relaxed/simple;
	bh=v9HeOFbg7yqaPJFAebJkoHX6/z4ZNAksuMZiGZTzcV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYwJwr2F8YRQ77Q4hBFdAHZN9kUWSh23e2dLgRThkQU8vdS/+3Nr9H13daNrsB/gtnFmXZ3fkC+Qwz6QIEE6sVCDPbKqAE57DX7KSNb2PoDs+ZuX49lqLN7bnHYG+/+X56m6H1xL2hH6XxQpgxuchZoBMZIrjFQCh2hFJII0nLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg7MNV9C; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg7MNV9C"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ced3386430so58019235ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 11:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484235; x=1785089035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdVZ4aGJrm1DuTj3OJVvOnHsBpK+4e3jVQB95QmtQUM=;
        b=gg7MNV9CA9igFeOzIJfAXVNKOwkbLs9PG4eMCYQjLezdWaZeh7jVGLj5Bj+Ifn4bGZ
         9k7C45ijMqgkKegBw2uAAYb2GPAqQ8ebq/LU9PHT/VfBPXsw4/R5BiIXxbb/h6EKYtGl
         jHGI7NRDvxstNnUchf2jW03fLgLCF4a97s4DP+uQ1hn2Kd3dmFBTLw9lNvT4mIC61tgW
         ZiI5dd/5sYZ1v3FyIwphdF9J1lp25UR/KdNFZItpiBWIJon9xb7I23APgu02mGWys9uZ
         VQWOEPF7tUF4JX95pBH7CI77gBwfNsugWDFHrFpz1euzx9cWfs26ekO/zsIKOxDppCUd
         uK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484235; x=1785089035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SdVZ4aGJrm1DuTj3OJVvOnHsBpK+4e3jVQB95QmtQUM=;
        b=ffbxSGMecgkkPL3j5Ekj3dQvvOKGumvWNT3MamP2RqtH2UABXoYulxX3EDWbCilM7g
         gEPAD1YPGLxok+osfff+VNqaO4gPTz3Co6arGq5v6gaI7xakPKVU8kG1B9LpInMZrycU
         AEM8dUYkTNf/5VtiKDcXAmDGk7fzq/QBOmS3aRMIjAWGo2dxIa8hGl2a4TLJezbaDvLD
         LgegQw+CfGDd28LgO2DPLM0D0TWrkgoViwbmwKBYqhi8zzw+4yFIXsfHSBOGQbqpY2IA
         dGx5i3W9k8R+F3bSKA4nDQWme2vy6z1q57Iz1LAnbC/SxMhL2+XZK5XTOtHHNeiftOxy
         YjhA==
X-Forwarded-Encrypted: i=1; AHgh+Rr47ZIyedufY8+3x/ia5mrZK+4UcYfJu5LH9eTjAb3YOVi+6NPzm3AxcAEXwaDp+XtT8jhJ+MgVQu3jesoAO5ZdLpRU@vger.kernel.org
X-Gm-Message-State: AOJu0YzHGa1M9JRmzZF5wwDtBHWVNe6CdKXQPW7kWxX1VsC4ZXBIEW1v
	/dDdFQsnmY0Z1De16LYsBTgpH1Qi8CNWQzbwdO6zy691r4cxkJzoMDA=
X-Gm-Gg: AfdE7cnJyiSXhaDGLWNy3+d7fzryNGdlK6MW8eaFCSudT6Cle6g4+9DL44lDPdlPvui
	spe+I58sBUR2XP+BQf1EwsguuopYOhzigtIs9ACRlSD1vUYvksgYpcFjyURbu2/XfIBscbdZJb4
	IDGnuOVUpuKe399CgpGFtcAzvDhKQCHgmsFhPxhoNQ+ZgWEXslxY2CEQWxxUX01E9YXuQUEQmMv
	svNbswunNe4YDIbG4m1Y5iytldr2ql9dcOnIedyQszJMCoFMMZUlD+S8ZIPes0OEVTVqlFaTN6k
	SXsxHdH5zdEvGsQtYt0rBIk1zZ8ExXOdfY8eZ8uxXex1JuhqdnNG3C3y5rHBUrt6sSHWq0LEDLs
	3NXdTU4+YeNlk4vxpBAXTC8omTrvxu98Xl2x6BEX6jKjm3ThNipOQ+TOSb0t5+dWeMUpVTw/+Me
	8haF8TmsEExZ2THDxVOU9TAQ+SV+El1O3fZZlOLJ+h
X-Received: by 2002:a05:6a20:bca2:b0:3c3:bbe6:95c7 with SMTP id adf61e73a8af0-3c3bbe69a9amr6850926637.17.1784484235584;
        Sun, 19 Jul 2026 11:03:55 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.194.66.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm27967645eec.13.2026.07.19.11.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:03:54 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 1/2] treewide: Add a flag to detect the Apple T2 chip
Date: Sun, 19 Jul 2026 14:03:03 -0400
Message-ID: <20260719180308.1398-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com>
References: <20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a flag to detect Apple T2 chips on Intel Macs.
Cache the result to avoid repeated checks. That will
be used in upcoming patches.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 arch/x86/pci/fixup.c                          | 10 +++++
 include/linux/platform_data/x86/apple.h       |  5 +++
 security/integrity/platform_certs/load_uefi.c | 38 ++++---------------
 3 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
index b301c6c8df75..fbd204ca4c6d 100644
--- a/arch/x86/pci/fixup.c
+++ b/arch/x86/pci/fixup.c
@@ -7,6 +7,7 @@
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/pci.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/suspend.h>
 #include <linux/vgaarb.h>
 #include <asm/amd/node.h>
@@ -995,6 +996,15 @@ static void asus_disable_nvme_d3cold(struct pci_dev *pdev)
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x9a09, asus_disable_nvme_d3cold);
 
+bool has_t2_chip;
+EXPORT_SYMBOL(has_t2_chip);
+
+static void apple_has_t2_chip(struct pci_dev *pdev)
+{
+	has_t2_chip = true;
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_APPLE, 0x1801, apple_has_t2_chip);
+
 #ifdef CONFIG_SUSPEND
 /*
  * Root Ports on some AMD SoCs advertise PME_Support for D3hot and D3cold, but
diff --git a/include/linux/platform_data/x86/apple.h b/include/linux/platform_data/x86/apple.h
index 079e816c3c21..a2ab63bd1eac 100644
--- a/include/linux/platform_data/x86/apple.h
+++ b/include/linux/platform_data/x86/apple.h
@@ -6,8 +6,13 @@
  * x86_apple_machine - whether the machine is an x86 Apple Macintosh
  */
 extern bool x86_apple_machine;
+/**
+ * has_t2_chip - whether the machine has the Apple T2 chip
+ */
+extern bool has_t2_chip;
 #else
 #define x86_apple_machine false
+#define has_t2_chip false
 #endif
 
 #endif
diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index c0d6948446c3..da57ac322e72 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -3,42 +3,16 @@
 #include <linux/kernel.h>
 #include <linux/sched.h>
 #include <linux/cred.h>
-#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/efi.h>
 #include <linux/slab.h>
 #include <linux/ima.h>
+#include <linux/platform_data/x86/apple.h>
 #include <keys/asymmetric-type.h>
 #include <keys/system_keyring.h>
 #include "../integrity.h"
 #include "keyring_handler.h"
 
-/*
- * On T2 Macs reading the db and dbx efi variables to load UEFI Secure Boot
- * certificates causes occurrence of a page fault in Apple's firmware and
- * a crash disabling EFI runtime services. The following quirk skips reading
- * these variables.
- */
-static const struct dmi_system_id uefi_skip_cert[] = {
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,3") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro15,4") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,3") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookPro16,4") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir8,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir8,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacBookAir9,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "Macmini8,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "MacPro7,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMac20,1") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMac20,2") },
-	{ UEFI_QUIRK_SKIP_CERT("Apple Inc.", "iMacPro1,1") },
-	{ }
-};
-
 /*
  * Look to see if a UEFI variable called MokIgnoreDB exists and return true if
  * it does.
@@ -165,10 +139,14 @@ static int __init load_uefi_certs(void)
 	unsigned long dbsize = 0, dbxsize = 0, mokxsize = 0;
 	efi_status_t status;
 	int rc = 0;
-	const struct dmi_system_id *dmi_id;
 
-	dmi_id = dmi_first_match(uefi_skip_cert);
-	if (dmi_id) {
+	/*
+	 * On T2 Macs reading the db and dbx efi variables to load UEFI Secure Boot
+	 * certificates causes occurrence of a page fault in Apple's firmware and
+	 * a crash disabling EFI runtime services. The following quirk skips reading
+	 * these variables.
+	 */
+	if (has_t2_chip) {
 		pr_err("Reading UEFI Secure Boot Certs is not supported on T2 Macs.\n");
 		return false;
 	}
-- 
2.43.0

