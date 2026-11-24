Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.254.200.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541283;
	b=znF4zRwpWvr5H5/nfqwk5JpsrmHHwamDHGFpU22Ud+BMRxqLzs8iJQhauKwXK0HoWLFz
	 OrpLhXsLA/VD2zxNQfI9s0//nl52IXzlVIKijEX56rSWiTJTxxmuLjbtUgqOFy1pYkD5Y
	 JcKHo0ZMla74THhCQiMhwLzIeCVb3owmmXm3YjV/vX3/bw5LBbpMtZ6BlgjjUVSCWmL3Y
	 nKk3KufKA8KcoLhs9NvSL+AgXWr3Ec4cWqwghguI2L5/xosRovD+xYoeWWzIpYlghtz03
	 4eygLBd2SgTkvIVZt4SdeIwxv3wcGJvTji82BlgNQj9FGvx1SQ/ragzlMhxS924aPcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541283;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=umues63wH7jbsbumI5KNs6T4Yj4M+7oybHqjPtUUOIk=;
	b=xoVOlfpSAiNZGnY8Q4oT3AcgzPiCtASQu1+o58zYTUcQTXWrLlatpTY8iVvWtMNfao8/
	 t9BOnJOEVh5MqjQoQuWLlqSyfDq1AXiXFGBLYHlm2f9rRhxav9cmvGATr+k5qgSlYgxOM
	 tWZxuqD2zBj+FZR3uJSkDucZ87oxrLSW4k11i3v7d2a+cNM+YX9mWLy/Sv3ebKHQXoc2A
	 FofPGTzD6w0wERXpRPOBO/wNP8q4ugN1LAkfvMqgmNv3l+ntzdLdLIvdY92S6zbSh7b1o
	 L0VsU+bPRKPXBuJPldMDBXrdB+Uob9tyu0aLgeMWW8TpP7PpwWPvNMIiCa7GSABa+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sustech.edu.cn;
	spf=pass smtp.mailfrom=mail.sustech.edu.cn;
	dkim=pass header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=HqJKCysx;
	arc=none smtp.remote-ip=54.254.200.92
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA1F606A326;
	Tue, 24 Nov 2026 17:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA1F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sustech.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sustech.edu.cn header.i=@mail.sustech.edu.cn header.a=rsa-sha256 header.s=oemc2211 header.b=HqJKCysx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.sustech.edu.cn;
	s=oemc2211; t=1795541225;
	bh=umues63wH7jbsbumI5KNs6T4Yj4M+7oybHqjPtUUOIk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=HqJKCysxyQA1U/vG6jeO5U5AYlnRjDffdiBaPi5R9VE+rwfgWCI47+cfVNmu4FQYX
	 sgsY0O9OK7Aiz45aN2EkQHTmqhv4ZpKEbsS32RhkRLaP3hHPNAIux8bTM1wT7ti8Kv
	 S/Fw7ajxaYOLjglB40rXnJNpIXAmgF4yGQBcGmJo=
