Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9DF3A0E93;
	Tue, 19 May 2026 20:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779222492; cv=none; b=ZjGZYVMtVNbJFtYZrNUyoonCoTBUKR3CPLpFTo6qJ6XbSHCo3L4msOU+tAPiYsOPBV7jwYISqhKMsZ+ezIjsenTWTCFsVerY8olI+oZrXWHXDfgHjEQOBfqtWP0wXWfH7C5WHAXwDlJ8ld+Fi+92+1pZKaUMNlor+vamPW0UJr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779222492; c=relaxed/simple;
	bh=hx4qXrIgwAizNkABOcLp0v2snPXYP0ptG0FPMEs0rVA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gLQxCbjWm8ZhPbmz+Q/4xAXRfC68wUl0XyP9w+RfGpDe6fAyGBltUkrScj+xpQzor2MJmDPh5ybgp09Ld8hNSc+Mkji7JZx1ZI0foG9BOx7el2fn3eQlZytY4jqKcXcYbqcJN1UIVJcpPDXPVqy9fUKNKAa22EF1fOiIRTBcN7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGG8iuWk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGG8iuWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE101F000E9;
	Tue, 19 May 2026 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779222491;
	bh=oIWIBlj1t5xQUcyCvkuZXxj/ScpReAuj1xCzkoK876Q=;
	h=From:To:Cc:Subject:Date;
	b=IGG8iuWkywWBhhN0+GtbYo//TEiDJgHOhPWCEWfMFsoYtYsckapPZQMMATmN6z+fM
	 FzZjAuoe60Yc93CYvDq42lqVkUhqiLjKoCeQ8kT2QKgev2JZzT2xyn+WW4BJVWzFxA
	 RUOwi37uB5IJLcACd4vmKmlbxmZtgVA2J1XTDfUM0FnigUdkfZ7fEb3xjZ+7yJfLmV
	 YE9O8iPb3mO51grC5fQCNGRWYeVDJRCYtWaqGhitzabtg7IoMLvukCEUe/mm23f91h
	 KQR1MBBGImdDsKqEraPRASphXePEDFwMdNIkZSVkD7GThpDGafWjpBm81zduS163wF
	 0F3vHM4jvzaNQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Mingyou Chen <qby140326@gmail.com>
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Luke D. Jones" <luke@ljones.dev>,
	Gladyshev Ilya <foxido@foxido.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: bitland-mifs-wmi: add CONFIG_LEDS_CLASS dependency
Date: Tue, 19 May 2026 22:28:01 +0200
Message-Id: <20260519202804.1339581-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver requires the LED classdev support
and causes a link failure when that is disabled:

x86_64-linux-ld: vmlinux.o: in function `bitland_mifs_wmi_probe':
bitland-mifs-wmi.c:(.text+0xede02a): undefined reference to `devm_led_classdev_register_ext'

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
----
There is currently a mix of 'depends on LEDS_CLASS'
and 'select LEDS_CLASS' in the platform drivers. This
is something that should be fixed at some point, as it
risks circular dependencies.

The majority use 'select', but I went for 'depends on'
here since the symbol is user visible.
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0e9f4403a4f4..d7beda4239ab 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -118,6 +118,7 @@ config BITLAND_MIFS_WMI
 	depends on ACPI_WMI
 	depends on HWMON
 	depends on INPUT
+	depends on LEDS_CLASS
 	depends on POWER_SUPPLY
 	select ACPI_PLATFORM_PROFILE
 	select INPUT_SPARSEKMAP
-- 
2.39.5

