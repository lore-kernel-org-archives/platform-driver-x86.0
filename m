From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: [PATCH]amilo-rfkill: add depends on i8042 in Kconfig
Date: Tue, 18 Jun 2013 17:21:04 +0800 (CST)
Message-ID: <alpine.DEB.2.02.1306181705530.28460@M2420>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com, bhutchings@solarflare.com
Cc: platform-driver-x86@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, jim.epost@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

From: Xiong Zhou <jencce.kernel@gmail.com>

Fix randconfig build failure for Amilo x86 platform driver.
AMILO_RFKILL requires SERIO_I8042 being available.

amilo-rfkill.c:(.text+0x108b5b): undefined reference to `i8042_lock_chip'
amilo-rfkill.c:(.text+0x108b69): undefined reference to `i8042_command'
amilo-rfkill.c:(.text+0x108b71): undefined reference to `i8042_unlock_chip'

Reported-by: Jim Davis <jim.epost@gmail.com>
Signed-off-by: Xiong Zhou <jencce.kernel@gmail.com>
---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 8577261..37645b9 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -176,6 +176,7 @@ config FUJITSU_TABLET
 config AMILO_RFKILL
 	tristate "Fujitsu-Siemens Amilo rfkill support"
 	depends on RFKILL
+	depends on SERIO_I8042
 	---help---
 	  This is a driver for enabling wifi on some Fujitsu-Siemens Amilo
 	  laptops.
