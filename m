Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442745;
	b=2xhyEgMeub+uuzYZ6JWyJPfZiTBOTpVu6Q9S7F1E5RpOUT/T5uNW0W5L1ySgsA0xKOWb
	 TaCiQbV0tyc1vwe8MIMdOUemrhUycASMwmhEBtJToY5Jw9swizjYH++PWAS0OsxBcJUmO
	 FlcNquVz9Fnp5xCyUZADL6+jys5skipasBkjPPaPV8Fb9Qneu6iRPH7s5YOs43yj2c42s
	 ZkDwEOSLK8BAAHcppOJ5bl2wVLrrrfVVOT625fbZEmdXyja3xdAq0KXZ7e7JEbyeZp/KK
	 Tw6pkDQBJT8+l16sks0UDKItcyVO9wPazSIFJI2G53xBGky/pk5JpkU6c5FtUTFmrSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442745;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=cwp+Lcsy6Zsi8JyfFm3sAAth81i45T++9rhKgYespsw=;
	b=iyZ6L7Uc21jy/71GH0XdHbM3ypheSFHF8qz7Bx8aBkDLnOFbEKIixG7tIDqJSmJHz6Rr
	 sWaf+S8PmZoxla7z10x6Cv+8jzKSO6XqiOjuy7zbT90XZfb9QUdfR4xvuAWcuWbmifp32
	 bkN+sZ0HsFN9YzE+gDL8m5h05265n4wWn78UQZVPNZxeqptDLt1+a7Melu8NGrzWaU0CJ
	 5+lf0HyzPZsSNVRhRB801Y3uzU6wZJmomsaqKkP70cCFycWbcwF/PCyxxDrmyLL3BXdRm
	 ls5q4SOQC/pOdCNsVl2cHMbZ5VgBuT0A/LWPc5GRropq6k+W/Z0GmSMuB7ibw9dh70w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=Jk3HQata;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D63606A31F;
	Mon, 23 Nov 2026 14:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6D63606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=Jk3HQata
Received: from [127.0.1.1] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 8B8E42FC004A;
	Mon, 23 Nov 2026 15:05:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1795442742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cwp+Lcsy6Zsi8JyfFm3sAAth81i45T++9rhKgYespsw=;
	b=Jk3HQataaU4L2APWM0aqqQkKU9OmdS5bKb7/BPf72tRZzSuPvi2WNK2Gxa6u1sAJEiO49q
	3LBeX43D58OVdP2PEcGDNTMJs2CBHzMvDXd+9nyC4bzpG9B2401fh3NJlh34xe+fivTQb7
	V5VvJaLt34bmojuKB50gctPcOMLDVGc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
Date: Mon, 23 Nov 2026 15:05:10 +0100
Subject: [PATCH v2] platform/x86/tuxedo: Handle LampUpdateFlags in
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
Message-Id: <20261123-nb04-fixes-v2-1-973e569381ba@tuxedocomputers.com>
X-B4-Tracking: v=1; b=H4sIABVIBGsC/01Py3KDMAz8FcbnGmMgHuDU/+jk4IcCbsFQy2boZ
 Pj3GMihN612tat9EgRvAUmXPYmH1aKdXQLlR0b0IF0P1JqESVmUghdlQ50qavqwGyAV5makEm3
 TSknSweLhJJL+635hjOobdDgc3goPvzGlhEtGlESgwQN02RDCgh1jvQ35D3gHYz77ni1RMdQTG
 62LG7uIQ8PC7Fc5GryYPK2ySWIAfySdvnqeJhu6THMhFOi2qitNjs8Gi+n672y98vORd8H2f8G
 VU04Fr41sKmVE8fgMcQMzJ98lpiDM00Tu+76/AF4SFZRIAQAA
X-Change-ID: 20261028-nb04-fixes-6d5dab6989aa
To: Werner Sembach <wse@tuxedocomputers.com>, 
 Aaron Erhardt <aer@tuxedocomputers.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
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
Changes in v2:
- Fix formatting
---
Tested userspace software:
- OpenRGB (aac7e55114)
- lampctl (https://github.com/tuxedo-aer/lampctl 5da2aff)
---
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
index 5c56c6b1a85e..5bb9f992f6e3 100644
--- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
@@ -723,8 +723,7 @@ static int handle_lamp_range_update_report(struct hid_device *hdev,
 			    LAMP_MULTI_UPDATE_REPORT_LAMP_COUNT_MAX);
 		lamp_multi_update_report.lamp_update_flags =
 			i + LAMP_MULTI_UPDATE_REPORT_LAMP_COUNT_MAX >=
-			rep->lamp_id_end + 1 ?
-				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE : 0;
+			rep->lamp_id_end + 1 ? rep->lamp_update_flags : 0;
 
 		for (unsigned int j = 0; j < lamp_multi_update_report.lamp_count; ++j) {
 			lamp_multi_update_report.lamp_id[j] = i + j;

---
base-commit: c166bec9343c8b50e4c2acb78b1424c23d98841f
change-id: 20261028-nb04-fixes-6d5dab6989aa

Best regards,
--  
Aaron Erhardt <aer@tuxedocomputers.com>

