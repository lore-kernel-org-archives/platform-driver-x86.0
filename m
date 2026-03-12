Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A73290AE;
	Thu, 12 Mar 2026 19:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343507; cv=none; b=iqIsxlH/zYQDqfOzSbNY5IRBidLAM4KwKJVOaLwBwuBSuTR/CHeD1dcaa6D1infcycrWKHEjTXQiBMwezOxN1OqHggaUTXnzztSi0FqPBnql9W0F6TTag6UXR3ttiIvCd1Fuai6hJ9e/NWSp4Vdm9hfUqBqqkTN/W3IqyNEpDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343507; c=relaxed/simple;
	bh=QkSPpYYF4MkheP1+Mc9d12nhlET5whxBOmDLGkQP7/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rSbc7NarSjsb6XRywg627f7kOJ+t8T0fbCM7RtexFjBxSmEu+iRsQaU6iOUB8Zt2mC5eF0jc2hRxLuRahx7G76o+rgqUclx/cClNjIMw6NlSUvxorTyX8JjxaYTWPbGOheQOzqqY7vOYktfn6VLAq7LTlTs+R6T56f/bc8CkpQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=RvReuRvO; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="RvReuRvO"
Received: from wse-pc.fritz.box (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id E24AD2FC004D;
	Thu, 12 Mar 2026 20:25:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773343503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m0EKlEU1XAOvrc711jexLq07VIiR4kxO0/QHXGj4eJ0=;
	b=RvReuRvOzEiJLGQav8E+tDtPpYA6rRKEm1ClhucvWpKJ2Orpm3gh5trAGS9GxPdvok8ZvV
	uZOP2bLAZ22z6aeUsW8uhxl/+g6asjxyzewiPWVxXaCVyOqDi57WFqDB/ncul4D8g+Pbjj
	ixpN487LRu8pyIQXnEkG/YiYYcPgBWs=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v5 0/5] platform/x86: uniwill-laptop: More support for TUXEDO devices
Date: Thu, 12 Mar 2026 20:22:56 +0100
Message-ID: <20260312192456.75913-1-wse@tuxedocomputers.com>
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