X-QQ-mid: zesmtpgz9t1795541220t893dc80b
X-QQ-Originating-IP: K/3y/atdbX8o9h2nkVJA2iD2ZW1tv7gvwJawJpixFNQ=
Received: from sakura-NbF-XX.sustech.edu.cn ( [116.7.234.244])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 01:26:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6108143953703836400
EX-QQ-RecipientCnt: 7
From: Fuwei Xie <12313607@mail.sustech.edu.cn>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Fuwei Xie <12313607@mail.sustech.edu.cn>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	Zheng Shuyang <yhshzh0@gmail.com>
Subject: [RFC PATCH v3 2/5] platform/x86: huawei-wmi: bind the Huawei method device
Date: Wed, 25 Nov 2026 01:25:29 +0800
Message-ID: <1B65BDB3A7AABFF5+20261124172651.37716-3-12313607@mail.sustech.edu.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124172651.37716-1-12313607@mail.sustech.edu.cn>
References: <20261124172651.37716-1-12313607@mail.sustech.edu.cn>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:mail.sustech.edu.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NzSDQCFWCzVT008q7Gogg7lls1PPIziJ9ql9G179Zr7e9kG5itU+Yddj
	wjBPD+iEWXc53Zwc0Li8IBGC5V658fnFn04thxSOzkQhuAtgPvWopanaNkZhKe2CkyK/VLt
	g9VoksvX6Sp6ZiNBKwFkvKdKIK4pHMo6NP3p/dv297/v9z4FrMJBZOXi+zh0D81UPAKNCJ9
	Cv5apo8+WBbfs2SjiptMk98pVUf2ITiZsZa7hHtZDou+lsMkNFdU5xr/NQdAtbo2qvEBfW6
	wkkrPGPYeRvAQwDQw30KFtQgtcf/VwyNAJDG9shBEfte3lM4077VyarhkR3pkYSpTPcgD7x
	UlExcXkY/WeN3Q9OSktUWQOe279dY9AhftPxRnVztXDXnRMEeYvcg6ot9vkYXkErc1msm0p
	89aHeGsTQOvMKJueEc2NrfXqe3sApviDW/4759HHFNTK1yI/jBHMZiiRoBI3J6AmoDrEnrL
	sTSOPBJeLExyZnI9dWlfxPlZRWUFq9wq5AOrn7pI1hturAlt/FHEQa9ME/lyjGQn9jC9MYg
	weuNkGiBLuENEqSsabrtU2ra1uM8+YOZm7OQl8tYcBj7gCT6520S2MOb5SI4aGJKrfsDlda
	e78up126NWB3jR8FFRvpcNSn6DuhXmmNJjDsJOZoUYkjPmAECplrGTgl5FRpqn051e0K3La
	mlKTyyVYavdpro9o+NR4AlwcMgslh10jy1WXynxArW4bMACL45ODBLR6vDnqlHK+X1xc56L
	suvFdESFMALCHGGYnH7cFl0PSKGpPDvwMWyHF3DIk5wtbPx9EvTiyMRh6fBvPV7TLy/o1Mo
	vRx0tmHTUqI+2v9D9DzLm3xdSx95XxHu3LEDYroeeluoACSQ7q1eeM9b5RDF0R7QerEwKMc
	qIUUzyaIBMTNHnf5IsvVsPUmg7xU67/KLR1v/Ri4h8lA0tJ9hrpTa2vMvpP5lMJadZGNJ4g
	oUi8upsWM21r0lJ7zCVvgzRw7g8vQQsGafZmp2FvIZCCHc8SJu3IXwaKc4JKK5d5NJE/hup
	W8s7IBqfOkL50vIl9OeR7va/WjBijex76pczkMbUGQmoHS1r+VLJZX5NUowhg=
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

Bind the method GUID on the WMI bus and give its platform device the
bound wdev for method calls. Unregister the platform device before the
method driver releases the binding. Keep the platform sysfs location
and the input-only path on machines without the method GUID.

Allocate platform state on probe and unwind previously registered
input handlers if a later input device fails to register.

Signed-off-by: Fuwei Xie <12313607@mail.sustech.edu.cn>
---
 drivers/platform/x86/huawei-wmi.c | 109 ++++++++++++++++++++----------
 1 file changed, 75 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
