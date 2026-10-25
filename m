Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900943;
	b=FcvqJMcU5c0KsnSqhT+L1jJcpTKMXuLi3cP9pMDo7n2REoIX0bkwBqwRnq1N1lw00MhT
	 p5GZ1Tf0pRZU8msHT754uRsb8qhRLrQUv3J6o2K+dVJrDIoS7TznpQS3FwKmRbEMMwpVX
	 EcPGq58M9s7sQ9WIsVuNwZfVQffEdVdVxctAACfux1/CvrTjS1T8AJ4pF2LCDVKmLbsQ4
	 lz1m2yStMKaFWXvb1vEmWAd614FdGZ4uDlfph9m3qenLsgSIgFMw5OP3Vrlm4L6iVXldt
	 HJRYGD8tVl9UjB78BWJecml60ts7oJWNG/3eTdZxq9DobcBRYD0GRcvux0e4anLsBkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9V8bhrkeRqD536LIpEdmwvDv4vBsMscyvHJCjoTqtsw=;
	b=Mt8IQ9jVoMKZR/K8ecKEuHxtuJSuwj5Mj1PuzB9iriSqxLO9SQScllmek4GQbqnPr5iz
	 Txn0JOraG73K3R6pjfQvXEmuSeRPrj184ST2qYRSXxEdhjS0PPW8E+Y5dUMQsCypPZaQD
	 8UUuOrWGjoGw/f2chNe64hReu4kSSxz7pY5OcuY11HorxAm1QcS1CZVr9lq0qo+p5Fxkw
	 apX12T25NOGSXSEFXaYTDjVTjPxIq/CBEJF7S+SjcscfKly8EuEqiNclRkjQe53Ig2eYZ
	 NNeSTN+2OxAvfGbHSbvyg/KKABm6wzmDdl2DIzXsRYP7rqJB0KMV3dklmZ4/4BFS5Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Edbei+9+;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297B1606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 297B1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Edbei+9+
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-156cbe59622so1285705c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900941; x=1793505741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9V8bhrkeRqD536LIpEdmwvDv4vBsMscyvHJCjoTqtsw=;
        b=Edbei+9+prgspDDlFtXr6lXH7oZp3Bu+pRv2o4XtsaMRudMu8MtLiOElGlLizbMP0k
         Fr0TeAqB3xodFxj0h3gxbXvlROmI+URcC3zF0Je3ygXwaljKwBLtEsonFhjMCIXAoZUw
         WG93PfTEByDD+FaiqAv41FC4xxi4aw0/QK/HFbyfrMz1VRk3+Yejez3Il3OTE43pcjrq
         UOZ1e2cwrNy28uOCYikzK84bIfjc6Z8BaoUftbU0X5eg1lVbmLoWj2ldfA7XCkn+ZHx6
         MBNnOyBLEO3afuJZGqWB3onxG9cDTraNZMPespPxOvJ8Z3/6qGegES/6QZuIVTZ6t+/e
         LtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900941; x=1793505741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9V8bhrkeRqD536LIpEdmwvDv4vBsMscyvHJCjoTqtsw=;
        b=Teb+E4/mlmddYj4HmF3uLToUCkl/gME3/7CMbC4+pRvhfIK3PvdTcAMmtJW6paRExc
         Nf337rw9hfCHPP5d3tYOJjlM1THTRmEmlcdvn2PrcGVyN+OtHCwCQuK3tIizdg7Ub/kz
         C34aP0opbZ8aKHTGi7Y10whKEc8BE0Cqy26x73F6mhpyOqNm4rG9AzasIuezuE0OmkU3
         4wKqyi0SaKNbSQb0RjHOI81xgJi1AFdzziIITAQ/JBF58Gi8GGFsGIw8Orbg5vtR8lL2
         KLnZzxM8cvP2RxwjTczvlw7dBGB6HY0Fu5gk06GCGkVsiOlIqg+SKpcW9bdZK6TAw0Sy
         6paQ==
