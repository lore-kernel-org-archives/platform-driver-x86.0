From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 6/8] platform:x86: Remove OOM message after
	input_allocate_device
Date: Wed, 23 Oct 2013 12:14:52 -0700
Message-ID: <93f2f693853e4409877d3d639e39b3b497738757.1382555436.git.joe@perches.com>
References: <cover.1382555436.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <cover.1382555436.git.joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>, Ike Panhc <ike.pan-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Harald Welte <laforge-TgoAw6mPHtdg9hUCZPvPmw@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Herton Ronaldo Krzesinski <herton-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Emitting an OOM message isn't necessary after input_allocate_device
as there's a generic OOM and a dump_stack already done.

Signed-off-by: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
---
 drivers/platform/x86/asus-laptop.c        | 5 ++---
 drivers/platform/x86/eeepc-laptop.c       | 4 +---
 drivers/platform/x86/ideapad-laptop.c     | 4 +---
 drivers/platform/x86/intel_mid_powerbtn.c | 4 +---
 drivers/platform/x86/panasonic-laptop.c   | 5 +----
 drivers/platform/x86/thinkpad_acpi.c      | 1 -
 drivers/platform/x86/topstar-laptop.c     | 4 +---
 drivers/platform/x86/toshiba_acpi.c       | 4 +---
 8 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 0e9c169..594323a 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1494,10 +1494,9 @@ static int asus_input_init(struct asus_laptop *asus)
 	int error;
 
 	input = input_allocate_device();
-	if (!input) {
-		pr_warn("Unable to allocate input device\n");
+	if (!input)
 		return -ENOMEM;
-	}
+
 	input->name = "Asus Laptop extra buttons";
 	input->phys = ASUS_LAPTOP_FILE "/input0";
 	input->id.bustype = BUS_HOST;
diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index aefcc32..dec68e7 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -1203,10 +1203,8 @@ static int eeepc_input_init(struct eeepc_laptop *eeepc)
 	int error;
 
 	input = input_allocate_device();
-	if (!input) {
-		pr_info("Unable to allocate input device\n");
+	if (!input)
 		return -ENOMEM;
-	}
 
 	input->name = "Asus EeePC extra buttons";
 	input->phys = EEEPC_LAPTOP_FILE "/input0";
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 89c4519..d826f30 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -574,10 +574,8 @@ static int ideapad_input_init(struct ideapad_private *priv)
 	int error;
 
 	inputdev = input_allocate_device();
-	if (!inputdev) {
-		pr_info("Unable to allocate input device\n");
+	if (!inputdev)
 		return -ENOMEM;
-	}
 
 	inputdev->name = "Ideapad extra buttons";
 	inputdev->phys = "ideapad/input0";
diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 6b18aba..8d67752 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -66,10 +66,8 @@ static int mfld_pb_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	input = input_allocate_device();
-	if (!input) {
-		dev_err(&pdev->dev, "Input device allocation error\n");
+	if (!input)
 		return -ENOMEM;
-	}
 
 	input->name = pdev->name;
 	input->phys = "power-button/input0";
diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 10d12b2..3008fd2 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -490,11 +490,8 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
 	int error;
 
 	input_dev = input_allocate_device();
-	if (!input_dev) {
-		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-				  "Couldn't allocate input device for hotkey"));
+	if (!input_dev)
 		return -ENOMEM;
-	}
 
 	input_dev->name = ACPI_PCC_DRIVER_NAME;
 	input_dev->phys = ACPI_PCC_INPUT_PHYS;
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 03ca6c1..b38ab7d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9056,7 +9056,6 @@ static int __init thinkpad_acpi_module_init(void)
 	mutex_init(&tpacpi_inputdev_send_mutex);
 	tpacpi_inputdev = input_allocate_device();
 	if (!tpacpi_inputdev) {
-		pr_err("unable to allocate input device\n");
 		thinkpad_acpi_module_exit();
 		return -ENOMEM;
 	} else {
diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
index 67897c8..e597de0 100644
--- a/drivers/platform/x86/topstar-laptop.c
+++ b/drivers/platform/x86/topstar-laptop.c
@@ -97,10 +97,8 @@ static int acpi_topstar_init_hkey(struct topstar_hkey *hkey)
 	int error;
 
 	input = input_allocate_device();
-	if (!input) {
-		pr_err("Unable to allocate input device\n");
+	if (!input)
 		return -ENOMEM;
-	}
 
 	input->name = "Topstar Laptop extra buttons";
 	input->phys = "topstar/input0";
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0cfadb6..7fce391 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -975,10 +975,8 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	u32 hci_result;
 
 	dev->hotkey_dev = input_allocate_device();
-	if (!dev->hotkey_dev) {
-		pr_info("Unable to register input device\n");
+	if (!dev->hotkey_dev)
 		return -ENOMEM;
-	}
 
 	dev->hotkey_dev->name = "Toshiba input device";
 	dev->hotkey_dev->phys = "toshiba_acpi/input0";
-- 
1.8.1.2.459.gbcd45b4.dirty


------------------------------------------------------------------------------
October Webinars: Code for Performance
Free Intel webinars can help you accelerate application performance.
Explore tips for MPI, OpenMP, advanced profiling, and more. Get the most from 
the latest Intel processors and coprocessors. See abstracts and register >
http://pubads.g.doubleclick.net/gampad/clk?id=60135991&iu=/4140/ostg.clktrk
