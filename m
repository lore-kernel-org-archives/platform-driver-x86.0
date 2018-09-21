From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/6] platform/x86: acerhdf: clarify modinfo messages for BIOS override
Date: Thu, 20 Sep 2018 21:44:16 -0400
Message-ID: <20180921014421.30804-2-paul.gortmaker@windriver.com>
References: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921014421.30804-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Peter Feuerer <peter@piie.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

Normally, a module parameter for a BIOS check override implies "pretend
you support this version" (and the user will enter their local version).

However, this driver uses the model/BIOS module parameters in a way that
is "pretend my system is the supported model XYZ with BIOS version ABC."
which is less common.

Since the help strings don't make such a distinction, one gets this
somewhat frustrating scenario, where the user sees the error, enters
*their* BIOS version and then gets the same error:

  root@gw:~# modprobe acerhdf
  acerhdf: Acer Aspire One Fan driver, v.0.7.0
  acerhdf: unknown (unsupported) BIOS version Gateway  /LT31   /v1.3307 , please report, aborting!
  modprobe: ERROR: could not insert 'acerhdf': Invalid argument

  root@gw:~# modprobe acerhdf force_bios=v1.3307
  acerhdf: Acer Aspire One Fan driver, v.0.7.0
  acerhdf: forcing BIOS version: v1.3307
  acerhdf: unknown (unsupported) BIOS version Gateway  /LT31   /v1.3307 , please report, aborting!
  modprobe: ERROR: could not insert 'acerhdf': Invalid argument

Clarify the module param help text to make it clear that the driver
expects a choice from existing supported models/versions.

Cc: Peter Feuerer <peter@piie.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/platform/x86/acerhdf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index ea22591ee66f..3d5c4e183111 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -105,9 +105,9 @@ MODULE_PARM_DESC(fanoff, "Turn the fan off below this temperature");
 module_param(verbose, uint, 0600);
 MODULE_PARM_DESC(verbose, "Enable verbose dmesg output");
 module_param_string(force_bios, force_bios, 16, 0);
-MODULE_PARM_DESC(force_bios, "Force BIOS version and omit BIOS check");
+MODULE_PARM_DESC(force_bios, "Pretend system has this known supported BIOS version");
 module_param_string(force_product, force_product, 16, 0);
-MODULE_PARM_DESC(force_product, "Force BIOS product and omit BIOS check");
+MODULE_PARM_DESC(force_product, "Pretend system is this known supported model");
 
 /*
  * cmd_off: to switch the fan completely off and check if the fan is off
-- 
2.15.0
