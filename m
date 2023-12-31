Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AA58483
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g2sCNH+F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704040418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hpArVQLj57Rr7iXvC+/YVZTaR/YLrYEeueGBuC4mDP8=;
	b=g2sCNH+FiOzBjPPKEvFT9XzDf64DrjAcwLywJrG2lD5379rkHXoM7v3azNDy/nYUfe4lKw
	SItLWP1ewqESBhD2eksSkHRWC+1Vj644WXqOcFu1vqKKtf3T4IDRqyUmXzpahz7fPcb+yI
	8p1aTIcisyoTwZ4P6l/1N8XM6xrn93s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-l1YFIPYNNPaSKYzZwngfig-1; Sun,
 31 Dec 2023 11:33:35 -0500
X-MC-Unique: l1YFIPYNNPaSKYzZwngfig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B43852824760;
	Sun, 31 Dec 2023 16:33:34 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2F60DC15E6C;
	Sun, 31 Dec 2023 16:33:33 +0000 (UTC)
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
Subject: [PATCH 4/4] x86/platform/atom: Check state of Punit managed devices on s2idle
Date: Sun, 31 Dec 2023 17:33:22 +0100
Message-ID: <20231231163322.9492-5-hdegoede@redhat.com>
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

This is a port of "pm: Add pm suspend debug notifier for North IPs"
from the latte-l-oss branch of:
from https://github.com/MiCode/Xiaomi_Kernel_OpenSource latte-l-oss

With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
functionality this can now finally be ported to the mainline kernel
without requiring adding non-upstreamable hooks into the cpu_idle
driver mechanism.

This adds a check that all hardware blocks in the North complex
(controlled by Punit) are in a state that allows the SoC to enter S0i3
and prints an error message for any device in D0.

Signed-off-by: Johannes Stezenbach <js@sig21.net>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
[hdegoede: Use acpi_s2idle_dev_ops]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 arch/x86/platform/atom/punit_atom_debug.c | 40 +++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/x86/platform/atom/punit_atom_debug.c b/arch/x86/platform/atom/punit_atom_debug.c
index f8ed5f66cd20..efa4b188300d 100644
--- a/arch/x86/platform/atom/punit_atom_debug.c
+++ b/arch/x86/platform/atom/punit_atom_debug.c
@@ -7,6 +7,9 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#define pr_fmt(fmt) "punit_atom: " fmt
+
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/device.h>
@@ -102,10 +105,12 @@ static int punit_dev_state_show(struct seq_file *seq_file, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(punit_dev_state);
 
+static const struct punit_device *punit_dev;
 static struct dentry *punit_dbg_file;
 
 static void punit_dbgfs_register(struct punit_device *punit_device)
 {
+	punit_dev = punit_device;
 	punit_dbg_file = debugfs_create_dir("punit_atom", NULL);
 
 	debugfs_create_file("dev_power_state", 0444, punit_dbg_file,
@@ -117,6 +122,35 @@ static void punit_dbgfs_unregister(void)
 	debugfs_remove_recursive(punit_dbg_file);
 }
 
+#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
+static void punit_s2idle_check(void)
+{
+	const struct punit_device *punit_devp;
+	u32 punit_pwr_status, dstate;
+	int status;
+
+	for (punit_devp = punit_dev; punit_devp->name; punit_devp++) {
+		/* Skip MIO this is on till the very last moment */
+		if (punit_devp->reg == MIO_SS_PM)
+			continue;
+
+		status = iosf_mbi_read(BT_MBI_UNIT_PMC, MBI_REG_READ,
+				       punit_devp->reg, &punit_pwr_status);
+		if (status) {
+			pr_err("%s read failed\n", punit_devp->name);
+		} else  {
+			dstate = (punit_pwr_status >> punit_devp->sss_pos) & 3;
+			if (!dstate)
+				pr_err("%s is in D0 prior to s2idle\n", punit_devp->name);
+		}
+	}
+}
+
+static struct acpi_s2idle_dev_ops punit_s2idle_ops = {
+	.check = punit_s2idle_check,
+};
+#endif
+
 #define X86_MATCH(model, data)						 \
 	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_##model, \
 					   X86_FEATURE_MWAIT, data)
@@ -138,12 +172,18 @@ static int __init punit_atom_debug_init(void)
 		return -ENODEV;
 
 	punit_dbgfs_register((struct punit_device *)id->driver_data);
+#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
+	acpi_register_lps0_dev(&punit_s2idle_ops);
+#endif
 
 	return 0;
 }
 
 static void __exit punit_atom_debug_exit(void)
 {
+#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
+	acpi_unregister_lps0_dev(&punit_s2idle_ops);
+#endif
 	punit_dbgfs_unregister();
 }
 
-- 
2.43.0

