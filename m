Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4DF135A65
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708114656; cv=none; b=VYW7+NGBXreqblNVBAi4q9k+hp/tHW/S7t8IzhHfaXsy+c0ZShUdz2xZx5K03SOvJ2UrnjoBtF3DAhtfmZnPTI7GCTSuWWzszor27n7O0OWOGXQHFmmSLNfECiKZiZpcklEuEaP3CEcI3qkQFzAsa0/Lx/8iwrue4foixkBEZt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708114656; c=relaxed/simple;
	bh=DcAmIHRc6vBVkSMsM0z3r3f7GNAhjxQE4Oy60KdFOEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g73LYmxExN/GvGQQ+3zYELH0opxAJqPIHRJENYKPW3j5zysx1AFSJdEGnYmMpTBi4i5YVtM7R/gyFjoMidgqUjx8Rxmcl2+CqrWjAAcBm4uBZtt0wD0v7YseA3oP7HJUaEBT1zjUkKxjRf8OdpVSrYTx7ZzN+aRhH9okl7Hn5G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YUMR2Dw3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YUMR2Dw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708114654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UP+Xl9qB429XjpqV58tIo1e4Run18WYtjMdYtzljZlc=;
	b=YUMR2Dw35skw183LJU/UdlVUMyece/2B7tcQ5s0upmRjB+SEYS36oAu+nRVeF4BPDgGrn3
	djg1hqYJ2masOAIg2HYin7q8IZQayr7Tzl9F60leNZR4uLVNw+IcGFF4RgVpeRESCTXC0N
	VPDtHrbcUoR1lUz5IHa50M0QLshETn0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-odJjpy6mMmm_cSJSNr88uQ-1; Fri, 16 Feb 2024 15:17:30 -0500
X-MC-Unique: odJjpy6mMmm_cSJSNr88uQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57B9C83B7EB;
	Fri, 16 Feb 2024 20:17:30 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A8AE72166AE9;
	Fri, 16 Feb 2024 20:17:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/4] platform/x86: x86-android-tablets: 2 regression fixes
Date: Fri, 16 Feb 2024 21:17:17 +0100
Message-ID: <20240216201721.239791-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Hi All,

This series fixes 2 recent regressions in the x86-android-tablets code

Patch 1: Fixes the Goodix touchscreen in the Lenovo YogaBook1 X90
         no longer working in 6.7 and 6.8
Patch 2: Is a prep patch for manual serdev instantation failing on 6.8
Patch 3: Fixes manual serdev instantation failing on 6.8
Patch 4: Is just a rename of a single variable

Patches 1 - 3 are actual regression fixes and patch 4 although not
technically a bugfix is trivial. So to keep things simple I plan
to merge this entire series through the fixes branch.

Regards,

Hans


Hans de Goede (4):
  platform/x86: x86-android-tablets: Fix keyboard touchscreen on Lenovo
    Yogabook1 X90
  platform/x86: Add new get_serdev_controller() helper
  platform/x86: x86-android-tablets: Fix serdev instantiation no longer
    working
  platform/x86: x86-android-tablets: Fix acer_b1_750_goodix_gpios name

 drivers/platform/x86/serdev_helpers.h         | 77 +++++++++++++++++++
 .../platform/x86/x86-android-tablets/core.c   | 38 +++------
 .../platform/x86/x86-android-tablets/lenovo.c |  1 +
 .../platform/x86/x86-android-tablets/other.c  |  4 +-
 .../x86-android-tablets/x86-android-tablets.h |  1 +
 5 files changed, 93 insertions(+), 28 deletions(-)
 create mode 100644 drivers/platform/x86/serdev_helpers.h

-- 
2.43.0

