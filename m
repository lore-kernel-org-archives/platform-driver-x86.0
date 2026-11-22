Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795322143;
	b=YNVxsnyQAPUWipX4huXnpxDRbpxzdgKOgPEtu8LHLqRShtj+KJXVOJm3SCVWuCuhF246
	 D2imGkwTHNbCxIe5xZU6QVJy7Td6H6ynLNUIspy+gInKGWTbbHzG+ciWFjyBKmTkP0rne
	 cUm0ngX2ocz0h96vn5DIBPo2hQ6icjid4kMGdyrGQKO9cL+BCTkwy0ZG/iRg//1dMw8bi
	 bvekJDwHQxTLFsYXmeyHoMqpsSk/zU4ke/j4S6dtGT2XzasR20sahGAfr54iOx8v4241+
	 xHDlCT26r8yakH6hBX6keAYKxICqOswwF+0cDkOSbJBRNpY/2RbHUl5oq+qxGjiM5IQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322143;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hDT/aECBwNbW2NyGACBkXyKf6xBKy+F1zx00muMQwYk=;
	b=MZyvpAJpSFwuTbZTL9fFBdZjLZbMwKSd73QOLKKzmeKo0gPiYGAPH/eMTR+XfBDr7YuO
	 4Yr/z7ZDe/GG23OOoiUNRIs3Upkv/zQIBPfUDWwiXSh9aITpSFsRUAucXldhFZA9RvF9+
	 2os9g7NdmuFZawH1Kd47fd5H0p8RKjAwqj8xYS6HXixlbiulALgGljDTLdeqna4sYzyXf
	 pPFuuUMhWm92MinHt2dQFuM1tYhTZoAnuWRttqez4ntJsa95DVi5hiFt/Wmf8QSGNyDvk
	 FDj35kcogEGQljghMR+dhq8130a2PKWU7qU1BHYEzk2N4t191Sug1aI8ou9Abx8HcBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lyafLCx9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C40D606A32A;
	Sun, 22 Nov 2026 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lyafLCx9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795322143;
	b=B4j4WMZIlOCuFk7fde5NWU8ou5jZFQJoaNlaD7JcfGyuBLohgVDg1SHpgTr5pXFAv5Ut
	 6G2DHvI2SltWHSYDGpaJ9zQwJkWlfVC8nwzywk8oBBROrRS0cLUpn8KiHRCUkWJcRUSCy
	 81HbLis0WiPAB6cegPv1n+qc56DFZjSi3RLev1E+0SRvGdqzifAjUNb11TNhJagehdk0v
	 Vr/jLn+VpFDr0HI6u3uYZnKsTfRv8So6AtPhBlF3Kv01vclrjfI59qSBC8shISj37xe+y
	 tv1HqriWxA6L3D/6vFrDtseEdq7tP9w7VFKdSP6KBNIyQdAWDdq1ZvyhUqcujU9jCFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795322143;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hDT/aECBwNbW2NyGACBkXyKf6xBKy+F1zx00muMQwYk=;
	b=EH4J8jK6o6I5Swfys09n7YnZHgSaeo9O4qFe3ZpFDFm4b0LVHO28lCuZgBe2fRmeI7dx
	 lTPTCVzpb2qWmkGp6cwMr9p6j1sNH/bQ/iLUM5v57vTteWAqGOyj3Y6a+xcv8XhsvV9eW
	 lo0l7DO6TrkZHyCzUJp31MfZWIoFJmenr2a5fTCgUv/TIUTPUXnrK2arFO04yVWUcxh2j
	 t6aSN7Uxvx2pyR1l+Y1BHuHtnShtEXtuAZTZb265+r68XofD211zaKkTA4KmHXsZePBUo
	 c/zrTggyX057rq/xnEwTisglrugt7rG4pHGDTaHoPRidAzwAWU/ZAbHeoy7scCdt59A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CCA61F000C6;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795322143;
	bh=hDT/aECBwNbW2NyGACBkXyKf6xBKy+F1zx00muMQwYk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lyafLCx9VdmFPDGV06vNOjyFIG/zP2a04VGJTajolsDiXcFaxJxmvo6AjkfBUmleo
	 TSeQPly3kbS8qw2q8RKo40bZvFH5j3SOQpysHm54RbdW3CyHsoORGUKsfNz6BwqvCS
	 dELTPwGI6rktaYOK0/R+M282MizdVU10sdEe+zLpVhZqPzNEe1Tv/eLl66zqJLjq+n
	 6cHk4ETeMZ4Bgp4zP+6MTQdre0d5w6zYnRekkpn4CcuzfKGNicKRemt9TlwCSHwqe+
	 i3xFJzbe7JctHBwPUJB6qVHEGTvSJedCzpcQEyAWymyhsyb1/hwMpQoM11JOVvioKE
	 Wj7CS3rnMB4VQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0FD594BEEE;
	Sun, 22 Nov 2026 04:35:42 +0000 (UTC)
