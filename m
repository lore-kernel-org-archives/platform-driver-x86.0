Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DC542BE8F;
	Tue, 28 Jul 2026 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239989; cv=none; b=m57l46x9NlajQWR6PFQQi20SuwQtGGyBmRTHHaKjXf0LDUZ0MB/+YJEPjMH1TzhTRi5yLLq5LlcDN/c/lBznSUYDuuhYJK0DbuyZ9KwfhV5SiGdjde+vIK05xkuaO6PA9IHk3K2iIwDG1JE4tQpRZJR6ryK5qPfO15PBlM5/Jbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239989; c=relaxed/simple;
	bh=XnIcqupmro4QZtu02gGtztwX37QwGudwUYRoIjHo7sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNLRpt+XCsIcDJut1+bB7znDBGJ1JNJDCwm7oNJn0Jfx9/8AlPwrwkE3MVY4ITT0mUne+s9oXp1wuQqDXbhHJFIkVcgZenpkXD5adh/ZAhC5bCvghVw9fd0ITwRtB9lJEO9FYSrQKBxuOZJmrvnZFzYkd1lkGHd/M0cqNnWydjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=C0oliktO; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="C0oliktO"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A4FC52FC0079;
	Tue, 28 Jul 2026 13:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785239977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ev/GJiHME8Ms5EuopNoqcru5aHrEB6B2EQkB2WlEx24=;
	b=C0oliktOKoBTg2q0+2HUt7Zl7euDyroA7F5pOSOQoc+dMandwhNaGJa02FZiBwwL0CUIdQ
	beAbaMW5GYk1g4e8YcYE05hNCUgF7/CvvfCaFa8ZpBLoD8xF+gSW519dX7z+px6jL3q5U2
	RtARzw7G7i8ECtVhf3t6PFSNrRCUdVM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/6] platform/x86/tuxedo: Don't use device driver data
Date: Tue, 28 Jul 2026 13:59:16 +0200
Message-ID: <20260728115918.125349-2-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728115918.125349-1-aer@tuxedocomputers.com>
References: <20260728115918.125349-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WMI driver for TUXEDO Sirius devices used to rely on the device
driver data through dev_set_drvdata even though it is only a virtual
low level HID driver. For this purpose, it is better to use the
driver_data of the hid_device struct to avoid interfering with high
level device drivers.

Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
index 32d7756022c2..72205de72256 100644
--- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
@@ -448,7 +448,7 @@ static int tux_ll_start(struct hid_device *hdev)
 	}
 	driver_data->next_lamp_id = 0;
 
-	dev_set_drvdata(&hdev->dev, driver_data);
+	hdev->driver_data = driver_data;
 
 	return ret;
 }
@@ -485,7 +485,7 @@ struct __packed lamp_array_attributes_report_t {
 static int handle_lamp_array_attributes_report(struct hid_device *hdev,
 					       struct lamp_array_attributes_report_t *rep)
 {
-	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
 
 	rep->lamp_count = driver_data->lamp_count;
 	rep->bounding_box_width_in_micrometers = 368000;
@@ -510,7 +510,7 @@ struct __packed lamp_attributes_request_report_t {
 static int handle_lamp_attributes_request_report(struct hid_device *hdev,
 						 struct lamp_attributes_request_report_t *rep)
 {
-	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
 
 	if (rep->lamp_id < driver_data->lamp_count)
 		driver_data->next_lamp_id = rep->lamp_id;
@@ -539,7 +539,7 @@ struct __packed lamp_attributes_response_report_t {
 static int handle_lamp_attributes_response_report(struct hid_device *hdev,
 						  struct lamp_attributes_response_report_t *rep)
 {
-	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
 	u16 lamp_id = driver_data->next_lamp_id;
 
 	rep->lamp_id = lamp_id;
@@ -598,7 +598,7 @@ struct __packed lamp_multi_update_report_t {
 static int handle_lamp_multi_update_report(struct hid_device *hdev,
 					   struct lamp_multi_update_report_t *rep)
 {
-	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
 	union tux_wmi_xx_496in_80out_in_t *next = &driver_data->next_kbl_set_multiple_keys_in;
 	struct tux_kbl_set_multiple_keys_in_rgb_config_t *rgb_configs_j;
 	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
@@ -683,7 +683,7 @@ struct __packed lamp_range_update_report_t {
 static int handle_lamp_range_update_report(struct hid_device *hdev,
 					   struct lamp_range_update_report_t *rep)
 {
-	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
+	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
 	struct lamp_multi_update_report_t lamp_multi_update_report = {
 		.report_id = LAMP_MULTI_UPDATE_REPORT_ID,
 	};
-- 
2.43.0

