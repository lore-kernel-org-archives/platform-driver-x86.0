Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672563;
	b=cEDXtvqm17YC21YDQWakp3TrtNnR8MphBeP82X/0k/PcE6iSUdMbCmhIvChVi+oCfgfo
	 dz50HbkdlFL1+P5C5DZGOs+VmEJJ5lS7DYPYL7Sz2GBOnxDnhwLLN4r89ZqjFjIomHnfs
	 sF7cjB5gTRgpqQNq5d6SvXtlq+VK/eLlM3szLkRVtSopdBtItPhx87h7sCEWoWExTszJi
	 JNqFLyEYCD5WdClc6QYyDMyObhXyh3IfjNrRP1+Dl4+wRaHRMbXKAt2PcyEGplYmZAibf
	 bDAeC7nrtWevoQeFX0lD2j4lqDfh/3L21pYpiEXT9aKXKiL7spM6oIjckYCwxAzjlQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EfZAm8HK5M4blUNFdDl+epKKwi55wmzsTvrZgcxUZEg=;
	b=JNY0EcWo7Ali41BWioI/tgsKQsqNbfZtNV4CkZe2gUhOoU5ziyWiAu9Nk6C9musQLb8S
	 Ciih8vqL7uIwLyjUdVQyBEtO8Y9nGukdinxzeCFq2iQn+BPzadEZQhrLlrQHZsKacufCG
	 yl2PGJDrjkAU8D/dEaXHBHZlvZlFiyx9SnzzP39gJCdQjwM+00ENZl1ytN+o6G3D5tGcU
	 cS2NQfkgyzjClECOfsgKMlfp3Q8JY1zHhFMWvNT6+VyoqYhfonM25sFh9xC9da2MQhvy8
	 WqBrzoGusMIalh/JceNp+dSWWaELVOzQ/EzPiqRKqfEz/wOL+QZBzUshAetHto7vONA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyiEkrQ7;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80095606A338
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80095606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fyiEkrQ7
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso4134107eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672563; x=1795277363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfZAm8HK5M4blUNFdDl+epKKwi55wmzsTvrZgcxUZEg=;
        b=fyiEkrQ7Mr3ulVKXsUkU7aXda0e8efD4fC35q2/ZvGd0LwHuIdbauFljjdLSpCj4Ad
         IOgeuwjaHlMYbzDDUFJyrfz/7/dSuKNwWd0U+YxbvXTjUdg4OCb4ys9BEUlzHZuBg/iP
         MQLKaZswKcuJ0Z13SOsSaRgTiHqO470hlZ9K7hO6x6yNgk6iVRXGWtz0v5zaiAAXe0dX
         E4IpUtxm9SS6fRMBctHOKFSj5WTtYDm1nSMQ2sJoDWq0lvnPPi15o+uTHcV52cZBch96
         s7xXAuJFtYfF+qyVMnoQfl/8PrEtX/EZSqwN0jHDelmBV//UcGkyLmPmU244LPhFmzim
         FHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672563; x=1795277363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EfZAm8HK5M4blUNFdDl+epKKwi55wmzsTvrZgcxUZEg=;
        b=S+UeJtWW8XOuboUa1HIk1nuONGXXFaiZHScnn+iJtwse1678pafNxf9H9vtEhxBIKb
         MFqDu8I6+3hmDwLHMVmNRnnG5A+Xo/XHr/B/hxhSDyBwLTMp1dP20fi59hfgOl1Mfxqb
         sxn5QXdF+tIeiSWuq66Dv2zQDlcJsozKT+xmk1D1S9yFcvRJrPLPDUDMxwpXpfD4aDzD
         AB30i0dDEIogEI+aNY07GV4eH5hpNOsQ1pm6GJEHO1hNPHiPW5LxAxf7pe99E6v4zmps
         eHP1kYCRnXZXZ0utAlCUWH2dJzOMYnLIGxxD59jOnXd+ApUPXPkxgMxFErWiCCfkKTyz
         fSiA==
X-Forwarded-Encrypted: i=1; AL+hErG/W/t6CFUM3Yk8BOYuUA6szVYRQsoTN1p+oAF9ChD5QNlTPgeO3UJD1Wczl6Z0zNLY50xMEcXmiRjVbntbpAX1be+z@vger.kernel.org
X-Gm-Message-State: APuU4Z+EYMwdZ9bAr1JhJlOnDTNLOEDsZfibfBq06US7CY1lj9QRePpy
	L7YIFhXhrxBHFcgePq7c1CGx9viIDwpV/1eb/SZmWnNTPm3rLow54yY=
X-Gm-Gg: AYBFou0NYrDdnsDKH9P9GzUsZ1L2+KxDHll0K+1aKRnN0C8MGdhgDoMtgXrEQKoaoSN
	B+jBZqJhGJC9Ru0V9ACOSdXmyTOWPZxsIAzCFofzw4DdQnQBjMpxF1BTI+/siJiriSpVujluVNn
	nuTej+2fOjVqRBD1la30l6kPlNc/n9Yg3zQKxYczDAai/K5p6EWjJVY2VOuA1CyYEzkpYtXTxut
	fF/u2qpTkdSAtCKmjbTwRKMaq2BADotsWxYzCu7K4b/bnSmIH08S9CvbUqMWq3p1oTXbAmfi8b+
	a9jGo5HMbxxlBEGBeXnyaIaPeJGIMGJATbzFSh2RMQDzX+8EFR3P0GgYG6JZS6GMBMPWXj7ArOy
	WICpZwAdVYrYPecWyLrxRp5qTaCu/gbE0sxQP9B/K7FNcPe6zyAHIcWS4nl1NJ2NsluN4Ts6r0T
	TOkxjTUoesB0RgcA0dcVkSuF8fKDgDjpk41zaAJ/ka0V8V6ecJ5h7otb3ZnmhIeDjxDV5x6eeW3
	yCNwc3gg7n6PPNe4VfQO6IHLRgOTC8l8zljT8fWMkNffH8KcBZQE2RSDh22k7BjWU+iNkqxzu7N
	KvF/B9RBamJRtD70uaF5cqhXybUWZ+hJF+PiatQ+00d/6eW9PHJaH/cfFQjACKaIAg==
