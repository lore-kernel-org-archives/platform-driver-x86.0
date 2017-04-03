From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 3/3] platform/x86: fujitsu-laptop: rename call_fext_func() arguments
Date: Mon,  3 Apr 2017 11:38:59 +0200
Message-ID: <20170403093859.6685-4-kernel@kempniu.pl>
References: <20170403093859.6685-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170403093859.6685-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Rename call_fext_func() arguments so that each argument's name signifies
its role:

  - cmd -> func: sub-function to call (flags, buttons etc.),
  - arg0 -> op: operation to perform (get, set, get capabilities etc.),
  - arg1 -> feature: feature to act on (e.g. which LED), if relevant,
  - arg2 -> state: state to set (e.g. LED on or off), if relevant.

Adjust whitespace to make checkpatch happy.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index e5413d268b24..26149f58dba7 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -217,13 +217,13 @@ static u32 dbg_level = 0x03;
 
 /* Fujitsu ACPI interface function */
 
-static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
+static int call_fext_func(int func, int op, int feature, int state)
 {
 	union acpi_object params[4] = {
-		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = cmd },
-		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = arg0 },
-		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = arg1 },
-		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = arg2 }
+		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = func },
+		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = op },
+		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = feature },
+		{ .integer.type = ACPI_TYPE_INTEGER, .integer.value = state }
 	};
 	struct acpi_object_list arg_list = { 4, params };
 	unsigned long long value;
@@ -236,9 +236,8 @@ static int call_fext_func(int cmd, int arg0, int arg1, int arg2)
 		return -ENODEV;
 	}
 
-	vdbg_printk(FUJLAPTOP_DBG_TRACE,
-		"FUNC 0x%x (args 0x%x, 0x%x, 0x%x) returned 0x%x\n",
-			cmd, arg0, arg1, arg2, (int)value);
+	vdbg_printk(FUJLAPTOP_DBG_TRACE, "FUNC 0x%x (args 0x%x, 0x%x, 0x%x) returned 0x%x\n",
+		    func, op, feature, state, (int)value);
 	return value;
 }
 
-- 
2.12.1
