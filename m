Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672355;
	b=3QsLnx83xMOHJVTS4KTcAqKWeqorZo+Xa1KbYmLMpU2MYmYPorewnrWZw3exOExBpvwX
	 Mp3YsZyQsDwrY/O3J8Afhf7B0DQkGvBvzk5EUFaIXARMUnVXMX6BVJgBhLFohD+ubn12f
	 3Sm2hxwEaMz6Xx6cpVFmpasm2plKvypx4y3XWfjTNE9T9wzSQ52jjatcu0edSHNrR8ScW
	 mqZf17oFlNCKXM9d7xkyIEmPGbN/t+eOn7eL4UqRWRaJrA1N8zQA7Ogtd/pA8dsTjHHhr
	 PbGd7Bf/QNEQOHrZkl7PpmJ+c4htsTyqzCsIu6MsaLoztxew7uo0eQK6eirH4YA3GHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rwXxXGuI8odA6JxbQFYflPGUh67I5rWeLK+lGKx8MRg=;
	b=2yIy+t9x0LJrstHoRyEiH/VFtoj7hy7k6LshgcLiEoJ2Zc6kJWKGO4dblshV0EFF92Yu
	 OKrtR5UCEyjHJiIfBCJY1T9dn1u92YH78XhimhGaicy12fdDqtWiie/xWuy2iZO11yNs7
	 Tl+gjk2iD46oo0C87MiUnlwKYuYaWbQ/i9RwMp1OtEBRtx6C37bMQhQxUeyHCU1+S27ub
	 V9pGzACUD1JrhId5nwTGEBblhj7+kqktHYw+Aaj0NC1X6+fCotpTyTDuehh772a8dUUhl
	 CLziVJSB3oZKfJIi4P3zlohhcNF6G6hN4LC4SbXKabykYFmiUw1yT7Cg2dBxZPkxLhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ylt25xxI;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884A3606A327
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884A3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ylt25xxI
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so2740335c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672354; x=1795277154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwXxXGuI8odA6JxbQFYflPGUh67I5rWeLK+lGKx8MRg=;
        b=ylt25xxIBag8hj1X6iBLXaTpMY5Pb0x9gWZ9v811l2u2hHhfwwFVcmDKQXepxHIRwX
         c7PyaEK9KIy3GU77RlSxBsezWsRbkN21rabe7XYhjAETrN7wW9KP4nWH3/TPVufNzUfd
         35t1OD8UXG5J15P4SqlR6T6XOvhd49FQe0PRVY8EzlvKtUTbN9WIJRn8mrvRjBHRmrBZ
         GCP3W2aJfwPBRm8m1Tfd6LSkSbx/N6DqActZwrJccRYgaVjo0GKTAdjnQyZoFucqoIdr
         /G/Pb8WOS+3R2GE8c/PCNJn2mJt6Q9B5bAp718IUyI1kGJ5L8LCuBrkT1di1k/pcvR+i
         Bniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672354; x=1795277154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwXxXGuI8odA6JxbQFYflPGUh67I5rWeLK+lGKx8MRg=;
        b=br6097haO9307VzV3DIr2e714LXzK5p4V3RIF/taXOwGrVBg8Efi4g/wsAch7GtXI2
         6crbv0dnWBiY5VKigCIR+wNuwcwBrZaddVquWcvaCfPyGE2kbIrPF/VYsP7hz5N14Gzr
         yfA+xmznMW/cRDHTN7eaBKXP5tOBcbXJN/7q367kqKPBUAT2Zgb9OLIQ/1tJHi6DUyXW
         NMN3cSkOEWwxW9k1mdhJ1MjfuAoxCrlJwSdKS8oEpgyJmPNRNm7IGhiXzNqFKheeuY6U
         UH1qG3Sw9cKr4OE0JNrR98XImY/82BvGKcR/1tn0Z6DJ41u9Kov/p5ZnzggwMtB3o7wu
         ucng==
X-Forwarded-Encrypted: i=1; AL+hErFjmDrF1e+dNZcJiToaDmjhiY5GnaVdMUQ+bcq8rEKXKz22tiIaBghiLv/QJX3uFalAlUODVH4issUMtriy+482XpK3@vger.kernel.org
X-Gm-Message-State: APuU4Z9siF+1TenQ9GdhCTUvesEc4vl2zJjN756RFwLyzAky+CEXAE8P
	VrOJ9pzpkUkythiSgECnLDxFijyyYDYcGS46RDkd0rgRppZUdu+JP2o=
