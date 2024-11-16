Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CCC12E5B
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771345; cv=none; b=dovEqxPeRcwunLOYYWKO7u4UsVFRP2dK94N/8jM06+r7nPIBWzN3rj0APfT96S3xEIXn3YLMaBtj+OVoRoBVvmngr9GDZDs4Swb1OmTBMPey6fO8A9/uAcoOGzh/yR0Ih+0hSJW0D2S0hrudotYYy3yKth6qtfQ5cN2nHH9TB84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771345; c=relaxed/simple;
	bh=slKNWxQlYcM+oQuRkeIVz+lyl4up+WxlVt8v612TOAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJXS6/tZeQGI3U2YzoCWNoAN6br1/D9D9840pvJueAzQLggHY2O0haLGf7yw972lVUF0vYwloNj/uqu2ViDm2X/8xWXYecKfiHgla2G95SGkBOKRAmzrbuwIt2KrSelFA2AbiWsoaKhj294WKK/l/Z14dGg+vIr01xIg8uAtjjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OvifxW9w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvifxW9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731771342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDhpVkvrD/h+oKthTD9NvtS9v4xZ8qpsXOQTXs0tXQw=;
	b=OvifxW9wUAXrV6PVq37IxfkFv1dV03utPbzywHoNhMzNseXcN3hTyihZqNQh0nartJ3hnp
	eSu31Fjn6gDwT2U8JbicEkhVw1OXVQ7DHANAgvv+3UauV7vCj+Vear04AjBpTzfMObwEBY
	wMtP/jJOQYSVWNzGnnxe3nPbESpU4dk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-539-21xuJJtWN02twFdui0QnSw-1; Sat,
 16 Nov 2024 10:35:40 -0500
X-MC-Unique: 21xuJJtWN02twFdui0QnSw-1
X-Mimecast-MFC-AGG-ID: 21xuJJtWN02twFdui0QnSw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD2C919560B0;
	Sat, 16 Nov 2024 15:35:39 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6DA311956054;
	Sat, 16 Nov 2024 15:35:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/6] platform/x86: x86-android-tablets: Add missing __init to get_i2c_adap_by_*()
Date: Sat, 16 Nov 2024 16:35:29 +0100
Message-ID: <20241116153533.84722-3-hdegoede@redhat.com>
In-Reply-To: <20241116153533.84722-1-hdegoede@redhat.com>
References: <20241116153533.84722-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

get_i2c_adap_by_handle() and get_i2c_adap_by_pci_parent() both are only
used by x86_instantiate_i2c_client() which is __init itself and in case
of the latter it also uses match_parent() which is also __init.

Fixes: 5b78e809f948 ("platform/x86: x86-android-tablets: Add support for getting i2c_adapter by PCI parent devname()")
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index e9f4d91496d5..affaffadd179 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -157,7 +157,7 @@ static struct gpiod_lookup_table * const *gpiod_lookup_tables;
 static const struct software_node *bat_swnode;
 static void (*exit_handler)(void);
 
-static struct i2c_adapter *
+static __init struct i2c_adapter *
 get_i2c_adap_by_handle(const struct x86_i2c_client_info *client_info)
 {
 	acpi_handle handle;
@@ -177,7 +177,7 @@ static __init int match_parent(struct device *dev, const void *data)
 	return dev->parent == data;
 }
 
-static struct i2c_adapter *
+static __init struct i2c_adapter *
 get_i2c_adap_by_pci_parent(const struct x86_i2c_client_info *client_info)
 {
 	struct i2c_adapter *adap = NULL;
-- 
2.47.0

