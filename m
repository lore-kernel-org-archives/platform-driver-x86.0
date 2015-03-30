From: Joe Perches <joe@perches.com>
Subject: [PATCH 4/7] wmi: Use bool function return values of true/false not 1/0
Date: Mon, 30 Mar 2015 10:43:20 -0700
Message-ID: <f2834902af97b7c3220b99d724bdb6539caaded7.1427736972.git.joe@perches.com>
References: <cover.1427736972.git.joe@perches.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1427736972.git.joe@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Use the normal return values for bool functions

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/platform/x86/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 26a0bd8..aac4757 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -239,10 +239,10 @@ static bool find_guid(const char *guid_string, struct wmi_block **out)
 		if (memcmp(block->guid, guid_input, 16) == 0) {
 			if (out)
 				*out = wblock;
-			return 1;
+			return true;
 		}
 	}
-	return 0;
+	return false;
 }
 
 static acpi_status wmi_method_enable(struct wmi_block *wblock, int enable)
-- 
2.1.2
