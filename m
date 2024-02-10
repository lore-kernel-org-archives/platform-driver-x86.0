Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10628371
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Feb 2024 11:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707562918; cv=none; b=K+lrQXybWim6jpVApwzA1qNSHW4Hm+bfQ5/xmnpSAk3cCi53KDlVYaFV5+2ouqmCFOYY3N2pZTN7BxybtcsX0XIChgVyIbaP/WK55vgngmi8n+tFSFcDdyQ6qEZZmCJzp6XYME00AoPnGiSyq6skK+P7Spc6MSzPpqrn+9ULs+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707562918; c=relaxed/simple;
	bh=XrQshJyZhevqIIBoX1hkhKevh99+1JwVuiZJEnQJQb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLG2BYXCdMtIa/4piVCln6sd/PjEH2uXUe5iU8xjziEBcFVG1tzPTMiy3EnFuD1rckTAUdOlVFvb6MOJqWjZvuznjILONej2fC+DXTCrBAdtNQxMlUsRrPwcwHSojDaIVZs1B1QWnQck3ExIfKS5znAJ5fbkaOwcsC9wpvVA70o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hQpSNW9R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hQpSNW9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707562915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ggA4wns++3y1E2sNvVB+GtYCUkC1NkQ1J8dGS4KPaYk=;
	b=hQpSNW9RIqtwYs/YVGKg2PFgytvJ794i14MyguVbe9hhPWEjvjiiVa+AgPVAB3V3K9fvnt
	EIPvw3BGO+hr+DgUg5fnSGVef9UM/5fC6+GK3ZUh/OJymPXbsVY7M8RuqAFDyqWt0Y+VM/
	yhrslOvabS7HJPq5d3SCOOfzZ23lJeQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-XU_Xzw0GPPOWrHyitwOZzQ-1; Sat,
 10 Feb 2024 06:01:51 -0500
X-MC-Unique: XU_Xzw0GPPOWrHyitwOZzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1D501C05EB8;
	Sat, 10 Feb 2024 11:01:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EC8F40C9444;
	Sat, 10 Feb 2024 11:01:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel: int0002_vgpio: Pass IRQF_ONESHOT to request_irq()
Date: Sat, 10 Feb 2024 12:01:49 +0100
Message-ID: <20240210110149.12803-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Since commit 7a36b901a6eb ("ACPI: OSL: Use a threaded interrupt handler
for SCI") the ACPI OSL code passes IRQF_ONESHOT when requesting the SCI.

Since the INT0002 GPIO is typically shared with the ACPI SCI the INT0002
driver must pass the same flags.

This fixes the INT0002 driver failing to probe due to following error +
as well as removing the backtrace that follows this error:

"genirq: Flags mismatch irq 9. 00000084 (INT0002) vs. 00002080 (acpi)"

Fixes: 7a36b901a6eb ("ACPI: OSL: Use a threaded interrupt handler for SCI")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int0002_vgpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index b6708bab7c53..527d8fbc7cc1 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -196,7 +196,7 @@ static int int0002_probe(struct platform_device *pdev)
 	 * IRQs into gpiolib.
 	 */
 	ret = devm_request_irq(dev, irq, int0002_irq,
-			       IRQF_SHARED, "INT0002", chip);
+			       IRQF_ONESHOT | IRQF_SHARED, "INT0002", chip);
 	if (ret) {
 		dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
 		return ret;
-- 
2.43.0

