Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF8643B4BD;
	Tue,  1 Sep 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275041; cv=pass; b=emwqnR2iYPBdTDDldsb7kBt1V086XarzeiQL51J87fygMA0FCG4EimeLE66321kehWefeHak+rK7WH5VIXz1nXDCMj18ujTAheqZn6xQCPB95XFeFPHbwbXwfLVhO1UZbLwOgnzL6fBjdF/vwWnmZYhrMJ9yP6kGC9LI4TxhXF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275041; c=relaxed/simple;
	bh=bsiX9TmU8yyJWunXTtk29c3Q4XxwYjJFWNna0AbGdLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4HFT+S7hJo62bcq00srpEMSZYqpzulI9dCLE/ZQCLfQX0kbmoNqOM0Ml/PhRtoqsc2kRoCp6bme3/RQtmTiWoMP0+gURyCNpRfng9cnZs+1LHDz1/jrdWqkg6a/0PFNchm954TkYRbgqtYZKWngH4ntKoqLsOwVmVVN3djKUfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=rC8KrlFG; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="rC8KrlFG"
ARC-Seal: i=1; a=rsa-sha256; t=1788275023; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JSvCwaDj7o5huU1KlCQpr8W6r1hZc80re2SoCuKreSLGQ7YfwppDhDSjynY+qmIP11N/gBOWD7WHpuVt32CTbBd9CphRW95wSr9AGHcD9jGH2a4aPiDENwiGYH+mmFHh3aGzAHLgnuMs1MVxbWD/2hpjIjGwlLGA6nYd+e+6fco=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275023; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cTnD9NEl02EgDePoGeEJ/9xidaKFbvUQBYGEhsD2/Lo=; 
	b=IWEiIx6nDDSzr0LMgYPG2Ml/NXzOIDyO5dZ+fBkyTd9hvPd3UXJrolydjY9tK3YuiH4KjvVVK+7mQct0RupoDzR9b9Ls6iANDNZfr9bhpcYd0O9LufZfA7We144tbu7G1YwYH9Kcd59vGBL8ALBGcIePEXvcjXcSdjvij/PIWOI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275023;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cTnD9NEl02EgDePoGeEJ/9xidaKFbvUQBYGEhsD2/Lo=;
	b=rC8KrlFGAVh0FSvRLHu/Qyjy9vbrycdxpMRr4NfhzP3w1DDz7qEihZ86wqQVwQSv
	BUoF0kEh4yGvajH2pjUGeNxo2sijDM8M70Cl3Ye9GA3tVL7Jwrqmi4v73ZgsT44R6gS
	+sfsPHbzWfH4JsA/IdYjRcVQIvqxGhD4iOyDfySZ5YtP2hAlhagefbOpohxiw9Gnj9T
	C9LYNqPFFFOidulTf26PrSnD/Tk8s8nkP5Rt88j+b3mAgFcnSAGAadI5hNqFSwqi0Ug
	7HjpdsIA9XUe2gi+XJ9IZ13/yeVY1c/ngSPhPOhU/p2O7BpjiIdiaIkXABjHyOaR7eU
	lnQTxBYeIg==
Received: by mx.zohomail.com with SMTPS id 1788275020278835.966605680935;
	Tue, 1 Sep 2026 08:03:40 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 01 Sep 2026 23:02:12 +0800
Subject: [PATCH 2/5] platform/x86/amd/pmf: Inline simple helper functions
 of Core Layer
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-amd-pmf-fix-outlining-v1-2-b54ff94d3d45@rong.moe>
References: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
In-Reply-To: <20260901-amd-pmf-fix-outlining-v1-0-b54ff94d3d45@rong.moe>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Sanket Goswami <Sanket.Goswami@amd.com>, 
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-1f2f7
X-ZohoMailClient: External

The Core Layer has simple and dumb helper functions defined as global
symbols, which are heavily used by other layers and become symbols
against linkage. This bloats the size of the module.

