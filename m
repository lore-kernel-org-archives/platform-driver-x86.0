From: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Subject: [PATCH 2/2] classmate-laptop: little optimization for cmpc_rfkill_block
Date: Tue, 30 Nov 2010 16:30:43 -0200
Message-ID: <1291141843-8807-2-git-send-email-herton@mandriva.com.br>
References: <1291141843-8807-1-git-send-email-herton@mandriva.com.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from perninha.conectiva.com.br ([187.115.55.249]:55886 "EHLO
	perninha.conectiva.com.br" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753122Ab0K3SbB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Nov 2010 13:31:01 -0500
In-Reply-To: <1291141843-8807-1-git-send-email-herton@mandriva.com.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, Herton Ronaldo Krzesinski <herton@mandriva.com.br>

We don't need to call bios/acpi (cmpc_set_rfkill_wlan) if the blocked
state is already set to the same value (little optimization). This can
happen for example if we initialize the module with same initial
hardware state (rfkill core always call cmpc_rfkill_block on
initialization here).

Also GWRI method only accepts 0 or 1 for setting rfkill block, as can be
seen on AML code from acpidump->DSDT from a classmate sample I have, so
should be fine setting state only to 0 or 1 directly.

Signed-off-by: Herton Ronaldo Krzesinski <herton@mandriva.com.br>
Cc: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
---
 drivers/platform/x86/classmate-laptop.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index b714c6a..51ec5f5 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -522,18 +522,20 @@ static int cmpc_rfkill_block(void *data, bool blocked)
 	acpi_status status;
 	acpi_handle handle;
 	unsigned long long state;
+	bool is_blocked;
 
 	handle = data;
 	status = cmpc_get_rfkill_wlan(handle, &state);
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
-	if (blocked)
-		state &= ~1;
-	else
-		state |= 1;
-	status = cmpc_set_rfkill_wlan(handle, state);
-	if (ACPI_FAILURE(status))
-		return -ENODEV;
+	/* Check if we really need to call cmpc_set_rfkill_wlan */
+	is_blocked = state & 1 ? false : true;
+	if (is_blocked != blocked) {
+		state = blocked ? 0 : 1;
+		status = cmpc_set_rfkill_wlan(handle, state);
+		if (ACPI_FAILURE(status))
+			return -ENODEV;
+	}
 	return 0;
 }
 
-- 
1.7.3.2
