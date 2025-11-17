Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AEB30CD8B;
	Mon, 17 Nov 2025 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763385947; cv=none; b=fnd8EoWpYDmwFDe0tDv4LL39DfqtKOhE04svcSKV432YC5hhrH7nNEEcEyQMpBJceitp1d8qKwn+gPD8gXSm94tQzp83n0hffcB4xhIv0DwlceEiNJSIi2x2Qsp/PIykfYSgTrrekrj7hYssPvWvxnyY1sbP7FzmPaDP2Tl3QBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763385947; c=relaxed/simple;
	bh=AAaF6FrZEjS8uZTbPl0GCteQL+mrJ2XCYFtdQL2afwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lm+oRPf7yo2RaVm64zqdZd6gjSVlPD5U5gR9RKEG6vVF1DojmTpiOhehON3XapFBhz8O0LdDRiVXUqlEKBQh8mIjUSondvSk35XR5l5yZHIZmZf3fJMFyuA2z6tGBUd04K9f7v/vwLazzf91Hguqx9amp2eFuRWs6iij1fTiofY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=bibdmJ1O; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="bibdmJ1O"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 9E77C2FC004A;
	Mon, 17 Nov 2025 14:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763385937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2XLhH5PItzP4+seYEkamWSs5ibK21m2m9ZLSZoTOJzg=;
	b=bibdmJ1OALOzGX+h8lgqyDDVIQ4WbaUZtNIh1/C+adpEW8H3l7wGlW4fCOW6mps1oFr0Ja
	nC/PKHwg7jkiNfyDFi4mLr1deHdjfsdtpQJhP0WXZq6yn4L0DoaSUQukOR6l8XDeN5XbzD
	zPZsxM8tG8JGNTZOCuZPcKW4/M3t5yU=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH 0/6] Start of Upstream Support for TUXEDO NB02 devices
Date: Mon, 17 Nov 2025 14:23:57 +0100
Message-ID: <20251117132530.32460-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the Uniwill driver from Armin now accepted I want to push the first
big addon to it that I worked on in parallel.

First this adds all current Tuxedo devices to use at least the input part
of the new driver.

Second it adds a new feature for cTGP control on Uniwill devices with
NVIDIA GPUs and enables that on the TUXEDO devices.

I have not yet enabled the other features in this driver for TUXEDO devices
as they either don't apply (Uniwill did a line with Intel that behaves a
little different to the rest of their ECs and that line is what the features
Armin added are based on) or are, as of now, untested.

There are plenty more features currently implemented in the out of tree
tuxedo-drivers dkms package that I plan to port over one by one, but as
always: No ETA given.

Werner Sembach (6):
  platform/x86/uniwill: Add TUXEDO devices
  platform/x86/uniwill: Handle more WMI events required for TUXEDO
    devices
  platform/x86/uniwill: Implement cTGP setting
  platform/x86/uniwill: Make uniwill_dmi_table accessible in probe
  platform/x86/uniwill: Run callbacks of uniwill_dmi_table
  platform/x86/uniwill: Set cTGP support based on EC for TUXEDO IBP Gen7
    MK1

 drivers/platform/x86/uniwill/uniwill-acpi.c | 546 ++++++++++++++++++--
 drivers/platform/x86/uniwill/uniwill-wmi.h  |   2 +
 2 files changed, 502 insertions(+), 46 deletions(-)

-- 
2.43.0

