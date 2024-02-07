Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555825573
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Feb 2024 06:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707286255; cv=none; b=I3g4pCm27pKIHypkq1K/UgV5tM5leaNRedQQMCBI26nR50EKnsZERuvKBYqfges3DlOcUPtVz+Vrkz63SS2GfMHWzVmrpls22/gqVclUNc+qsmCougM4yLy6AB/Q749RnVsUopTH18m/dF4tTqXAGWpY/dzSbxOY9EUon7fge7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707286255; c=relaxed/simple;
	bh=L35QMpEsdoDCMyjRk0YIWhnb7h4Fbiw8wggB3TGNW0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hY/PJz1T3jX0PCpkWac2HmFAyPLX/pkz/RjpzZacaHBiKaSwQ+rtNTCI10UUAbvLdyGGEld+1iku3VuhkcCtJZzsMA5SObNeMtLdnXAVYaXrcc8CykqWDAQORl4ciwkSFZHFN1j545pukv/6EUrNZs/Ph72ZEml0zjpeR5tI564=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fnRU6vIO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fnRU6vIO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707286252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nQ115fx9zHrutsWrwrQXur/1A7qSlZzNjkAaOamyOZA=;
	b=fnRU6vIOkNAdT7zUep+beFMQ4i0KjRU8vc3UrNUyWhjUjNRXXYdUaNvtF/qfe2FVud2G0e
	QWr+bgUp/tfk3wg0sCtnXh3PtSZUndTUFeVwFui3dnDGeM7asXMUQEcOZqZSt+6BWtWvj9
	5KX5n3HBpiYJ9hsyzBWaagS0kIMvBho=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-OSQKT60zNpaxyv92lEr_4Q-1; Wed, 07 Feb 2024 01:10:48 -0500
X-MC-Unique: OSQKT60zNpaxyv92lEr_4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CADDC811E81;
	Wed,  7 Feb 2024 06:10:47 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.240.8])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB86C1C0652C;
	Wed,  7 Feb 2024 06:10:44 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 0/2] KTD2026 indicator LED for X86 Xiaomi Pad2
Date: Wed,  7 Feb 2024 14:10:04 +0800
Message-ID: <20240207061006.407066-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

This patch added the support for Xiaomi Pad2 indicator LED. This work
included two parts.
1. Added the KTD2026 swnode description to describe the LED controller.
2. Migrated the original driver to fwnode to support x86 platform.

Moreover, the LED trigger is set to bq27520-0-charging for Xiaomi Pad2
so the LED will be turned on when charging.

Kate Hsuan (2):
  platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
    indicator LED
  leds: rgb: leds-ktd202x: Get device properties through fwnode to
    support ACPI

 drivers/leds/rgb/Kconfig                      |  1 -
 drivers/leds/rgb/leds-ktd202x.c               | 68 ++++++++++-----
 .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h |  2 +
 4 files changed, 132 insertions(+), 24 deletions(-)

-- 
2.43.0

