From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 07/16] asus-wmi: fix section mismatch
Date: Fri,  1 Jul 2011 11:34:32 +0200
Message-ID: <1309512881-2901-8-git-send-email-corentin.chary@gmail.com>
References: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 619e3e3..fa6982a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1711,7 +1711,7 @@ static int asus_wmi_probe(struct platform_device *pdev)
 
 static bool used;
 
-int asus_wmi_register_driver(struct asus_wmi_driver *driver)
+int __init_or_module asus_wmi_register_driver(struct asus_wmi_driver *driver)
 {
 	struct platform_driver *platform_driver;
 	struct platform_device *platform_device;
-- 
1.7.3.4
