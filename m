From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] hp-wmi: check for allocation failures
Date: Thu, 17 May 2012 09:48:12 +0300
Message-ID: <20120517064812.GA14660@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from acsinet15.oracle.com ([141.146.126.227]:45438 "EHLO
	acsinet15.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759429Ab2EQGsR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 May 2012 02:48:17 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

rfkill_alloc() returns NULL on failure.  Check for it, to make the
static checkers happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index e2faa3c..387183a 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -634,6 +634,8 @@ static int __devinit hp_wmi_rfkill_setup(struct platform_device *device)
 					   RFKILL_TYPE_WLAN,
 					   &hp_wmi_rfkill_ops,
 					   (void *) HPWMI_WIFI);
+		if (!wifi_rfkill)
+			return -ENOMEM;
 		rfkill_init_sw_state(wifi_rfkill,
 				     hp_wmi_get_sw_state(HPWMI_WIFI));
 		rfkill_set_hw_state(wifi_rfkill,
@@ -648,6 +650,10 @@ static int __devinit hp_wmi_rfkill_setup(struct platform_device *device)
 						RFKILL_TYPE_BLUETOOTH,
 						&hp_wmi_rfkill_ops,
 						(void *) HPWMI_BLUETOOTH);
+		if (!bluetooth_rfkill) {
+			err = -ENOMEM;
+			goto register_wifi_error;
+		}
 		rfkill_init_sw_state(bluetooth_rfkill,
 				     hp_wmi_get_sw_state(HPWMI_BLUETOOTH));
 		rfkill_set_hw_state(bluetooth_rfkill,
@@ -662,6 +668,10 @@ static int __devinit hp_wmi_rfkill_setup(struct platform_device *device)
 					   RFKILL_TYPE_WWAN,
 					   &hp_wmi_rfkill_ops,
 					   (void *) HPWMI_WWAN);
+		if (!wwan_rfkill) {
+			err = -ENOMEM;
+			goto register_bluetooth_error;
+		}
 		rfkill_init_sw_state(wwan_rfkill,
 				     hp_wmi_get_sw_state(HPWMI_WWAN));
 		rfkill_set_hw_state(wwan_rfkill,
