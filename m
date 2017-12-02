From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/4] platform/x86: ideapad-laptop: Use __func__ instead of write_ec_cmd in pr_err
Date: Sat,  2 Dec 2017 21:45:32 +0800
Message-ID: <20171202134534.3252-2-jiaxun.yang@flygoat.com>
References: <20171202134534.3252-1-jiaxun.yang@flygoat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171202134534.3252-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Roger Jargoyhen <rjargoyhen@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: platform-driver-x86.vger.kernel.org

To deal with checkpatch warning:
WARNING: Prefer using '"%s...", __func__' to using 'write_ec_cmd',
this function's name, in a string

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 9f2a4bc58df0..37a88938bbaa 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -231,7 +231,7 @@ static int write_ec_cmd(acpi_handle handle, int cmd, unsigned long data)
 		if (val == 0)
 			return 0;
 	}
-	pr_err("timeout in write_ec_cmd\n");
+	pr_err("timeout in %s\n", __func__);
 	return -1;
 }
 
-- 
2.14.1
