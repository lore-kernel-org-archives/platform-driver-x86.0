Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B212E5B
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771343; cv=none; b=iq2pGWD7oISrKVaao4a0q1GKWqo6hZ7EXUk0Z+qBfAgq4bpo7pai3zcf79zzvj+pL5O7VBKFe0R8Zfc2f0Pi/PT8AFBwipALKEh5LHm5zYH2W0H1Y/obFgihBCBaVHq0VMfR74qQ2T8lialdNE13EyweRZqxuM6QZLlJWOFXIKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771343; c=relaxed/simple;
	bh=4P+t5WhWHQpztXrXSZODlY3bYojb0wwi+vLqWPF85JE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1zpS/T13xDfx6zyrmEpZQ1byQROrKYhESOJ7oIbmjXe4lVIcNhFJzFQAY4jmq8NvFdH9oJkR9Jzgn44F2J2OtPLWSk/8RO10nHPCv9DHgnzscdCF8CXZrkJr/2r7YmBzqjXNmJV8oYm1Zj0fAMGFi5/0hdpXiM+LwqavG5Dfg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XOgkigaC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XOgkigaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731771339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Hc2sxQquns0++EKgGFnYF6aV/LKMe8e3Nyj6z2lRio=;
	b=XOgkigaC08Dfsd7wtelLEVmA5iTgmE9L+GidxcFstIYaaljex2usZL70P5dp1hB2SgEijG
	e33JqIyecZYiLws9mUBTgcG4dslKjW2rqIYW3hAu8REI8KghdqNYbnJ16u1m9ZxHqp6xBu
	VZcxVx1U3TVMMHnS0CBbORrF1r1wAQg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-dvactWl0OE-bAZ5Qs75dlQ-1; Sat,
 16 Nov 2024 10:35:37 -0500
X-MC-Unique: dvactWl0OE-bAZ5Qs75dlQ-1
X-Mimecast-MFC-AGG-ID: dvactWl0OE-bAZ5Qs75dlQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A7EF19560B1;
	Sat, 16 Nov 2024 15:35:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A17851956054;
	Sat, 16 Nov 2024 15:35:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/6] platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU ATLA 10
Date: Sat, 16 Nov 2024 16:35:27 +0100
Message-ID: <20241116153533.84722-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hi All,

Here is a patch-series for adding Bluetooth support for the Vexia EDU ATLA
10 tablet to x86-android-tablets.

Due to the LPSS UARTs being enumerated through PCI rather than through
ACPI, this is somewhat involved. Just like how this special case needed
some extra work for instantiating the various i2c-clients.

Changes in v2:
- Use a union in struct x86_serdev_info which stores either ACPI HID + UID
  or the PCI devfn of the serdev-controller

Regards,

Hans


Hans de Goede (6):
  platform/x86: serdev_helpers: Add get_serdev_controller_from_parent()
    helper
  platform/x86: x86-android-tablets: Add missing __init to
    get_i2c_adap_by_*()
  platform/x86: x86-android-tablets: Change x86_instantiate_serdev()
    prototype
  platform/x86: x86-android-tablets: Store serdev-controller ACPI HID +
    UID in a union
  platform/x86: x86-android-tablets: Add support for getting
    serdev-controller by PCI parent
  platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU
    ATLA 10

 drivers/platform/x86/serdev_helpers.h         | 60 +++++++++++--------
 .../platform/x86/x86-android-tablets/asus.c   |  4 +-
 .../platform/x86/x86-android-tablets/core.c   | 31 +++++++---
 .../platform/x86/x86-android-tablets/lenovo.c |  4 +-
 .../platform/x86/x86-android-tablets/other.c  | 12 +++-
 .../x86-android-tablets/x86-android-tablets.h | 13 +++-
 6 files changed, 83 insertions(+), 41 deletions(-)

-- 
2.47.0

