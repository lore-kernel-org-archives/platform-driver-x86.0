Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.16.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706118;
	b=uOpXxaa4Epf+b46kYOXOC1qNkOb4cqI+HOKneVCOUKoaZqOJA7+PHcg6lvV0c14UpbqY
	 Pxg8gPzsju5c586WlDgAdBxvdAeSgkWEG+8eWdsBypOuj2+p20/cnFRF8yCxXPt9toC1+
	 QDNJqVEMWWxTPnFcYfxneFOhI05h27MWNNIWmULEjYT/yV+En5ZjOfyOTgTtmzMF7DaHa
	 2nhbUGX8rRKT6IFMh9aHavxHtGS9Iwnm09tABesDhGAkztobjITHkN/FVBqM6BbzrDsys
	 6TCM2zCxx0Z7tL+oD+fUBcQEsHhYXfuwQRELnp9VlVGm7MRaCLMA5R6YnNOE9V28PNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706118;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=KVVW7TPyhjGJAPwl+tjBBq7ztzXtRILV0pdDvXyoSsw=;
	b=lw9uis1FUqh3I5sZ2oSkiQycuu3BVwZmsO0zzjQKIc2wH2fKsFAMf2GbxQsMvMhxQ8A5
	 n8UUu6FsnO5KWNlSHTHSoA7kBQACzqlriYK05TkHZun7l1eDx01YSlbQ9fpRJBcUIdzwA
	 HljDBp4q3gDU7oiU0gum7m7XWdq1kwpNud0A6COrVDCHqbm0vLsUxjqxHDZzxvpyXUmmW
	 /3r+hSiCJpthzeFeN3aBzJRM8asGKjC8mfhzW4Ly6U5grmPD5f8ww8P0w/skkrPnc8Ed+
	 T2Wxlfaunv7UhK+1MgsEVY98MMbpLHkISyipZ1y/uHbq10pDc0S755OEj4pydRhs5lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smail.nju.edu.cn;
	spf=pass smtp.mailfrom=smail.nju.edu.cn;
	dkim=pass header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=3GAcGtaN;
	arc=none smtp.remote-ip=54.206.16.166
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7366082BF5;
	Tue,  3 Nov 2026 11:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D7366082BF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=3GAcGtaN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1793706094;
	bh=KVVW7TPyhjGJAPwl+tjBBq7ztzXtRILV0pdDvXyoSsw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=3GAcGtaNpJdfn3MRUJv6MGuSb1j7qf+uEr3YEYKeN5mN4MhVDDBX7EXr44nPAGcwf
	 fiJgbBKRMyI7zmDYCJ7oM8aed3FGskoBcrBHKyPQdwK2tMao5pjhI2cHBde9Ts5V3n
	 PDr3exfsBZMHfBXgA4/4kyKpBo/Kvb531mPSVANM=
