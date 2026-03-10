Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39053783A2;
	Tue, 10 Mar 2026 23:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773186029; cv=none; b=YiprgS19FPjuFVXIsU22Dw5O3JjQmNpFkqtyGmaUUXuJoBZK1z9Gk2STqK3Vvz5842SFoUEHoZ5VT2P6cWWdKDRMrkuGcQDKkW+9PN4h7PBq5/Et+sDwe9n1KCtFIrgXawwYrRRVFi+O7YAlHKraCub391MilyIAsQoXQKECCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773186029; c=relaxed/simple;
	bh=tZjm/jP79awqcVIqvGRHt18W4LJLrttQcC8s5BP5H4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lpawqVFx0yWgjG6L3AS22ZpwPh0KkE40I1JgVfMJrL/LY5rVx2xnNWAhPpBFEfYUoT80QlMax+p+ThhSuXcC5pcGiBG6aS4YmgMZEhRCjxhZYLI9a7cMEokllFRaAp9d3OjWMnciuAqyOZogU3+y/26kc8UvyPA5xPIaxlD9fM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=fAlfHyd5; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="fAlfHyd5"
Received: from wse-pc.fritz.box (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 20E022FC004A;
	Wed, 11 Mar 2026 00:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773186024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RTmY4SRsvawGMAqMBorxo3P/4JUalKKd/dKZLLKyShY=;
	b=fAlfHyd5qaMNZCpsn90dBxRwxzcCcrZHZVNnDxFhcCyvRFN/Y+g1K+Qw+BCkb3PHkJX5LO
	UG10A/6bMua46momtNwsSOtHCKYM/aaTZdZCSNUVFyWTTsWjSRlYL777OxXjFlOtDrZsYb
	l/CwFUPTVZjvhfCN/9Ouh8ryFFPNikc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v5 0/5] latform/x86: uniwill-laptop: More support for TUXEDO devices
Date: Wed, 11 Mar 2026 00:34:15 +0100
Message-ID: <20260310234022.2085232-1-wse@tuxedocomputers.com>
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

