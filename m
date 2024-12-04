Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC0F18F2E2
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344974; cv=none; b=BUam1iiftvAbsRTW2IUFcgfcEfTXk24hQpayWlPNwjd+OPSTjPUaSnxFLayVowyxgIRDgzlCaMAPmG5cFOfRMVxEC1xs07i5Q6DVW7n+ZdSxdKVgWcuyRQvuMpVwnqL5Cr6sHndzSVx/IA/aB8yUsuwwDZaybcc/JgxaG52S8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344974; c=relaxed/simple;
	bh=EfpK889Gu5Ppyf8BKV2OI40gcLme8fPMZSZ3E5SYqJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRvvmLlubCg135aOvB0J7vu1vB8izvoYJija847m5CgOMs8sXHip3NZSTOvo7Qw4q+a9+1F7pcWEdBigZCVG02ZlE75nUFyc84belXbn3E3eh3xvJ6L4UbO1jmNS9gKkjXvYfUhE+RaUWWZkWgtTTk95EE0A0Etg9w7G4LAI2vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CGAyOeQv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CGAyOeQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733344972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcBDUZ/mdS057p/M1A9V0EqrH5cG/uyiv7s28jrF7Ag=;
	b=CGAyOeQvZyJcnx9R2jp7warkA7Nktc6pMrNuZE5ysQ5WCSnhjpO17vAspWCRFpjNdEEWBD
	ORja2hnKhM3uRBrmS8V981MpqPfKYNSqkP7q4oxSTLaKI4N4l7lorMV0ut3iCkE/C/AlYq
	qN9dRrPzzmGfJQYct+zwStFwsswXiqA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-K9BscVupPcqwPXuqxxZNrg-1; Wed,
 04 Dec 2024 15:42:48 -0500
X-MC-Unique: K9BscVupPcqwPXuqxxZNrg-1
X-Mimecast-MFC-AGG-ID: K9BscVupPcqwPXuqxxZNrg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECD5F19560AB;
	Wed,  4 Dec 2024 20:42:47 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 99C571956094;
	Wed,  4 Dec 2024 20:42:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 5/8] platform/x86: x86-android-tablets: Change x86_instantiate_serdev() prototype
Date: Wed,  4 Dec 2024 21:42:16 +0100
Message-ID: <20241204204227.95757-6-hdegoede@redhat.com>
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

Make x86_instantiate_serdev() take a "struct x86_dev_info *" + idx as
arguments instead of a "struct x86_serdev_info *" + idx.

This makes the x86_instantiate_serdev() prototype match
the x86_instantiate_i2c_client() and x86_instantiate_spi_dev() prototypes.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
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

