Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900956;
	b=L6eUiShHr6dsQLtDA8MQo5ZtpEOvN7ET/Hlg+GmZhTmVJvuk/vfWO2hyjPXStTiwRnnV
	 cElseJxNspHAU8uCH4a1nwhW9XGxubQvGiz4vYsxfCPdy+4l/ocvYaXA+Q15Dpv2KVCkR
	 K3SR9G/78vrYaYVFQlDMxtG9R04RuekbMkq0WTh8xzB1yxTFvEqtKYkyBcGusdqhX9KmF
	 2T43TbwxJuTie5KksnwGf1LuAgOfqoEXn2ZAJSfeOcsUUzdRXWdbr862SRAdkCwzxmQYw
	 sR8KoRI/vEW6D01MJEysoSP6BHA6XbOeOZaH0hn3bZg8lalfcDVUl1HAZPeN/9bAyAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=osKiCGgvhu8yMTzDeDh9QImzUzGTyVINpwGdXaYWlN8=;
	b=UE80A/G2xppgEpdTION6D0q9Rao+YNB/BglV4AufxeLOBrv0oOEH0VFss0eJms33OzzJ
	 sWkkE31Iu3lbO2D3Y1iRoZZeAmOGsDIQz2mthinv5ulPqPyxMlErJa0ymEs7xQnDkzXBH
	 pP8RAqeRZgrWmiTOxmM52aWMsDK8xQ6z7/GwI0kUyvlbgAkLng352frWI4vGyio3xsHqi
	 n1pu5TO0r3a9WlMcmgsuAn68CkXa5VL8hl2zO4A+gX47oRZHf/eeZ2QJ6OgpAyLvcMGZ0
	 Wc6c2m0GdZMi2/Ogx96PHHESoJQjTyc000IOmhEiX77sNvb3Gv5+k3btJvpFigyK6HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KpwzWuSt;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3168606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3168606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KpwzWuSt
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15ea896ddc8so3433366c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900955; x=1793505755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=osKiCGgvhu8yMTzDeDh9QImzUzGTyVINpwGdXaYWlN8=;
        b=KpwzWuSt9n8WGO32G+YWj0LJ4cjjH9gIvlqJaV/l1g3jWAHaMiCSeVl3ctLoDHUZPr
         v4jX5VvSfynhWrgTOaz83SVbBEMXyUy88uz1q376hvcyF73n5TkR8jjGqx6WETsB10bh
         KfYNGMy9xwnoNGhT8kKvlV8BQha8ZF3x/7Y3OF6eiyjnuOaMDNpFj3suP45WsshBB6aR
         Pq7ekQe0cY8xDIGJsm/WpoBDtKTDcyb+/qDfJfXi6vBSTfOD+JoQUfva2z+avQ2inYgh
         aO5BFlYNp2hJunbaPjfI/DAJdzo5URyvsEqCV2+KHO2YswNOp6f2YubZ24ZEZzlFKipU
         oFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900955; x=1793505755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=osKiCGgvhu8yMTzDeDh9QImzUzGTyVINpwGdXaYWlN8=;
        b=ncvXMnZBZMcnO1r7LlROhmoH++tVY+y2aHJ65bCKgIJ8PpPD2anX3ldlsvLhm+yox2
         5xUHxFdNS1+vnKTDExTHfiSJE7KynAswnNdzxYK6AGAjhaiX8ZWcD4/BpGXq53aCdcwd
         NGWf3dlqbA5poE1ZdAuHP0OHTHOHJJV6nZmi5GMberaeG/rIXMNF/dsT4seel6GK4+Ee
         QQ4fJPtwKJwoWIyCQEk3p2NV7t7ifBsOrMBJ8yYxYiBXY2sQV1WtZmjTaKbNkoDcgIkb
         BQKbr9mQONHrq8lb9VauxZzqmGWudG1XRftBb0SiaZsgl9SdfXjgqZSNzqRhdVVqoL21
         2EWA==
