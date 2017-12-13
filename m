From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: [PATCH 3/3] platform/x86: dell-laptop: braces {} are not necessary for single statement blocks
Date: Wed, 13 Dec 2017 13:43:09 +0530
Message-ID: <20171213081309.22851-4-dhaval.shah@softnautics.com>
References: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171213081309.22851-1-dhaval.shah@softnautics.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg59@srcf.ucam.org, pali.rohar@gmail.com, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dhaval Shah <dhaval.shah@softnautics.com>
List-Id: platform-driver-x86.vger.kernel.org

Resolved braces {} are not necessary for single statement blocks
checkpatch warnings. Issue found by checkpatch.

Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
---
 drivers/platform/x86/dell-laptop.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/dell-laptop.c
index bf4e73a02b39..21361bfa2b5c 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -493,9 +493,8 @@ static void dell_rfkill_query(struct rfkill *rfkill, void *data)
 	ret = dell_send_request(CLASS_INFO, SELECT_RFKILL);
 	status = buffer->output[1];
 
-	if (ret != 0 || !(status & BIT(0))) {
+	if (ret != 0 || !(status & BIT(0)))
 		return;
-	}
 
 	dell_set_arguments(0, 0x2, 0, 0);
 	ret = dell_send_request(CLASS_INFO, SELECT_RFKILL);
-- 
2.11.0