From: Nick Dowsett via B4 Relay <devnull+nick42d.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 12:35:38 +0800
Subject: [PATCH 1/4] platform/x86: clevo-laptop: add minimal WMI driver
 skeleton and Kbuild plumbing
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-clevo-laptop-v1-1-881debf4d4b0@gmail.com>
References: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
In-Reply-To: <20261122-clevo-laptop-v1-0-881debf4d4b0@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Armin Wolf <W_Armin@gmx.de>, Werner Sembach <wse@tuxedocomputers.com>, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Nick Dowsett <nick42d@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795322140; l=4849;
 i=nick42d@gmail.com; h=from:subject:message-id;
 bh=e9AdSz41EP3ywu8H4Pe835LANDmSykHvhG+wsu9VTm0=;
 b=anPBWXAgeDelXVKsG1nyDfq5seJYrlBDPkqh3KwKnpA+NHh8NhWsZkOp8Ma8DT8s/zy84t9RA
 rOGeCqw3QfpCihA5a8gVD9q+r1aJgvG9SSAbJGB4mhukqD3/VjtEWSA
X-Developer-Key: i=nick42d@gmail.com; a=ed25519;
 pk=1uIkNexEofzEXNN3Y3QW5z8IrgjWaP0yH6Es51jxWOg=
X-Endpoint-Received: by B4 Relay for nick42d@gmail.com/default with
 auth_id=1596
X-Original-From: Nick Dowsett <nick42d@gmail.com>
Reply-To: nick42d@gmail.com
Content-Transfer-Encoding: 7bit

From: Nick Dowsett <nick42d@gmail.com>

- Add `drivers/platform/x86/clevo-laptop.rs` with module implementation,
  DMI board check, and Driver registration.
- Add Kconfig and MAINTAINERS entries and Makefile wiring.

Signed-off-by: Nick Dowsett <nick42d@gmail.com>
---
 MAINTAINERS                          |  6 +++
 drivers/platform/x86/Kconfig         | 17 +++++++++
 drivers/platform/x86/Makefile        |  3 ++
 drivers/platform/x86/clevo-laptop.rs | 72 ++++++++++++++++++++++++++++++++++++
 4 files changed, 98 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 44540a1eb2b8..1130c293e84d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6566,6 +6566,12 @@ F:	scripts/Makefile.clang
 F:	scripts/clang-tools/
 K:	\b(?i:clang|llvm)\b
 
+CLEVO LAPTOP DRIVER
+M:	Nick Dowsett <nick42d@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/clevo-laptop.rs
+
 CLK API
 M:	Russell King <linux@armlinux.org.uk>
 L:	linux-clk@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9ce384e0475e..18aa4550c9f4 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1059,6 +1059,23 @@ config OXP_EC
 
 source "drivers/platform/x86/tuxedo/Kconfig"
 
