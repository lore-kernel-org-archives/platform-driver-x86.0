Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4900188A3B
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733340899; cv=none; b=l3S9bb6coanKrMIR8B4oc3JGbPJpqldKdIK150b04dku9TPoG9nGnmY2JeQCmiWlqvmwar22u1p0ypiJ3In0zZ/yFEo+oPtB2fdgFc7KNhVPQwFTdeack4DrV6tJ8lTabA7Y9OTIcPYBllYHf3IIZik/aHrv0ZTltwfiw46BLts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733340899; c=relaxed/simple;
	bh=kh5SWpzrzd8M0++tHbyJUAV2WMNoxmG3tyDR6S+xDQo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIEiWbaLujxUHFU+Zp98W5lbRn0X5VN+b9yfJkjZDR4T07fcdswoHPoeKLqVoW4wMnZr69z3rdx3GuQTc166DLKhleKIEphldHsLc4HFvgz6CjWbAqTWkB2a/kXEJU3TbleQ9/mF/uJh4+h3qZ/drfcMUoD1hSnPgegIHJkWrlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lhl+dTco; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lhl+dTco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733340896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PtP+MxKVGxqaDMEOnTjU/IlmymFj6VP/1OD2iJu4C3s=;
	b=Lhl+dTcot32hKm9jcZp4vGJ5q0jtQ1Xi/PuWqrOUtMWFnqXVbuW0Z+yDo5S7wkzwyx4ua5
	FEZusppTA3tLOvDULeoUW7ndjCuMldwBGnKOcGVFRhDIMBiloFBdYhV2kPH4BRRjnCoIO3
	30dgagekwa+dusgUOKrSfP4ryFBWNSc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-364-FsEvLW0sOxG3wtyOWc_t3Q-1; Wed,
 04 Dec 2024 14:34:55 -0500
X-MC-Unique: FsEvLW0sOxG3wtyOWc_t3Q-1
X-Mimecast-MFC-AGG-ID: FsEvLW0sOxG3wtyOWc_t3Q
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E98219560A2;
	Wed,  4 Dec 2024 19:34:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.11])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB25219560A2;
	Wed,  4 Dec 2024 19:34:51 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 0/2] platform/x86: Vexia EDU ATLA 10 pwrsrc and battery support
Date: Wed,  4 Dec 2024 20:34:40 +0100
Message-ID: <20241204193442.65374-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi All,

Here is v3 of my series to add support for having the bytcrc_pwrsrc driver
register a power_supply class device and adding a new driver for battery
monitoring using the Vexia EDU ATLA 10 EC.

Changes in v3:
- Use I2C_SMBUS_BLOCK_MAX instead of hardcoding 32 bytes as bufsize
- Add UPDATE_INTERVAL_JIFFIES define

Changes in v2:
- Makefile tweaks
- postfix variable/define names with units (e.g. _mV / _mAh)
- Replace i2c_smbus_read_i2c_block_data() with i2c_smbus_read_block_data()
  which takes care of the length byte prefixing the buffer for us
- Address other small review remarks

Regards,

Hans


Hans de Goede (2):
  platform/x86/intel: bytcrc_pwrsrc: Optionally register a power_supply
    dev
  platform/x86: x86-android-tablets: Add Vexia EDU ATLA 10 EC battery
    driver

 drivers/platform/x86/intel/bytcrc_pwrsrc.c    |  79 +++++-
 .../platform/x86/x86-android-tablets/Makefile |   2 +-
 .../x86/x86-android-tablets/vexia_atla10_ec.c | 261 ++++++++++++++++++
 3 files changed, 339 insertions(+), 3 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c

-- 
2.47.0

