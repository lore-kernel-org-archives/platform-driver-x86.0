Received: from mta0.migadu.com (out-233.mta0.migadu.com [91.218.175.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9079C3890E4
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790347369; cv=none; b=TvN3Qj05iGSpT5S85OOil1TZId0VaAQKPY8xgxYNNzgb9LavT6Z3k8WiCnD/uxKOmqzn2a3ItPo6Bz1uyFedL8gc1AROusBVfwFPvU5L0JR9qFKrigNR65iZXkGsQNsJabyhxJr0R9hQvkrtl1UbjudBDjLgGgbtlJ5M/zsWqDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790347369; c=relaxed/simple;
	bh=MfvEt5ad7oxEhFbggOeDjte0yZkwxwoadyggkNq8XCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=py1kmR2WYjVN/78TnvIH6QMZ7wcmI2vJ7wKQiVS7WrJrFxiW8idbHlW216HdbipqCkUb2Ssj5CTwSHP6kVnZiPQc7HeBA8bZR6F6PA1863VmmYhxcPCyGzLMa+KNVdQJzbhNvsdSWkXCyl67st1Hjzwy7KlPS+syC/JXOi/bdCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OnXvlHnA; arc=none smtp.client-ip=91.218.175.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OnXvlHnA"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MfvEt5ad7oxEhFbggOeDjte0yZkwxwoadyggkNq8XCA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790347352; v=1; x=1790952152;
 b=OnXvlHnARpSqePG3V1Z5r0AlT9a7Bg7PUpnJfwVoHT2lbpHCntElnZU6FXLxXV9efb2GM4a/
 +/MWbfC+gyjClVVovz8Eq91az4cFSUahksvO8OMsqm1bohB37rpY2lesW0gEe6Q7G+gEg2Lp6KO
 Slc5Tr/c0O9fXbvdqQItkXI8=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2dd83e1fad1b43ba;
	Fri, 25 Sep 2026 14:42:32 +0000
X-Mizu-Trace-ID: 2dd83e1fad1b43ba
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
Subject: [PATCH v3 1/4] platform/x86: asus-armoury: move has_valid_limit() above the attribute declarations
Date: Fri, 25 Sep 2026 14:42:25 +0000
Message-ID: <20260925144229.3693-2-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260925144229.3693-1-denis.benato@linux.dev>
References: <20260925144229.3693-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pure code move in preparation for making the power tunable attribute
groups gate their visibility on the platform limits: the visibility
callbacks expanded by the group macros at the attribute declaration
sites will call has_valid_limit(), which therefore needs to be declared
before them.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.c | 76 ++++++++++++++---------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 2d5ca75bc727..067d9db93ce4 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -782,6 +782,44 @@ static inline struct rog_tunables *get_current_tunables(void)
 	return asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
 }
 
+/**
+ * has_valid_limit - Checks if a power-related attribute has a valid limit value
+ * @name: The name of the attribute to check
+ * @limits: Pointer to the power_limits structure containing limit values
+ *
+ * This function checks if a power-related attribute has a valid limit value.
+ * It returns false if limits is NULL or if the corresponding limit value is zero.
+ *
+ * Return: true if the attribute has a valid limit value, false otherwise
+ */
+static bool has_valid_limit(const char *name, const struct power_limits *limits)
+{
+	u32 limit_value = 0;
+
+	if (!limits)
+		return false;
+
+	if (!strcmp(name, ATTR_PPT_PL1_SPL))
+		limit_value = limits->ppt_pl1_spl_max;
+	else if (!strcmp(name, ATTR_PPT_PL2_SPPT))
+		limit_value = limits->ppt_pl2_sppt_max;
+	else if (!strcmp(name, ATTR_PPT_PL3_FPPT))
+		limit_value = limits->ppt_pl3_fppt_max;
+	else if (!strcmp(name, ATTR_PPT_APU_SPPT))
+		limit_value = limits->ppt_apu_sppt_max;
+	else if (!strcmp(name, ATTR_PPT_PLATFORM_SPPT))
+		limit_value = limits->ppt_platform_sppt_max;
+	else if (!strcmp(name, ATTR_NV_DYNAMIC_BOOST))
+		limit_value = limits->nv_dynamic_boost_max;
+	else if (!strcmp(name, ATTR_NV_TEMP_TARGET))
+		limit_value = limits->nv_temp_target_max;
+	else if (!strcmp(name, ATTR_NV_BASE_TGP) ||
+		 !strcmp(name, ATTR_NV_TGP))
+		limit_value = limits->nv_tgp_max;
+
+	return limit_value > 0;
+}
+
 /* Simple attribute creation */
 ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
 			    "Show the current mode of charging");
@@ -871,44 +909,6 @@ static bool is_power_tunable_attr(const char *name)
 	return false;
 }
 
-/**
- * has_valid_limit - Checks if a power-related attribute has a valid limit value
- * @name: The name of the attribute to check
- * @limits: Pointer to the power_limits structure containing limit values
- *
- * This function checks if a power-related attribute has a valid limit value.
- * It returns false if limits is NULL or if the corresponding limit value is zero.
- *
- * Return: true if the attribute has a valid limit value, false otherwise
- */
-static bool has_valid_limit(const char *name, const struct power_limits *limits)
-{
-	u32 limit_value = 0;
-
-	if (!limits)
-		return false;
-
-	if (!strcmp(name, ATTR_PPT_PL1_SPL))
-		limit_value = limits->ppt_pl1_spl_max;
-	else if (!strcmp(name, ATTR_PPT_PL2_SPPT))
-		limit_value = limits->ppt_pl2_sppt_max;
-	else if (!strcmp(name, ATTR_PPT_PL3_FPPT))
-		limit_value = limits->ppt_pl3_fppt_max;
-	else if (!strcmp(name, ATTR_PPT_APU_SPPT))
-		limit_value = limits->ppt_apu_sppt_max;
-	else if (!strcmp(name, ATTR_PPT_PLATFORM_SPPT))
-		limit_value = limits->ppt_platform_sppt_max;
-	else if (!strcmp(name, ATTR_NV_DYNAMIC_BOOST))
-		limit_value = limits->nv_dynamic_boost_max;
-	else if (!strcmp(name, ATTR_NV_TEMP_TARGET))
-		limit_value = limits->nv_temp_target_max;
-	else if (!strcmp(name, ATTR_NV_BASE_TGP) ||
-		 !strcmp(name, ATTR_NV_TGP))
-		limit_value = limits->nv_tgp_max;
-
-	return limit_value > 0;
-}
-
 static int asus_fw_attr_add(void)
 {
 	const struct rog_tunables *const ac_rog_tunables =
-- 
2.47.3

