Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDD643F4DD;
	Tue,  7 Jul 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460283; cv=none; b=dr3FLKcC7AOQ2H2Hh0NEz/kpR8F7BLD04EGPaAzvonYAbYmZ+DkI/ee+QBnriaXlq6ca27FFaoj12vq4y7eKOasz07Dgd0V+RMhBBV2hPhtYc017hVeIfuOptykoQTZiuvWvLCpJBEzohMf+tfbpWmEVw8gh1+91AlemWT53yXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460283; c=relaxed/simple;
	bh=JCWXTRsiNvrME8XvddHmlCeSPWkb0mbkcj4T/CHz33s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+8lNNRO63s+aIZs1NzQVcsmwHbxq/Qb03S1rbzPxgzXCQVFNnCiXrhLnGW2HzVxs5JFFJDVna4yPIrrzeAIe0OHArhhTelsxJYAVoeeBHWg71vhzbb5s/Z+jCzaIIZQALxnHvrEDKm9bY13lGQ+4tUiwVdW7Zfc2SsRaZ7PuOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=GVDvSRJk; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="GVDvSRJk"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EF16B845AC;
	Tue, 07 Jul 2026 23:37:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecp11ivTXs3U; Tue,  7 Jul 2026 23:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783460277; bh=JCWXTRsiNvrME8XvddHmlCeSPWkb0mbkcj4T/CHz33s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GVDvSRJk38tsNE2eqd6+iCbEbEwriMGZ5TZFufHXxduCSmFP0cjhZpqmOByIhp1G0
	 bRasbROC3HxaD2/guPW3xTp9N8XsNC+1IsxzhU6bBU63L50NCBFYg+rCeUaLE6R7zD
	 Jjfr7Q4S3U6lrHdFqNAY4poAtSr0hSi5nsGAC2B1uDVdEZp18He27n+HMJhNFFODZ+
	 jgB/IKbBpOOqy6GsiZm2x+aBbJMEUtKM/rfI4dYxGhExRbhsvY4dyBUx72pJrz5XRK
	 HB6nTZCrl34qV4D85rU9sLHcL8Acvq+3unToVoWnDNryGTuy88HnSvr0OSqGRxcFYC
	 6vyHIHFKaDkoA==
From: Marco Scardovi <scardracs@disroot.org>
To: scardracs@disroot.org
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 2/2] platform/x86: asus-armoury: use cleanup.h to manage tunables
Date: Tue,  7 Jul 2026 23:36:12 +0200
Message-ID: <20260707213741.6515-3-scardracs@disroot.org>
In-Reply-To: <20260707213741.6515-1-scardracs@disroot.org>
References: <20260707213741.6515-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert init_rog_tunables() to use the cleanup infrastructure to
automatically free ac_rog_tunables if dc_rog_tunables allocation fails.

By declaring local pointers with the __free(kfree) attribute, the
manual kfree() in the error path can be removed. Upon successful
initialization, the ownership is transferred to the global struct
using no_free_ptr().

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 drivers/platform/x86/asus-armoury.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index fa7d0485c712..93d9665717af 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -16,6 +16,7 @@
 #include <linux/acpi.h>
 #include <linux/array_size.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
@@ -1010,7 +1011,8 @@ static int asus_fw_attr_add(void)
 static int init_rog_tunables(void)
 {
 	const struct power_limits *ac_limits, *dc_limits;
-	struct rog_tunables *ac_rog_tunables = NULL, *dc_rog_tunables = NULL;
+	struct rog_tunables *ac_rog_tunables __free(kfree) = NULL;
+	struct rog_tunables *dc_rog_tunables __free(kfree) = NULL;
 	const struct power_data *power_data;
 	const struct dmi_system_id *dmi_id;
 
@@ -1080,10 +1082,8 @@ static int init_rog_tunables(void)
 	dc_limits = power_data->dc_data;
 	if (dc_limits) {
 		dc_rog_tunables = kzalloc_obj(*dc_rog_tunables);
-		if (!dc_rog_tunables) {
-			kfree(ac_rog_tunables);
+		if (!dc_rog_tunables)
 			return -ENOMEM;
-		}
 
 		dc_rog_tunables->power_limits = dc_limits;
 
@@ -1124,8 +1124,8 @@ static int init_rog_tunables(void)
 		pr_debug("No DC PPT limits defined\n");
 	}
 
-	asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = ac_rog_tunables;
-	asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = dc_rog_tunables;
+	asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = no_free_ptr(ac_rog_tunables);
+	asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = no_free_ptr(dc_rog_tunables);
 
 	return 0;
 }
-- 
2.55.0

