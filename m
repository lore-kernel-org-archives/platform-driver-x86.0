From: Mario Limonciello <mario.limonciello@dell.com>
Subject: [PATCH 2/2] platform/x86: alienware-wmi: Correct a memory leak
Date: Mon, 10 Sep 2018 13:01:53 -0500
Message-ID: <1536602513-13861-2-git-send-email-mario.limonciello@dell.com>
References: <1536602513-13861-1-git-send-email-mario.limonciello@dell.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536602513-13861-1-git-send-email-mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

An ACPI buffer that was allocated was not being freed after use.

Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/alienware-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index d975462..f10af5c 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -536,6 +536,7 @@ static acpi_status alienware_wmax_command(struct wmax_basic_args *in_args,
 		if (obj && obj->type == ACPI_TYPE_INTEGER)
 			*out_data = (u32) obj->integer.value;
 	}
+	kfree(output.pointer);
 	return status;
 
 }
-- 
2.7.4
