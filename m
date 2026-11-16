Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.21.23.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822359;
	b=rwZk0o7GRUWJJymCKDKRxNRuDouA7D2WWFRNMzxligrESWtszmuk34tnU6KuBzPELG37
	 NqlGB+wJ4sOR7KkMqw3Xt4JG0opCCtaZxqIBC0i1ffbcut7fCeN85nnrIhJa/kwyEb9F6
	 u0OeJvK6b4Vwg1NjYY4u0h93744BRDCxMiIgAzuort6q1Vk2U5/xYWGidaz74zxKqP2Yc
	 gwrJMZhXDt96oastqERZ424+tVlEnXn8QQsPNyVOPj3CjQ5ii77skNR6R+dsC/YStGxv/
	 SkrIjJ9mCKpGMWISSIqnUbBTBSwemEfZsiyjaevfRDNbZvwEl9Sz+HICoK+P+jD+k2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822359;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:From:
	 To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=3+xZN0bsWJJibhUekk/X1lX5iT54cP4tOjvN77b9l7U=;
	b=gS1OWfebi/fgQTfzLTHjngIedB4d/lQkSGotF7iP8DJLBTDUa9wyR5ZvmGC0wUJT0yq1
	 ppVstFbk7URE/YRrqyz004myLZfx4f9k0S9skj96yNeEJh/QGwkJjqH24NGu1SRMRRuG+
	 si0ZvER0WTeXS7nfOo2vRyN9qOmfoub74ceAVzB1QJV1jywcFuP2osILaoiHc6u+le304
	 WCO0Maf2slahkfJJ8ByPaKNy1A3+DI7JcitMkFoY5DYYfaNIRgoGOrF6WHK1eEF3Aa8Vi
	 ukuZ9SYpgjp0u3l7gBOvJkecMq/l/IeSdK2lVbYWFKYSX61ZxzSTDXSyYfr1a36D1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=disroot.org;
	spf=pass smtp.mailfrom=disroot.org;
	dkim=pass header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Zkn4WLF2;
	arc=none smtp.remote-ip=178.21.23.139
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD6606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 09:45:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9FD6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=Zkn4WLF2
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6932480098;
	Mon, 16 Nov 2026 10:45:50 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnAHj2V7yLhG; Mon, 16 Nov 2026 10:45:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1794822349; bh=5TEGFCt+4M86wBKY0Eg61fjOLNMx4cZXIl2gjyKAvqg=;
	h=From:To:Cc:Subject:Date;
	b=Zkn4WLF2noXYX/5gxWIL8qc4CHp34fsr6JgUrQ3lZ07WNsVZML/XBEJY2aE/DwBQg
	 R3NC3xVhHF0LHJz9+TZU6otZfxf1kAkoK9ngbXl1Or/XKH7SD6FTOl8Z7dzHR1e42D
	 8lKLMGY1PGWWlmu5xf9/xgu8zlpkAhbY3rFs9ylIp4E7y1xO4bd25Fa2SpsztMd1T5
	 zNvOjzRJtoYzAGGsZaUCpW3sPSzvGV6l5RNvtGhKBDHSWrCcp54grlasTZvJJVX7d3
	 qsaSWxFgc9czXTZOEdz2g+jNFMav4Aw8V4OkrPCIfZDZQ38NvYOyWsl/sHhXHcfHA9
	 yn11rH4X0U53w==
From: Anton Karmanov <bergentroll+git@disroot.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Anton Karmanov <bergentroll@disroot.org>
Subject: [PATCH] platform/x86/intel/int3472: Add MSI Prestige 16 AI+ MercedesAMG to board_data_table
Date: Mon, 16 Nov 2026 15:15:45 +0530
Message-ID: <20261116094545.78283-1-bergentroll+git@disroot.org>
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

From: Anton Karmanov <bergentroll@disroot.org>

The branded MSI Prestige 16 AI+ MercedesAMG B2VMG seems identical to the
presented base Evo model, but reports a distinct DMI product name
string.

Add a DMI table entry for this model pointing to the existing board data
so that the camera sensor (ov5675) successfully initializes instead of
failing with -ENODEV.
---
 drivers/platform/x86/intel/int3472/tps68470_board_data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index 90094732e55..796020467c2 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -670,6 +670,14 @@ static const struct dmi_system_id int3472_tps68470_board_data_table[] = {
 		},
 		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Prestige 16 AI+ MercedesAMG B2VMG"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "MS-15A3"),
+		},
+		.driver_data = (void *)&msi_prestige_ai_evo_tps68470_board_data,
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-- 
2.56.1