X-Forwarded-Encrypted: i=1; AKwUvBxebE70Ae8AxW+VlvO5PtJOYUrwDNr80DltzUXh1uIqc5uScB7X6CDA5CiUS4qxUml/AbN2/pP6JHiIh/Y5kge70XXh@vger.kernel.org
X-Gm-Message-State: AFq9FYL43vr02fvCdAzf51IrgCigX/HclctGJea512le89bsmkTOfiSn
	FqI73rYBOy0oOoVMida9Ul6tEmG0tDfz4KB5ofEYTm1JM7C8Snz4I8I=
X-Gm-Gg: AYBFou2Bz22xebPj7Acoe909sfkVtE1YjMLk/KfjxUzEvOaJzf0WnSogqf9thFS6z/9
	wsdpkv0TkdaAAavSzvnEj4YIXWW/WMmxHwIDwcXQIemms+QIGTO3qVZ8k9qcH5jpxmbnloLx6Sc
	HkbgLjceDZzMDHj96yjgBIBJ8O4gbRefNMdibqodw2xu6pf7yNOIYeo92LaGTPu+Pl/fA+sIvQe
	mzBZK9RMBtsYl+7Ovxdn+MSSfWmE8FYR2JG8/JYlGcEx9v+KXxXaJFdCWtZWsCA/fSCuvDhfDTR
	uqMGP+MjWOYZqEqSvPb6uj13BYHTIFAyvJ+/E/rcQvJ4v85JUDiSDC2aDNsZCFKRbPhdgO+vpNv
	DcnPLTTGO8z8/fsAxFM+3i8ElWUSj2brvNlQjdAJ+NBGcFtmz17ttHrqv76MknMrTZkQQl2QOaT
	japmdgdU7ZkIK168kVKPkOLYn3pggPPjc23Zl17RUwPw534/fa/GgyKXlMHUkO7MJu6uY6B1ECX
	8m1GIM6RPzYrXghXdqvjix2+iTP8oXQWU2jNXLis9DaynlvMax5nVxPXitFz3iQ+LM2UHCNdi/L
	I9MOvKPu+Ok9xEE=
X-Received: by 2002:a05:7023:d04:b0:15c:1679:1cc7 with SMTP id a92af1059eb24-19936e34bacmr5319231c88.37.1792900941134;
        Sat, 24 Oct 2026 21:02:21 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:02:20 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 04/13] platform/apple-gmux: Fix Interrupts for MMIO systems
Date: Sat, 24 Oct 2026 23:59:40 -0400
Message-ID: <20261025040046.1602-5-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

on MMIO systems, we need check to for failure in interrupts,
and we have implimented display hotplug to wake up the gpu.

Co-developed-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 96 +++++++++++++++++++++++++++----
 1 file changed, 84 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 076ed7ba6..bef87a57a 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -6,6 +6,8 @@
  *  Copyright (C) 2010-2012 Andreas Heider <andreas@meetr.de>
  *  Copyright (C) 2015 Lukas Wunner <lukas@wunner.de>
  *  Copyright (C) 2023 Orlando Chamberlain <orlandoch.dev@gmail.com>
+ *  Copyright (C) 2026 Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
+ *  Copyright (C) 2026 Andre Eikmeyer <dev@deq.rocks>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -23,6 +25,8 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/debugfs.h>
 #include <linux/dmi.h>
+#include <linux/workqueue.h>
+#include <linux/pm_runtime.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -66,6 +70,10 @@ struct apple_gmux_data {
 
 	struct backlight_device *bdev;
 
+	/* interrupt handling data */
+	bool external_state;
+	struct work_struct interrupt_work;
+
 	/* power handling data */
 	struct pci_dev *discrete_pdev;
 	bool uses_pwrd;
