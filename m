Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E69E4D3BE7
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 14:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.172.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421533; cv=none; b=CRNIrMYxQGJ9B3E6u3wcMXMO6tW5BOwoXvf+BO6VrXS/fWGIqgCdJ074yIx/eUO1/8WbFUEtXhN+ClZkDcWi+mMK7okD/XEF/56f/0hyvxwGyDTibFLgNMdSh/0YLcinAfQpWPQhdO1sQIoT+9gfWNcdBZ1fhzwmPxQYvIkqun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421533; c=relaxed/simple;
	bh=mo4W2I4lVIorZV3Wi5CmQEqKHVh2Oh7Jipyamp0ivak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htRXCVNPrRmPRJgoNHeYbd2OINObOhveH1MMd1Z4nX/yEu3ZlI28Sbj5qOhe1k/7bK6KXBiI2RkxIhpnF2VXQVht47Cm5o5dzlrH4O5qNbRLGPVtAvkAQE9mSBvUFal3Lui/3haVnG1nNVX+d4k56MYyhQOgmIj8bzUvnC6/5So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl; spf=pass smtp.mailfrom=lausen.nl; dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.b=u5inwBJR; arc=none smtp.client-ip=95.143.172.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.b="u5inwBJR"
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 2423961120
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 16:52:08 +0200 (CEST)
Received: (qmail 26495 invoked by uid 990); 19 Oct 2026 14:52:08 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Mon, 19 Oct 2026 16:52:07 +0200
From: Leonard Lausen <leonard@lausen.nl>
To: platform-driver-x86@vger.kernel.org,
	Joshua Grisham <josh@joshuagrisham.com>
Cc: leonard@lausen.nl,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: samsung-galaxybook: Ignore ACPI notification 0x71
Date: Mon, 19 Oct 2026 16:51:20 +0200
Message-ID: <20261019145123.46430-2-leonard@lausen.nl>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.99997) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.59997
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=mo4W2I4lVIorZV3Wi5CmQEqKHVh2Oh7Jipyamp0ivak=;
	b=u5inwBJR/FnYumLqZtt2UwhMG5BpYtIV94lur8QbuMxGfFndtxngUiHEH36Cp8EuFX0m+d8c+t
	syd2httM1Dzim7ovodUcjI0oOS7wRtxlGnq+wrzfNKVL1fBPMcJWCa2jAVr5n1509q8JbrdDPSMU
	KLU6sjdTXuff51zQSAzSk9H2468jRGMySvUXtcS70oYHNGnLFnsDk8TVpzVDZiLlC9RVQ1faMvQb
	8YfWlwLX/R1H8+KlRipvtxaTJva6O1hL36t9JuiTdE5lRYhZXFE3+99LOknEb2+ooVBkxumFfJEZ
	BkSJEm1mKpMGXSVvUBwC6B3+xHNSrgbPrGNKLkF6Y8mPkalnQOkqdOT6abZO3KPbbEDCVQzk2AS0
	l2TlhLzJ1f6QXNh3Su9g4GinO9Qqr3vrVvmxOsAkpDJbHb4xugJU0/1WE4sY+9UX22mLiaFtQ63/
	OUYL0V2rtgPgU0A++/KbnZrrg3kwvSxNxHhPL8salmMZ01q7v+GattEgApCM8Pc49UtdwzIW/GlH
	vo0CuZjpCYNf7/uW6wHJ//oIyRh/vpFRb42WxuxGpch8zmK5axIi4GHPfNs7vYCsT1YTdPWK6/Sl
	PFbcs7EbEjs+j0W7g68HVp0GQYUaPriBds2RpOr3fbxTPB5H0p81jEniz6iA4IhG45FwzX2ezHnE
	Y=

The embedded controller on the Samsung Galaxy Book 930XDB emits ACPI
notification 0x71 repeatedly while resuming from s2idle. The driver
does not recognize it and logs a warning for every occurrence.

Inspection of Samsung System Support Service 1.5.6800.0, which targets
SAM0428 devices, found that notification 0x71 is left unmapped.

Accept the notification without an in-driver action. Its meaning is
unknown, so keep a neutral name for it. The common notification path
still forwards it to user space through ACPI netlink.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
Tested on a Samsung Galaxy Book 930XDB with Linux 7.3.

 drivers/platform/x86/samsung-galaxybook.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 99f72b204a51..3431e13bd7ed 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -197,6 +197,8 @@ static const guid_t performance_mode_guid =
 #define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
 #define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
 #define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
+/* No known in-driver action; still forwarded through ACPI netlink. */
+#define GB_ACPI_NOTIFY_UNKNOWN_71                 0x71
 #define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT     0x7d
 #define GB_ACPI_NOTIFY_HOTKEY_MICMUTE           0x6e
 #define GB_ACPI_NOTIFY_HOTKEY_CAMERA            0x6f
@@ -1258,6 +1260,7 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
 	case GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED:
 	case GB_ACPI_NOTIFY_DEVICE_ON_TABLE:
 	case GB_ACPI_NOTIFY_DEVICE_OFF_TABLE:
+	case GB_ACPI_NOTIFY_UNKNOWN_71:
 		break;
 	case GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE:
 		if (galaxybook->has_performance_mode)

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.55.0

