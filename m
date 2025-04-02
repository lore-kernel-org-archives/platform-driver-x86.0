Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D1B1E51E7
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Apr 2025 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625530; cv=none; b=Kw0RMsJSLpwFQ5OseSeOegHSMRsNIwKPZzCnssGgc8T6zSNuZdlQr7j8RPtrH7dxERHB6NeToUHbAAWT+RQ/+s9sd2h8MZD9f16SJ5cB1VBgql//YOOdTAFtzfBeXNiVdu1k828xknommQ71cAKUGrNbqseQJMyv7XjzdZRfKaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625530; c=relaxed/simple;
	bh=DF9uLVCmcppGaYrzAQ/097853xSxX5JBUgPcUUDVnAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2nfwEs3ZLhxxid8jhWS/xubhx0YqdGVjYRiIRNPd5277zJCtC4y9Wt0IGh5bgjRAcXbKFr9AmelylxpRfKlq7ZTVJWZwi1RS7HLibenN/zdaiRWhQShxJB848MHOzI4+M9LM+9tK9xGSfo9r8Mo+dNhgiLKX4iWupTZNCFvdes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LI9goEBF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LI9goEBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743625527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqvRoUOS45eqYZyUu/oyin/hyEkH6Sk3qKL5WSi0Vdk=;
	b=LI9goEBFWKaZgUlDDv+3zds6a5b0zTWsJo8VI8hM9+XzS9gGecfdQAmI5Mu70FzYelK+eC
	sX/YJHciI2cYV7bDLUU6y6B/UXkDAafQXggiinq59MaG99LLuwB3gAG58SbH3qLxN5czXW
	InvpTZ9dj1aS5RMQnrJlssTrbfjaEqk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209-vltAgjnWPDqat50_cdk5lQ-1; Wed,
 02 Apr 2025 16:25:22 -0400
X-MC-Unique: vltAgjnWPDqat50_cdk5lQ-1
X-Mimecast-MFC-AGG-ID: vltAgjnWPDqat50_cdk5lQ_1743625520
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 374181956048;
	Wed,  2 Apr 2025 20:25:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.44.32.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90D5B1801752;
	Wed,  2 Apr 2025 20:25:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 1/9] platform/x86: int3472: Add skl_int3472_register_clock() helper
Date: Wed,  2 Apr 2025 22:25:02 +0200
Message-ID: <20250402202510.432888-2-hdegoede@redhat.com>
In-Reply-To: <20250402202510.432888-1-hdegoede@redhat.com>
References: <20250402202510.432888-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

skl_int3472_register_dsm_clock() and skl_int3472_register_gpio_clock() are
80% the same code. Factor out the common code into a new
skl_int3472_register_clock() helper.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 57 +++++--------------
 1 file changed, 13 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index 16e36ac0a7b4..837990af24fe 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -118,7 +118,7 @@ static const struct clk_ops skl_int3472_clock_ops = {
 	.recalc_rate = skl_int3472_clk_recalc_rate,
 };
 
-int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
+static int skl_int3472_register_clock(struct int3472_discrete_device *int3472)
 {
 	struct acpi_device *adev = int3472->adev;
 	struct clk_init_data init = {
@@ -127,12 +127,6 @@ int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
 	};
 	int ret;
 
-	if (int3472->clock.cl)
-		return 0; /* A GPIO controlled clk has already been registered */
-
-	if (!acpi_check_dsm(adev->handle, &img_clk_guid, 0, BIT(1)))
-		return 0; /* DSM clock control is not available */
-
 	init.name = kasprintf(GFP_KERNEL, "%s-clk", acpi_dev_name(adev));
 	if (!init.name)
 		return -ENOMEM;
@@ -161,51 +155,26 @@ int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
 	return ret;
 }
 
+int skl_int3472_register_dsm_clock(struct int3472_discrete_device *int3472)
+{
+	if (int3472->clock.cl)
+		return 0; /* A GPIO controlled clk has already been registered */
+
+	if (!acpi_check_dsm(int3472->adev->handle, &img_clk_guid, 0, BIT(1)))
+		return 0; /* DSM clock control is not available */
+
+	return skl_int3472_register_clock(int3472);
+}
+
 int skl_int3472_register_gpio_clock(struct int3472_discrete_device *int3472,
 				    struct gpio_desc *gpio)
 {
-	struct clk_init_data init = {
-		.ops = &skl_int3472_clock_ops,
-		.flags = CLK_GET_RATE_NOCACHE,
-	};
-	int ret;
-
 	if (int3472->clock.cl)
 		return -EBUSY;
 
 	int3472->clock.ena_gpio = gpio;
 
-	init.name = kasprintf(GFP_KERNEL, "%s-clk",
-			      acpi_dev_name(int3472->adev));
-	if (!init.name)
-		return -ENOMEM;
-
-	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
-
-	int3472->clock.clk_hw.init = &init;
-	int3472->clock.clk = clk_register(&int3472->adev->dev,
-					  &int3472->clock.clk_hw);
-	if (IS_ERR(int3472->clock.clk)) {
-		ret = PTR_ERR(int3472->clock.clk);
-		goto out_free_init_name;
-	}
-
-	int3472->clock.cl = clkdev_create(int3472->clock.clk, NULL,
-					  int3472->sensor_name);
-	if (!int3472->clock.cl) {
-		ret = -ENOMEM;
-		goto err_unregister_clk;
-	}
-
-	kfree(init.name);
-	return 0;
-
-err_unregister_clk:
-	clk_unregister(int3472->clock.clk);
-out_free_init_name:
-	kfree(init.name);
-
-	return ret;
+	return skl_int3472_register_clock(int3472);
 }
 
 void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
-- 
2.49.0

