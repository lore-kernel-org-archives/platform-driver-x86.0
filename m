Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA53346B8
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jan 2026 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615525; cv=none; b=kRnrBUTJGi9Drb+4KEBN6je66xJSzKlOZ7xg9E6l0HDQJt/AAlLO8oNH2DOw2hQIStVpx+rlVqbyOMRtpRAdyE2VQXd/cKF0JdC+gA5FBlAJ/13avHh8NNF5E8jsI0ue/wsNaor0SRzqfjA95zso++npiKW33qoblCRdK94j5RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615525; c=relaxed/simple;
	bh=asJqFQ5BkOOb8AkdBPYV2TvruTmATWEaa2GP8k2e2mI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sMtsjBlizKbmRXLtMZoe2hvFsHo7EqIpcwg/ikEHZWjcrgP2kZEgCt8jZ8YuU3fStPS7ZQkqfwTwqHR9nhkj47ZFxITBtlbCKCepdjN4osdq/572Ol0LGBaA124lFz+eXAnv4QTH4upAgkcKMJ6M4QtARIzlIXixeJveJnlZVE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=CHH4wiek; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="CHH4wiek"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767615508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KlbfZxiwSFKYxZOO6dTN1MDVCP97BEkGN3p97ixJ/lw=;
	b=CHH4wiekjMjK/n1sHWcjQzEC5k4FkExSHjSY4EcnhSzIfrIX19uUSterL3NWBKYOESad3W
	PWaVkSHHYLnJgwtm3GWkiZAHgY0Js/d7VksYL3VraHR+Wg3qyap8FMqrR1cVK9AlnrFi8R
	JjfUidJURhpXoo5dUusSoB2MI2OVHvg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Chen Yu <yu.c.chen@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/surface: Replace deprecated strcpy in surface_button_add
Date: Mon,  5 Jan 2026 13:18:03 +0100
Message-ID: <20260105121802.1947-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() has been deprecated [1] because it performs no bounds checking
on the destination buffer, which can lead to buffer overflows. Replace
it with the safer strscpy().  No functional changes.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/platform/surface/surfacepro3_button.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surfacepro3_button.c b/drivers/platform/surface/surfacepro3_button.c
index 2755601f979c..d027a064a62d 100644
--- a/drivers/platform/surface/surfacepro3_button.c
+++ b/drivers/platform/surface/surfacepro3_button.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/input.h>
 #include <linux/acpi.h>
@@ -211,7 +212,7 @@ static int surface_button_add(struct acpi_device *device)
 	}
 
 	name = acpi_device_name(device);
-	strcpy(name, SURFACE_BUTTON_DEVICE_NAME);
+	strscpy(acpi_device_name(device), SURFACE_BUTTON_DEVICE_NAME);
 	snprintf(button->phys, sizeof(button->phys), "%s/buttons", hid);
 
 	input->name = name;
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