X-Forwarded-Encrypted: i=1; AKwUvBxhsQDy6JMY43y/VORYQyOl6AU5PAdIAdpZkOnFssRzBw1qvcMEGXc7n8behscG55YQjOfiQdYUkFI1M2b0Dtch4mVM@vger.kernel.org
X-Gm-Message-State: AFq9FYKJvQztA1pzp54xuHQK33kSjuvI54LD6fT4RBGWc62XkFbbnWrt
	Iwn701zsORrCsqi7iJ5dfgWLT2UatXHpFiODxJivl97skm2RoAc0eOo=
X-Gm-Gg: AYBFou3XJT2hlec2J1kq+iEUU47CdfVORmP3uJm7kOL9TOdCnvsvN3piZpzLEEJumlJ
	RoXwEIvOZNOmV7YiZEkWZ3chQzz0ozFPJnIvNjp98Uxt6FG6Z3lLd6UmCoHtvTmaL0nyvzstUvW
	P68ou8zxEbI1OoKV91UQOznwIa5ztIea+/xtTKUMYZFjhgJTRNXEcinSBy9PIvIrKa4mK7KZGWm
	eaibKnCsVM1VLyBj2PaPQ08XKGQcELCOMJxavIfLPSt3PhdhVTVr68RQoA7nVpnaKxFv0UCGeeo
	xAgt99Japwj9n0HXK+6hLq9doKS8jWunTegkfQ4NHUAXpwUd403BwnP0yekboJtLwciS+mvb8H/
	h8SOU0tOtot4ejqfvuhJJSmTymNAlF3Qw6YyjbE7nABiWGWU06820j3AF0Ngz7//zqrIiQoVLSL
	u3hG3wCqM4xA5daSFGu0qgBtoFxG9tPTRScWeRBh2IG7bfo/KX9XKK9p2SgV9qAdaNJzU9qvBcI
	QRhjHXjPLHwJizv9esbF5jv6OBvlLEPT7zFOOSrbhbYeL4z+jMEA66ioRY8Km3+HvZ9s4pOAqoi
	nSO5qbXofIxKprOx
X-Received: by 2002:a05:701b:465c:b0:19a:9a93:c9b2 with SMTP id a92af1059eb24-19a9a93cdbbmr3658412c88.13.1792900954786;
        Sat, 24 Oct 2026 21:02:34 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:02:34 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
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
Subject: [PATCH 05/13] platform/apple-gmux: Write switch state to EFI on MMIO devices
Date: Sat, 24 Oct 2026 23:59:41 -0400
Message-ID: <20261025040046.1602-6-atharvatiwarilinuxdev@gmail.com>
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

From: Andre Eikmeyer <dev@deq.rocks>

On T2 devices (MMIO), the T2 coprocessor reads gpu-active efi
variable, and macOS seems to write it, so to properly communciate
to the T2 coprocessor, we write gpu-active.

Co-developed: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/platform/x86/Kconfig      |  1 +
 drivers/platform/x86/apple-gmux.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

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
index bef87a57a..637b3b216 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -27,6 +27,7 @@
 #include <linux/dmi.h>
 #include <linux/workqueue.h>
 #include <linux/pm_runtime.h>
+#include <linux/efi.h>
 #include <acpi/video.h>
 #include <asm/io.h>
 
@@ -494,6 +495,31 @@ static void gmux_write_switch_state(struct apple_gmux_data *gmux_data)
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
+	if (!efivar_is_available())
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
@@ -502,6 +528,8 @@ static int gmux_switchto(enum vga_switcheroo_client_id id)
 		apple_gmux_data->switch_state_external = id;
 
 	gmux_write_switch_state(apple_gmux_data);
+	if (apple_gmux_data->type == APPLE_GMUX_TYPE_MMIO)
+		gmux_write_switch_state_efi(apple_gmux_data);
 
 	return 0;
 }
@@ -1283,3 +1311,4 @@ MODULE_AUTHOR("Seth Forshee <seth.forshee@canonical.com>");
 MODULE_DESCRIPTION("Apple Gmux Driver");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(pnp, gmux_device_ids);
+MODULE_IMPORT_NS("EFIVAR");
-- 
2.55.0

