Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1B3367F53;
	Thu, 12 Mar 2026 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773343631; cv=none; b=oqbMrEarXBSFmtEd9aiLRZDCirCnXv+Ni0zohkNMRnAktLFTsJ+T5+6cMvIuEcdHf2X/uqXY2kZBM24ahpy4+c2Gte71OZORrIYxGGAjPeWruqNImtAmf/Cwk050StKjbJiNpMHDsDNNBbZpcfd9HI6/eojeJq8VGqLYH5tSm7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773343631; c=relaxed/simple;
	bh=Fv57+s5FN/MhboViLzQhyK6eXaJIFqplyqwsNx/zR0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYU9ACid/FIBWP7IjH1b8tCGvB9p/dVfX54YOeWBDrm3fJcl5KkUljQ+U/Bk+U1UqB3nxf1+su23zEml6RUStOqKcxEzvb2vH3LOxbPMuD1q4Yebl9FFDtSMCnQEtUQr94q3j2cFOi02cL6jh51ZuxBoxuvSCsAxUNiq0vxRTnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=hQ1NdWA+; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="hQ1NdWA+"
Received: from wse-pc.fritz.box (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 189D22FC004D;
	Thu, 12 Mar 2026 20:27:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773343627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3JMj3pzp1S+kyAhbS0A2po8jn1vGK2XzwdurrPiKmhE=;
	b=hQ1NdWA+rFPWgGn1ul6W/3FB17tU//g463fwbOhE+HRSRDAQq7s9cWWdJ/NNLRyzezEaIb
	zEzL1D9s1uPNa4W/KcJ6q9kDAS3H8mrH/kgS6CcNOgJtIqQA4sjpedGpieMNMXHQrP+hp1
	rhwhSgYfh21H9j6HQcuxbsaRax6Gg90=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v6 0/5] platform/x86: uniwill-laptop: More support for TUXEDO devices
Date: Thu, 12 Mar 2026 20:25:23 +0100
Message-ID: <20260312192705.76576-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for sending a secound time, messed up subject line (still had v5
instead of v6).

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