@@ -105,6 +113,7 @@ struct apple_gmux_config {
 
 #define GMUX_INTERRUPT_STATUS_ACTIVE	0
 #define GMUX_INTERRUPT_STATUS_DISPLAY	(1 << 0)
+#define GMUX_INTERRUPT_STATUS_FAILED	(1 << 1)
 #define GMUX_INTERRUPT_STATUS_POWER	(1 << 2)
 #define GMUX_INTERRUPT_STATUS_HOTPLUG	(1 << 3)
 
@@ -417,8 +426,8 @@ static const struct backlight_ops gmux_bl_ops = {
  * the discrete GPU can then be woken to drive the newly connected display.
  * The ability to switch AUX on these generations could be used to improve
  * reliability of hotplug detection by having the integrated GPU poll the
- * ports while the discrete GPU is asleep, but currently we do not make use
- * of this feature.
+ * ports while the discrete GPU is asleep, but currently we only make use of
+ * this feature on MMIO/T2 Macs.
  *
  * Our switching policy for the external port is that on those generations
  * which are able to switch it fully, the port is switched together with the
@@ -796,9 +805,10 @@ static const struct apple_gmux_config apple_gmux_mmio = {
  * value is read and then inverted.
  *
  * Because Linux masquerades as Darwin, it ends up in the notification-only code
- * path. On MMIO gmux's, this seems to lead to us being unable to clear interrupts,
- * unless we call GMSP(0). Without this, there is a flood of status=0 interrupts
- * that can't be cleared. This issue seems to be unique to MMIO gmux's.
+ * path. On MMIO gmux's, The Polarity is initally left in a undefined state leading
+ * to lots of interrupts, that we can't clear, to fix this we set the polarity to 0
+ * everytime we enable interrupts, On MMIO gmux's, GMLV reads the same GPIO pin as
+ * GMSP, and setting the polarity to 1, stops the Interrupts completely.
  */
 
 static inline void gmux_disable_interrupts(struct apple_gmux_data *gmux_data)
@@ -807,8 +817,11 @@ static inline void gmux_disable_interrupts(struct apple_gmux_data *gmux_data)
 		    GMUX_INTERRUPT_DISABLE);
 }
 
-static inline void gmux_enable_interrupts(struct apple_gmux_data *gmux_data)
+static inline void gmux_enable_interrupts(struct apple_gmux_data *gmux_data, bool do_gmsp)
 {
+	if (gmux_data->type == APPLE_GMUX_TYPE_MMIO && do_gmsp)
+		acpi_execute_simple_method(gmux_data->dhandle, "GMSP", 0);
+
 	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_ENABLE,
 		    GMUX_INTERRUPT_ENABLE);
 }
@@ -825,23 +838,78 @@ static void gmux_clear_interrupts(struct apple_gmux_data *gmux_data)
 	/* to clear interrupts write back current status */
 	status = gmux_interrupt_get_status(gmux_data);
 	gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
-	/* Prevent flood of status=0 interrupts */
-	if (gmux_data->config == &apple_gmux_mmio)
-		acpi_execute_simple_method(gmux_data->dhandle, "GMSP", 0);
 }
 
