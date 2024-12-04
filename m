Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62C71531E8
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344965; cv=none; b=eDXK/EOqIjmyno0ektRkcIUQCh41EWwZLKqqN5nEJ8UFSLkExox3K3MsEz5ERggUu5dOvWyq0R7GbP//Als9g4nGFArJc5ZDu3NSNXzzDmaVZDAtWM5dscYj4eXt+Jowb+enYGB0SW+W/y3AA0bU71AHOzYL6DVlLgOnJ2rQq7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344965; c=relaxed/simple;
	bh=slKNWxQlYcM+oQuRkeIVz+lyl4up+WxlVt8v612TOAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XwGEPtpeLJyVS1X31R8uWlOwpViwsLvD65n6ZVsREX8L/Zl02CrcWYZPC1BORXq9vkATkN4w2c3ePghxWFn2LgpYQN30rKrnUAT1NOGp25LiKNoZbeu05QWqjIFm9ELFSTnp9rN5VUyQsFtn6D59jQOAr3M3H3Ru4F28bikTib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+id7Etv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+id7Etv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733344962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TDhpVkvrD/h+oKthTD9NvtS9v4xZ8qpsXOQTXs0tXQw=;
	b=a+id7EtviDPTmNpX2MhP6rYg16HeU2BYPE+qn7OZIAh8JpuUEGIrXMhkD4ix/r+PSJXmWW
	GbthnbROdFsE3XWAl78hBiuUleDWHV3PWkqqAqMTKXI0XyhrC7tvXxjZ53b7gAAFL0Y62m
	fpytUqmmnXz9S8gXnD+TPnf1qju7d6A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-fRMNfid6MvyzvEOgKhKJFw-1; Wed,
 04 Dec 2024 15:42:41 -0500
X-MC-Unique: fRMNfid6MvyzvEOgKhKJFw-1
X-Mimecast-MFC-AGG-ID: fRMNfid6MvyzvEOgKhKJFw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61C881956095;
	Wed,  4 Dec 2024 20:42:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0396E1956094;
	Wed,  4 Dec 2024 20:42:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 1/8] platform/x86: x86-android-tablets: Add missing __init to get_i2c_adap_by_*()
Date: Wed,  4 Dec 2024 21:42:12 +0100
Message-ID: <20241204204227.95757-2-hdegoede@redhat.com>
In-Reply-To: <20241204204227.95757-1-hdegoede@redhat.com>
References: <20241204204227.95757-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

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

