Received: from mta0.migadu.com (out-69.mta0.migadu.com [91.218.175.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C924AB3D3
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573348; cv=none; b=Vt6qU7ktuhAJLGToS8V6j5hBHH6k7e4ETLKY9nLgsiLXsVSR+xTb+xjFn3RFoS29g+bGRMZojGo9Xtlns/46QO6eOy+Zmwy/XwBuR6OqVTAq9N0vb2VvQmfeR0Dm6kMDOcxYARRAwmgaYMcMPKUW3D9FfQ5YDBAkdwA62odU/EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573348; c=relaxed/simple;
	bh=RnycfHy3B/O20XaLemKi+nuu4GwL0rtcQeCeVAhEhic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UwPeY2lhhOGWBbxA2ipxnOSnbiVny8jfKj8OgfJzE60hhnlGX6siB5K50cXj7J68bbayo9ebPyadkxtXPb37pv0l5uacuQb2tQsKILNgfWJC4Q18+KEq7lvGagv895+7e7LnzDV1wMoou3pt3U9TwxoGpjQ9bbSfwLsTeY8zEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kwZM64Hn; arc=none smtp.client-ip=91.218.175.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kwZM64Hn"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RnycfHy3B/O20XaLemKi+nuu4GwL0rtcQeCeVAhEhic=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789573343; v=1; x=1790178143;
 b=kwZM64HnIoPmP/8y8I/8XWTN/Zf52nA1H3UqJOC7u5hbBGVTkpsonj605rD4orLFcAr3+BmS
 Vkd2WrQ1ceuOt6eBxNx+AIuWmCBgb3ck7BUafOcz1s8eCbjrYxL46080NANu1CP5VufMz79Z8qz
 IzO2kLsIPRg4JortBaDLSXU8=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1a96745af3f696f3;
	Wed, 16 Sep 2026 15:42:22 +0000
X-Mizu-Trace-ID: 1a96745af3f696f3
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
Subject: [PATCH v1 2/2] platform/x86: asus-armoury: add dGPU disable fallback DEVID for ProArt H7606 series
Date: Wed, 16 Sep 2026 15:42:10 +0000
Message-ID: <20260916154210.181441-3-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916154210.181441-1-denis.benato@linux.dev>
References: <20260916154210.181441-1-denis.benato@linux.dev>
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
index 8639902f084d..3cbee734180a 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -977,6 +977,8 @@ static int asus_fw_attr_add(void)
 	asus_armoury.dgpu_disable_dev_id = 0;
 	if (armoury_has_devstate(ASUS_WMI_DEVID_DGPU))
 		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_DGPU;
+	else if (armoury_has_devstate(ASUS_WMI_DEVID_GPU_MODE))
+		asus_armoury.dgpu_disable_dev_id = ASUS_WMI_DEVID_GPU_MODE;
 
 	err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
 				 &mini_led_mode_attr_group);
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 289be6ac7335..2cd2776ad6fb 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -138,6 +138,9 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+/* dgpu on/off - alternative to ASUS_WMI_DEVID_DGPU */
+#define ASUS_WMI_DEVID_GPU_MODE		0x00090120
+
 #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
 
 #define ASUS_WMI_DEVID_DGPU_POWER_STATE	0x00120097
-- 
2.47.3

