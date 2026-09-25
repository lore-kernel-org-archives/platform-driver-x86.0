Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4D01E32D6
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347377; cv=none; b=dJlWS13TAyVpkYCiHY0/SNKvwZW7KDA4i2/U7f/C9CvKlucYPREn++H/LqH+vrgSvA5pUM3CeY1FCfwYdtnZjEMbQXP91alV2XtcSP5/uQPlWupDiarmrAwYAQrfrATJ9073fcCMKb5/0QfiIjkf2RH1MwqYiH6mG9O75bRENco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347377; c=relaxed/simple;
	bh=FhIw8yCAByP67BC4dQbuhW0LENXAGhz9fIxT0E/EZUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSWz4MJiOAs95RuPJisCUcfaia8rEf1q4yJT7xLyQWzzV6rnuKnDp4udm1AhHON7YxrPDz+6JpKxfBrIBJBAbNkThn0i5hs9JcooZyWAHZu0/sAI55UUAg2cGBcIMFdYuOK55pjLSlt0rjgumUYUHDkgqNS3mTMPklqspouzYFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oJwx0RO+; arc=none smtp.client-ip=95.215.58.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oJwx0RO+"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FhIw8yCAByP67BC4dQbuhW0LENXAGhz9fIxT0E/EZUI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790347354; v=1; x=1790952154;
 b=oJwx0RO+oisJVzYAp4vLU556FfBSbJVoo4LYiF/o1hZQ9u+fMbGZ8aG7A4TFtHzllCJ/uNSY
 W3c9WdBlNkJDYCfuurYj0lFNJyaw9nnnFUtYYrHa6S+SY81i75P5QAdpaKxNmbu+MvRniTimpsa
 0FjruOqLVHCUYheRFMPiq/bU=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ff28ac3c2d76e92a;
	Fri, 25 Sep 2026 14:42:34 +0000
X-Mizu-Trace-ID: ff28ac3c2d76e92a
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Hans de Goede" <hansg@kernel.org>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Luke Jones" <luke@ljones.dev>,
	"busybox11" <busybox11th@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 3/4] platform/x86: asus-armoury: add dGPU disable fallback DEVID for ProArt H7606 series
Date: Fri, 25 Sep 2026 14:42:27 +0000
Message-ID: <20260925144229.3693-4-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925144229.3693-1-denis.benato@linux.dev>
References: <20260925144229.3693-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer ASUS ProArt laptops (e.g. H7606 series) implement dGPU power
control on WMI DEVID 0x00090120 instead of the usual 0x00090020.
The default DEVID returns 0xFFFFFFE2 on these models, so the
dgpu_disable firmware attribute is never created and the dGPU cannot
be re-enabled from Linux at all.

Add a fallback probe for device ID 0x00090120 following the same
approach as the gpu_mux_dev_id probe.

Details for 0x00090120 (confirmed on H7606W using direct WMNB calls
and inspecting the DSDT DEVS handler):
  - Reading DSTS returns 0x00010001 when the dGPU is off (CUMA=1),
	or 0x00010000 when it's on.
  - Writing DEVS: 0 enables the dGPU (calls PG00._ON() + Notifies
	PEGP, Device Check), and 1 disables or ejects it.

This behavior matches the dgpu_disable attribute (1 = disabled).

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c        | 2 ++
 include/linux/platform_data/x86/asus-wmi.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 7812e93734b8..7c54f616d701 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -950,6 +950,8 @@ static int asus_fw_attr_add(void)
 	asus_armoury.dgpu_disable_dev_id = 0;
 	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
 		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_DGPU;
+	else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MODE))
+		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_GPU_MODE;
 
 	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
 		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index be4d2873ffc9..4ea1ccc1d0ee 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -139,6 +139,9 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+/* dgpu on/off - alternative to ASUS_WMI_DEVID_DGPU */
+#define ASUS_WMI_DEVID_GPU_MODE		0x00090120
+
 #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
 
 #define ASUS_WMI_DEVID_DGPU_POWER_STATE	0x00120097
-- 
2.47.3

