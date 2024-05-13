Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A1D211C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 May 2024 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715611572; cv=none; b=Qg4rtcq8HimXBYqS+mULTvhz12oqp0PDhJsuWEMlFlddipyelnIlvtf7SQ2EIRuZ9+wTqZcx4jVf3xg9xQW/BxwnefWrgoJT9Uy3Fo1IQTrreSlh9X4kbg2A8yeDtXU4guvC8wlA3DGIy3MpHcJga3fb71GSUTX9DacUVjxA5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715611572; c=relaxed/simple;
	bh=GqHMqYYz4u91XU95tFlSplYGsynHar61rRD9yo3eYHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PAO7f9kyfbWUZHcML0Nw0pP5QK3Jlvsagn4acWtWAHZToKKBO3TVF6ib3WAiBhDkty95twUgH9IXOzuwpxzxiRN+OB4qIlTpo3VhpSFBseKqGRXPPDyN8Q41LzAWy1wKBA1w7Re6zMeE1LVHNeueVX2r7Dy/hxvHKKhTKQmdsnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N4cmnqJ3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N4cmnqJ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715611569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IKXOXMurd+0ZSBa0cQPZ8qOFHaLuzzkE+SWRzsmBZB0=;
	b=N4cmnqJ32ng4ySNcM4E9sdwzY9F+UAVfVbLuBV5HjsmZ3FNhJzt7Tt2z4yX5QTUfJeHJTZ
	edeVhApX/1kQPPkmVYnKQRaPm/Ey3V+K5prRQ6THx5RpFKgu0wuM176KHHRjKJzKVI5MoU
	3UAtwens00nw8Dc/dpd7W64/Lf6m6Rs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-OsC8BiXmO8q53t5dseyK1A-1; Mon, 13 May 2024 10:46:06 -0400
X-MC-Unique: OsC8BiXmO8q53t5dseyK1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FD838016FA;
	Mon, 13 May 2024 14:46:06 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD7A72026D6E;
	Mon, 13 May 2024 14:46:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	AceLan Kao <acelan.kao@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Roman Bogoyev <roman@computercheck.com.au>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/2] platform/x86: Add new Dell UART backlight driver
Date: Mon, 13 May 2024 16:46:00 +0200
Message-ID: <20240513144603.93874-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

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

Changes in v3:
- Rework dell_uart_bl_receive() loop (based on suggestions from Ilpo)
- Address some more review remarks from Andy

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
 .../platform/x86/dell/dell-uart-backlight.c   | 398 ++++++++++++++++++
 .../dell-uart-backlight-emulator/.gitignore   |   1 +
 .../x86/dell-uart-backlight-emulator/Makefile |  19 +
 .../x86/dell-uart-backlight-emulator/README   |  46 ++
 .../dell-uart-backlight-emulator.c            | 163 +++++++
 7 files changed, 643 insertions(+)
 create mode 100644 drivers/platform/x86/dell/dell-uart-backlight.c
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/.gitignore
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/Makefile
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/README
 create mode 100644 tools/arch/x86/dell-uart-backlight-emulator/dell-uart-backlight-emulator.c

-- 
2.44.0

