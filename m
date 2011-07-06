From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH] platform-drivers-x86: msi-wmi: add missing
 sparse_keymap_free in msi_wmi_init error path
Date: Wed, 06 Jul 2011 11:05:20 +0800
Message-ID: <1309921520.26847.3.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dtor@mail.ru>, Thomas Renninger <trenn@suse.de>, Anisse Astier <anisse@astier.eu>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/platform/x86/msi-wmi.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index c832e33..6f40bf2 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -272,6 +272,7 @@ static int __init msi_wmi_init(void)
 err_free_backlight:
 	backlight_device_unregister(backlight);
 err_free_input:
+	sparse_keymap_free(msi_wmi_input_dev);
 	input_unregister_device(msi_wmi_input_dev);
 err_uninstall_notifier:
 	wmi_remove_notify_handler(MSIWMI_EVENT_GUID);
-- 
1.7.4.1
