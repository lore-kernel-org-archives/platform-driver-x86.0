From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 09/10] eeepc-laptop: add a getter for touchpad led
Date: Mon, 29 Nov 2010 08:14:13 +0100
Message-ID: <1291014854-17961-10-git-send-email-corentincj@iksaif.net>
References: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:60478 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754961Ab0K2HPK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:10 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id 3E632862B0
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:09 +0100 (CET)
In-Reply-To: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

Allow te get the current led state in a more accurate way.

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/eeepc-laptop.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index b2edfdc..e9fc530 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -529,6 +529,15 @@ static void tpd_led_set(struct led_classdev *led_cdev,
 	queue_work(eeepc->led_workqueue, &eeepc->tpd_led_work);
 }
 
+static enum led_brightness tpd_led_get(struct led_classdev *led_cdev)
+{
+	struct eeepc_laptop *eeepc;
+
+	eeepc = container_of(led_cdev, struct eeepc_laptop, tpd_led);
+
+	return get_acpi(eeepc, CM_ASL_TPD);
+}
+
 static int eeepc_led_init(struct eeepc_laptop *eeepc)
 {
 	int rv;
@@ -543,6 +552,8 @@ static int eeepc_led_init(struct eeepc_laptop *eeepc)
 
 	eeepc->tpd_led.name = "eeepc::touchpad";
 	eeepc->tpd_led.brightness_set = tpd_led_set;
+	if (get_acpi(eeepc, CM_ASL_TPD) >= 0) /* if method is available */
+	  eeepc->tpd_led.brightness_get = tpd_led_get;
 	eeepc->tpd_led.max_brightness = 1;
 
 	rv = led_classdev_register(&eeepc->platform_device->dev,
-- 
1.7.3.2
