Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872AD1B414A
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 18:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746643676; cv=none; b=Trauqg8/c5UhO2Bf1jQMrFQj4H2fpknhZV3egcZYvWwGtNThk+Zboie+uMFI43D+rhylFk5X5GGjnQDMLukYG+6oki1PMlBfq07KxspkxNk8btXsZR5oewIuOQxQYqzanFj+gu9odWTTSemmcwV1MEAftCm24uoe0dEEqXqBDAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746643676; c=relaxed/simple;
	bh=Ix+ixCRYX7nhf54621iyda7H0xVjnd+96PAL2peFtNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AeLpWOjDSNCyFOpvgzWSzr4P0VrdqDMbZjPAcA3mqQnLA2Y3LP1g153O+hW4nqE/dp2Itl7GmRRkc7j3WwiT6zwTuMih4gMYSp+eGyLACHbUknhRMZ1FDeL9WQHR7gF2R38G3pamaYdEdQ12DCp9xhDLwPS0Adv/NBWdSPbNhNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eGui7Hxv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eGui7Hxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746643673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DQ1MeujzY80NlUXgSlBSkAf4IDE/Iof+2Qm5wM8j44g=;
	b=eGui7HxvicBdor2jMkGOyicKdh6puKBXg7s542aOZ3nj+KA/eD7gykv2syKXA2NOmkrGQf
	TGuLvfOpM/yw6z+V662JRbPetTRnAE20uAI/3vrUANnjblaa/5b8ND/8xpKO7EVuhhv2+K
	XJwz5XcXZdu1ThyOMsog2z4u3aAVPbo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-EFz21W8-NUie05BQa1T5vA-1; Wed,
 07 May 2025 14:47:51 -0400
X-MC-Unique: EFz21W8-NUie05BQa1T5vA-1
X-Mimecast-MFC-AGG-ID: EFz21W8-NUie05BQa1T5vA_1746643670
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E4F8D1800374;
	Wed,  7 May 2025 18:47:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2B45E30001A1;
	Wed,  7 May 2025 18:47:46 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO mapping in atomisp
Date: Wed,  7 May 2025 20:47:31 +0200
Message-ID: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi All,

This patch series does some small refactoring of the int3472 code to allow
re-using the sensor GPIO mapping code in the atomisp driver and then the
final patch in the series moves the atomisp driver over.

About merging this, maybe the int3472 patches can be merged in time for
the 6.16 merge window and then the atomisp patch can be merged after
6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
5 patches will be necessary.

Regards,

Hans


Hans de Goede (6):
  platform/x86: int3472: Move common.h to public includes, symbols to
    INTEL_INT3472
  platform/x86: int3472: Stop using devm_gpiod_get()
  platform/x86: int3472: Export int3472_discrete_parse_crs()
  platform/x86: int3472: Remove unused sensor_config struct member
  platform/x86: int3472: For mt9m114 sensors map powerdown to
    powerenable
  media: atomisp: Switch to int3472 driver sensor GPIO mapping code

 MAINTAINERS                                   |   1 +
 .../x86/intel/int3472/clk_and_regulator.c     |   9 +-
 drivers/platform/x86/intel/int3472/common.c   |   9 +-
 drivers/platform/x86/intel/int3472/discrete.c |  28 +-
 .../x86/intel/int3472/discrete_quirks.c       |   3 +-
 drivers/platform/x86/intel/int3472/led.c      |   3 +-
 drivers/platform/x86/intel/int3472/tps68470.c |   3 +-
 .../staging/media/atomisp/pci/atomisp_csi2.h  |  17 --
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 239 ++----------------
 .../staging/media/atomisp/pci/atomisp_v4l2.c  |   1 +
 .../linux/platform_data/x86/int3472.h         |  16 +-
 11 files changed, 76 insertions(+), 253 deletions(-)
 rename drivers/platform/x86/intel/int3472/common.h => include/linux/platform_data/x86/int3472.h (92%)

-- 
2.49.0

