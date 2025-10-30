Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC03559F8
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 13:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761829424; cv=none; b=fzRx0P/qY59mOWvJQXfumo+ZhLZH/iXmRUitm4t4uTnV1GqGJ2unEZIc3OeQCnwMuPf6pqG+WAcrmsgeyCA9mvfLtOh+iQaW4cCxlrVHPVEBRcrBium4DOz406WFQVxEZa+b5lQWX1NK6eHfO4TAuBaFRelXzrIG1lo6xiHq3Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761829424; c=relaxed/simple;
	bh=hcXpjFnjgKjuF1ADt7m5OcA/a7STH527cObJXWD9bnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GM0e3LX5jor3nmQNpCok2A/6GEHaTAqI/0M/qcfVBlPZrn+f73oDMB9mZPo3RfgPmGazaMGGp/sV/HamV8ohcJTCi0AmOeHMR49SPpTml06HJGfV8Ds2khRGeR+W4lpBmWM69ww+vN3iE5w759DA7UOeSkovFdvBZX6EdMnAhd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=B+wryc/q; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="B+wryc/q"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761829419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXnp9yGFaXthfMa5lFAvHu19m8DYFcVY7XymM8HAbsg=;
	b=B+wryc/qcM/5/mQ/EwXa5n0idfn4yGyZiW2V6Pek7Q08e9a08GLe7dqGArPBbarayA1D0a
	Q7+1QQ9u8HUK2k0XJCosWstIRGqVddGfFpyMc77rzoz0RdvPHl90jPXKVsPYvPdiBolVMC
	6X6bF7hlVd3fAC7muGTev165N1/q+r8=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	porfet828@gmail.com,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v16 8/9] platform/x86: asus-wmi: rename ASUS_WMI_DEVID_PPT_FPPT
Date: Thu, 30 Oct 2025 14:03:19 +0100
Message-ID: <20251030130320.1287122-9-denis.benato@linux.dev>
In-Reply-To: <20251030130320.1287122-1-denis.benato@linux.dev>
References: <20251030130320.1287122-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Maintain power-related WMI macros naming consistency:
rename ASUS_WMI_DEVID_PPT_FPPT to ASUS_WMI_DEVID_PPT_PL3_FPPT.

Link: https://lore.kernel.org/all/cad7b458-5a7a-4975-94a1-d0c74f6f3de5@oracle.com/

Suggested-by: ALOK TIWARI <alok.a.tiwari@oracle.com>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c            | 4 ++--
 include/linux/platform_data/x86/asus-wmi.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6de633d4a748..64cfc0bf98dd 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1218,7 +1218,7 @@ static ssize_t ppt_fppt_store(struct device *dev,
 	if (value < PPT_TOTAL_MIN || value > PPT_TOTAL_MAX)
 		return -EINVAL;
 
-	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_FPPT, value, &result);
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_PPT_PL3_FPPT, value, &result);
 	if (err) {
 		pr_warn("Failed to set ppt_fppt: %d\n", err);
 		return err;
@@ -4602,7 +4602,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
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
2.51.2

