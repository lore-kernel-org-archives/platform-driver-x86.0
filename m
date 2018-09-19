From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: intel_int0002_vgpio: Enable the driver on Bay Trail platforms
Date: Wed, 19 Sep 2018 20:14:51 +0200
Message-ID: <20180919181451.8771-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The intel_int0002_vgpio driver was added to avoid an IRQ 9 storm on Cherry
Trail platforms.

When originally merged the CPU ID for Bay Trail SoCs was commented out
of the list of valid CPU IDs because we did not have any reports of the
IRQ storm on Bay Trail platforms.

We now have a report of the IRQ 9 storm on the Bay Trail based Thinkpad
Tablet 10 which is fixed by enabling this driver, so lets enable it on
Bay Trail too.

I've tested various other Bay Trail device with this driver enabled
without adverse side-effects.

BugLink: https://www.dpin.de/nf/finally-s0i3-is-there-thinkpad-tablet-10-sleeps-deeply-with-linux-kernel-4-15rc/#comments
Reported-and-tested-by: Nicole Faerber <nicole@id3p.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_int0002_vgpio.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index a473dc51b18d..987a3b03f225 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -57,11 +57,7 @@
 #define ICPU(model)	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
 
 static const struct x86_cpu_id int0002_cpu_ids[] = {
-/*
- * Limit ourselves to Cherry Trail for now, until testing shows we
- * need to handle the INT0002 device on Baytrail too.
- *	ICPU(INTEL_FAM6_ATOM_SILVERMONT1),	 * Valleyview, Bay Trail *
- */
+	ICPU(INTEL_FAM6_ATOM_SILVERMONT1),	/* Valleyview, Bay Trail  */
 	ICPU(INTEL_FAM6_ATOM_AIRMONT),		/* Braswell, Cherry Trail */
 	{}
 };
-- 
2.19.0.rc1
