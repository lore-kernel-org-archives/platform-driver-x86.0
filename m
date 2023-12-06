Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sgPl/KKT"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0555918F;
	Tue,  5 Dec 2023 22:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=P8Ri5BuO2beZsqvWzjOyFCIGgTJgQtvxQqM7x0tBVTQ=; b=sgPl/KKTIgdUP1+4pbSQbWO1+W
	gkl8XSm1+BQNzWPCudS7OmqaD2Q2AVTKAH+9B29dqgXkJfwKsrqE9SEpWsxxgkBBeG9tbNIMy+Lnp
	ONn8FUk88oBiwE69CUWtTgva7ki2zfyLIUw0AynHmGPe7yQfvHlz9//D6JKzTMfTC6BTOai5HwvgG
	/+HXYsDDox8/EY4Ey1512snlC327mNLvhiP+XeD5tJwHLya6sP5gfuqrBVD3CPaaRxX7rpeZijQ2B
	++f0uq3f+Z/ePPfAnJHuvnmDjnlF0uiVtkm4trKQ0EvBR9nNDBoX7xXTyhmeJeammcTNZ6M2a6bhk
	0Mbfr2lg==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkyf-0099Gc-1Y;
	Wed, 06 Dec 2023 06:01:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: fix kernel-doc warnings
Date: Tue,  5 Dec 2023 22:01:43 -0800
Message-ID: <20231206060144.8260-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a function's return description and don't misuse "/**" for
non-kernel-doc comments to prevent warnings from scripts/kernel-doc.

thinkpad_acpi.c:523: warning: No description found for return value of 'tpacpi_check_quirks'
thinkpad_acpi.c:9307: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
thinkpad_acpi.c:9307: warning: missing initial short description on line:
 * This evaluates a ACPI method call specific to the battery

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: ibm-acpi-devel@lists.sourceforge.net
CC: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/thinkpad_acpi.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -- a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -512,10 +512,10 @@ struct tpacpi_quirk {
  * Iterates over a quirks list until one is found that matches the
  * ThinkPad's vendor, BIOS and EC model.
  *
- * Returns 0 if nothing matches, otherwise returns the quirks field of
+ * Returns: %0 if nothing matches, otherwise returns the quirks field of
  * the matching &struct tpacpi_quirk entry.
  *
- * The match criteria is: vendor, ec and bios much match.
+ * The match criteria is: vendor, ec and bios must match.
  */
 static unsigned long __init tpacpi_check_quirks(
 			const struct tpacpi_quirk *qlist,
@@ -9303,7 +9303,7 @@ static struct tpacpi_battery_driver_data
 
 /* ACPI helpers/functions/probes */
 
-/**
+/*
  * This evaluates a ACPI method call specific to the battery
  * ACPI extension. The specifics are that an error is marked
  * in the 32rd bit of the response, so we just check that here.
