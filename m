Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2C1326D74;
	Tue, 18 Nov 2025 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478529; cv=none; b=g0u5q62sbdHZJm9F9ZFUAReq0gMH8vC5LnaYspfke54u3r/AJ+rt67THi+EYcoRi6XBnlZufjwoeEcNgBRLY7lsryF/O+5k9SdSWWUiZt+7ZPUf/EpemQcl2e4ApSQlv5jVHwWjcSd5WZ+dy/7cbr0jW3VGZaULjNGvkwzWTNfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478529; c=relaxed/simple;
	bh=7AWyd/y4lYQ2qm7/yYL0KRn6YQaX6ncG403+BDs00UE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WKUKCx7eJuZhQHrRCPaT+E4dcBQPboVuRXgixq+mBlK53nrE7cZ4/f+6CfRhDIU7QSoqmAFp9A82BgRWxHBRxISIWAVYeNWol7MD8t5AzeFXiEhcnzLpQJYWRtIFtWu7w1aBsTbFI64TLvznzKjyHR4EFfCRYbdkxsEJ9lprVvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=fC2YrYt5; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="fC2YrYt5"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id DBBF92FC0057;
	Tue, 18 Nov 2025 16:08:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763478525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=29zP6DbN9YPCxm3Q0FTGa8eaz6E2KkhGscB9nnMikYM=;
	b=fC2YrYt5dzOcqOK182UfYRNlU3KU0Gt75MYNy5zcmYTbOd6v0ctVnDQUHf9ZFDIWmNyxrr
	8N8psP4K1tWy0q0ycgoZ41tKjEK9EGWT8voBKgM8RdXfyR1sExS2exJLXoD3IWPR5oJf0C
	JM+xEomJJpdGzYwWAiXRhuIl0V7deOQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v2 0/2] Start of upstream support for TUXEDO NB02 devices
Date: Tue, 18 Nov 2025 16:02:27 +0100
Message-ID: <20251118150839.55336-1-wse@tuxedocomputers.com>
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

V1-V2: - Drop the cTGP implementation to push that in an own patchset
       - Reorder patches

Werner Sembach (2):
  platform/x86/uniwill: Handle more WMI events required for TUXEDO
    devices
  platform/x86/uniwill: Add TUXEDO devices

 drivers/platform/x86/uniwill/uniwill-acpi.c | 327 +++++++++++++++++++-
 drivers/platform/x86/uniwill/uniwill-wmi.h  |   2 +
 2 files changed, 328 insertions(+), 1 deletion(-)

-- 
2.43.0

