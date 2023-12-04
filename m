Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4EDC0
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 13:52:28 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAGrT-0008G1-7w; Mon, 04 Dec 2023 22:52:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAGrS-00DbUZ-HC; Mon, 04 Dec 2023 22:52:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAGrS-00ELqD-7q; Mon, 04 Dec 2023 22:52:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: acpi4asus-user@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 1/2] platform/x86: asus-wmi: Convert to platform remove callback returning void
Date: Mon,  4 Dec 2023 22:52:11 +0100
Message-ID:  <639b9ffc18422fe59125893bd7909e8a73cffb72.1701726190.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701726190.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701726190.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1959; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=jIzop6S8QxKkWaTxvedKHsOFu3W6F7VXWCpnop+8wrY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbkoL0sydLl3CsqUBDkJQ1mi+S2e/Z23m6TTLX v3E4cdsgCqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW5KCwAKCRCPgPtYfRL+ TjqfB/4kh62jsY9FemT7I87VAY7bFN6t7GY1EikVZJFTSZxX063lpzsyuN8EmokNVzkE/FkGeEd O3cif3ZSrPtT55AW+dDr6F3YQ4fccAk/DmnLvRD44ShiEz3u4wXdTYi1VVSt5OQbg18aC2SPV2w UqT80Bc1yXx84/iAzv4K3IyoPSEIZEDv0sBcQYLLFpOj3p1JYzENz/O3o0Nfll5QBnDliOjwIF/ GTNnnft/iDRHJo7OdfB4XjMcsOYOEa7akCIoLdoboNquChiCllV6KJ7yEYu88st+xOpLusT5Kkv IAL7vjKtEGJBm++GGGp/GyNQ0/OBDO9WqGFwzh/mfpW0XN1H
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/asus-wmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index ca668cf04020..d1ec40e4881d 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4604,7 +4604,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	return err;
 }
 
-static int asus_wmi_remove(struct platform_device *device)
+static void asus_wmi_remove(struct platform_device *device)
 {
 	struct asus_wmi *asus;
 
@@ -4627,7 +4627,6 @@ static int asus_wmi_remove(struct platform_device *device)
 		platform_profile_remove();
 
 	kfree(asus);
-	return 0;
 }
 
 /* Platform driver - hibernate/resume callbacks *******************************/
@@ -4749,7 +4748,7 @@ int __init_or_module asus_wmi_register_driver(struct asus_wmi_driver *driver)
 		return -EBUSY;
 
 	platform_driver = &driver->platform_driver;
-	platform_driver->remove = asus_wmi_remove;
+	platform_driver->remove_new = asus_wmi_remove;
 	platform_driver->driver.owner = driver->owner;
 	platform_driver->driver.name = driver->name;
 	platform_driver->driver.pm = &asus_pm_ops;
-- 
2.42.0

