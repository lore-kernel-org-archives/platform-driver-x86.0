Received: from e3i429.smtp2go.com (e3i429.smtp2go.com [158.120.85.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430F343CED8
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 12:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772281638; cv=none; b=dzMpBr4pafhVVurskvFZ5Q6wAYTc6AAfwGRdOiOJrZ0+mTviPjzdpjmEOF6FRQX2Iln/FodfiMHTVSRfkvMJES7NjXMdWW9E7ypIdqMMmEhLJjw2MDoaD/J5XcsZMhCK+WEUeLlc5BEi5YCI/M7neoI1PmcuuKZ3JUuxFpgcne0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772281638; c=relaxed/simple;
	bh=TecPAR4YTGMv/LGbDhHsbGkxBRP7y++fgAWgPj54lbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLGatNOj9TDUQ7DdjVh/ModxyyRlfYqBQLRWCpZ6i99S8m6elH6gll/OrwUoVKGnfkxSkyf3lI8Nx52dbXfaGsWcjiGoaEKR7IuvLH3sng4D/W8EXMYt0ZgM9kiebL3iGGyHW3ayyjmiIdDcWtdyGOb9XN9un6asvmK65xzN5+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=VKexVFMq; arc=none smtp.client-ip=158.120.85.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="VKexVFMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1772281633; h=from : subject :
 to : message-id : date;
 bh=ur6MsWU6ulXxbpBctPcAzZ/4BXy99UC+DF9Kus3rU/g=;
 b=VKexVFMq1Ta1tDF6gGP/EsZ7J0AzgrjEvwls0x/onIryEZihCh172RY8xGKv80jgd70nY
 z+enqjpp21aCjWDUZ6ucbAt0F+VPpw159f5YDs9GLP4eLlPs1+dJh4jydDJpIUOX7kWWE7X
 QyLrSJmV3O26LNwz+vRELNVRHOSyCbNHrUfspkF4Rv7VYGtcezMhOI/414ZdSVCryUU/vrp
 YQrD2/N0IbGMi4ZcCmRiD90J3Aat7ABRsMWd+PPmpKZfiSKxUPbTLBvzKqljEDJInSm3U9i
 qu36BU8vbiIs82WX2WJdxPWrOfShVWqE092Lq1xm/4j6TfOi9RHeGJ/91hxw==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.99.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1vwJPX-FnQW0hPt7wX-fLch;
	Sat, 28 Feb 2026 12:27:08 +0000
From: edip@medip.dev
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	kuba@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>
Subject: [PATCH v3 2/2] platform/x86: hp-wmi: Add missing LED Kconfig dependencies
Date: Sat, 28 Feb 2026 15:21:45 +0300
Message-ID: <20260228122143.119571-4-edip@medip.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228122143.119571-2-edip@medip.dev>
References: <20260228122143.119571-2-edip@medip.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sG5xfRxR-E
X-smtpcorp-track: CwqdYkMgeX3P.RB8RtiVqcNJm.jYCeVgiBK3G

From: Edip Hazuri <edip@medip.dev>

Add depends on LEDS_CLASS and LEDS_CLASS_MULTICOLOR for the
multicolor keyboard backlight support.

Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 drivers/platform/x86/hp/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/hp/Kconfig b/drivers/platform/x86/hp/Kconfig
index dd51491b9bcd..02668ebc3020 100644
--- a/drivers/platform/x86/hp/Kconfig
+++ b/drivers/platform/x86/hp/Kconfig
@@ -40,6 +40,8 @@ config HP_WMI
 	depends on ACPI_EC
 	depends on ACPI_WMI
 	depends on INPUT
+	depends on LEDS_CLASS
+	depends on LEDS_CLASS_MULTICOLOR
 	depends on RFKILL || RFKILL = n
 	select POWER_SUPPLY
 	select INPUT_SPARSEKMAP
-- 
2.53.0

