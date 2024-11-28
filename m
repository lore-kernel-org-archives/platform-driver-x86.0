Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A771BBBD3
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732808550; cv=none; b=a4GzWkjytd/nVZHDw58yG9zw2faGwXxNgbepTBKIZa0fWnwSmvD24OtIbhF5VlrBLlllbX9mIBp+Bz/LKsqXjY51NbpBrE/WTcNBvF7LfmR13TpAu0pyhjBHi7CPB9pPEQxvSJ5cUvaeHmnqBBNpUFWFZuEBx7AsLLRSz7h/XCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732808550; c=relaxed/simple;
	bh=mHH/FbS1tGHMCkj+uNFfA1x6oVs3dCjQzjwUwW71hkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FE4zIx6E8qhpUdVxHNWD8wmUjoNmwlugjZE+khtz5iRZF5H0hil2jY9YRNUNrTMxUccYWX25y+lT4xQiqbkbrF94uao0nwQUL3aQFZkbW6tJxWA/UGwTf2v+AF8EJShb+fFA6oQx+UVsjFxnluGbMnN2wbUkV2FFM5nCMCtBKbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=foWQCMPB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="foWQCMPB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732808545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCIeJ4ahMS0NYqhuzopp8hefBazYBzOwG6rJ9SmztBk=;
	b=foWQCMPBGuwM0+B0/b1vTSKIvXp610qgIf9jx2fWRuKl5ZeEO0j4VIMvZVjAFj1QsT7W7n
	6myYabEQxg8SsjWpALOcS0Nknz6P3TrkbaeaybQf0UDeRIyAZoIgCyR+f+cbSujnYKD5IP
	ZpjxtDkB09Cg7g7yRMxqDSrFzF6+Ek8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-A8V7Rv9rOKy3hcf26WAcVQ-1; Thu,
 28 Nov 2024 10:42:22 -0500
X-MC-Unique: A8V7Rv9rOKy3hcf26WAcVQ-1
X-Mimecast-MFC-AGG-ID: A8V7Rv9rOKy3hcf26WAcVQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3974D19560BF;
	Thu, 28 Nov 2024 15:42:21 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.119])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5C617195605A;
	Thu, 28 Nov 2024 15:42:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/4] platform/x86: int3472: Fix skl_int3472_handle_gpio_resources() return value
Date: Thu, 28 Nov 2024 16:42:11 +0100
Message-ID: <20241128154212.6216-3-hdegoede@redhat.com>
In-Reply-To: <20241128154212.6216-1-hdegoede@redhat.com>
References: <20241128154212.6216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

The INT3472 code never wants a copy of the ACPI resource to be added
to the list-head passed to acpi_dev_get_resources().

Make skl_int3472_handle_gpio_resources() always return -errno or 1
and drop the now no longer acpi_dev_free_resource_list() call.

Also update the inaccurate comment about the return value.
skl_int3472_handle_gpio_resources() was already returning 1 in the case
of not a GPIO resource or invalid _DSM return and not -EINVAL / -ENODEV
as the comment claimed.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Despite the "Fix" in the subject this is not really a bugfix, the old code
works fine too, so no Fixes tag
---
 drivers/platform/x86/intel/int3472/discrete.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 01da18b426ae..05e442078f8f 100644
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
@@ -283,7 +283,8 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
 	if (ret < 0)
 		return dev_err_probe(int3472->dev, ret, err_msg);
 
-	return ret;
+	/* Tell acpi_dev_get_resources() to not make a copy of the resource */
+	return 1;
 }
 
 static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
@@ -299,8 +300,6 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 	if (ret < 0)
 		return ret;
 
-	acpi_dev_free_resource_list(&resource_list);
-
 	/* Register _DSM based clock (no-op if a GPIO clock was already registered) */
 	ret = skl_int3472_register_dsm_clock(int3472);
 	if (ret < 0)
-- 
2.47.0