X-Gm-Gg: AYBFou3aHjzEN/uD6iBNjJcBtcU7PDqDg9pCI/thP21QzLNENwIaHA7SNbWBcy5LPhL
	H+pMpLrlmT+2Toq2MJXUjeFOqSdCXtH3IFbmPMpWDKlsOUjVGHC/HjHPT94Fl84FYGMq/dLWRTT
	YWQn+2AkIiF0zDFUY7S75AAbHWpYeSQYJYiAu8zG8nLzFfHO1Ik8/OYH3s6sddUjCYOVu9BXhRR
	4Mjt1qU+9jvd3iVhX7ESagpraX3xX8NrEKf2euBUBTMLWb1/F1Ph5IudGc7WcctcYQSrtxHgL+8
	xckL3og3VnizGD7VdIlFBhKO6qRhEWc1nVDnu8CMSSkI75g+nQS29ft25jOahQSp+g92T/TB9ba
	vzEI040ZDf903m00JnXOhJet+b1kdlRMfkU9Y6w4UVSMeK+iOKgiYfS2cyUDBtVmfJoUX7jAoBR
	Z1lSyPYQVtniUdpOvH76DIMXkzSsCzjzrnEkGtZe6YTxZTdq0mGN3jEJaX8fQ5t4kuwUcVIBe+y
	3ZoZwtINfS/nKqb0Im7nJPoMNajzp6VI/VsQZV+C2B6i+VlgKIcO/76SFRl1HaDWt5a3/+W6nJG
	o3q19SJm1vP9REyDkU14TGAlGBsouWLk/blvyykG+2jzE+Qolrh3sxDz9XBktF1Cnw==
X-Received: by 2002:a05:7023:d0a:b0:1a4:fac9:aeee with SMTP id a92af1059eb24-1b50302aba6mr5983738c88.4.1794672353408;
        Sat, 14 Nov 2026 08:05:53 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.114.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b505b5bf76sm13378548c88.10.2026.11.14.08.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:05:53 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
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
Subject: [PATCH v2 01/12] platform/apple-gmux: Fix power for MMIO systems
Date: Sat, 14 Nov 2026 11:03:48 -0500
Message-ID: <20261114160457.3034-2-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160457.3034-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160457.3034-1-atharvatiwarilinuxdev@gmail.com>
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

Currently The dGPU on MMIO Systems, dies when we write the gmux values
to turn off the gpu.

