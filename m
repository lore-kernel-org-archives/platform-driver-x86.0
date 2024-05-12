Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C474F2576E
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 May 2024 16:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715531047; cv=none; b=PmBoHvHTzlPxEtUKBwTLiZ3y7ZzJksQvtsk3XJ6aRfUZ0l8pAVDWdSJaDOY1d8rNk46wd+qAR2BAfYRHMZiiXpgzORbE8Cm/zUFtD74FXqfcLSKcvubbJUYc6LYk5OZdK36zeu6aZ4mQtGz+I6uav2BKmdauJWOlzUZAWVlwPZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715531047; c=relaxed/simple;
	bh=VSuYcVXARQhtCB32D2A1ORwhEPkNloYtX/BTRJ2D6H4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rNzBd4xWfLycFVhHNpG/G9J+jtap2W1JjPaec0UNkGL69IgTYlrdY1ykXHbB2gL4LVxA6HxHYUbThMq7d369nJMisQE3ALsqboYMscx8Zneh3/wafqQrwS9klXGqBR8jW+pLELuEG7a47BK3A1exUMrH2r4n35OnHL0txANSVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y7wCSuzd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y7wCSuzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715531044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/ddAlNROTuHvvYZgc/WMbKnty1GcIypmkdCGPlRw7E4=;
	b=Y7wCSuzdJ2LxCUiylriYaI97GDFNeHG+/wmT7WouMn0yDKhA6VubYNeyv9Ny4bdceGKqF1
	hf/FX8FQLpe6MAODsNVSUHTSheU8s1Vy8LEF9lcjtLCzuDZf7BPMhcXslSNbwhc78wLVzQ
	cK6ZRSZPhxsUPO/Yihhez3ToczepSfg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-182-QrhKa4D0NU2ubF9vXlVbyg-1; Sun,
 12 May 2024 12:24:00 -0400
X-MC-Unique: QrhKa4D0NU2ubF9vXlVbyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7142B3801EC5;
	Sun, 12 May 2024 16:24:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.46])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4228D966;
	Sun, 12 May 2024 16:23:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	AceLan Kao <acelan.kao@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: Add new Dell UART backlight driver
Date: Sun, 12 May 2024 18:23:50 +0200
Message-ID: <20240512162353.46693-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1

Hi All,

I recently learned that some Dell AIOs (1) use a backlight controller board
connected to an UART. Canonical even submitted a driver for this in 2017:
https://lkml.org/lkml/2017/10/26/78

This UART has a DELL0501 HID with CID set to PNP0501 so that the UART is
still handled by 8250_pnp.c. Unfortunately there is no separate ACPI device
with an UartSerialBusV2() resource to model the backlight-controller. An
ACPI quirk has been merged recently to deal with this and create a serdev
controller for the UART despite the missing UartSerialBusV2() resource:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=99b572e6136eab69a8c91d72cf8595b256e304b5

Patch 1 in this series adds a driver binding to the "dell-uart-backlight"
device created by this quirk. This drivers creates a serdev-device for
the DELL0501 serdev-controller and registers a serdev backlight driver
which binds to this serdev-device.

Patch 2 contains a small emulator for the UART attached backlight
controller found on this Dell AOIs, I wrote and used this to develop
the driver since I did not have access to such an AOI myself.

This has been successfully tested by Roman Bogoyev (who originally
reported the missing driver to me by email) on a Dell Inspiron 27 7000
(7790) and by Kai-Heng Feng on a newer Dell AOI model.

Regards,

Hans

1) All In One a monitor with a PC builtin


Hans de Goede (2):
  platform/x86: Add new Dell UART backlight driver
  tools arch x86: Add dell-uart-backlight-emulator

 drivers/platform/x86/dell/Kconfig             |  15 +
 drivers/platform/x86/dell/Makefile            |   1 +
 .../platform/x86/dell/dell-uart-backlight.c   | 409 ++++++++++++++++++
 .../dell-uart-backlight-emulator/.gitignore   |   1 +
 .../x86/dell-uart-backlight-emulator/Makefile |  19 +
 .../x86/dell-uart-backlight-emulator/README   |  46 ++
 .../dell-uart-backlight-emulator.c            | 166 +++++++
 7 files changed, 657 insertions(+)
 create mode 100644 drivers/platform/x86/dell/dell-uart-backlight.c
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/.gitignore
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/Makefile
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/README
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c

-- 
2.44.0

