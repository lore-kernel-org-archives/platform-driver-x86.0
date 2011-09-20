From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH 6/6] toshiba_acpi: Initialize brightness in backlight device
Date: Tue, 20 Sep 2011 16:55:54 -0500
Message-ID: <1316555754-25949-7-git-send-email-seth.forshee@canonical.com>
References: <1316555754-25949-1-git-send-email-seth.forshee@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1316555754-25949-1-git-send-email-seth.forshee@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Azael Avalos <coproscefalo@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 drivers/platform/x86/toshiba_acpi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c51a64c..13ef8c3 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -979,6 +979,7 @@ static int __devinit toshiba_acpi_add(struct acpi_device *acpi_dev)
 		dev->backlight_dev = NULL;
 		goto error;
 	}
+	dev->backlight_dev->props.brightness = get_lcd(dev->backlight_dev);
 
 	/* Register rfkill switch for Bluetooth */
 	if (hci_get_bt_present(dev, &bt_present) == HCI_SUCCESS && bt_present) {
-- 
1.7.4.1
