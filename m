Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E94825B0;
	Mon, 28 Sep 2026 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585718; cv=none; b=qhTzftG8aVnnEKIGZssC5SOMhK2pL0C51FAznkvYNmlb5kFCPG36sYHocjt8GkreZjMyuhAIs7raAnL3BbZPetzgxchw0m2SmJhPWNDYBDswa+Gb4y3+aRZCHb5Py+v3fsZtbTAbdfEKEQ+rVBEXm4mTdA0pATpmIVAbmq8vTss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585718; c=relaxed/simple;
	bh=IlQJbmODu8OTLKM6Ck2yIbU0aWiMbF5LLi5vPDqOLS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hguYCeXqiW1nMrexK33IlBNfLaidesmkqBenILRm9DyP7nQ+D0LjBpzOLVwb+pAgkTgk7HE4pCxyA9puFBPzA2hm6BsAsSOYNU8Kxw2AygGU5NNPo2OtOqYMdv+8d6dD5KCCXZB6vd2ZYlCcT4wHsI9OUM8uq2tvc5YbSuUF7nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=nIh1Z6/D; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="nIh1Z6/D"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 039772FC0064;
	Mon, 28 Sep 2026 10:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1790585707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fohmdc0x4oM0juNqlZC+l7JsMiiLTluDsf2v2gmbKts=;
	b=nIh1Z6/Ds27EznHcvWC7p45mWgCF4JdhTqdveUKRkGJH2YwyJtkGEoXdGCngFzv/6D8QTo
	xmv7Omhairz9XDTCRtRarjT1vX2ESETUfzSfyCMzoEK4UDBCMiFkja0cl+blCyTNBHQ4/O
	8Ce1cPbdFt/eA2m92wJ4mlolVneS36A=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] platform/x86/tuxedo: Set HID report ID on success
Date: Mon, 28 Sep 2026 10:36:27 +0200
Message-ID: <20260928085448.9024-3-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928085448.9024-1-aer@tuxedocomputers.com>
References: <20260928085448.9024-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While not strictly necessary due to the synchronous handling of HID
requests, it is better to set the ID of the HID report before
returning the buffer. This also better complies with the HID spec and
avoids problems with userspace tools expecting a report ID.

Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 26 +++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
index 72205de72256..11babc7c7767 100644
--- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
@@ -766,6 +766,8 @@ static int handle_lamp_array_control_report(struct hid_device *hdev __always_unu
 static int tux_ll_raw_request(struct hid_device *hdev, u8 reportnum, u8 *buf,
 			      size_t len, unsigned char rtype, int reqtype)
 {
+	int ret = -EINVAL;
+
 	if (rtype != HID_FEATURE_REPORT)
 		return -EINVAL;
 
@@ -775,13 +777,15 @@ static int tux_ll_raw_request(struct hid_device *hdev, u8 reportnum, u8 *buf,
 		case LAMP_ARRAY_ATTRIBUTES_REPORT_ID:
 			if (len != sizeof(struct lamp_array_attributes_report_t))
 				return -EINVAL;
-			return handle_lamp_array_attributes_report(hdev,
+			ret = handle_lamp_array_attributes_report(hdev,
 				(struct lamp_array_attributes_report_t *)buf);
+			break;
 		case LAMP_ATTRIBUTES_RESPONSE_REPORT_ID:
 			if (len != sizeof(struct lamp_attributes_response_report_t))
 				return -EINVAL;
-			return handle_lamp_attributes_response_report(hdev,
+			ret = handle_lamp_attributes_response_report(hdev,
 				(struct lamp_attributes_response_report_t *)buf);
+			break;
 		}
 		break;
 	case HID_REQ_SET_REPORT:
@@ -789,28 +793,36 @@ static int tux_ll_raw_request(struct hid_device *hdev, u8 reportnum, u8 *buf,
 		case LAMP_ATTRIBUTES_REQUEST_REPORT_ID:
 			if (len != sizeof(struct lamp_attributes_request_report_t))
 				return -EINVAL;
-			return handle_lamp_attributes_request_report(hdev,
+			ret = handle_lamp_attributes_request_report(hdev,
 				(struct lamp_attributes_request_report_t *)buf);
+			break;
 		case LAMP_MULTI_UPDATE_REPORT_ID:
 			if (len != sizeof(struct lamp_multi_update_report_t))
 				return -EINVAL;
-			return handle_lamp_multi_update_report(hdev,
+			ret = handle_lamp_multi_update_report(hdev,
 				(struct lamp_multi_update_report_t *)buf);
+			break;
 		case LAMP_RANGE_UPDATE_REPORT_ID:
 			if (len != sizeof(struct lamp_range_update_report_t))
 				return -EINVAL;
-			return handle_lamp_range_update_report(hdev,
+			ret = handle_lamp_range_update_report(hdev,
 				(struct lamp_range_update_report_t *)buf);
+			break;
 		case LAMP_ARRAY_CONTROL_REPORT_ID:
 			if (len != sizeof(struct lamp_array_control_report_t))
 				return -EINVAL;
-			return handle_lamp_array_control_report(hdev,
+			ret = handle_lamp_array_control_report(hdev,
 				(struct lamp_array_control_report_t *)buf);
+			break;
 		}
 		break;
 	}
 
-	return -EINVAL;
+	/* Set report number on success */
+	if (ret > 0)
+		buf[0] = reportnum;
+
+	return ret;
 }
 
 static const struct hid_ll_driver tux_ll_driver = {
-- 
2.43.0

