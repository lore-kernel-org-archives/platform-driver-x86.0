Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0E11B4157
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323102; cv=none; b=h7qACTvjQIIq9F8+ZXXvs0PbdlELhxjrnPfG7HJN4+cMuB7Fs01owXLgFsOVPH59jixI4xnIMRrVx1ZgweGxVRjWsFAmxxdUqiMsbwO7eV5mypG+6lfqopFo3Xa/T4IkJw/kPSi5u63NXT1FhgZz4hZ2fJ4hulsY6v627yYm2i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323102; c=relaxed/simple;
	bh=bzZV/cMZwASkG19dsd5ACVo5kRNEXcfeXTR6A7s6caE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mPyjQXHyggcv9IC1fj2vKre/Q/B0Jz6DLsjmcnejFPIr6GSS3oKnkPG6nhSrQOdmRBberaAO+EMVY7e/fhMmae/Tiv9I1+8aWnemSxRcnueDWXhsY4N2XmyQdPZmfQ/Z4zGicba+O3HzmW6cy6nUgrpvhXV3XGOn4hPopsux6E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qy95kl/s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qy95kl/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733323099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fhpcEC/tiPm3d0LycSorlQv7zqEOdPfUjLN+bZ1Vg84=;
	b=Qy95kl/spZuhmcy5JJpj+h+8C4jC02QtCqZsJPH9sEwJIGizU6H+NQeayivFR2GewG6IIz
	Tr8jNpA6ogMmAiLtkA+TzrAAPNheH5hWe8NwueY43ipRuI3PO6zk5X5aPwvYrb1ektYYV3
	8mq8xJpFlUzcuze4mcKRO+ZZI2m72gQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-XBYQmWbRMbiuQ0EFju4n7Q-1; Wed,
 04 Dec 2024 09:38:16 -0500
X-MC-Unique: XBYQmWbRMbiuQ0EFju4n7Q-1
X-Mimecast-MFC-AGG-ID: XBYQmWbRMbiuQ0EFju4n7Q
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1630C195605A;
	Wed,  4 Dec 2024 14:38:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B36AF19560A0;
	Wed,  4 Dec 2024 14:38:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel: int0002_vgpio: Make the irqchip immutable
Date: Wed,  4 Dec 2024 15:38:07 +0100
Message-ID: <20241204143807.32966-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Commit 6c846d026d49 ("gpio: Don't fiddle with irqchips marked as
immutable") added a warning to indicate if the gpiolib is altering the
internals of irqchips:

gpio gpiochip4: (INT0002 Virtual GPIO): not an immutable chip, please consider fixing it!

Fix this by making the irqchip in the int0002_vgpio driver immutable.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int0002_vgpio.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index 527d8fbc7cc1..71fe75d67847 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -83,8 +83,12 @@ static void int0002_irq_ack(struct irq_data *data)
 
 static void int0002_irq_unmask(struct irq_data *data)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
 	u32 gpe_en_reg;
 
+	gpiochip_enable_irq(gc, hwirq);
+
 	gpe_en_reg = inl(GPE0A_EN_PORT);
 	gpe_en_reg |= GPE0A_PME_B0_EN_BIT;
 	outl(gpe_en_reg, GPE0A_EN_PORT);
@@ -92,11 +96,15 @@ static void int0002_irq_unmask(struct irq_data *data)
 
 static void int0002_irq_mask(struct irq_data *data)
 {
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
 	u32 gpe_en_reg;
 
 	gpe_en_reg = inl(GPE0A_EN_PORT);
 	gpe_en_reg &= ~GPE0A_PME_B0_EN_BIT;
 	outl(gpe_en_reg, GPE0A_EN_PORT);
+
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static int int0002_irq_set_wake(struct irq_data *data, unsigned int on)
@@ -140,12 +148,14 @@ static bool int0002_check_wake(void *data)
 	return (gpe_sts_reg & GPE0A_PME_B0_STS_BIT);
 }
 
-static struct irq_chip int0002_irqchip = {
+static const struct irq_chip int0002_irqchip = {
 	.name			= DRV_NAME,
 	.irq_ack		= int0002_irq_ack,
 	.irq_mask		= int0002_irq_mask,
 	.irq_unmask		= int0002_irq_unmask,
 	.irq_set_wake		= int0002_irq_set_wake,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static void int0002_init_irq_valid_mask(struct gpio_chip *chip,
@@ -203,7 +213,7 @@ static int int0002_probe(struct platform_device *pdev)
 	}
 
 	girq = &chip->irq;
-	girq->chip = &int0002_irqchip;
+	gpio_irq_chip_set_chip(girq, &int0002_irqchip);
 	/* This let us handle the parent IRQ in the driver */
 	girq->parent_handler = NULL;
 	girq->num_parents = 0;
-- 
2.47.0

