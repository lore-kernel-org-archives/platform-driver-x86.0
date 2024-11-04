Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60101D3584
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 20:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730750940; cv=none; b=VRz2YYtX3f/+FLHCKFm1PPf1bSU3CeygXIuw+A2jb4lbu0hP1vW2kDo137DZe9chAQwPZ82WB+TD1Tn12D5+Yl1usJTGoJ/MHo8z4/C47LefD2+75zTn7nGeA3Mc3dzSi8hZs+0glM68K8FoaAP1OR5u2xnHPLi8tveqhy9uBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730750940; c=relaxed/simple;
	bh=ePH84B+TRh2zKWFO07bi+TJ8rVPyHYOdGgi7ZYVsqFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzQC26sEBmEz0fZbgTNmEDZQjR95yXDpYebGJMt1cSQhUp/+sb5Q4RE/JsNNy5aOheTl+nJHge9iUdZrK9aQd6dTdwUBTe4lfmhw3rWy6VTW9+xsirAMCqLU8KIHJmD7BFZMjy0cGMv2Cv3u/NKg1IHzwM3IHM2gChyB4zDpEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CssKfL1p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CssKfL1p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730750937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OEPKZTmRbfZVgcAPIF3BI0wjoSP9MkQiYDm2LLIaT1Q=;
	b=CssKfL1pl4yRvTXBgdcQffYGpz0730ZKhynG7WuTbVl1akDOql1DtUw4YnSSNXbiaXleK/
	WocLNFCWEiuTyglVpV0/Bf9hF/eCoEjSxIqC3OqsR4WavgbxbKp2DkGnxwxFj4omUKFsqJ
	OI3c29p4LorH63+ncwzNuAakwP7p9mI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-fXJ70UUMNF-ghf9BnkPE3Q-1; Mon,
 04 Nov 2024 15:08:54 -0500
X-MC-Unique: fXJ70UUMNF-ghf9BnkPE3Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E756C1955D95;
	Mon,  4 Nov 2024 20:08:52 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.64])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 35DC11956086;
	Mon,  4 Nov 2024 20:08:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/3] platform/x86: x86-android-tablets: Add get_i2c_adap_by_handle() helper
Date: Mon,  4 Nov 2024 21:08:46 +0100
Message-ID: <20241104200848.58693-2-hdegoede@redhat.com>
In-Reply-To: <20241104200848.58693-1-hdegoede@redhat.com>
References: <20241104200848.58693-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Add get_i2c_adap_by_handle() helper function, this is a preparation patch
for adding support for getting i2c_adapter-s by PCI parent devname().

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this series
---
 .../platform/x86/x86-android-tablets/core.c   | 25 ++++++++++++-------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index ef572b90e06b..4154395c60bb 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -155,26 +155,33 @@ static struct gpiod_lookup_table * const *gpiod_lookup_tables;
 static const struct software_node *bat_swnode;
 static void (*exit_handler)(void);
 
+static struct i2c_adapter *
+get_i2c_adap_by_handle(const struct x86_i2c_client_info *client_info)
+{
+	acpi_handle handle;
+	acpi_status status;
+
+	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
+	if (ACPI_FAILURE(status)) {
+		pr_err("Error could not get %s handle\n", client_info->adapter_path);
+		return NULL;
+	}
+
+	return i2c_acpi_find_adapter_by_handle(handle);
+}
+
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
 					     int idx)
 {
 	const struct x86_i2c_client_info *client_info = &dev_info->i2c_client_info[idx];
 	struct i2c_board_info board_info = client_info->board_info;
 	struct i2c_adapter *adap;
-	acpi_handle handle;
-	acpi_status status;
 
 	board_info.irq = x86_acpi_irq_helper_get(&client_info->irq_data);
 	if (board_info.irq < 0)
 		return board_info.irq;
 
-	status = acpi_get_handle(NULL, client_info->adapter_path, &handle);
-	if (ACPI_FAILURE(status)) {
-		pr_err("Error could not get %s handle\n", client_info->adapter_path);
-		return -ENODEV;
-	}
-
-	adap = i2c_acpi_find_adapter_by_handle(handle);
+	adap = get_i2c_adap_by_handle(client_info);
 	if (!adap) {
 		pr_err("error could not get %s adapter\n", client_info->adapter_path);
 		return -ENODEV;
-- 
2.47.0

