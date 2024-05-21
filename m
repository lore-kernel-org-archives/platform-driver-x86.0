Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C425490A
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 May 2024 09:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716284871; cv=none; b=blIoxjMwMxBV+DGPdd870TcwyqkQGBxZ7Cj202oxgMhQMMeE2tFIRTTDUOJbgB8HGvXrzP+CrXNDFG0leaQ7fSs+6a60GQJDSfhoUrHVdvl1kA0Ot8L1E1gtoeqhfw/hvvJCREz1en9KzqXuEzugGyeGq61wME33pbNteIskLJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716284871; c=relaxed/simple;
	bh=eR2bzeVzdKiW/sq9TJGn1L88nYRETFSMiQoukzUJo3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8S3j2KIdBrOIdIM21n4o0VFFny1Ad1zecRouNOeQnVhiDgY+9d8rAdcGhx1uWqWrQu5sN+8Pa/lhSk4BopTQReA7A7Y6AjeWf9zeaTbNMVzuPjX6e5Yq0Hnc7DTu9S9VGdpnKs6KbwraxL5fEiBOk6PGaiS5rfvePN7kdAynHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YVB7614s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YVB7614s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716284868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3aP6+dA1fCehw7X6qbGd9+enjosG8XNi2EJd1Osp0EM=;
	b=YVB7614sBBbG1vgs0kpAeu8IwqcMW6TsjaUDZM36QzUk0sRxDj1bpz3e8gIS47M14pIXfm
	sg3wzgcz2s2UateQri5Tg+xaeShA6ahRg5UmIWycYBZFikbp7sj/8KT7frxhUMSjP/o+II
	RaR3fKFMJGwrHodPoCYUl0sKLmQpGbc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-436-nx2mQkSHPnmV0DEP1l2i4A-1; Tue,
 21 May 2024 05:47:43 -0400
X-MC-Unique: nx2mQkSHPnmV0DEP1l2i4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D38529AA385;
	Tue, 21 May 2024 09:47:43 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.153])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E5C22026D68;
	Tue, 21 May 2024 09:47:42 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: x86-android-tablets: Add "select LEDS_CLASS"
Date: Tue, 21 May 2024 11:47:41 +0200
Message-ID: <20240521094741.273397-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Since the x86-android-tablets now calls devm_led_classdev_register_ext()
it needs to select LEDS_CLASS as well as LEDS_CLASS' NEW_LEDS dependency.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405182256.FsKBjIzG-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
index 6603461d4273..b591419de80c 100644
--- a/drivers/platform/x86/x86-android-tablets/Kconfig
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -6,6 +6,8 @@
 config X86_ANDROID_TABLETS
 	tristate "X86 Android tablet support"
 	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB && PMIC_OPREGION
+	select NEW_LEDS
+	select LEDS_CLASS
 	help
 	  X86 tablets which ship with Android as (part of) the factory image
 	  typically have various problems with their DSDTs. The factory kernels
-- 
2.45.1

