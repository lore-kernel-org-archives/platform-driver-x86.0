Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33555313267
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 00:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790124436; cv=none; b=TPnCE1jTEaTovEMCBCdRUmZiT2JpptdPn4BzJPsg4BSxKAuuFxC4Pfn1iyv4gyPbY0rMvqhvPjfmD/ej3zXQJMhVWM5Yo76Odpt+O8VNLIxehViU7goDM2nrfDDkqFC3LSx/pUlFdG4gd0JwEq0J7NOL2eeW2iN7DIAAttQPn7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790124436; c=relaxed/simple;
	bh=FhIw8yCAByP67BC4dQbuhW0LENXAGhz9fIxT0E/EZUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aqfp+3g3TqIruigCFTH/NGPQIN+FNm73zj+3T48bTHYTywrhTvEo9qolSbzISLjAHHWQk9zYeG/JxWmjY0HdvEacQ035+dccD+Vkm+B9//EpeGN2aOZ8N8lqG77Dvd9+1uhcWAwTHN4cPKRat51Fw/cmp8jDgUGiSlT8f0c+bYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KG11adFd; arc=none smtp.client-ip=95.215.58.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KG11adFd"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FhIw8yCAByP67BC4dQbuhW0LENXAGhz9fIxT0E/EZUI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790124433; v=1; x=1790729233;
 b=KG11adFdBx4xMNBwCf1fwcLrRPk37mtXuV/T2l8cuVEGQf0Gr3SEQZ62Ou6vNJvpJMtPo39O
 pl+HQmDlYfE0SlDCqXm3vpSEhOvWpR7z+G+01QVaxcCLaU8QnZFZ7kPdNctKtcy4WcvInmApjvW
 1MVrxg3pjIBrjYYTtHu7wzFQ=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 120358fc2d05fb9f;
	Wed, 23 Sep 2026 00:47:13 +0000
X-Mizu-Trace-ID: 120358fc2d05fb9f
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
Subject: [PATCH v2 2/2] platform/x86: asus-armoury: add dGPU disable fallback DEVID for ProArt H7606 series
Date: Wed, 23 Sep 2026 00:47:06 +0000
Message-ID: <20260923004706.41256-3-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923004706.41256-1-denis.benato@linux.dev>
References: <20260923004706.41256-1-denis.benato@linux.dev>
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

