Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4CF377A9F;
	Tue, 28 Jul 2026 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785239988; cv=none; b=ds494Y+V8bCQeZ1Yp420A3jndxSYpFVGz0BmtMzuSeYZDPxyOMuYHGbbQ5Gbj7CN90rGv+rHy3OjvHlg75rNWXslrHyj1nQC6tiFNX11sJI/ZF3iSn+DtaUKx9kf6wZ/EkZUa0TBZhPsv1kzUJUaiYJm43/eOVaXsogAPNlXmNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785239988; c=relaxed/simple;
	bh=Pv8DSRAWYSc7wCgDZQZQCIlh4QvKQCtxii84s2glyKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3A7CnFuwEfsieJDeHU4P/JqzqcfOH6oKLkJtkA9PprT6rMa/IjfZFBuA632JUL1rIHaqqDO/VnYQ4VGjEFLRrFYlCbp4STfvgv3xMpEGig82F7rbfXmO2zLpeCWe87SER6WMOK2/EEjOhTk1KQ/K2BCoMsmeERH+eUzym/NOHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Yi7IT4UV; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Yi7IT4UV"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 37C992FC0077;
	Tue, 28 Jul 2026 13:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785239977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h2RrX3cIj6EeanDPOj2FdlFO/06cupaOcj7S5zo++js=;
	b=Yi7IT4UVLmEkV6NloDCceK2pQTpGvAouvOCDZ/PbGKtzZdgC/TM/kIHXf5ybC39wKETEwC
	rgGzA/Vu3bwl/N/bNyGmJbc0gDPAgUmLjjiI9Ls2TFxf1/uLmoAbP1nddu2TiBUC0Jb+K6
	uCewvmcKJZSUoSdq4nDKZprqaVd0HmA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/6] platform/x86/tuxedo: Fixes for TUXEDO NB04 driver
Date: Tue, 28 Jul 2026 13:59:15 +0200
Message-ID: <20260728115918.125349-1-aer@tuxedocomputers.com>
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

