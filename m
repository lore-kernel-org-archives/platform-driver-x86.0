From: Andi Kleen <andi@firstfloor.org>
Subject: [PATCH] [256/275] classmate-laptop: depends on RFKILL or RFKILL=n
Date: Wed, 30 Mar 2011 14:08:23 -0700 (PDT)
Message-ID: <20110330210823.3951A3E1A05@tassilo.jf.intel.com>
References: <20110330203.501921634@firstfloor.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110330203.501921634@firstfloor.org>
Sender: linux-kernel-owner@vger.kernel.org
To: cascardo@holoscopio.com, mjg@redhat.com, ak@linux.intel.com, randy.dunlap@oracle.com, platform-driver-x86@vger.kernel.org, don@syst.com.br, linux-kernel@vger.kernel.org, stable@kernel.
List-Id: platform-driver-x86.vger.kernel.org

2.6.35-longterm review patch.  If anyone has any objections, please let me know.

------------------
From: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>

[ upstream commit f35843ed8d17562f7c5da4b34a4a81b0cc450e9e ]

Randy Dunlap has reported that building classmate-laptop fails when
CONFIG_RFKILL=m and CONFIG_ACPI_CMPC=y. He suggested depending on
RFKILL, but, then, it will not be possible to select classmate-laptop
when RFKILL is off. There's no known problem with building and using
classmate-laptop with RFKILL off. So depend on RFKILL or RFKILL=n.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Signed-off-by: Matthew Garrett <mjg@redhat.com>
Signed-off-by: Andi Kleen <ak@linux.intel.com>
Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Daniel Oliveira Nascimento <don@syst.com.br>

---
 drivers/platform/x86/Kconfig |    1 +
 1 file changed, 1 insertion(+)

Index: linux-2.6.35.y/drivers/platform/x86/Kconfig
===================================================================
--- linux-2.6.35.y.orig/drivers/platform/x86/Kconfig	2011-03-29 23:03:58.646799545 -0700
+++ linux-2.6.35.y/drivers/platform/x86/Kconfig	2011-03-29 23:04:02.297706128 -0700
@@ -520,6 +520,7 @@
 config ACPI_CMPC
 	tristate "CMPC Laptop Extras"
 	depends on X86 && ACPI
+	depends on RFKILL || RFKILL=n
 	select INPUT
 	select BACKLIGHT_CLASS_DEVICE
 	default n
