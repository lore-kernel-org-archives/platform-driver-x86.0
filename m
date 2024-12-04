Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5307C3D0D5
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 20:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733344965; cv=none; b=WIy4hA6DykYy8XuPRXVd7itLlJu2r6m8JygsMMvpwAxTcCEpGsvt9sZfaUOPx5lcIJwVppaiTl6In8tc2Clia4xpPGZ+GweM+ggsHJxvY6dWT7t5HdP2qaVzGZ4/+EbMczUoBUWdawsGILecV+E1kvKnqjbMhx4ztvk6hv9UGFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733344965; c=relaxed/simple;
	bh=PaijjdoP1H8Ul83P3FUXm1uO+RKR9cUPglfGNGDrs0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lnVApgu7gFTw2mQL3zk8fHHNOw31TJr5iwoIdLT6HlyFLtvOmiI5jxGkoWO2KloklbvE/TcN4efpTZIHwXeXmEHGfyOExMQt6aYUSQKHljphNcNEXvyoCTzcQPevdILnwp4XGuXrXlzyyYJL/Poc47isWkYDGnoohGrNW1hQBpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NzlaY2jT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NzlaY2jT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733344962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xQQAO7odwhFIzVgnTMPbnzKCSV1fneUMKCZFGLx2nWY=;
	b=NzlaY2jTr5EvOxXHu1WeNzU7SHpROPowacc00WwqeB2YDWnORaUsf/azoIgoIJ9NWvUNI/
	oE4jwLw0CW4c0aq7xQjv48/Cepl95AkSgqhtHNEItWsZlhH80sqjgQyfQVEgHRY9iSc4Xq
	vYbEx/+IYW+zYllx6Y/MqlBKaGTKLl8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-464-dIhiUTF3MxOEvZ3fuWgBhg-1; Wed,
 04 Dec 2024 15:42:40 -0500
X-MC-Unique: dIhiUTF3MxOEvZ3fuWgBhg-1
X-Mimecast-MFC-AGG-ID: dIhiUTF3MxOEvZ3fuWgBhg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B2BA19560A1;
	Wed,  4 Dec 2024 20:42:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 171E61956095;
	Wed,  4 Dec 2024 20:42:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/8] platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU ATLA 10
Date: Wed,  4 Dec 2024 21:42:11 +0100
Message-ID: <20241204204227.95757-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi All,

Here is a patch-series for adding Bluetooth support for the Vexia EDU ATLA
10 tablet to x86-android-tablets.

Due to the LPSS UARTs being enumerated through PCI rather than through
ACPI, this is somewhat involved. Just like how this special case needed
some extra work for instantiating the various i2c-clients.

Changes in v3:
- Make the "platform/x86: x86-android-tablets: Add missing __init to
  get_i2c_adap_by_*()" bugfix the first patch in the series
- Add 2 more bugfixes as patches 2 - 3

Changes in v2:
- Use a union in struct x86_serdev_info which stores either ACPI HID + UID
  or the PCI devfn of the serdev-controller

Regards,

Hans


Hans de Goede (8):
  platform/x86: x86-android-tablets: Add missing __init to
    get_i2c_adap_by_*()
  platform/x86: x86-android-tablets: Make variables only used locally
    static
  platform/x86: serdev_helpers: Check for serial_ctrl_uid == NULL
  platform/x86: serdev_helpers: Add get_serdev_controller_from_parent()
    helper
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
 .../platform/x86/x86-android-tablets/other.c  | 16 ++++-
 .../x86-android-tablets/x86-android-tablets.h | 13 +++-
 6 files changed, 85 insertions(+), 43 deletions(-)

-- 
2.47.0

