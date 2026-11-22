Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.91
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313936;
	b=QVNORKh4ULE/UedbvDEuixayMNFNLjHccF6757VPJSkWVOYiBZINTEedZdvC+vpDaBDf
	 Y+fcWsa85YlpmsJ3r8fBUTUnvzgpqscU/rW/BuSYH9xjymsIzbEhPRZyjUS40gNLYanpo
	 ioLOXlEePzS/ZisBnZFnD6i3Jp9t77itXZA/t7lIPnF+53Go1nRsONBHVXWUl1Sn9K97X
	 57D1cUdwjQMTyElW6yJ3jemW/cuz1dJGoV99HUY6SFpnPblMtEKnqWj9GKTMOD6WItfo/
	 YuN4/Kuvz0i/oiha6kPxEub/VQoQAN3uo4z1TijQ0gFaHuBMB5rIopyIFp3JHNICVGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313936;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7pdHqZ1SWS3GM0eBdGjiSssBdOiAVefKKrfY5o5tukw=;
	b=KMxHa2GjFetw6dup7jmTQbUmZh55fSY+c8gks+coU+yhNyvPvHIO8sSGAw4hmwSTLhMa
	 GlE4L8r3TQCcURMp3vKjX+0+f8DYK2xa6NR+wVhwoHn/+AFoquyX4bl2TBvVAQM/FtmGm
	 L1WfZl0yBUoXjzouCzFItpLdmROQ0LlXGY4JNmGsTZgSNB+JnsXTmYEqXmHmOjXVZWg1V
	 fljasguJiv3sCSuAmLC+xna92IIO4m/ZDrVLj4y6WrBHl7QruJcGQTr+crgaw/BExsMq7
	 hUOvNMOXy901IzXa6x2y7TvwLu4tkMFnYBqxT13s0HU2EJcr47L1kXkTkdq3+Eh33Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hAA8Yab8;
	arc=none smtp.remote-ip=91.218.175.91
Received: from mta0.migadu.com (out-91.mta0.migadu.com [91.218.175.91])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08A5606A33F
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 02:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08A5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hAA8Yab8
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=N4F5vxvA10qUab/Pw49w5r4KoXZ/lfPzLxBwp+b8uA0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795313934; v=1; x=1795918734;
 b=hAA8Yab8Je1QymaUv7Y3weGaR9OvypSkf5GBuuXNpXFg8L3KO5ovCRP3Zt9/tcnBMrsHPwUO
 8K3yYqYRDjq76Ozhq+Zt/BwQYmIct6eiVHEHQDrRtvX74GkSq8VOj8QYqRQa97DlEKrFJ4vEcxo
 WR4R+7Z/jpYM7YqjVINVXQn8=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 60b1eee66f9b36e8;
	Sun, 22 Nov 2026 02:18:54 +0000
X-Mizu-Trace-ID: 60b1eee66f9b36e8
X-Migadu-Flow: FLOW_OUT
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Benjamin Tissoires" <bentiss@kernel.org>,
	"Jiri Kosina" <jikos@kernel.org>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schwartz" <matthew.schwartz@linux.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Jonathan LoBue" <jlobue10@gmail.com>,
	"Khamunetri Clark" <khamunetriclark@gmail.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	"Joshua Leivenzon" <hacker1024@users.sourceforge.net>,
	"Nathan Chancellor" <nathan@kernel.org>,
	=?UTF-8?q?Rebecca=20Mara=20M=C3=BCller?= <rebecca.mara@posteo.de>,
	"Ivan Levchenko" <me@livan.pro>,
	"Corentin Chary" <corentin.chary@gmail.com>,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v16 02/19] HID: asus: move functions above
Date: Sun, 22 Nov 2026 02:18:31 +0000
Message-ID: <20261122021849.57863-3-denis.benato@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122021849.57863-1-denis.benato@linux.dev>
References: <20261122021849.57863-1-denis.benato@linux.dev>
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

Core asus functions that ally driver has to use are below the position where
they will be used: move static function declaration above to avoid forward
declaration of said functions.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/hid/hid-asus.c | 232 ++++++++++++++++++++---------------------
 1 file changed, 116 insertions(+), 116 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 482e082586f1..659b5f3f2801 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -182,6 +182,122 @@ struct asus_drvdata {
 	struct asus_xgm_led *xgm_led;
 };
 
