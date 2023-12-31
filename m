Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413188484
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h4gvyPqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704040415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jy2ggSLvM5SLvy+vAKZJKvRDZmKa5xq023novpbhPp8=;
	b=h4gvyPqytTOv36FxkEzj85n0nHIQG7lG0q141JtAjCSDZX2TpxpCfmVrXuAFEqlUPXXbsu
	EHp+pCYXTD3eTOcdBOT58FU99rfwmTtNiRUsRm5LWdhiy5wI1tiN5fO6KVwAXaRpLA3whx
	MC55UvaRgZItjLfbPocqzPLL+yZ2WkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-fXi_7uczOw2xuK73ljNHSw-1; Sun, 31 Dec 2023 11:33:31 -0500
X-MC-Unique: fXi_7uczOw2xuK73ljNHSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 121ED185A783;
	Sun, 31 Dec 2023 16:33:31 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86E85C15A0C;
	Sun, 31 Dec 2023 16:33:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 2/4] platform/x86: pmc_atom: Check state of PMC managed devices on s2idle
Date: Sun, 31 Dec 2023 17:33:20 +0100
Message-ID: <20231231163322.9492-3-hdegoede@redhat.com>
In-Reply-To: <20231231163322.9492-1-hdegoede@redhat.com>
References: <20231231163322.9492-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

From: Johannes Stezenbach <js@sig21.net>

This is a port of "pm: Add pm suspend debug notifier for South IPs"
from the latte-l-oss branch of:
from https://github.com/MiCode/Xiaomi_Kernel_OpenSource latte-l-oss

With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
functionality this can now finally be ported to the mainline kernel
without requiring adding non-upstreamable hooks into the cpu_idle
driver mechanism.

This adds a check that all hardware blocks in the South complex
(controlled by PMC) are in a state that allows the SoC to enter S0i3
and prints an error message for any device in D0.

Note the pmc_atom code is enabled by CONFIG_X86_INTEL_LPSS which
already depends on ACPI.

Signed-off-by: Johannes Stezenbach <js@sig21.net>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[hdegoede: Use acpi_s2idle_dev_ops, ignore fused off blocks, PMIC I2C]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/pmc_atom.c | 67 +++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 93a6414c6611..e14d489fa6f9 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -6,6 +6,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/acpi.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
@@ -17,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/seq_file.h>
+#include <linux/suspend.h>
 
 struct pmc_bit_map {
 	const char *name;
@@ -448,6 +450,67 @@ static int pmc_setup_clks(struct pci_dev *pdev, void __iomem *pmc_regmap,
 	return 0;
 }
 
+#ifdef CONFIG_SUSPEND
+static void pmc_dev_state_check(u32 sts, const struct pmc_bit_map *sts_map,
+				u32 fd, const struct pmc_bit_map *fd_map,
+				u32 sts_possible_false_pos)
+{
+	int index;
+
+	for (index = 0; sts_map[index].name; index++) {
+		if (!(fd_map[index].bit_mask & fd) &&
+		    !(sts_map[index].bit_mask & sts)) {
+			if (sts_map[index].bit_mask & sts_possible_false_pos)
+				pm_pr_dbg("pmc_atom: %s is in D0 prior to s2idle\n",
+					  sts_map[index].name);
+			else
+				pr_err("pmc_atom: %s is in D0 prior to s2idle\n",
+				       sts_map[index].name);
+		}
+	}
+}
+
+static void pmc_s2idle_check(void)
+{
+	struct pmc_dev *pmc = &pmc_device;
+	const struct pmc_reg_map *m = pmc->map;
+	u32 func_dis, func_dis_2;
+	u32 d3_sts_0, d3_sts_1;
+	u32 false_pos_sts_0, false_pos_sts_1;
+
+	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
+	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
+	d3_sts_0 = pmc_reg_read(pmc, PMC_D3_STS_0);
+	d3_sts_1 = pmc_reg_read(pmc, PMC_D3_STS_1);
+
+	/*
+	 * Some blocks are not used on lower-featured versions of the SoC and
+	 * always report D0, add these to false_pos mask to log at debug lvl.
+	 */
+	if (m->d3_sts_1	== byt_d3_sts_1_map) {
+		/* BYT */
+		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_PCIE_PORT0 |
+			BIT_PCIE_PORT1 | BIT_PCIE_PORT2 | BIT_PCIE_PORT3 |
+			BIT_LPSS2_F5_I2C5;
+		false_pos_sts_1 = BIT_SMB | BIT_USH_SS_PHY | BIT_DFX;
+	} else {
+		/* CHT */
+		false_pos_sts_0 = BIT_GBE | BIT_SATA | BIT_LPSS2_F7_I2C7;
+		false_pos_sts_1 = BIT_SMB | BIT_STS_ISH;
+	}
+
+	/* Low part */
+	pmc_dev_state_check(d3_sts_0, m->d3_sts_0, func_dis, m->func_dis, false_pos_sts_0);
+
+	/* High part */
+	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
+}
+
+static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
+	.check = pmc_s2idle_check,
+};
+#endif
+
 static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct pmc_dev *pmc = &pmc_device;
@@ -485,6 +548,10 @@ static int pmc_setup_dev(struct pci_dev *pdev, const struct pci_device_id *ent)
 		dev_warn(&pdev->dev, "platform clocks register failed: %d\n",
 			 ret);
 
+#ifdef CONFIG_SUSPEND
+	acpi_register_lps0_dev(&pmc_s2idle_ops);
+#endif
+
 	pmc->init = true;
 	return ret;
 }
-- 
2.43.0

