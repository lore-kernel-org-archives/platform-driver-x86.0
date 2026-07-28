Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6C43302F;
	Tue, 28 Jul 2026 12:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241673; cv=none; b=GYhmzJSN6kCcjTggMni1lQLBu5vtVVtHVdZFcRDzOl6Hgc8osJwPv2hEfFWI0v5vavFGAvynumSDSYm88lTWC6Ni5uWKCU9BZbrZkCFP59epJ8Ko0Et8ssShbDKXdRSO3h0BLD6z7We7uoGtZ8GTsS1drki7mcKETLG98GetDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241673; c=relaxed/simple;
	bh=IlQJbmODu8OTLKM6Ck2yIbU0aWiMbF5LLi5vPDqOLS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3I+5Q1VuZrGNay9mlorddye7LT6uOCnNawvzV3rt3Ufvb31Sj9wUa4ePiUXjTdpq2cwxlnAGhgSlgGD8V3afisP9VSS6mKVAm98YQL7d+csC8Zj9uj1hr5cRmU2SPchkQQwXRDe8tWHGfxUchjnPd8hrWT/e0X22gYhT4kBLJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=kz2tc5vu; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="kz2tc5vu"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id A24AE2FC007A;
	Tue, 28 Jul 2026 14:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785241664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fohmdc0x4oM0juNqlZC+l7JsMiiLTluDsf2v2gmbKts=;
	b=kz2tc5vuX0hWsQcf/IBZzdvofJXU8Yi0Z/AiOFfPq0G3cJJc3CSVwPFkJV3cCR+eF+fQbo
	JIjs0nb89srdr43OrGLKXmQSx3WTMdqegCNQgDXov4iGd9cfJyBU/WNuRSyTytXMHXS52D
	maQEUOs0L7QFRCqLgcb0AjT6/2GFBmc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/6] platform/x86/tuxedo: Set HID report ID on success
Date: Tue, 28 Jul 2026 14:26:34 +0200
Message-ID: <20260728122647.132540-3-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728122647.132540-1-aer@tuxedocomputers.com>
References: <20260728122647.132540-1-aer@tuxedocomputers.com>
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