Convert them into static inline functions to get rid of the overhead of
function outlining and linkage, and shrink the module
(!CONFIG_AMD_PMF_DEBUG && CONFIG_AMD_PMF_UTIL_SUPPORT) size by 432 Bytes
(GCC 16 -O2):

      text       data        bss      total filename	(before)
     26781      31636       2768      61185 amd-pmf.ko

      text       data        bss      total filename	(after)
     26533      31452       2768      60753 amd-pmf.ko

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/amd/pmf/acpi.c | 11 -----------
 drivers/platform/x86/amd/pmf/core.c | 22 ---------------------
 drivers/platform/x86/amd/pmf/pmf.h  | 39 +++++++++++++++++++++++++++++++++----
 3 files changed, 35 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 3d94b03cf794..6a2c11e75eea 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -158,17 +158,6 @@ static int apts_if_call_store_buffer(struct amd_pmf_dev *pdev,
 	return err;
 }
 
-int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
-{
-	/* If bit-n is set, that indicates function n+1 is supported */
-	return !!(pdev->supported_func & BIT(index - 1));
-}
-
-int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev)
-{
-	return !!(pdev->notifications & CUSTOM_BIOS_INPUT_BITS);
-}
-
 int apts_get_static_slider_granular_v2(struct amd_pmf_dev *pdev,
 				       struct amd_pmf_apts_granular_output *data, u32 apts_idx)
 {
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index b4eae65e675b..ec2ce7fa3dee 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -138,14 +138,6 @@ static void amd_pmf_dbgfs_register(struct amd_pmf_dev *dev)
 				    &current_power_limits_fops);
 }
 
-int amd_pmf_get_power_source(void)
-{
-	if (power_supply_is_system_supplied() > 0)
-		return POWER_SOURCE_AC;
-	else
-		return POWER_SOURCE_DC;
-}
-
 static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
 {
 	return ioread32(dev->regbase + reg_offset);
@@ -176,20 +168,6 @@ static void __maybe_unused amd_pmf_dump_registers(struct amd_pmf_dev *dev)
 	dev_dbg(dev->dev, "AMD_PMF_REGISTER_MESSAGE:%x\n", value);
 }
 
-/**
- * fixp_q88_fromint: Convert integer to Q8.8
- * @val: input value
- *
- * Converts an integer into binary fixed point format where 8 bits
- * are used for integer and 8 bits are used for the decimal.
- *
- * Return: unsigned integer converted to Q8.8 format
- */
-u32 fixp_q88_fromint(u32 val)
-{
-	return val << 8;
-}
-
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data)
 {
 	int rc;
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4da2ef1abb50..024f20306e11 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -13,11 +13,13 @@
 
 #include <linux/acpi.h>
 #include <linux/amd-pmf-io.h>
+#include <linux/bits.h>
 #include <linux/circ_buf.h>
 #include <linux/compiler_attributes.h>
 #include <linux/compiler_types.h>
 #include <linux/input.h>
 #include <linux/mutex_types.h>
+#include <linux/power_supply.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/types.h>
@@ -1073,18 +1075,47 @@ struct ta_pmf_shared_memory {
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
-int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
 int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
 int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
-int amd_pmf_get_power_source(void);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
 int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer);
 int amd_pmf_notify_sbios_heartbeat_event_v2(struct amd_pmf_dev *dev, u8 flag);
-u32 fixp_q88_fromint(u32 val);
-int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev);
 void amd_pmf_set_device(struct device *p_device);
 
+static inline int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index)
+{
+	/* If bit-n is set, that indicates function n+1 is supported */
+	return !!(pdev->supported_func & BIT(index - 1));
+}
+
+static inline int is_apmf_bios_input_notifications_supported(struct amd_pmf_dev *pdev)
+{
+	return !!(pdev->notifications & CUSTOM_BIOS_INPUT_BITS);
+}
+
+static inline int amd_pmf_get_power_source(void)
+{
+	if (power_supply_is_system_supplied() > 0)
+		return POWER_SOURCE_AC;
+	else
+		return POWER_SOURCE_DC;
+}
+
+/**
+ * fixp_q88_fromint: Convert integer to Q8.8
+ * @val: input value
+ *
+ * Converts an integer into binary fixed point format where 8 bits
+ * are used for integer and 8 bits are used for the decimal.
+ *
+ * Return: unsigned integer converted to Q8.8 format
+ */
+static inline u32 fixp_q88_fromint(u32 val)
+{
+	return val << 8;
+}
+
 /* Metrics layer */
 int amd_pmf_get_tbl_dram_addr(struct amd_pmf_dev *dev);
 

-- 
2.55.0

