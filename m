Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7420578C9C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Dec 2024 22:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733781935; cv=none; b=cZ/ZkSimdMPoZWLbtVcBr5cS75Zbi0TsI+AkzPJaxRbFaE9HscC/mdWaBWQrdZoLejnZMqSc9C5WueTZFELTXYsl+EJfvrQFPzw9iyj2iKIIKa4uoxaqiBPeDWUf5xkZrwswZWP9vuUiJ8TFLNRwwpT1YreNjt3DwfMAqDyOpGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733781935; c=relaxed/simple;
	bh=WWbFPiAFwElfiJVrgNLN+suaztbR/Db6EZwrKBMIFeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmYtDPy9nODhZDffDUTpq/Odz72me9QFj1WpbFugpdYwPYta84O8TmONBx5MN9gm0F1YIPaD4OsUZlvgXugZOt7LvL6C+VQWe9wu3ExtCHf2E2/7+69WpOfS7vTsOIbzmu2SHFDlQLnpqsEXRQD69aAiMAXbh2NoGwwComAeMh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZxOAJeOI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZxOAJeOI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733781932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGALN4PUAUgTaVcM63LKTXweykneJB19TUf/d6kMnmI=;
	b=ZxOAJeOIxuErlQvKKZBahBCem5gBMXIpXkdUrJV33ppDAgmdNnONzeG/3gF1Z7xKSaYp14
	mOXnoN/ehVcLcn60Bmjz+5fTLgz0uAFl+S5mvO9FJVEA1L29FLcpFxyqhC+1PGOFfwS/4P
	8o5QAsbun/O+bow3uhkDK0zYGLE0vl8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-FJJ_7TJ4N_-cFVEwzibk4Q-1; Mon,
 09 Dec 2024 17:05:31 -0500
X-MC-Unique: FJJ_7TJ4N_-cFVEwzibk4Q-1
X-Mimecast-MFC-AGG-ID: FJJ_7TJ4N_-cFVEwzibk4Q
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8F3619560B0;
	Mon,  9 Dec 2024 22:05:28 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.3])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 81DED19560A7;
	Mon,  9 Dec 2024 22:05:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/4] platform/x86: int3472: Fix skl_int3472_handle_gpio_resources() return value
Date: Mon,  9 Dec 2024 23:05:21 +0100
Message-ID: <20241209220522.25288-3-hdegoede@redhat.com>
In-Reply-To: <20241209220522.25288-1-hdegoede@redhat.com>
References: <20241209220522.25288-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The INT3472 code never wants a copy of the ACPI resource to be added
to the list-head passed to acpi_dev_get_resources().

Make skl_int3472_handle_gpio_resources() always return -errno or 1.

Also update the inaccurate comment about the return value.
skl_int3472_handle_gpio_resources() was already returning 1 in the case
of not a GPIO resource or invalid _DSM return and not -EINVAL / -ENODEV
as the comment claimed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Despite the "Fix" in the subject this is not really a bugfix, the old code
works fine too, so no Fixes tag
---
Changes in v2:
- Keep the acpi_dev_free_resource_list() call in place
---
 drivers/platform/x86/intel/int3472/discrete.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 6e2b81da2d68..31015ebe20d8 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -178,11 +178,11 @@ static void int3472_get_func_and_polarity(u8 type, const char **func, u32 *polar
  * to create clocks and regulators via the usual frameworks.
  *
  * Return:
- * * 1		- To continue the loop
- * * 0		- When all resources found are handled properly.
- * * -EINVAL	- If the resource is not a GPIO IO resource
- * * -ENODEV	- If the resource has no corresponding _DSM entry
- * * -Other	- Errors propagated from one of the sub-functions.
+ * * 1		- Continue the loop without adding a copy of the resource to
+ * *		  the list passed to acpi_dev_get_resources()
+ * * 0		- Continue the loop after adding a copy of the resource to
+ * *		  the list passed to acpi_dev_get_resources()
+ * * -errno	- Error, break loop
  */
 static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 					     void *data)
@@ -289,7 +289,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	if (ret < 0)
 		return dev_err_probe(int3472->dev, ret, err_msg);
 
-	return ret;
+	/* Tell acpi_dev_get_resources() to not make a copy of the resource */
+	return 1;
 }
 
 static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
-- 
2.47.1