+static void gmux_notify_work(struct work_struct *work)
+{
+	struct apple_gmux_data *gmux_data =
+		container_of(work, struct apple_gmux_data, interrupt_work);
+	u8 status;
+	bool turn_on_gpu = false;
+
+	status = gmux_interrupt_get_status(gmux_data);
+	if (!status)
+		return;
+
+	gmux_disable_interrupts(gmux_data);
+	pr_debug("Notify handler called: status %d\n", status);
+	acpi_execute_simple_method(gmux_data->dhandle, "GMSP", 0);
+
+	status = gmux_interrupt_get_status(gmux_data);
+	while (status) {
+		gmux_write8(gmux_data, GMUX_PORT_INTERRUPT_STATUS, status);
+		if (status & GMUX_INTERRUPT_STATUS_FAILED) {
+			pr_warn_ratelimited("interrupt failed: status: 0x%x\n", status);
+			status = gmux_interrupt_get_status(gmux_data);
+			continue;
+		}
+		if (status & GMUX_INTERRUPT_STATUS_POWER)
+			complete(&gmux_data->powerchange_done);
+
+		if (status & GMUX_INTERRUPT_STATUS_HOTPLUG) {
+			/*
+			 * We get an interrupt every time a display connects or disconnects, but
+			 * the GET_DISPLAY port only tells us if a display is connected or not,
+			 * so we resume every time a display is connected or disconnected.
+			 */
+			bool external_state = !!gmux_read8(gmux_data,
+						GMUX_PORT_SWITCH_GET_DISPLAY);
+			if (external_state != gmux_data->external_state) {
+				gmux_data->external_state = external_state;
+				if (external_state)
+					pr_debug("A display has been connected\n");
+				else
+					pr_debug("All displays has been disconnected\n");
+			}
+			if (!gmux_data->external_switchable && gmux_data->discrete_pdev)
+				turn_on_gpu = true;
+		}
+		status = gmux_interrupt_get_status(gmux_data);
+	}
+
+	gmux_enable_interrupts(gmux_data, 0);
+
+	if (turn_on_gpu)
+		pm_runtime_resume(&gmux_data->discrete_pdev->dev);
+
+}
 static void gmux_notify_handler(acpi_handle device, u32 value, void *context)
 {
 	u8 status;
 	struct pnp_dev *pnp = (struct pnp_dev *)context;
 	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
 
+	if (gmux_data->type == APPLE_GMUX_TYPE_MMIO) {
+		schedule_work(&gmux_data->interrupt_work);
+		return;
+	}
+
 	status = gmux_interrupt_get_status(gmux_data);
 	gmux_disable_interrupts(gmux_data);
 	pr_debug("Notify handler called: status %d\n", status);
 
 	gmux_clear_interrupts(gmux_data);
-	gmux_enable_interrupts(gmux_data);
+	gmux_enable_interrupts(gmux_data, 0);
 
 	if (status & GMUX_INTERRUPT_STATUS_POWER)
 		complete(&gmux_data->powerchange_done);
@@ -935,7 +1003,7 @@ static int gmux_resume(struct device *dev)
 	struct pnp_dev *pnp = to_pnp_dev(dev);
 	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
 
-	gmux_enable_interrupts(gmux_data);
+	gmux_enable_interrupts(gmux_data, 1);
 	gmux_write_switch_state(gmux_data);
 	if (gmux_data->power_state == VGA_SWITCHEROO_OFF)
 		gmux_set_discrete_state(gmux_data, gmux_data->power_state);
@@ -996,6 +1064,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 			pr_err("couldn't remap gmux mmio region");
 			goto err_release;
 		}
+		INIT_WORK(&gmux_data->interrupt_work, gmux_notify_work);
 		goto get_version;
 	case APPLE_GMUX_TYPE_INDEXED:
 		gmux_data->config = &apple_gmux_index;
@@ -1115,7 +1184,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 
 	apple_gmux_data = gmux_data;
 	init_completion(&gmux_data->powerchange_done);
-	gmux_enable_interrupts(gmux_data);
+	gmux_enable_interrupts(gmux_data, 1);
 	gmux_read_switch_state(gmux_data);
 
 	/*
@@ -1150,6 +1219,8 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 err_unmap:
 	if (gmux_data->iomem_base)
 		iounmap(gmux_data->iomem_base);
+	if (gmux_data->type == APPLE_GMUX_TYPE_MMIO)
+		cancel_work_sync(&gmux_data->interrupt_work);
 err_release:
 	if (gmux_data->config->resource_type == IORESOURCE_MEM)
 		release_mem_region(gmux_data->iostart, gmux_data->iolen);
@@ -1168,6 +1239,7 @@ static void gmux_remove(struct pnp_dev *pnp)
 	vga_switcheroo_unregister_handler();
 	pci_dev_put(gmux_data->discrete_pdev);
 	gmux_disable_interrupts(gmux_data);
+	cancel_work_sync(&gmux_data->interrupt_work);
 	if (gmux_data->gpe >= 0) {
 		acpi_disable_gpe(NULL, gmux_data->gpe);
 		acpi_remove_notify_handler(gmux_data->dhandle,
-- 
2.55.0