X-QQ-mid: zesmtpip3t1793706092tc9853fb8
X-QQ-Originating-IP: foAq5r9/O7XKCss9j919Q9DYLIpM1JP+QVY8CprYUU0=
Received: from workstation-Precision-7920-Towe ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 19:41:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3758075859219802919
From: Kang Chen <k.chen@smail.nju.edu.cn>
To: Matan Ziv-Av <matan@svgalib.org>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: lg-laptop: check WMBB buffer length
Date: Tue,  3 Nov 2026 19:41:30 +0800
Message-Id: <20261103114130.75260-1-k.chen@smail.nju.edu.cn>
X-Mailer: git-send-email 2.34.1
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
Feedback-ID: zesmtpip:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: N2dNga98lfCaS7p803k9tYYKAsRP5JNUKmECSkaFiSRtMixv0aL8bF4B
	zIn0IjzZi8K/iQfgUgh42zirx4frddQmJOimSh/Qcv/cY30kK9TuTaZ4S5JCogcywf51Po1
	fPaBuiVbqeAjIDaXS1mDscEZ1UG3Mw+7d4rdTRd7o7vCA/VKLBF2y84xR/5DY+aAkIBn6ug
	ByrdVcnQ2OvAG2PVpQRIls1QpwtKpFB1sYKnxzsFvZD++5CmPLTIEiy0ntO+D8YwfFLml6e
	Au4RYp/CSumbyVf8MCuRMEox1+uXNTUkk5v7Xi5uYb4jtOvhXy5Slc9uGcuY7oCRPAV1AzS
	2Cbke1BHMumn1VBrd9wkYBKVvj+nqgnhu5sYebkuTQ0kyidol6Z/F8zJcfsCmsdOFPcFfcy
	nIfXH6iqNKPjvmC+waFujaInY8GP7E3YDVzSY6WKKyTsV9kZx8Tm5YCVoku6jay3iRqiZly
	UHU7utUb78tFMG29vf19fIELlDOiJhF13Ly4sP9ZHFr1/qoRQ/7LBJJimW3CdLzHWx/XWGu
	JtFi0dn6MHXxTviYuRWOmriCRD11zmftic3Yyt/jXtISj/TGa5DAPbctNhLJkJRI2GFz/RZ
	mx6qR9VvjaQVdnRkrI6+MOgt0ToMs4LdBbDXBo/i0kLi3JAEs4rLVFO2/Qr4K3IXl4Jqp+y
	qRuemM8geMnUrbh1kh9dY1Knd7gsfhTZqJDObpCBdEdFqocH19+5MU5JihlsFp7D/WFdU5U
	EZ+dfQ3ECEVY44HTyD5sAlmZIohMocvEvgRq8W7v6cFhywzMoFqQs7LHb8RHXMw1Hw8e7iO
	CLeafElYGlE8rTAFryFDkw+2aVG+AuXhRdoq7GRnS+l0A74PYlIJ5CU5vCs4dIU5u3tDnBe
	63YZw528a3vQamOaJoYVYalrfK/55PQTgs0RaTeGTykzRiZkVoCUOnF+XWr18f0Xl5LnQY3
	9Hr9eHZeWZnYFmr4kdLhXrtj8sCPPcrFQ086UrTg8cmUv/iAOg0h6QTFEYyDC9hv3YWYMR6
	sj4YNVd1UWSaDugMWjPfHsyoG3r9cQc2TsrE7L7yYkT4kF6EbGblnduQ96cwg=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Two WMBB users read byte 0x10 of the returned buffer after checking only
the object type.  A short buffer from the firmware makes both
usb_charge_show() and charge_control_end_threshold_show() read past the
allocation.

Add a named offset and require the buffer to be long enough before
reading the status byte.

Fixes: dbf0c5a6b1f8 ("platform/x86: Add LG Gram laptop special features driver")
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
---
 drivers/platform/x86/lg-laptop.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 36ad1e269443..4e1dbd80ffa1 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -87,6 +87,7 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware debug messages");
 #define WM_FAN_MODE	0x33
 #define WMBB_USB_CHARGE 0x10B
 #define WMBB_BATT_LIMIT 0x10C
+#define WMBB_STATUS_OFFSET 0x10
 
 #define KBD_LED_BRIGHTNESS_MASK GENMASK(4, 0)
 #define KBD_LED_BRIGHTNESS_OFF	0x0
@@ -405,12 +406,13 @@ static ssize_t usb_charge_show(struct device *dev,
 	if (!r)
 		return -EIO;
 
-	if (r->type != ACPI_TYPE_BUFFER) {
+	if (r->type != ACPI_TYPE_BUFFER ||
+	    r->buffer.length <= WMBB_STATUS_OFFSET) {
 		kfree(r);
 		return -EIO;
 	}
 
-	status = !!r->buffer.pointer[0x10];
+	status = !!r->buffer.pointer[WMBB_STATUS_OFFSET];
 
 	kfree(r);
 
@@ -524,12 +526,13 @@ static ssize_t charge_control_end_threshold_show(struct device *device,
 		if (!r)
 			return -EIO;
 
-		if (r->type != ACPI_TYPE_BUFFER) {
+		if (r->type != ACPI_TYPE_BUFFER ||
+		    r->buffer.length <= WMBB_STATUS_OFFSET) {
 			kfree(r);
 			return -EIO;
 		}
 
-		status = r->buffer.pointer[0x10];
+		status = r->buffer.pointer[WMBB_STATUS_OFFSET];
 		kfree(r);
 	} else {
 		ret = lg_wmab_get(&pf_device->dev, WM_BATT_LIMIT, &status);
-- 
2.34.1

