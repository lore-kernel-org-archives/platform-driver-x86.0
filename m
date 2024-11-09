Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24E19E97C
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Nov 2024 22:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189953; cv=none; b=rYcS3z2Zk91kG6PIz3P25DVJY8RVN+LA/IDXC2tKmV3bdL6GMAwKkg+RLcuJ6+MjIBSHy5Lm3WgyVZgR5gwMy3blO7yY7YKWrjMiA8nIyx8Y76A72KG8CN79/y9BJOd7QSlcBBSEVcW4SUVMixE89BawjjLw1rrJYRBV1ttrGps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189953; c=relaxed/simple;
	bh=rUeZhLLB1XEmvGMMQ+p7jcGYmp+FTfPxg0MLqRGNFSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsETOHJzBVHa/hSaz4BvJfCIEFdPpyrdaAcA/8eynI6q0y+DhpLBTVanCYpuvxNIulnpGl/yydAElxOiQeeG5VdwCskUlizmBv7UnVh5w3ygKSQaHV1Sp6qTa4ljwCULYJWhnR6DZJwCt704oWRB+Y3vkyLkUhn67itHwnqNnXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CvZp7lMz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CvZp7lMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731189951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGB29OKQg97Sp8XtK7VuccgvoHOGWWp7nA1UaLumjhU=;
	b=CvZp7lMz1cBiJv5KibKH8ZjFFym/sMi3X9zbKg+7V1k5uJuD8ubTcymeGrAAosGxIGYerM
	r5FxuVYjcKIykBBDphxXiRHS0Imy1aZ359aJymwmzM/Bkvsfn6l0I+EZd5R1RLngIqOMcC
	fF3u0Z3sDdy8R8psxpC/gW4pJYBpoaI=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-292-2ItElI6qNpeGZnJg9NQ3pw-1; Sat,
 09 Nov 2024 17:05:47 -0500
X-MC-Unique: 2ItElI6qNpeGZnJg9NQ3pw-1
X-Mimecast-MFC-AGG-ID: 2ItElI6qNpeGZnJg9NQ3pw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF8C81955F43;
	Sat,  9 Nov 2024 22:05:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.21])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8087B1956056;
	Sat,  9 Nov 2024 22:05:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/5] platform/x86: x86-android-tablets: Change x86_instantiate_serdev() prototype
Date: Sat,  9 Nov 2024 23:05:28 +0100
Message-ID: <20241109220530.83394-4-hdegoede@redhat.com>
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

Make x86_instantiate_serdev() take a "struct x86_dev_info *" + idx as
arguments instead of a "struct x86_serdev_info *" + idx.

This makes the x86_instantiate_serdev() prototype match
the x86_instantiate_i2c_client() and x86_instantiate_spi_dev() prototypes.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index affaffadd179..800d6c84dced 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -271,8 +271,9 @@ static __init int x86_instantiate_spi_dev(const struct x86_dev_info *dev_info, i
 	return 0;
 }
 
-static __init int x86_instantiate_serdev(const struct x86_serdev_info *info, int idx)
+static __init int x86_instantiate_serdev(const struct x86_dev_info *dev_info, int idx)
 {
+	const struct x86_serdev_info *info = &dev_info->serdev_info[idx];
 	struct acpi_device *serdev_adev;
 	struct serdev_device *serdev;
 	struct device *ctrl_dev;
@@ -446,7 +447,7 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 
 	serdev_count = dev_info->serdev_count;
 	for (i = 0; i < serdev_count; i++) {
-		ret = x86_instantiate_serdev(&dev_info->serdev_info[i], i);
+		ret = x86_instantiate_serdev(dev_info, i);
 		if (ret < 0) {
 			x86_android_tablet_remove(pdev);
 			return ret;
-- 
2.47.0

