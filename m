Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE8B3D9665;
	Fri,  3 Jul 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074761; cv=none; b=YKBkeIUcq5X5PSXp9zKsjtc+kqPotqUHv2TvYWZrUA0Ld2/zALa25kVYQ4PnJeLd8vB0DKXjm74wHpKnabexGwED5ycod1GzuSnRx/Y+eLpDibrWASaov1eDcdQnPjTPiKvbl5N1ax+82d15lExkxIlmBb9M/Mygi2DLkfImPO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074761; c=relaxed/simple;
	bh=t+Tlo7tgtk5kru/LR7Jxi/tPEEzYzt0fdJ/lhmLxG8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=afFmbNIqIdOh8Wuneg0UTvwbE3EdanuEcU3BFh9V1H0G7BojDW6QeZtN8tgcL8N6x4piamps3sUluL3OZ3w4stY6lwyPhsz7AVTkd7n2eTvfirFS54A+fitJYSpj7M7A3x5dAA+LZf7ZshQS5BnyNza0azH/wlb693S8Be04v8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=Ya+s2hsG; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="Ya+s2hsG"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 57048840EB;
	Fri, 03 Jul 2026 12:32:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6hPIPR_wtP4Z; Fri,  3 Jul 2026 12:32:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1783074751; bh=t+Tlo7tgtk5kru/LR7Jxi/tPEEzYzt0fdJ/lhmLxG8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ya+s2hsGpQYDz84hd5MAf9Z/0SVPYlWizo4yEoBF8KPQp0kG58q3Drwr/eie0dZgT
	 s+8KlHuhkgAnixBtbVh8eazPE9Blxn1vdToXQJNO0Xs7cyz5J2MWb6cN3u/uI7vqJ+
	 eb4Hq7tegivFK4T7Y+mMv7NjXGq7+7F2nORaadvwrly5Xs/F6Uzv0nhcBOTM/0ToGD
	 aZnp/M6OrBoyRPucqD6g7eXagZzW5pgrAhHCNX/hXSu3gNuYn2bBlm+Uc5tRlgjNwx
	 AGyYgWxzmYZKuWlMYtuDVfEbM1nj3pp/rBkLVZcE9JjECtearxbAQ9EXWxkYRbPuBR
	 Nc17ykR8JG4Bw==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH v3 2/2] platform/x86: asus-armoury: use cleanup.h to manage tunables
Date: Fri,  3 Jul 2026 12:31:59 +0200
Message-ID: <20260703103212.7406-3-scardracs@disroot.org>
In-Reply-To: <20260703103212.7406-1-scardracs@disroot.org>
References: <20260703103212.7406-1-scardracs@disroot.org>
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
index ea53a005bb25..5af4a79a61b4 100644
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
@@ -992,7 +993,8 @@ static int asus_fw_attr_add(void)
 static int init_rog_tunables(void)
 {
 	const struct power_limits *ac_limits, *dc_limits;
-	struct rog_tunables *ac_rog_tunables = NULL, *dc_rog_tunables = NULL;
+	struct rog_tunables *ac_rog_tunables __free(kfree) = NULL;
+	struct rog_tunables *dc_rog_tunables __free(kfree) = NULL;
 	const struct power_data *power_data;
 	const struct dmi_system_id *dmi_id;
 
@@ -1060,10 +1062,8 @@ static int init_rog_tunables(void)
 	dc_limits = power_data->dc_data;
 	if (dc_limits) {
 		dc_rog_tunables = kzalloc_obj(*dc_rog_tunables);
-		if (!dc_rog_tunables) {
-			kfree(ac_rog_tunables);
+		if (!dc_rog_tunables)
 			return -ENOMEM;
-		}
 
 		dc_rog_tunables->power_limits = dc_limits;
 
@@ -1104,8 +1104,8 @@ static int init_rog_tunables(void)
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