On MMIO macs Using only gmux dosent work, instead we have to use PWRD
method + GMUX, which turns off the entire bridge, and completely messes the
pci config, so we can't use pci to traverse through it. we save the
entire bridge using ACPI addresses then we run PWRD(1) to turn off
the bridge, then we write gmux states, and resume we do the vice
versa, but here we dont need to retrain the link and write the
MMIO variable.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Co-developed-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 159 ++++++++++++++++++++++++++++--
 1 file changed, 152 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 9c728ac4e..34e94f2b2 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -65,6 +65,10 @@ struct apple_gmux_data {
 
 	struct backlight_device *bdev;
 
+	/* power handling data */
+	struct pci_dev *discrete_pdev;
+	enum apple_gmux_type type;
+
 	/* switcheroo data */
 	acpi_handle dhandle;
 	int gpe;
@@ -502,23 +506,158 @@ static int gmux_switch_ddc(enum vga_switcheroo_client_id id)
 /**
  * DOC: Power control
  *
- * gmux is able to cut power to the discrete GPU. It automatically takes care
+ * gmux is able to cut power to the discrete GPU. On most
+ * Systems the gmux automatically takes care
  * of the correct sequence to tear down and bring up the power rails for
  * core voltage, VRAM and PCIe.
+ *
+ * But on MMIO systems, the standard gmux writes does not work instead we
+ * have to use a combination of ACPI and GMUX,
+ * and Using PWRD (the method that used in macOS to turn on/off the dGPU and its bridges),
+ * which turns off the entire bridge and messes up the PCI config,
+ * so we can't use pci_upstream_bridge to traverse
+ * through the bridge, so we use ACPI addresses to save/restore bridges.
+ *
+ * NOTE: Communication to these bridges (not the dGPU/HDA) in any form
+ * when the bridge is off, will result in CPU CATERR.
  */
 
+static int gmux_save_restore_pci(acpi_handle parent_handle, const char *name,
+				bool save, acpi_handle *out_handle)
+{
+	acpi_status status;
+	acpi_handle handle;
+	struct acpi_device *adev;
+	struct device *dev;
+	struct pci_dev *pdev;
+
+	if (name) {
+		status = acpi_get_handle(parent_handle, name, &handle);
+		if (ACPI_FAILURE(status))
+			return -EIO;
+
+		if (out_handle)
+			*out_handle = handle;
+	} else
+		handle = parent_handle;
+
+	adev = acpi_fetch_acpi_dev(handle);
+	if (!adev)
+		return -EIO;
+
+	dev = acpi_get_first_physical_node(adev);
+	if (!dev || !dev_is_pci(dev))
+		return -EIO;
+
+	pdev = to_pci_dev(dev);
+
+	if (save) {
+		pci_save_state(pdev);
+		pdev->current_state = PCI_D3cold;
+	} else {
+		pdev->current_state = PCI_D0;
+		pci_restore_state(pdev);
+	}
+	return 0;
+}
+
 static int gmux_set_discrete_state(struct apple_gmux_data *gmux_data,
 				   enum vga_switcheroo_state state)
 {
 	reinit_completion(&gmux_data->powerchange_done);
+	acpi_handle discrete_handle;
+	acpi_status status;
+	unsigned long long result;
+
+	if (!gmux_data->discrete_pdev)
+		return -ENODEV;
+
+	discrete_handle = ACPI_HANDLE(&gmux_data->discrete_pdev->dev);
+	if (!discrete_handle)
+		return -ENODEV;
 
 	if (state == VGA_SWITCHEROO_ON) {
-		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
-		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
+		if (gmux_data->type == APPLE_GMUX_TYPE_MMIO) {
+			acpi_handle handle;
+			u16 vendor;
+			int i;
+
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 2);
+			msleep(100);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
+
+			status = acpi_execute_simple_method(discrete_handle, "PWRD", 0);
+			if (ACPI_FAILURE(status))
+				return -EIO;
+			msleep(20);
+
+			if (gmux_save_restore_pci(NULL, "\\_SB_.PCI0.PEG0", 0, &handle))
+				return -EIO;
+
+			if (gmux_save_restore_pci(handle, "EGP0", 0, &handle))
+				return -EIO;
+
+			if (gmux_save_restore_pci(handle, "EGP1", 0, &handle))
+				return -EIO;
+
+			for (i = 0; i < 1000; i++) {
+				pci_read_config_word(gmux_data->discrete_pdev,
+							PCI_VENDOR_ID, &vendor);
+				if (vendor != 0xffff)
+					break;
+				msleep(1);
+			}
+			if (vendor == 0xffff)
+				return -ETIMEDOUT;
+
+			if (gmux_save_restore_pci(handle, "GFX0", 0, NULL))
+				return -EIO;
+
+			if (gmux_save_restore_pci(handle, "HDAU", 0, NULL))
+				return -EIO;
+		} else {
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 3);
+		}
 		pr_debug("Discrete card powered up\n");
 	} else {
-		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
-		gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 0);
+		if (gmux_data->type == APPLE_GMUX_TYPE_MMIO) {
+			acpi_handle parent_handle = discrete_handle;
+			bool saved_hda = false;
+
+			/* If the power state was OFF, then we only do
+			 * PWRD and we do not save registers, as the
+			 * registers are already saved
+			 */
+			if (gmux_data->power_state == VGA_SWITCHEROO_OFF)
+				goto do_pwrd;
+
+			while (ACPI_SUCCESS(acpi_get_parent(parent_handle,
+							&parent_handle))) {
+				if (!saved_hda) {
+					if (!gmux_save_restore_pci(parent_handle,
+								"HDAU", true, NULL)) {
+						saved_hda = true;
+						pci_save_state(gmux_data->discrete_pdev);
+						gmux_data->discrete_pdev->current_state =
+								PCI_D3cold;
+					}
+				}
+				if (gmux_save_restore_pci(parent_handle, NULL, true, NULL))
+					break;
+			}
+do_pwrd:
+			status = acpi_execute_simple_method(discrete_handle, "PWRD", 1);
+			if (ACPI_FAILURE(status))
+				return -EIO;
+			msleep(20);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
+			mdelay(10);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 0);
+		} else {
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 1);
+			gmux_write8(gmux_data, GMUX_PORT_DISCRETE_POWER, 0);
+		}
 		pr_debug("Discrete card powered down\n");
 	}
 
@@ -552,10 +691,14 @@ static enum vga_switcheroo_client_id gmux_get_client_id(struct pci_dev *pdev)
 	else if (pdev->vendor == PCI_VENDOR_ID_NVIDIA &&
 		 pdev->device == 0x0863)
 		return VGA_SWITCHEROO_IGD;
-	else
+	else {
+		if (!apple_gmux_data->discrete_pdev)
+			apple_gmux_data->discrete_pdev = pci_dev_get(pdev);
+
 		return VGA_SWITCHEROO_DIS;
-}
 
+	}
+}
 static const struct vga_switcheroo_handler gmux_handler_no_ddc = {
 	.switchto = gmux_switchto,
 	.power_state = gmux_set_power_state,
@@ -803,6 +946,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	if (!gmux_data)
 		return -ENOMEM;
 	pnp_set_drvdata(pnp, gmux_data);
+	gmux_data->type = type;
 
 	switch (type) {
 	case APPLE_GMUX_TYPE_MMIO:
@@ -993,6 +1137,7 @@ static void gmux_remove(struct pnp_dev *pnp)
 
 	gmux_fini_debugfs(gmux_data);
 	vga_switcheroo_unregister_handler();
+	pci_dev_put(gmux_data->discrete_pdev);
 	gmux_disable_interrupts(gmux_data);
 	if (gmux_data->gpe >= 0) {
 		acpi_disable_gpe(NULL, gmux_data->gpe);
-- 
2.55.0