X-Received: by 2002:a05:693c:4152:10b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-379659c6839mr6027249eec.8.1794672562295;
        Sat, 14 Nov 2026 08:09:22 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:09:21 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
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
Subject: [PATCH v2 05/12] platform/apple-gmux: Write switch state to EFI on MMIO devices
Date: Sat, 14 Nov 2026 11:06:29 -0500
Message-ID: <20261114160731.3756-6-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
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

From: Andre Eikmeyer <dev@deq.rocks>

On T2 devices (MMIO), the T2 coprocessor reads gpu-active efi
variable, and macOS seems to write it, so to properly communciate
to the T2 coprocessor, we write gpu-active.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Co-developed: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/platform/x86/Kconfig      |  1 +
 drivers/platform/x86/apple-gmux.c | 40 +++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index c37e76066..01895d511 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -217,6 +217,7 @@ config APPLE_GMUX
 	depends on ACPI && PCI
 	depends on PNP
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on EFI
 	help
 	  This driver provides support for the gmux device found on many
 	  Apple laptops, which controls the display mux for the hybrid
diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 37ba20779..c4a953b5b 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -26,6 +26,7 @@
 #include <linux/debugfs.h>
 #include <linux/workqueue.h>
 #include <linux/pm_runtime.h>
+#include <linux/efi.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -489,6 +490,32 @@ static void gmux_write_switch_state(struct apple_gmux_data *gmux_data)
 		gmux_write8(gmux_data, GMUX_PORT_SWITCH_EXTERNAL, 3);
 }
 
+#define APPLE_GPU_VARS_GUID EFI_GUID(0xfa4ce28d, 0xb62f, 0x4c99, \
+				     0x9c, 0xc3, 0x68, 0x15, 0x68, 0x6e, 0x30, 0xf9)
+
+static efi_char16_t gmux_gpu_active_name[] = L"gpu-active";
+
+static void gmux_write_switch_state_efi(struct apple_gmux_data *gmux_data)
+{
+	efi_guid_t guid = APPLE_GPU_VARS_GUID;
+	u32 active = gmux_data->switch_state_display == VGA_SWITCHEROO_IGD;
+	efi_status_t status;
+
+	if (!efivar_is_available() ||
+			!efi_rt_services_supported(EFI_RT_SUPPORTED_SET_VARIABLE))
+		return;
+
+	status = efivar_set_variable(gmux_gpu_active_name, &guid,
+				     EFI_VARIABLE_NON_VOLATILE |
+				     EFI_VARIABLE_BOOTSERVICE_ACCESS |
+				     EFI_VARIABLE_RUNTIME_ACCESS,
+				     sizeof(active), &active);
+	if (status != EFI_SUCCESS)
+		pr_warn("writing gpu-active failed: 0x%lx\n", status);
+	else
+		pr_debug("gpu-active: %u\n", active);
+}
+
 static int gmux_switchto(enum vga_switcheroo_client_id id)
 {
 	apple_gmux_data->switch_state_ddc = id;
@@ -497,6 +524,8 @@ static int gmux_switchto(enum vga_switcheroo_client_id id)
 		apple_gmux_data->switch_state_external = id;
 
 	gmux_write_switch_state(apple_gmux_data);
+	if (apple_gmux_data->type == APPLE_GMUX_TYPE_MMIO)
+		gmux_write_switch_state_efi(apple_gmux_data);
 
 	return 0;
 }
@@ -1240,6 +1269,15 @@ static void gmux_remove(struct pnp_dev *pnp)
 	kfree(gmux_data);
 }
 
+static void gmux_shutdown(struct pnp_dev *pnp)
+{
+	struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
+
+	gmux_write_switch_state_efi(gmux_data);
+
+	gmux_remove(pnp);
+}
+
 static const struct pnp_device_id gmux_device_ids[] = {
 	{ .id = GMUX_ACPI_HID },
 	{ }
@@ -1254,6 +1292,7 @@ static struct pnp_driver gmux_pnp_driver = {
 	.name		= "apple-gmux",
 	.probe		= gmux_probe,
 	.remove		= gmux_remove,
+	.shutdown	= gmux_shutdown,
 	.id_table	= gmux_device_ids,
 	.driver		= {
 			.pm = &gmux_dev_pm_ops,
@@ -1265,3 +1304,4 @@ MODULE_AUTHOR("Seth Forshee <seth.forshee@canonical.com>");
 MODULE_DESCRIPTION("Apple Gmux Driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(pnp, gmux_device_ids);
+MODULE_IMPORT_NS("EFIVAR");
-- 
2.55.0

