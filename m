Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42B14B95F
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715598960; cv=none; b=mo5dU2+zV/HgQgSX7yasEdiN+LfTsvAhpGtKTr+jhhDIrb8mkJs1g0xDc0XLNZ8PE5i2LbXHBqzFUo4RNQo1l3EixVh1Lw/AhO4/OJQ3dqPeSON8nadjBBowzK7akvovfBkJ9HyHq7UKDv24I5thqBHgwwm4l17xX1DLtKfEi+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715598960; c=relaxed/simple;
	bh=SrlazT0Gr+VT8D4LStwJToLUXfi52mQ49MDrSeeezKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/ZLiLKkdznLZY9DwZXarhGVOJrKO7OY9aSWGzEkg5uXoxcZ4Gjac09v+2TzmewoFHXvFrKhiwtQ+gs3LC86Fs/eKWo3Xo57IvWYYgFms1+k2WhrhD49mzBIsNzyMOfKpuI/oEDVpeKyjDuN7O5Y7fQDiQVJotrQIoM071PekJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JezNj2wE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JezNj2wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715598957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zvSHopbQ6J2Qr1m0wX+6bsGhXrCtFTmoUJNyrI0jtNY=;
	b=JezNj2wEjBtq5t3yrjCFgNDkxFwkdewO4pVSp1XhNwdrEbFcw/hOCwzVEe/Qr8D8PGzrZG
	WV3FtfsCXRiYVeRvyIKR1ZP5m3+GpT+p1r1TizxeXczCQlvqV7EHN5OJJEY4bxgC1oFeaf
	VYiJT4F5EJzZMgfJHHfvj4jsAlficYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-cunMcFMHNnWbwQ_pSNZEww-1; Mon, 13 May 2024 07:15:56 -0400
X-MC-Unique: cunMcFMHNnWbwQ_pSNZEww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BDCA80027F;
	Mon, 13 May 2024 11:15:55 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A27A40C5C6;
	Mon, 13 May 2024 11:15:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	AceLan Kao <acelan.kao@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: Add new Dell UART backlight driver
Date: Mon, 13 May 2024 13:15:49 +0200
Message-ID: <20240513111552.44880-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

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

Changes in v2:
- Address all the review-remarks Ilpo and Andy had on Patch 1/2,
  thank you for the extensive review Ilpo and Andy

Regards,

Hans


Hans de Goede (2):
  platform/x86: Add new Dell UART backlight driver
  tools arch x86: Add dell-uart-backlight-emulator

 drivers/platform/x86/dell/Kconfig             |  15 +
 drivers/platform/x86/dell/Makefile            |   1 +
 .../platform/x86/dell/dell-uart-backlight.c   | 409 ++++++++++++++++++
 .../dell-uart-backlight-emulator/.gitignore   |   1 +
 .../x86/dell-uart-backlight-emulator/Makefile |  19 +
 .../x86/dell-uart-backlight-emulator/README   |  46 ++
 .../dell-uart-backlight-emulator.c            | 167 +++++++
 7 files changed, 658 insertions(+)
 create mode 100644 drivers/platform/x86/dell/dell-uart-backlight.c
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/.gitignore
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/Makefile
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/README
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c

-- 
2.44.0