+config CLEVO_LAPTOP
+	tristate "Clevo Laptop Platform Driver"
+	depends on RUST
+	depends on ACPI_WMI=y
+	depends on DMI
+	depends on LEDS_CLASS
+	help
+	  This driver provides platform support for Clevo barebones and
+	  rebranded laptops (Tuxedo, Metabox, Sager, XMG, etc.).
+	  Currently only Clevo NLx0AU boards (e.g. Metabox Edge NL57AU)
+	  with a 5-step white keyboard backlight are supported over WMI.
+	  It is intended to be extended with additional Clevo models and
+	  EC features over time.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called clevo-laptop.
+
 endif # X86_PLATFORM_DEVICES
 
 config P2SB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 229057234d00..070af05a2064 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -158,6 +158,9 @@ obj-$(CONFIG_SILICOM_PLATFORM)		+= silicom-platform.o
 # TUXEDO
 obj-y					+= tuxedo/
 
+# Clevo
+obj-$(CONFIG_CLEVO_LAPTOP)		+= clevo-laptop.o
+
 # Winmate
 obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
 
diff --git a/drivers/platform/x86/clevo-laptop.rs b/drivers/platform/x86/clevo-laptop.rs
new file mode 100644
index 000000000000..1d862c57b3fe
--- /dev/null
+++ b/drivers/platform/x86/clevo-laptop.rs
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Clevo Laptop Driver.
+//!
+//! Currently supports only the 5-step white keyboard backlight on Clevo
+//! NLx0AU boards (e.g., Metabox Edge NL57AU).
+//!
+//! Copyright (C) 2026 Nick Dowsett <nick42d@gmail.com>.
+//!
+//! Inspired by Tuxedo Computers' drivers.
+
+use kernel::{
+    device,
+    dmi,
+    prelude::*,
+    wmi, //
+};
+
+/// # Note
+///
+/// This GUID is non-unique (shared by Uniwill for example) and cannot be trusted
+/// to uniquely identify a Clevo device.
+const CLEVO_WMI_METHOD_GUID: &CStr = c"ABBC0F6D-8EA1-11D1-00A0-C90629100000";
+/// DMI board name allowlist, restricted to tested boards since the WMI GUID is not
+/// unique.
+const SUPPORTED_BOARDS: &[&CStr] = &[c"NLx0AU"];
+
+module! {
+    type: ClevoLaptopModule,
+    name: "clevo-laptop",
+    authors: ["Nick Dowsett <nick42d@gmail.com>"],
+    description: "Clevo Laptop Driver (Keyboard Backlight)",
+    license: "GPL",
+}
+
+/// RAII guard for Clevo Laptop Module holding all subsystem drivers e.g WMI.
+#[pin_data]
+struct ClevoLaptopModule {
+    #[pin]
+    _wmi_driver: wmi::Registration<WmiDriver>,
+}
+
+impl kernel::InPlaceModule for ClevoLaptopModule {
+    fn init(module: &'static ThisModule) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            if dmi::get_system_info(dmi::Field::BoardName)
+                .is_none_or(|board| !SUPPORTED_BOARDS.contains(&board))
+            {
+                return Err(ENODEV);
+            }
+            Ok(try_pin_init!(Self {
+                _wmi_driver <- wmi::Registration::new(c"clevo-laptop", module),
+            }))
+        })
+    }
+}
+
+/// RAII guard for Clevo WMI driver holding all subsystem devices e.g LED device.
+#[pin_data]
+struct WmiDriver {}
+
+kernel::wmi_device_table!(WMI_TABLE, [wmi::DeviceId::new(CLEVO_WMI_METHOD_GUID)]);
+
+impl wmi::Driver for WmiDriver {
+    type Data<'bound> = WmiDriver;
+    const ID_TABLE: wmi::IdTable = &WMI_TABLE;
+    fn probe<'bound>(
+        _dev: &'bound wmi::Device<device::Core<'_>>,
+    ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
+        try_pin_init!(WmiDriver {})
+    }
+}

-- 
2.56.1


