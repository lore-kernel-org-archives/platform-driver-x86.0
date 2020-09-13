From: trix@redhat.com
Subject: [PATCH] platform/x86: thinkpad_acpi: initialize tp_nvram_state variable
Date: Sun, 13 Sep 2020 12:02:03 -0700
Message-ID: <20200913190203.22238-1-trix@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, natechancellor@gmail.com, ndesaulniers@google.com, len.brown@intel.com
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Tom Rix <trix@redhat.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis flags this represenative problem
thinkpad_acpi.c:2523:7: warning: Branch condition evaluates
  to a garbage value
                if (!oldn->mute ||
                    ^~~~~~~~~~~

In hotkey_kthread() mute is conditionally set by hotkey_read_nvram()
but unconditionally checked by hotkey_compare_and_issue_event().
So the tp_nvram_state variable s[2] needs to be initialized.

Fixes: 01e88f25985d ("ACPI: thinkpad-acpi: add CMOS NVRAM polling for hot keys (v9)")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 47925c319d7b..24da8b6872f2 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2573,7 +2573,7 @@ static void hotkey_compare_and_issue_event(struct tp_nvram_state *oldn,
  */
 static int hotkey_kthread(void *data)
 {
-	struct tp_nvram_state s[2];
+	struct tp_nvram_state s[2] = { 0 };
 	u32 poll_mask, event_mask;
 	unsigned int si, so;
 	unsigned long t;
-- 
2.18.1
