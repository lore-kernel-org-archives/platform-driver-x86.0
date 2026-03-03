Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA573644CB;
	Tue,  3 Mar 2026 22:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772578491; cv=none; b=XVMUqapMNcjkzptvNctbt1GcxsV2XPN5apF1ltm5hKXK3zIiPWfyjISwbtbrA/37DVvXaGwLDE6Qr8YmCyQHVZckzQ+hcgZ/4crqev6n1vS3lwfzb4OWijy5qu7FrP/SAWTVAZvOJrEQl9BcAyv9WRhSEgB2GpUhoffmKwGc8Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772578491; c=relaxed/simple;
	bh=yqwgL7Jhpc9Vo1afs0FQKvhXDyaxv3yurLjfkkl8QCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TWNfGTqdM+MWXUCVfSCIe4sI+fD4Nqc0R3CS54Us8hlQNZ/uxqDzz8NOlyyh1wpwM5JJ5qWS8WygLZjbSsckdeTbyrX7iYrMWE0rCn15Unw1UAS/EMgwDmNVlFW8x0hEpXQif7ZMCUDk0r37EiYUCa0EabwT6EtBCsigiseNUG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=at3OoNHA; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="at3OoNHA"
Received: from wse-pc.fritz.box (i5C75F679.versanet.de [92.117.246.121])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id D51762FC0050;
	Tue,  3 Mar 2026 23:54:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1772578486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+zYKhEmaz4+U/EvknTuN80LHZNec7TSNtv8M+Lk790g=;
	b=at3OoNHAW3Q/dkqeGFg//v5tdIPpFTd7+hRsSKKtEnCw1tD/iL8q3RE0mkA6ISFcJhi2rQ
	9ADd7glGm2E9jrfSG4zCFY1+4G7bNHao4zdboge3Am2cAIlHPNcwxsCGZprKQC7zYTRwOj
	vAhloyCKpdTVkEsiscnixUrsMOSfEiE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v4 0/5] platform/x86/uniwill: More support for TUXEDO devices
Date: Tue,  3 Mar 2026 23:54:06 +0100
Message-ID: <20260303225440.504358-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset applies to platform-drivers-x86/review-ilpo-fixes.

v2: Incorporate Armins feedback.
v3: Incorporate more of Armins feedback.
    Rework USB-C power prio functions
v4: Readd system vendor SchenkerTechnologiesGmbH for XMG FUSION (L19)
    Replace for loops with if statements for USB-C power priority functions
    Add missing mutex in usb_c_power_priority_restore

Armin Wolf (1):
  platform/x86/uniwill: uniwill-laptop: Rework hwmon feature defines

Werner Sembach (4):
  platform/x86/uniwill: Implement USB-C power priority setting
  platform/x86/uniwill: Apply features across all TUXEDO devices
  platform/x86/uniwill: Readd Schenker system vendor for XMG FUSION
  Documentation: laptops: Update documentation for uniwill laptops

 .../ABI/testing/sysfs-driver-uniwill-laptop   |  25 +
 .../admin-guide/laptops/uniwill-laptop.rst    |  12 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 439 +++++++++++++++---
 3 files changed, 406 insertions(+), 70 deletions(-)

-- 
2.43.0

