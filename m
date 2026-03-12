Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD2E38B132
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773350698; cv=none; b=YrKx796ZjiS1BZXY0PeMem/jdrF6sCK6uNg22RJDur5T8RIrTKo2+aPPt/JKaZ2MsK5qEAdHi1ivaB/UkiW3/RbdEPY3LiCgFg7stmjBWT+P26Tohpjue/Rv2TXPNUCnz766IcmFVKCrx0R7Cc4ejsFPdnBmkbqFQPGhB+8CJeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773350698; c=relaxed/simple;
	bh=etoSAVeC4+FfGUCh9hbQJEOFAq1ZaQsXbWntHgwFXPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkfR0xkaq8zyv6agZIhVw2DOd2dJLSHY6Oh62r03923tXv69n1ldQJer6BDhgQ08Bces4vXhj0qyUriQc3Z78QLOxVydpcVh2Sr6+Z1seijc1BCVyEa47sw7W6KRnXjKjj/gmgHVEy8uym+I1kxFWOZrn1U37b3tT2BSDcXDNf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LcWfTt0E; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LcWfTt0E"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773350694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E/WK0PqxZWoPri8rdv9a8+9gC38bPj0ETkUmXtODS2E=;
	b=LcWfTt0E276Sfz2XsU+fUzHcYytm/bfVcBp1AHRVHeWi11JoZ7LKjImCJ43TSc0ZnUaqpk
	kZNlX2rPISBUKqG098cgGx70Qc6HfYkPQio1zBELGoYNo/kf8L3gpSTIOdp3VUh6UZ8w8i
	+sQGekeWxDnJMQiBOTPJDp9I41qqto4=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH] platform/x86: asus-nb-wmi: add DMI quirk for ASUS ROG Flow Z13-KJP GZ302EAC
Date: Thu, 12 Mar 2026 14:22:46 -0700
Message-ID: <20260312212246.1608080-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The ASUS ROG Flow Z13-KJP GZ302EAC model uses sys_vendor name ASUS
rather than ASUSTeK COMPUTER INC., but it needs the same folio quirk as
the other ROG Flow Z13. To keep things simple, just match on sys_vendor
ASUS since it covers both.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/platform/x86/asus-nb-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index a38a65f5c550d..b4677c5bba5b4 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -548,7 +548,7 @@ static const struct dmi_system_id asus_quirks[] = {
 		.callback = dmi_matched,
 		.ident = "ASUS ROG Z13",
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "ROG Flow Z13"),
 		},
 		.driver_data = &quirk_asus_z13,
-- 
2.53.0

