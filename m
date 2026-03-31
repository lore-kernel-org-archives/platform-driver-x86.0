Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6F30B53C;
	Tue, 31 Mar 2026 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774964691; cv=none; b=apvuAiHPTG2yR1moY2tygmnbyTzZruZDabEtxQFkBEcYVprs0Ketr0a9QSfgHmdIih/SCrp5mQrorhe4d8wLP/pP6MyeeclYgkDz+ksLjwpMiq+SofEA7GwMpdkgUnL/h0BP8NHJlXLU0fIkF45slvYG/NK+pP1sfIgfwGiuUvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774964691; c=relaxed/simple;
	bh=hO3V9dL84QquHa0H/TehoSCQXgp3Zo/rQMkLYsZi6As=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aESMk/mQVbGiQlU68RqY4lP1PGGzrSRWjyxVrMRHtvG+JRJhj63p/Z3M8Z5O/QveRP+7uI3Go2dV5yzZztEwlq7cdteTrS9yzN6eE+NAZVanvGjcdYepuzZkdVxv4eaAdf8jzrBDuPdq/xVN0sz2KYb2zKI+2WHljGE2A3wlyb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=JnCrkRKC; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="JnCrkRKC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=j5SyKqDkDusazZv0VlV6NYcLAWKsAQjF5FtDuF8xXnU=; b=JnCrkRKCSAcgEICi7Tx6wOIaC5
	EBFuzKrImRnHMF/VdcXulT4BSy4opzhU/eCRzcK5Lym5KKf4szMrSs+hpxpEjVztbv4V+BfE4ZYqf
	PeyHyJIKYJOQR/vO/+w/flInb5xSwjl2lfedROU4JnPXm5GW8MSKnG/vDwmEEC0OThKQ=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7ZOd-006bDv-0G;
	Tue, 31 Mar 2026 15:44:43 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v7 0/4] platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)
Date: Tue, 31 Mar 2026 15:44:39 +0200
Message-Id: <20260331134443.1573053-1-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for INT3472 GPIO type 0x02 which controls an IR flood LED
used for face authentication on some laptops (e.g. Dell Pro Max 16
Premium). Without this, the kernel logs "GPIO type 0x02 unknown; the
sensor may not work" and IR sensors paired with a flood LED cannot
function.

The series first refactors the existing LED code (patches 1-3), then
adds the new IR flood LED type with multi-LED support (patch 4).

Changes in v7:
- Combined function parameters onto a single line in the brightness
  callback to avoid alignment churn across patches (patch 1)
- Fixed indentation after pled_set to led_set rename (patch 2)
- Renamed GPIO con_id from "privacy-led" to "privacy" and passed it
  from the caller to reduce churn (patch 3)
- Avoided unnecessary line wrap in function declaration (patch 3)
- Replaced bool add_lookup parameter with u8 type and switch-case
  for lookup logic in the callee (patch 4)
- Simplified caller to use fallthrough for PRIVACY_LED/STROBE (patch 4)

Marco Nenciarini (4):
  platform/x86: int3472: Use local variable for LED struct access
  platform/x86: int3472: Rename pled to led in LED registration code
  platform/x86: int3472: Parameterize LED con_id in registration
  platform/x86: int3472: Add support for GPIO type 0x02 (IR flood LED)

 drivers/platform/x86/intel/int3472/discrete.c | 13 +++-
 drivers/platform/x86/intel/int3472/led.c      | 66 +++++++++++--------
 include/linux/platform_data/x86/int3472.h     | 12 ++--
 3 files changed, 58 insertions(+), 33 deletions(-)

-- 
2.47.3

