Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4D1C3F13;
	Fri,  3 Jan 2025 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735945523; cv=none; b=Pv+kNBl45qGPYttma3L2YVWhYdFy+fFmZz+7uzTbRj6B+2B2TI1oIMB0mC7vNAIvPdau9NbMmJWIjFV/tbNqvJsxBFvFFHdAAYpKGkJyJWfKksiaufFnzN5/8+vN6DmpVLMFF6WiPKy6Ms2IUOVoDIb1rZh4FNH/BH2muLJn4rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735945523; c=relaxed/simple;
	bh=KY+VV+ArU3kCRd4UFRbhENoyrPPNBvUKfm4XfLamlco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/2YT2uF5pzAkYETyGI+pMJMMjCCGVqMaMZNelEm32pey+8Ylb2fIwixve81oizgszvZJs11ujYLgUOT++8/+XMabpWVSY3mPHh6bUAJ0uPFmDed9ijDnbbTQNpj3iP0q24qdXZ8c6rrpbwCrdTG2DiaOYPB8VvjFS2xafEbmVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Df2UYJkv; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Df2UYJkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735945513;
	bh=KY+VV+ArU3kCRd4UFRbhENoyrPPNBvUKfm4XfLamlco=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Df2UYJkvioy5sqOhka7k7Xwk96fbJD/tYsaT1J3ikVJ3elJI2olIk0+Y8Aegvxbp+
	 qZvDnMUkuzMOwX3t4jL77zgJ33QesJO72EYTww+obOQzP17XE9AYlSjJR+KebopDaM
	 sW/HTnrNzdHloMuyuz/EKAu4dTA09lhj12JNq15g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 04 Jan 2025 00:05:09 +0100
Subject: [PATCH 1/6] platform/x86: firmware_attributes_class: Move include
 linux/device/class.h
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250104-firmware-attributes-simplify-v1-1-949f9709e405@weissschuh.net>
References: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
In-Reply-To: <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mark Pearson <markpearson@lenovo.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735945513; l=1427;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KY+VV+ArU3kCRd4UFRbhENoyrPPNBvUKfm4XfLamlco=;
 b=4jiawZNmyM8uz291smGk0DmOykhs15VQTG/FymhGUPRv/nUeBWyfRglsqJ5eR3XEKnIsHv8GB
 S9NlgJk6yy4AvPwrtwu8Jzegr86Cwmb6/yzU+mYiaE4KpzMFEwJIThP
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The header firmware_attributes_class.h uses 'struct class'. It should
also include the necessary dependency header.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/firmware_attributes_class.c | 1 -
 drivers/platform/x86/firmware_attributes_class.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
index 182a07d8ae3dfa8925bb5b71a43d0219c3cf0fa0..cbc56e5db59283ba99ac0b915ac5fb2432afbdc9 100644
--- a/drivers/platform/x86/firmware_attributes_class.c
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -3,7 +3,6 @@
 /* Firmware attributes class helper module */
 
 #include <linux/mutex.h>
-#include <linux/device/class.h>
 #include <linux/module.h>
 #include "firmware_attributes_class.h"
 
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
index 363c75f1ac1b89df879a8689b070e6b11d3bb7fd..8e0f47cfdf92eb4dc8722b7d8371916af0d84efa 100644
--- a/drivers/platform/x86/firmware_attributes_class.h
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -5,6 +5,8 @@
 #ifndef FW_ATTR_CLASS_H
 #define FW_ATTR_CLASS_H
 
+#include <linux/device/class.h>
+
 int fw_attributes_class_get(const struct class **fw_attr_class);
 int fw_attributes_class_put(void);
 

-- 
2.47.1

