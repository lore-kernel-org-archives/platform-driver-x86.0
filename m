Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E423033EA;
	Tue, 24 Mar 2026 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384460; cv=none; b=XiXhgebJnvzGaLvAJOiVY6m0Tdliw2TNg8PmEke+L+V6m0zguXNqU+sZjvxgOGwxtUnjxITalHFBaNjBNFw2Hf4m+kD/z/+xr6uYvbaE84xxelvFOLrzTvquqoSUkoWRIcJIQzteY5HLqASNkPE9dahnHlyPUhxZPkh8Y7mgD6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384460; c=relaxed/simple;
	bh=jzKSNjkBkPRuV22f+oFYs0vDvc41nZie42LnODa2nMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QC/UB12NGkQVueMtUTniuXdMhGCCRhjlsi8ktKFqgyOXX2x/wggDEZNMFFu+zRdWpo6YeiIucjrDJbsMCgInZPDfp4bmCrPu4yzqRuAvTCzbECn4iV74Vz5LSM0YV1/0vADlZ2d+NeV5WcFfIZfMYiXHqcXFlEqSIZm6GkNDASY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=ZpqjK81x; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="ZpqjK81x"
Received: from wse-pc.fritz.box (i5C75F50F.versanet.de [92.117.245.15])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 9DA532FC0217;
	Tue, 24 Mar 2026 21:34:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1774384456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rc779YWRnAFLnLtn7srh7/kSxLqK7CyO6EKIDAQoTw8=;
	b=ZpqjK81x3bLZQakFQ6tNHQRbcigZDHNoJ534JW7jRTAUwR/GqwST5WDCMrave62rWjwZ11
	EAjmyoUBgAP7CjVMNd1wLbNrpdaL8zWb8aSBu6oUyngA3e174LiOjx458/tOdAnxvbZ0ZP
	xzBWeUJ/VbJAjf8SPKWaz257mWbJU28=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v8 0/5] platform/x86: uniwill-laptop: More support for TUXEDO devices
Date: Tue, 24 Mar 2026 21:32:07 +0100
Message-ID: <20260324203413.454361-1-wse@tuxedocomputers.com>
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
v8: Move USB-C power priority init to after probe call
    Clarify documentation

Armin Wolf (1):
  platform/x86: uniwill-laptop: Rework hwmon feature defines

Werner Sembach (4):
  platform/x86: uniwill-laptop: Implement USB-C power priority setting
  platform/x86: uniwill-laptop: Fix XMG Fusion 15 (L19) entries
  platform/x86: uniwill-laptop: Apply features across all TUXEDO devices
  Documentation: laptops: Update documentation for uniwill laptops

 .../ABI/testing/sysfs-driver-uniwill-laptop   |  27 ++
 .../admin-guide/laptops/uniwill-laptop.rst    |  12 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 439 +++++++++++++++---
 3 files changed, 408 insertions(+), 70 deletions(-)


base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.43.0

