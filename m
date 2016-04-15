From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] thinkpad_acpi: silence an unintialized variable warning
Date: Fri, 15 Apr 2016 17:46:34 +0300
Message-ID: <20160415144634.GE8953@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

If fan_get_status() fails then "s" isn't initialized.  I've tweaked the
error handling a bit to silence this warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e305ab5..9255ff3 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7972,10 +7972,12 @@ static int fan_get_status_safe(u8 *status)
 		fan_update_desired_level(s);
 	mutex_unlock(&fan_mutex);
 
+	if (rc)
+		return rc;
 	if (status)
 		*status = s;
 
-	return rc;
+	return 0;
 }
 
 static int fan_get_speed(unsigned int *speed)
