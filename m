Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268748;
	b=KpGWAymPDXDeBW1u+yc/ALncEErw4oqi00wjuBZmMSGNSV/wCZesJmcHdil63q3e4Vgh
	 TQEg86F1mmm/pFjT/zXilzYHsnE0Ckc/kycJlXT7UffbMB/uJSne2pDiFhkYXIwTocCUx
	 YsYkpUDumvq7SvcLX9UIMj1r29zA9jMjq4ZnB+8SOR1d7buvRgsqS7Bs+u2gnBWylrpND
	 NmffsjjcLqQmq3bCbdxBscZy9CLfQU67TQw0LKgdgvigjBfp7y1JWfbNXfJ3vy6wudghL
	 IymjfZNbAGP6x9X7sEaX+AaPJ3ex5uCl3YJLLzSZEahI0TiT1ShmsMRMUZl1KIpGVLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268748;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=7aStgNueysf+zBhxSzPxBFCgGCYSRMy/ej1Gb+SJRo4=;
	b=lKUblqmY8+EnlLzVg1saDhTna70aY98TBYCUQ3h2MfjExdzOCyqQld06iTYodbHemvPc
	 eE1hLZboGzpQHmrimXlDfMipfqOSa090Pb7F6k2riuMBpcf+BnMtquZNu1qSuEdQrjzX0
	 1ZoSNRVCzQ2fY0nwi1yDCeyjilnFB9vxDuiaKlgnbaorC3Ink/LKhRrV3Nb9qqkSIJw/t
	 NbAX7vJm6YK/SdO7W9yE+OHRS2Cbs8vblZ+21+uYmir7Rv7HE6cuDdWGCyt9rlukhxfHf
	 2MhDnmRiC5s/WyTfmZKu/XouoJ28hvpnMonzADeh3HkDCrmBWwi5H/5sRhLE0/H7wRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=SetW6jE3;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89613606A31C;
	Thu, 29 Oct 2026 10:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89613606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=SetW6jE3
Received: from [127.0.1.1] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 741082FC005B;
	Thu, 29 Oct 2026 11:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1793268738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7aStgNueysf+zBhxSzPxBFCgGCYSRMy/ej1Gb+SJRo4=;
	b=SetW6jE3gjaa9BspuDZccxhLga/uxdpwtrxNJSPZoXNGEffnfPUjsild2YCT7pLMb4/B4y
	QZW9PuIBnL3kZThtj7DBgzrfvWFHxt44pWZ50gQMw8H/8dtWFyEWnbn9zCqXUv+i3B8Sxx
	6bCtfvhIKELCVjT0Qz014HRTgpOMCdg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
Date: Thu, 29 Oct 2026 11:11:51 +0100
Subject: [PATCH] platform/x86/tuxedo: Handle LampUpdateFlags in
 LampRangeUpdateReport
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-nb04-fixes-v1-1-614da83bd60f@tuxedocomputers.com>
X-B4-Tracking: v=1; b=H4sIAOYb42oC/y2Nyw6CMBBFf6Xp2lJeNsKvGBZtGbEKBWcGY2L8d
 4u4vHPO3PuWBBiAZCveEuEZKMwxheIgpL/aOIAKfcqyzEtT5OVJRZfX6hJeQMr0x94605waa2V
 6WBB+IPnnbs+0uht43hr+BsJjTSu8a9JZAsUI0Ior80Kt1kPg7A4YYcxmHPSyOk1+0mOI60vvY
 HM0z/i0Y087ydJJTJYYcFv69fp5mgK3whfGOPBNVVdedp/PF0lE7VX2AAAA
X-Change-ID: 20261028-nb04-fixes-6d5dab6989aa
To: Werner Sembach <wse@tuxedocomputers.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aaron Erhardt <aer@tuxedocomputers.com>
X-Mailer: b4 0.16.0

According to HID Usage Tables v1.7 "Lighting And Illumination Page", the
LampUpdateComplete flag marks an update report as the last of a batch. A
device must apply all prior changes at once when it receives a report
with this flag set.

The handler for LampMultiUpdateReport already honors LampUpdateFlags,
but the handler for LampRangeUpdateReport did not. It always set
LampUpdateComplete on the final chunk, so every range update flushed the
internal color state regardless of what the host requested. This reduced
efficiency and caused unwanted intermediate states for software that
batches updates using the flag.

While splitting the update into several LampMultiUpdateReports, forward
the flags from the range report on the final chunk. Intermediate chunks
continue to carry no flags.

Fixes: cfd84b3f419b ("platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices")
Cc: stable@vger.kernel.org
Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
Tested userspace software:
- OpenRGB (aac7e55114)
- lampctl (https://github.com/tuxedo-aer/lampctl 5da2aff)
---
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
index 3e5ba524fe58..300af12e5f8a 100644
--- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
@@ -724,7 +724,7 @@ static int handle_lamp_range_update_report(struct hid_device *hdev,
 		lamp_multi_update_report.lamp_update_flags =
 			i + LAMP_MULTI_UPDATE_REPORT_LAMP_COUNT_MAX >=
 			rep->lamp_id_end + 1 ?
-				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE : 0;
+				rep->lamp_update_flags : 0;
 
 		for (unsigned int j = 0; j < lamp_multi_update_report.lamp_count; ++j) {
 			lamp_multi_update_report.lamp_id[j] = i + j;

---
base-commit: c166bec9343c8b50e4c2acb78b1424c23d98841f
change-id: 20261028-nb04-fixes-6d5dab6989aa

Best regards,
--  
Aaron Erhardt <aer@tuxedocomputers.com>

