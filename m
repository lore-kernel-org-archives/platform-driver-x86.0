From: Kelsey Skunberg <skunberg.kelsey@gmail.com>
Subject: [PATCH] platform: x86: Remove acpi_has_method() call in wmi.c
Date: Sun, 21 Jul 2019 21:11:58 -0600
Message-ID: <20190722031158.70311-1-skunberg.kelsey@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bjorn@helgaas.com, rjw@rjwysocki.net, skunberg.kelsey@gmail.com, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
List-Id: platform-driver-x86.vger.kernel.org

acpi_has_method() is unnecessary within __query_block() and should be
removed to avoid extra work.

wc_status is initialized to AE_ERROR before the acpi_has_method() call.
acpi_has_method() and acpi_execute_simple_method() failing due to the
method not existing will result in the same outcome from __query_block().

Signed-off-by: Kelsey Skunberg <skunberg.kelsey@gmail.com>
---
 drivers/platform/x86/wmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 784cea8572c2..59e9aa0f9643 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -340,9 +340,7 @@ static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
 		 * expensive, but have no corresponding WCxx method. So we
 		 * should not fail if this happens.
 		 */
-		if (acpi_has_method(handle, wc_method))
-			wc_status = acpi_execute_simple_method(handle,
-								wc_method, 1);
+		wc_status = acpi_execute_simple_method(handle, wc_method, 1);
 	}
 
 	strcpy(method, "WQ");
-- 
2.20.1
