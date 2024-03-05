Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AECB5D47E
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636383; cv=none; b=PD9Qv5iUWI/geaKOOhJDvbf5uKI4h7p0graUdYhaBqEXaWgPHNihw8L6ZjiOiWNTnTSyL3zofkbBVCC4HyKhcoguQ4dbYjRIlK+y4+jKzyRhOuVMZV1yemfxVu25jKYLy8vOun6PvUb5xZF7irNCRgI9zs+RlURVhMr3W/m8qfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636383; c=relaxed/simple;
	bh=c6MqmODdMYlBmjDOlDN8R/k8inYLZPi4Xy3tALiXFbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRzh9GRJMXPhrm8BXuceqp7Z8dW64mjSrOdomijXUldnrYk+trhC0yI5QkzY1phHG25jWI0tdJgQCCB0jmEoc9T/wBA+xClI3oER+HmK1tQ1qHt89yEU0T5YBHW3y/GLgJVv5/hHRDpWnX+mtzeHIt73AJIGF4gwbJhFW6fFGvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LamrF6l7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LamrF6l7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709636381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Nn7QLWui+E10V2dPVlHH/YfClJTC485Sk93yFLmpHY=;
	b=LamrF6l7hDuGGuNX92A4lEA9/0xx+96RpAnwbqgSDt/j7O/b/zNAIP3D/QQPSx7Vp4j9En
	+TlEcQ15YcekInVoBRyHFMptRgPwP2MOQpeKpWRm+J0QDoPYZcZ6Xw3+dPsHAkN2/SaAeK
	twfxDUr3LMEIk5sSCEMLmP+D9AkbT8w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-aRF07tVvPAafwZACZEdWzQ-1; Tue, 05 Mar 2024 05:59:36 -0500
X-MC-Unique: aRF07tVvPAafwZACZEdWzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10601800264;
	Tue,  5 Mar 2024 10:59:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C4F11C060D6;
	Tue,  5 Mar 2024 10:59:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 5/5] x86/platform/atom: Check state of Punit managed devices on s2idle
Date: Tue,  5 Mar 2024 11:59:15 +0100
Message-ID: <20240305105915.76242-6-hdegoede@redhat.com>
In-Reply-To: <20240305105915.76242-1-hdegoede@redhat.com>
References: <20240305105915.76242-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

From: Johannes Stezenbach <js@sig21.net>

For the Bay Trail or Cherry Trail SoC to enter the S0i3 power-level
at s2idle suspend requires most of the hw-blocks / devices in the SoC
to be in D3 when entering s2idle suspend.

If some devices are not in D3 then the SoC will stay in a higher
power state, consuming much more power from the battery then in S0i3.

Use the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
functionality to register a new s2idle check function which checks that
all hardware blocks in the North complex (controlled by Punit) are in
a state that allows the SoC to enter S0i3 and prints an error message
for any device in D0.

Signed-off-by: Johannes Stezenbach <js@sig21.net>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
[hdegoede: Use acpi_s2idle_dev_ops]
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Reword commit message
- Add punit_s2idle_check_[un]register() helper functions
---
 arch/x86/platform/atom/punit_atom_debug.c | 54 ++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/atom/punit_atom_debug.c b/arch/x86/platform/atom/punit_atom_debug.c
index f8ed5f66cd20..6b9c6deca8ba 100644
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
@@ -117,6 +120,51 @@ static void punit_dbgfs_unregister(void)
 	debugfs_remove_recursive(punit_dbg_file);
 }
 
+#if defined(CONFIG_ACPI) && defined(CONFIG_SUSPEND)
+static const struct punit_device *punit_dev;
+
+static void punit_s2idle_check(void)
+{
+	const struct punit_device *punit_devp;
+	u32 punit_pwr_status, dstate;
+	int status;
+
+	for (punit_devp = punit_dev; punit_devp->name; punit_devp++) {
+		/* Skip MIO, it is on till the very last moment */
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
+
+static void punit_s2idle_check_register(struct punit_device *punit_device)
+{
+	punit_dev = punit_device;
+	acpi_register_lps0_dev(&punit_s2idle_ops);
+}
+
+static void punit_s2idle_check_unregister(void)
+{
+	acpi_unregister_lps0_dev(&punit_s2idle_ops);
+}
+#else
+static void punit_s2idle_check_register(struct punit_device *punit_device) {}
+static void punit_s2idle_check_unregister(void) {}
+#endif
+
 #define X86_MATCH(model, data)						 \
 	X86_MATCH_VENDOR_FAM_MODEL_FEATURE(INTEL, 6, INTEL_FAM6_##model, \
 					   X86_FEATURE_MWAIT, data)
@@ -131,19 +179,23 @@ MODULE_DEVICE_TABLE(x86cpu, intel_punit_cpu_ids);
 
 static int __init punit_atom_debug_init(void)
 {
+	struct punit_device *punit_device;
 	const struct x86_cpu_id *id;
 
 	id = x86_match_cpu(intel_punit_cpu_ids);
 	if (!id)
 		return -ENODEV;
 
-	punit_dbgfs_register((struct punit_device *)id->driver_data);
+	punit_device = (struct punit_device *)id->driver_data;
+	punit_dbgfs_register(punit_device);
+	punit_s2idle_check_register(punit_device);
 
 	return 0;
 }
 
 static void __exit punit_atom_debug_exit(void)
 {
+	punit_s2idle_check_unregister();
 	punit_dbgfs_unregister();
 }
 
-- 
2.43.2

