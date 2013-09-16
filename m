From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] platform/x86: fix asus-wmi build error
Date: Mon, 16 Sep 2013 11:10:51 -0700
Message-ID: <523749AB.7010805@infradead.org>
References: <20130916131310.d526decb36e4a57d736a0cea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130916131310.d526decb36e4a57d736a0cea@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix build error in asus_wmi.c when ASUS_WMI=y and ACPI_VIDEO=m
by preventing that combination.

drivers/built-in.o: In function `asus_wmi_probe':
asus-wmi.c:(.text+0x65ddb4): undefined reference to `acpi_video_unregister'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Found in linux-next but applies to mainline.

 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20130916.orig/drivers/platform/x86/Kconfig
+++ linux-next-20130916/drivers/platform/x86/Kconfig
@@ -504,6 +504,7 @@ config ASUS_WMI
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on RFKILL || RFKILL = n
 	depends on HOTPLUG_PCI
+	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
