Received: from sender4-pp-g124.zoho.com (sender4-pp-g124.zoho.com [136.143.188.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD8F2FF65F;
	Tue, 10 Feb 2026 19:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770751195; cv=pass; b=AAi2B1r9fzNDaMU5YyZEHyiqRWeaY9WsLviaefG7WTfEPzcXKRrm89vgyStGmlkQtC2Cicz3EUTOnXUCt4eWu9MGCJKLNoYrCkdz4+jhNjIJNDC28zhlhLSCwITRae+p6Z9tHP9luYgipsqqR/xpzDwzS8VwQ/O4yl4+8iJXiwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770751195; c=relaxed/simple;
	bh=a9fJkaLus/cgeXhxO1QPufAA7z5qilh4c9K1V/6vaPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XB6ku8pbvWWYgMJi1eHeJv0n38fF7TVMd5GY4EZWtFv/cLFzcxRVt/1qlzGiitiSrzwilUaBkyKy+ZSaF2AlXK7Kf9ZfFOr73wdDxGtJByfk0hWOqdqcKUTEm1wkI/piLvcATmftBDpkXIa61R6IGgmd7YgAyKUD1rQ6moblwqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=dNk4tEHD; arc=pass smtp.client-ip=136.143.188.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="dNk4tEHD"
ARC-Seal: i=1; a=rsa-sha256; t=1770751186; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jbPaNxvL+4H1QXJDQ40UIc3ZkiDdofyDBzZ+3BlbBTw+O9/aYs8fH7hSvrBhup2ZZXSAlirnkhDKObk8q6RjuEQ6Bd6oNuUgtxRZJXlZwkzFQC5EerFUFtj2X+LIm8oYL4B8cJeQSBGoB42naEIkH3S6yZGfsz2pjax/1/7suII=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770751186; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MAPfbzlJu88VuYw/nOo01dRo+wGuE2qJFY0CnGTruUc=; 
	b=eRHJn1mVXPUGVuQTMraSpVicKopfPUtrejOHoEQ+1xo+vVwOE/fFoi+UgLhpdGYyG07cBU2vU4oMks+byO2k8r+Oz+DMUSyzKvs6fM5R/LlqQTKYmS/kvLilPTJLIhv4RKUMnMdeaogiidjplljFQpUqbjTgTVnFOCnCObpWnyc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770751186;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MAPfbzlJu88VuYw/nOo01dRo+wGuE2qJFY0CnGTruUc=;
	b=dNk4tEHD1yVDXUfL0orFmOi6rWZ89RULAnP8F7WBLPD731ZijDdAkE1B7TaftyV+
	g1GUNNEOblz/AZsauIUoOhHVDniYoqyxZxEyrmMeP2pVxnb47MAQWxWoGgy8uEiSfSM
	hexwJRVL/5ELyIoixJ1Oc6PmqXYmxmI1P02Naz8Ox8snVnpSzsrHvroIT8kVpfOOA63
	6S064ZiRDjFcPT6OtUdk7njn4OtGxK94BK11nHpAVutvRgUdF/K2XDFvFKvxHMHoGFE
	LRhtJfg7ZMXjeMPythh4digIpxV8uQyKw5hMEOGNNeAXSCsNVjr2xdHj21Ewp0TfdBJ
	dqYA/Khgkg==
Received: by mx.zohomail.com with SMTPS id 17707511831631010.491597866456;
	Tue, 10 Feb 2026 11:19:43 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
Date: Wed, 11 Feb 2026 03:19:35 +0800
Message-ID: <20260210191938.137234-1-i@rong.moe>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The Lenovo GameZone/Other interfaces have some delicate divergences
among different devices. When making a bug report or adding support for
new devices/interfaces, capdata is the most important information to
cross-check with.

Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users can
dump capdata and include it in their reports.

The output is like:

  LENOVO_CAPABILITY_DATA_00[0]:
    id:             0x00010000 [dev:  0, feat:  1, mode:  0, type:  0]
    supported:      0x00000007 [ RWV]
    default_value:  0

  LENOVO_CAPABILITY_DATA_01[0]:
    id:             0x00000000 [dev:  0, feat:  0, mode:  0, type:  0]
    supported:      0x00000000 [    ]
    default_value:  0
    step:           0
    min_value:      0
    max_value:      0

  LENOVO_FAN_TEST_DATA[0]:
    id:             1
    min_rpm:        2200
    max_rpm:        5000

A helper function for creating per-devcie debugfs directories is also
introduced into lenovo-wmi-helpers in order that we can maintain a tidy
directory structure in debugfs.

The series is based on platform-drivers-x86/review-ilpo-next since it
depends on a commit there. I am OK to wait until the next cycle.

Rong Zhang (2):
  platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
    debugfs dir
  platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata

 drivers/platform/x86/lenovo/Kconfig       |   1 +
 drivers/platform/x86/lenovo/wmi-capdata.c | 121 ++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
 drivers/platform/x86/lenovo/wmi-helpers.c |  34 ++++++
 drivers/platform/x86/lenovo/wmi-helpers.h |   2 +
 5 files changed, 159 insertions(+), 3 deletions(-)


base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
-- 
2.51.0

