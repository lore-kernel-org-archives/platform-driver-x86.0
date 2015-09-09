From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH] toshiba_acpi: Fix hotkeys registration on some toshiba models
Date: Wed,  9 Sep 2015 11:25:45 -0600
Message-ID: <1441819545-11619-2-git-send-email-coproscefalo@gmail.com>
References: <1441819545-11619-1-git-send-email-coproscefalo@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441819545-11619-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit a2b3471b5b13 ("toshiba_acpi: Use the Hotkey Event Type function
for keymap choosing") changed the *setup_keyboard function to query for
the Hotkey Event Type to help choose the correct keymap, but turns out
that here are certain Toshiba models out there not implementing this
feature, and thus, failing to continue the input device registration and
leaving such laptops without hotkey support.

This patch changes such check, and instead of returning an error if
the Hotkey Event Type is not present, we simply inform userspace about it,
changing the message printed from err to notice, making the function
responsible for registering the input device to continue.

This issue was found on a Toshiba Portege Z30-B, but there might be
some other models out there affected by this regression as well.

Cc: <stable@vger.kernel.org> # 4.1+
Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c434b53..f2372f4 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2398,11 +2398,9 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	if (error)
 		return error;
 
-	error = toshiba_hotkey_event_type_get(dev, &events_type);
-	if (error) {
-		pr_err("Unable to query Hotkey Event Type\n");
-		return error;
-	}
+	if (toshiba_hotkey_event_type_get(dev, &events_type))
+		pr_notice("Unable to query Hotkey Event Type\n");
+
 	dev->hotkey_event_type = events_type;
 
 	dev->hotkey_dev = input_allocate_device();
-- 
2.5.1
