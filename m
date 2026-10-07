Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD644CF22;
	Wed,  7 Oct 2026 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360166; cv=none; b=DlX1bxTUGybzA0th3QWDrg0uWqm3QGjy9+9BVf42XpLJcDILOMK4wOocz9i+pDhiyu3ny4tzBxAfjnMuhI3pIWBQgWFWEGXIk1jHUiZN2LJfxQOVp0m8oRcWdS964jOf/lp0DV6gK4N5qbei0bpRcQKbiyBiPzXJpqSTDlHx1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360166; c=relaxed/simple;
	bh=pQdIFw48Ao5G6PUyVHBavt1XLZmYkar+4DPyJ6dyoAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZT5HzB3tCUwUH8LZok7cL/1Qmi/VgbHARhc9LF3XMh9yj8ruLXmD9igt2oPiU4gBdVNN8kuYBhp9rAbta/JzIhvscc9sXD7GZmCS0Yi+iKTQS3XepxVZQRCbcHO/GDwcyuqURZfFkmMwtCVDyh/mc0+vNprg+EA675e/NxPo5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=HwnzmtW3; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="HwnzmtW3"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 589BC2FC004D;
	Wed,  7 Oct 2026 10:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1791360136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dChV1v6BpFktEWtGYJYbdosXPCPcO6r06raL7TNwLtc=;
	b=HwnzmtW3kU46dXqP4gqc1FtP18GCMUrlWeVTpOVbu49HDLG/loho0+Hj5a8WmPaS0aoFmk
	m6vu4pSd1g/xzIehVU3NuaEfJS2NwcJU93MDMwjLt9tE69bNPLVOJGtrb8g1MoFTmjHmQJ
	vNV48xnx68HhFMwaiIQ0oG+bWYAJfPY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] platform/x86/tuxedo: Fixes for TUXEDO NB04 driver
Date: Wed,  7 Oct 2026 10:01:46 +0200
Message-ID: <20261007080202.81694-1-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series contains several fixes for the TUXEDO NB04 driver.
Additional userspace tooling and a new WIP generic lamp array driver
being tested brought more attention to this driver, thus uncovering
some problems and potential for improvements.

v5: Fix and add missing tags
v4: Add missing fixes tag
v3: Improve commit message to properly explain changes
v2: Send all patches as one thread (sorry for the noise)

Aaron Erhardt (6):
  platform/x86/tuxedo: Don't use device driver data
  platform/x86/tuxedo: Set HID report ID on success
  platform/x86/tuxedo: Use intensity according to HID spec
  platform/x86/tuxedo: Fix keyboard LED map ordering
  platform/x86/tuxedo: Update and extend documentation
  MAINTAINERS: Add Aaron Erhardt as maintainer of TUXEDO DRIVERS

 MAINTAINERS                               |   1 +
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 122 ++++++++++++----------
 2 files changed, 70 insertions(+), 53 deletions(-)

-- 
2.43.0

