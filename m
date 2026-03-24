Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079703358B9;
	Tue, 24 Mar 2026 18:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774375484; cv=none; b=PI1YPzLiR4BUxYuQDjCVvzXo38AeRsRR0Pn/WnVow9Dg7sgz6Jrsz5jeejt4FxjMLRvEKax23iQkyA18Eo66SmkUI3u5mjmq+kND3T25JjDc0uDzDhpIu1CvYpDYC+TNiKAHeUhjzOEzBusDDWmDoXbCUtmYeXEy6DytRVi+vgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774375484; c=relaxed/simple;
	bh=28xuNHXrzx6rKbf9pWFUZaz/wkS2quBdkOe1CxET9I8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCY/XNbS2zR/l1R/0BKiosa1ZDvtEfotyGwPEphKuAh+7zgQqPhjraQMT20knSAJ55/Z2xGH4ClRB9vZ6mPQK5isCPDq3o09kQO08g+M1DX5nCV3Lm7EJxQ/Pd0EOv8dZHPJe3Qp94VwQDIhhBaW3Y43MX7FaEn0Odq4h28vhXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Yej9MvWr; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Yej9MvWr"
Received: from wse-pc.fritz.box (i5C75F50F.versanet.de [92.117.245.15])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 5D8D62FC0215;
	Tue, 24 Mar 2026 19:04:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774375479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9G8Yj053FkHAP1q6MPHMAaoy9bRyJEsB1jRnZyLxDvE=;
	b=Yej9MvWrFrXIW1UxrgwCcEq9MOf6OzJDoe3lxosawAuCxiAYhDba/lX7T+Mr4m81RMt/fa
	gIeM7GgVqt/rkRL0xfSt/RRcOlklOiezMeQ88LSvyB9AAY2PKb8L2r/1Gmov0ugCPN/fA+
	+zjJFYFZVlg5dCNuGV+E2XenSSTo6lI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v7 0/5] platform/x86: uniwill-laptop: More support for TUXEDO devices
Date: Tue, 24 Mar 2026 19:02:35 +0100
Message-ID: <20260324180437.69594-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: Incorporate Armins feedback.
v3: Incorporate more of Armins feedback.
    Rework USB-C power prio functions
v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (L19)
    Replace for loops with if statements for USB-C power priority functions
    Add missing mutex in usb_c_power_priority_restore
v5: Restructure patch around new entry for XMG Fusion
    Add missing Reviewed-by and Tested-by
    Spelling fixes in documentation
v6: Fix small format error in docs
    Fix Reviewed-by line
v7: Variable rename to lowercase

Armin Wolf (1):
  platform/x86: uniwill-laptop: Rework hwmon feature defines

Werner Sembach (4):
  platform/x86: uniwill-laptop: Implement USB-C power priority setting
  platform/x86: uniwill-laptop: Fix XMG Fusion 15 (L19) entries
  platform/x86: uniwill-laptop: Apply features across all TUXEDO devices
  Documentation: laptops: Update documentation for uniwill laptops

 .../ABI/testing/sysfs-driver-uniwill-laptop   |  25 +
 .../admin-guide/laptops/uniwill-laptop.rst    |  12 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 439 +++++++++++++++---
 3 files changed, 406 insertions(+), 70 deletions(-)


base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.43.0

