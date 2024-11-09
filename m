Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C0419D88F
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Nov 2024 22:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189953; cv=none; b=kvYvyUNTMp5qyDRoh91df5sboU66v0G63Ok6AjYOwroXFpy2HN7VkTEmGavWm+d2Y9Pv5GGLuqvO+64PVjmlEBwbMu3Mtox2IlJxUe9uUU/Jrk7vdG2bQoOMt6abyKIcN72SpeouddoZ70gtmFvW6yVCLbBjQfYXX0OAhuh9p0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189953; c=relaxed/simple;
	bh=csb59n64P97IasyyzROYGaymJ5eCXYvWjxKp70h+TvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K7B9iZ4MgwnNOQmeaFeJwr0lEV6bYUdgmrMu0s5mTuI4nXxuJSVWUSL6jm0PqodxMcanFsiu4zaMJ1Wv73l47RG7Y69TAm2mYUdNiCCWRgX79VAngur6Co2pMAzUCwvAFMDq2YeraWMMvUmDvwwJlfiZOxDWdaMopivcMvfx4n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=igJ7Frvj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="igJ7Frvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731189951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v21oqqEKdEz80Z80MaiBwUV9KHZZ2uwiOAj41qLvPfk=;
	b=igJ7Frvjr1hBCIFE5GQl1q0S798Cv/JmHdHTAbLJYIzxmcFtLdb8Ph4UHj4h+xPug0wFN7
	uEF+t36wImKOrFUkyY9L7hMJTqBByXJatw9b0FuONxeHLXTwlE+6UxzNr+qzkJOlGM4MVd
	FiV1Pg2qVErCWsiMagEy8QlKwvCTi9Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-dlk921z2M_GJ99saOeiZ6Q-1; Sat,
 09 Nov 2024 17:05:46 -0500
X-MC-Unique: dlk921z2M_GJ99saOeiZ6Q-1
X-Mimecast-MFC-AGG-ID: dlk921z2M_GJ99saOeiZ6Q
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AA3F19560A6;
	Sat,  9 Nov 2024 22:05:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.21])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF1AF1956056;
	Sat,  9 Nov 2024 22:05:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: x86-android-tablets: Add missing __init to get_i2c_adap_by_*()
Date: Sat,  9 Nov 2024 23:05:27 +0100
Message-ID: <20241109220530.83394-3-hdegoede@redhat.com>
In-Reply-To: <20241109220530.83394-1-hdegoede@redhat.com>
References: <20241109220530.83394-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

get_i2c_adap_by_handle() and get_i2c_adap_by_pci_parent() both are only
used by x86_instantiate_i2c_client() which is __init itself and in case
of the latter it also uses match_parent() which is also __init.

Fixes: 5b78e809f948 ("platform/x86: x86-android-tablets: Add support for getting i2c_adapter by PCI parent devname()")
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

