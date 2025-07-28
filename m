Received: from e3i331.smtp2go.com (e3i331.smtp2go.com [158.120.85.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FB021D3F0
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jul 2025 12:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753704996; cv=none; b=lYnwWDyxtAbQl8owQb+TBte75e3zJ7dQ9j4BSHl1W305I4+wl7+peHLAnqKolfmHyFA3CWzq0Ki3V6vQnkENLaPXna/lkSwWsXiQRbyVE8tJvboKqEaMrUUFZSQkz+eHG1622C1S8pMV7i0rwdWuXRexqS18AZD9bsNOibdHwaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753704996; c=relaxed/simple;
	bh=tR+gAlw+VJAUzlovBMweuxJ79ao2tYMAXcwuJPh6fPc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQTHWiDM/xy74EZFZGJ4Z9bdXlEvjWLv/u9SfgMucObPNjeKZrwqznwyU2D0yiYcpQVGY+qLw6pDbJUMwU3BMLu/JVbvMm95uMin0N54rAffwdi4pRA1dykm9Gi4AWRX+a7REsBW/6NbWNsoTrCHeWqLoFpmlNQYEmNJLPNXdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=sgmyO17S; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=WKnym41s; arc=none smtp.client-ip=158.120.85.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="sgmyO17S";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="WKnym41s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1753704083; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=HNCycqxR4SKAW4zRi3B5y0ggYK/ajf+aV8k0WOQ1SAA=;
 b=sgmyO17Sia6ovMTXQfhBVl8qSogLDxKf+0co3PJyxGSQiUA1xZZfSgbGVgmp3hGmjwSFT
 JzZCsMbIDaPA3AN/S+bqwSOd/Eli7qQ73VP38IPlwDc+I+ySEGjpp2Gfg8BWqFn+oNCiYbj
 l2nqIiNmhNTPNj9XtWhAPKnXAW0mZ1cftOjOl7bykr1c8tc3F5QYzcrNf55SLZzv6cBeE0w
 71be4eYaW+ctAi3mULgVuxKy4pwc9tw+VBn6YRuyB+KTLmHIAXgCKtecnj5hjNr1dJhYtYw
 PJBIx/DzD9uBKNlIkaGf8wbqgX0VDvALrGJks9gYA7TFdFJ0lhOJ/b7pw34g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1753704083; h=from : subject :
 to : message-id : date;
 bh=HNCycqxR4SKAW4zRi3B5y0ggYK/ajf+aV8k0WOQ1SAA=;
 b=WKnym41see3+qHAqSttaeKKgtABhaAMiY8BJqO7jQgbGGWJfxMZvgzU/LxJPQuz6cyCN2
 ERV/dUOXg49wtw5UxqQnEKO1zrR7PyiLAq+zb8AsW0EGyOJW+Zbu4O2vxlcKUBHKJJ9kG2Z
 ZHrcMnn9v4lzdFGJFBqhtrI28Id9zG1KW4jRX70wKoX8KrBZVonVyPLytRuf+idJGWvtdWr
 7DAXLdsTur5OdKgn9Npxca8VsigRsX54tUMmb3OE9CU1rG5SOJWSYyfWKygrIzqEGOdwl07
 aKbfy3cokG4+4Gvr51Htq1FotcxwmXh31vwhUmTdpfhGNbksIdNdsFf2hsiA==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1ugMXd-4o5NDgru1PL-gCdw;
	Mon, 28 Jul 2025 12:01:17 +0000
From: edip@medip.dev
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>
Subject: [PATCH] platform/x86: hp-wmi: mark Victus 16-r1xxx for victus_s fan and thermal profile support
Date: Mon, 28 Jul 2025 14:58:06 +0300
Message-ID: <20250728115805.20954-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854splFv8-g8x
X-smtpcorp-track: 4uGWjJDIXyvG.-YJX5WmhA4_S.7zOlYwWaNS3

From: Edip Hazuri <edip@medip.dev>

This patch adds Victus 16-r1xxx laptop DMI board name into existing
list.
Tested on 16-r1077nt and works without any problem.

Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index db5fdee21..60c8ac8d9 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -92,9 +92,9 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
-/* DMI Board names of Victus 16-s1000 laptops */
+/* DMI Board names of Victus 16-r1000 and Victus 16-s1000 laptops */
 static const char * const victus_s_thermal_profile_boards[] = {
-	"8C9C"
+	"8C99", "8C9C"
 };
 
 enum hp_wmi_radio {
-- 
2.50.1