index 559731d15..690bd0abc 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -60,6 +60,7 @@ struct huawei_wmi_debug {
 };
 
 struct huawei_wmi {
+	struct wmi_device *wdev;
 	bool battery_available;
 	bool fn_lock_available;
 
@@ -156,7 +157,7 @@ static int huawei_wmi_call(struct huawei_wmi *huawei,
 	acpi_status status;
 
 	mutex_lock(&huawei->wmi_lock);
-	status = wmi_evaluate_method(HWMI_METHOD_GUID, 0, 1, in, out);
+	status = wmidev_evaluate_method(huawei->wdev, 0, 1, in, out);
 	mutex_unlock(&huawei->wmi_lock);
 	if (ACPI_FAILURE(status)) {
 		dev_err(huawei->dev, "Failed to evaluate wmi method\n");
@@ -880,25 +881,36 @@ static const struct wmi_device_id huawei_wmi_events_id_table[] = {
 
 static int huawei_wmi_probe(struct platform_device *pdev)
 {
-	const struct wmi_device_id *guid = huawei_wmi_events_id_table;
+	const struct wmi_device_id *guid;
+	struct wmi_device **method = dev_get_platdata(&pdev->dev);
 	int err;
 
+	huawei_wmi = devm_kzalloc(&pdev->dev, sizeof(*huawei_wmi), GFP_KERNEL);
+	if (!huawei_wmi)
+		return -ENOMEM;
+
+	huawei_wmi->wdev = method ? *method : NULL;
 	platform_set_drvdata(pdev, huawei_wmi);
 	huawei_wmi->dev = &pdev->dev;
 
-	while (*guid->guid_string) {
-		if (wmi_has_guid(guid->guid_string)) {
-			err = huawei_wmi_input_setup(&pdev->dev, guid->guid_string);
-			if (err) {
-				dev_err(&pdev->dev, "Failed to setup input on %s\n", guid->guid_string);
-				return err;
-			}
-		}
+	for (guid = huawei_wmi_events_id_table; *guid->guid_string; guid++) {
+		if (!wmi_has_guid(guid->guid_string))
+			continue;
 
-		guid++;
+		err = huawei_wmi_input_setup(&pdev->dev, guid->guid_string);
+		if (!err)
+			continue;
+
+		dev_err(&pdev->dev, "Failed to setup input on %s\n", guid->guid_string);
+		while (guid != huawei_wmi_events_id_table) {
+			guid--;
+			if (wmi_has_guid(guid->guid_string))
+				huawei_wmi_input_exit(&pdev->dev, guid->guid_string);
+		}
+		return err;
 	}
 
-	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+	if (huawei_wmi->wdev) {
 		mutex_init(&huawei_wmi->wmi_lock);
 
 		huawei_wmi_leds_setup(&pdev->dev);
@@ -921,7 +933,7 @@ static void huawei_wmi_remove(struct platform_device *pdev)
 		guid++;
 	}
 
-	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+	if (huawei_wmi->wdev) {
 		huawei_wmi_debugfs_exit(&pdev->dev);
 		huawei_wmi_battery_exit(&pdev->dev);
 		huawei_wmi_fn_lock_exit(&pdev->dev);
@@ -936,14 +948,46 @@ static struct platform_driver huawei_wmi_driver = {
 	.remove = huawei_wmi_remove,
 };
 
-static __init int huawei_wmi_init(void)
+/*
+ * Keep the platform device and its existing userspace paths on both
+ * method-capable and older event-only machines.
+ */
+static struct platform_device *legacy_pdev;
+
+static int huawei_wmi_method_probe(struct wmi_device *wdev, const void *context)
 {
 	struct platform_device *pdev;
-	int err;
 
-	huawei_wmi = kzalloc_obj(struct huawei_wmi);
-	if (!huawei_wmi)
-		return -ENOMEM;
+	pdev = platform_device_register_data(NULL, "huawei-wmi", PLATFORM_DEVID_NONE,
+					     &wdev, sizeof(wdev));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	dev_set_drvdata(&wdev->dev, pdev);
+	return 0;
+}
+
+static void huawei_wmi_method_remove(struct wmi_device *wdev)
+{
+	platform_device_unregister(dev_get_drvdata(&wdev->dev));
+}
+
+static const struct wmi_device_id huawei_wmi_method_ids[] = {
+	{ HWMI_METHOD_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, huawei_wmi_method_ids);
+
+static struct wmi_driver huawei_wmi_method_driver = {
+	.driver.name = "huawei-wmi-method",
+	.id_table = huawei_wmi_method_ids,
+	.probe = huawei_wmi_method_probe,
+	.remove = huawei_wmi_method_remove,
+};
+
+static __init int huawei_wmi_init(void)
+{
+	int err;
 
 	quirks = &quirk_unknown;
 	dmi_check_system(huawei_quirks);
@@ -954,37 +998,34 @@ static __init int huawei_wmi_init(void)
 
 	err = platform_driver_register(&huawei_wmi_driver);
 	if (err)
-		goto pdrv_err;
+		return err;
 
-	pdev = platform_device_register_simple("huawei-wmi", PLATFORM_DEVID_NONE, NULL, 0);
-	if (IS_ERR(pdev)) {
-		err = PTR_ERR(pdev);
-		goto pdev_err;
+	if (wmi_has_guid(HWMI_METHOD_GUID)) {
+		err = wmi_driver_register(&huawei_wmi_method_driver);
+	} else {
+		legacy_pdev = platform_device_register_simple("huawei-wmi", PLATFORM_DEVID_NONE,
+							      NULL, 0);
+		err = PTR_ERR_OR_ZERO(legacy_pdev);
 	}
+	if (err)
+		platform_driver_unregister(&huawei_wmi_driver);
 
-	return 0;
-
-pdev_err:
-	platform_driver_unregister(&huawei_wmi_driver);
-pdrv_err:
-	kfree(huawei_wmi);
 	return err;
 }
 
 static __exit void huawei_wmi_exit(void)
 {
-	struct platform_device *pdev = to_platform_device(huawei_wmi->dev);
+	if (legacy_pdev)
+		platform_device_unregister(legacy_pdev);
+	else
+		wmi_driver_unregister(&huawei_wmi_method_driver);
 
-	platform_device_unregister(pdev);
 	platform_driver_unregister(&huawei_wmi_driver);
-
-	kfree(huawei_wmi);
 }
 
 module_init(huawei_wmi_init);
 module_exit(huawei_wmi_exit);
 
-MODULE_ALIAS("wmi:"HWMI_METHOD_GUID);
 MODULE_DEVICE_TABLE(wmi, huawei_wmi_events_id_table);
 MODULE_AUTHOR("Ayman Bagabas <ayman.bagabas@gmail.com>");
 MODULE_DESCRIPTION("Huawei WMI laptop extras driver");
-- 
2.55.0
