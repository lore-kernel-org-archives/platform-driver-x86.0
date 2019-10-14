From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] platform/x86: huawei-wmi: Fix a precision vs width printf bug
Date: Mon, 14 Oct 2019 13:58:01 +0300
Message-ID: <20191014105801.GA31759@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Ayman Bagabas <ayman.bagabas@gmail.com>
Cc: Andy Shevchenko <andy@infradead.org>, Mattias Jacobsson <2pi@mok.nu>, Takashi Iwai <tiwai@suse.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This was supposed to be precision "%.*s" instead of width "%*s".  It's
possible that this results in printing beyond the end of the string.

Fixes: a970b95345ab ("platform/x86: huawei-wmi: Add debugfs support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/huawei-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 6720f78c60c2..69a7be8dafcd 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -612,7 +612,7 @@ static void huawei_wmi_debugfs_call_dump(struct seq_file *m, void *data,
 		seq_printf(m, "0x%llx", obj->integer.value);
 		break;
 	case ACPI_TYPE_STRING:
-		seq_printf(m, "\"%*s\"", obj->string.length, obj->string.pointer);
+		seq_printf(m, "\"%.*s\"", obj->string.length, obj->string.pointer);
 		break;
 	case ACPI_TYPE_BUFFER:
 		seq_puts(m, "{");
-- 
2.20.1
