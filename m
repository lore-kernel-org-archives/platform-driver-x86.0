Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D81802
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Mar 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820670; cv=none; b=K47azfYp+yiAg9HxjEOBqfFo+IeBnqQvPIsWccGcvz/xsMJBwPvPLIjQcE7JBqt5YiLNXXnwZPr+cwREH5V8G1FRedHnMikWp+ez01BrbSSuO09dkuUfW0VGs9zdEvtjQqk4OfQQ/Rm7lxQ1qt4uAzvUszWNjRPgUu8OYKgG/z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820670; c=relaxed/simple;
	bh=CMIkr3Iu3NnPSzF9rH7WJRFSWObAbxCpYFtYRivtXCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WoKqE10WMItE5/DF0Fq2PcvlQOkkW+/4BnHTAXWapCzJSUtGzLxFeJV3TS2mFZiTqDvsaKaON/2OYS+mVDCway+RfUA3VpPKKroI8OiqElWdd2Ai7Pe9L70QNB2ya/+54BadrDjAgjx2RRm1fH99jlYju8SqW4yIyWyYvmuRnyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YDX1Zoy7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YDX1Zoy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742820667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hv9vtfaJTSuyYXXbr17OxMEjZMqEkRmCXZ0wqLg5SVw=;
	b=YDX1Zoy7znQ0m5F25PJBiu2ITtYGAcPDZFenxAOme763qW2iUNKuUm+/Q+MDsZ2/GTyVaG
	asFoe8jsI3tZQ9L48dfYGoJqdhNp9hXa3Kr5blz89ljCOcujaxTyBjgCPEM7iy8rYbaLH9
	9mktgtlfPSvnnDuYXQrI8qxrXQozoNE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-d8vMzQQmNYCR9O1ZywwG8A-1; Mon,
 24 Mar 2025 08:51:04 -0400
X-MC-Unique: d8vMzQQmNYCR9O1ZywwG8A-1
X-Mimecast-MFC-AGG-ID: d8vMzQQmNYCR9O1ZywwG8A_1742820663
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 867DC180AF4C;
	Mon, 24 Mar 2025 12:51:03 +0000 (UTC)
Received: from x1.redhat.com (unknown [10.44.33.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 088511801752;
	Mon, 24 Mar 2025 12:50:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] platform/x86: x86-android-tablets: Add select POWER_SUPPLY to Kconfig
Date: Mon, 24 Mar 2025 13:50:52 +0100
Message-ID: <20250324125052.374369-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Commit c78dd25138d1 ("platform/x86: x86-android-tablets: Add Vexia EDU
ATLA 10 EC battery driver"), adds power_supply class registering to
the x86-android-tablets code.

Add "select POWER_SUPPLY" to the Kconfig entry to avoid these errors:

ERROR: modpost: "power_supply_get_drvdata" [drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.ko] undefined!
ERROR: modpost: "power_supply_changed" [drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.ko] undefined!
ERROR: modpost: "devm_power_supply_register" [drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.ko] undefined!

When POWER_SUPPLY support is not enabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503231159.ga9eWMVO-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
index a67bddc43007..193da15ee01c 100644
--- a/drivers/platform/x86/x86-android-tablets/Kconfig
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -10,6 +10,7 @@ config X86_ANDROID_TABLETS
 	depends on ACPI && EFI && PCI
 	select NEW_LEDS
 	select LEDS_CLASS
+	select POWER_SUPPLY
 	help
 	  X86 tablets which ship with Android as (part of) the factory image
 	  typically have various problems with their DSDTs. The factory kernels
-- 
2.49.0