+/**
+ * asus_find_report() - Find a report of the given type by its ID
+ * @hdev: HID device
+ * @type: report type (HID_INPUT_REPORT, HID_OUTPUT_REPORT or
+ * HID_FEATURE_REPORT)
+ * @report_id: report ID to look for
+ *
+ * Return: the report with the given ID, or NULL if the device does not
+ * declare such a report.
+ */
+static struct hid_report *asus_find_report(struct hid_device *hdev,
+					   unsigned int type, u8 report_id)
+{
+	return hdev->report_enum[type].report_id_hash[report_id];
+}
+
+/**
+ * asus_report_len() - Length of a feature report for the device
+ * @hdev: HID device
+ * @report_id: report ID of the feature report
+ *
+ * The same ASUS report ID can have different sizes depending on the device:
+ * report 0x5E is a 64-byte report on laptops but a 300-byte report on XG
+ * Mobile stations. Always size transfers from the report descriptor of the
+ * device at hand instead of hardcoding lengths.
+ *
+ * Return: the length of the feature report in bytes, or 0 if the device
+ * does not declare the report.
+ */
+static size_t asus_report_len(struct hid_device *hdev, u8 report_id)
+{
+	struct hid_report *report;
+
+	report = asus_find_report(hdev, HID_FEATURE_REPORT, report_id);
+
+	return report ? hid_report_len(report) : 0;
+}
+
+static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t buf_size)
+{
+	const size_t hw_len = asus_report_len(hdev, buf[0]);
+	int ret;
+
+	if (!buf || !buf_size)
+		return -EINVAL;
+
+	/* The payload (including the report ID) must fit the device report. */
+	if (!hw_len || buf_size > hw_len)
+		return -EINVAL;
+
+	/*
+	 * Send a number of bytes exactly the declared size of the report, report ID
+	 * included. Sizes differ between devices: most ROG keyboards declare
+	 * 64 bytes and the XG Mobile 300, while the Zenbook Duo keyboards, like
+	 * the touchpads, declare 16 for report 0x5a, the size of the handshake,
+	 * and do not answer the 64 byte writes sized for the ROG keyboards.
+	 */
+	u8 *dmabuf __free(kfree) = kzalloc(hw_len, GFP_KERNEL);
+	if (!dmabuf)
+		return -ENOMEM;
+
+	memcpy(dmabuf, buf, buf_size);
+
+	/* The device may be runtime suspended, e.g. for a deferred backlight change */
+	ret = hid_hw_power(hdev, PM_HINT_FULLON);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * The report ID should be set from the incoming buffer due to LED and
+	 * key interfaces having different pages. Short payloads are zero-padded
+	 * to the exact report size the hardware expects for this report ID.
+	 */
+	ret = hid_hw_raw_request(hdev, buf[0], dmabuf, hw_len, HID_FEATURE_REPORT,
+				 HID_REQ_SET_REPORT);
+	hid_hw_power(hdev, PM_HINT_NORMAL);
+	return ret;
+}
+
+/**
+ * asus_kbd_get_report() - Read a report sized from the descriptor
+ * @hdev: HID device
+ * @report_id: report ID to read
+ * @buf: buffer to store the report in
+ * @buf_size: size of @buf
+ *
+ * The transfer is performed at the exact report size the device declares
+ * for @report_id. The device may answer with a short read, and only the
+ * bytes that fit in @buf are copied into it.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int asus_kbd_get_report(struct hid_device *hdev, u8 report_id,
+			       u8 *buf, size_t buf_size)
+{
+	size_t hw_len = asus_report_len(hdev, report_id);
+	int ret;
+
+	if (!hw_len)
+		return -EINVAL;
+
+	u8 *dmabuf __free(kfree) = kzalloc(hw_len, GFP_KERNEL);
+	if (!dmabuf)
+		return -ENOMEM;
+
+	ret = hid_hw_raw_request(hdev, report_id, dmabuf, hw_len,
+				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
+	if (ret < 0)
+		return ret;
+
+	/* The device may return less than requested (short read). */
+	memcpy(buf, dmabuf, min(buf_size, hw_len));
+
+	return 0;
+}
+
 static int asus_report_battery(struct asus_drvdata *, u8 *, int);
 
 static const struct asus_touchpad_info asus_i2c_tp = {
@@ -628,122 +744,6 @@ static int asus_raw_event(struct hid_device *hdev,
 	return 0;
 }
 
-/**
- * asus_find_report() - Find a report of the given type by its ID
- * @hdev: HID device
- * @type: report type (HID_INPUT_REPORT, HID_OUTPUT_REPORT or
- * HID_FEATURE_REPORT)
- * @report_id: report ID to look for
- *
- * Return: the report with the given ID, or NULL if the device does not
- * declare such a report.
- */
-static struct hid_report *asus_find_report(struct hid_device *hdev,
-					   unsigned int type, u8 report_id)
-{
-	return hdev->report_enum[type].report_id_hash[report_id];
-}
-
-/**
- * asus_report_len() - Length of a feature report for the device
- * @hdev: HID device
- * @report_id: report ID of the feature report
- *
- * The same ASUS report ID can have different sizes depending on the device:
- * report 0x5E is a 64-byte report on laptops but a 300-byte report on XG
- * Mobile stations. Always size transfers from the report descriptor of the
- * device at hand instead of hardcoding lengths.
- *
- * Return: the length of the feature report in bytes, or 0 if the device
- * does not declare the report.
- */
-static size_t asus_report_len(struct hid_device *hdev, u8 report_id)
-{
-	struct hid_report *report;
-
-	report = asus_find_report(hdev, HID_FEATURE_REPORT, report_id);
-
-	return report ? hid_report_len(report) : 0;
-}
-
-static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t buf_size)
-{
-	const size_t hw_len = asus_report_len(hdev, buf[0]);
-	int ret;
-
-	if (!buf || !buf_size)
-		return -EINVAL;
-
-	/* The payload (including the report ID) must fit the device report. */
-	if (!hw_len || buf_size > hw_len)
-		return -EINVAL;
-
-	/*
-	 * Send a number of bytes exactly the declared size of the report, report ID
-	 * included. Sizes differ between devices: most ROG keyboards declare
-	 * 64 bytes and the XG Mobile 300, while the Zenbook Duo keyboards, like
-	 * the touchpads, declare 16 for report 0x5a, the size of the handshake,
-	 * and do not answer the 64 byte writes sized for the ROG keyboards.
-	 */
-	u8 *dmabuf __free(kfree) = kzalloc(hw_len, GFP_KERNEL);
-	if (!dmabuf)
-		return -ENOMEM;
-
-	memcpy(dmabuf, buf, buf_size);
-
-	/* The device may be runtime suspended, e.g. for a deferred backlight change */
-	ret = hid_hw_power(hdev, PM_HINT_FULLON);
-	if (ret < 0)
-		return ret;
-
-	/*
-	 * The report ID should be set from the incoming buffer due to LED and
-	 * key interfaces having different pages. Short payloads are zero-padded
-	 * to the exact report size the hardware expects for this report ID.
-	 */
-	ret = hid_hw_raw_request(hdev, buf[0], dmabuf, hw_len, HID_FEATURE_REPORT,
-				 HID_REQ_SET_REPORT);
-	hid_hw_power(hdev, PM_HINT_NORMAL);
-	return ret;
-}
-
-/**
- * asus_kbd_get_report() - Read a report sized from the descriptor
- * @hdev: HID device
- * @report_id: report ID to read
- * @buf: buffer to store the report in
- * @buf_size: size of @buf
- *
- * The transfer is performed at the exact report size the device declares
- * for @report_id. The device may answer with a short read, and only the
- * bytes that fit in @buf are copied into it.
- *
- * Return: 0 on success, negative errno on failure.
- */
-static int asus_kbd_get_report(struct hid_device *hdev, u8 report_id,
-			       u8 *buf, size_t buf_size)
-{
-	size_t hw_len = asus_report_len(hdev, report_id);
-	int ret;
-
-	if (!hw_len)
-		return -EINVAL;
-
-	u8 *dmabuf __free(kfree) = kzalloc(hw_len, GFP_KERNEL);
-	if (!dmabuf)
-		return -ENOMEM;
-
-	ret = hid_hw_raw_request(hdev, report_id, dmabuf, hw_len,
-				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
-	if (ret < 0)
-		return ret;
-
-	/* The device may return less than requested (short read). */
-	memcpy(buf, dmabuf, min(buf_size, hw_len));
-
-	return 0;
-}
-
 static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
 {
 	/*
-- 
2.47.3

