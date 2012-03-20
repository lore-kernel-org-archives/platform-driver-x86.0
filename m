From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 03/14] eeepc-wmi: add extra keymaps for EP121
Date: Tue, 20 Mar 2012 09:53:03 +0100
Message-ID: <1332233594-13099-4-git-send-email-corentin.chary@gmail.com>
References: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1332233594-13099-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Chih-Wei Huang <cwhuang@linux.org.tw>, Corentin Chary <corentincj@iksaif.net>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Chih-Wei Huang <cwhuang@linux.org.tw>

Signed-off-by: Chih-Wei Huang <cwhuang@linux.org.tw>
Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 9f6e643..1d91eb2 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -84,6 +84,9 @@ static const struct key_entry eeepc_wmi_keymap[] = {
 	{ KE_KEY, 0xed, { KEY_CAMERA_DOWN } },
 	{ KE_KEY, 0xee, { KEY_CAMERA_LEFT } },
 	{ KE_KEY, 0xef, { KEY_CAMERA_RIGHT } },
+	{ KE_KEY, 0xf3, { KEY_MENU } },
+	{ KE_KEY, 0xf5, { KEY_HOMEPAGE } },
+	{ KE_KEY, 0xf6, { KEY_ESC } },
 	{ KE_END, 0},
 };
 
-- 
1.7.3.4
