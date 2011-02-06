From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH v2 15/18] eeepc-wmi: respect wireless_hotplug setting
Date: Sun,  6 Feb 2011 13:28:40 +0100
Message-ID: <1296995324-5462-16-git-send-email-corentincj@iksaif.net>
References: <1296995324-5462-1-git-send-email-corentincj@iksaif.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1296995324-5462-1-git-send-email-corentincj@iksaif.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Corentin Chary <corentincj@iksaif.net>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-wmi.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 910eb00..bc71333 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -748,6 +748,9 @@ static int eeepc_wmi_rfkill_init(struct eeepc_wmi *eeepc)
 	if (result && result != -ENODEV)
 		goto exit;
 
+	if (!eeepc->hotplug_wireless)
+		goto exit;
+
 	result = eeepc_setup_pci_hotplug(eeepc);
 	/*
 	 * If we get -EBUSY then something else is handling the PCI hotplug -
-- 
1.7.4.rc3
