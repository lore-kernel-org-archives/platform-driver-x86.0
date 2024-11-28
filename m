Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04ED2FA
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 00:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732753720; cv=none; b=h2eqe8oJKO1HDaA4fb1UGxImbaQ6P35eTr1eGwWbjg1T7bYCNyFSMUgAZ8ktsMiaZHwejIIKWU+gAitdS9Q5qdsL0TJqdH07OW6km5Dd8IIHl04H66zdK4bVhULKbEss+Y3lNDmSfw/nt8i2E+44Uib+MtM2JJaZzBi98YCgDSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732753720; c=relaxed/simple;
	bh=8RR81ZjG7/hNIQ6ezMqa+8E6VgIRq2tDGxO6T/HmDFo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NvqkwHnXQK/9aB59t5v787azXIkr+meuua/DXnvpvMoarPKPPl5PayFBS7jrjLhHYOzkf7eNh44rRDQDKPGoX687wtwIPUgVoY1AjSVRBbgymTPvBaiXUnS9ipsY2iFAGMfc3f6QBb+ms/pR+4FEVV/5W4wqjNOrH/V0tRi6cDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=Ux0RRlit; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Ux0RRlit"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732753718; x=1764289718;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8RR81ZjG7/hNIQ6ezMqa+8E6VgIRq2tDGxO6T/HmDFo=;
  b=Ux0RRlitLHybsoZfIBMp4w7aHYQ+V0sfYE+TvNpLoVoIOt5ZUlspRUh/
   NTp6fWhfNdQkcthbXFjPXHtIO6QAgOkldy3U47iJ0BJhKaN8S0PLKHhCy
   i9qpCLdP+qUZXaTWJrAKj/P9cK9qCSf7bwekTi+xy3FpNkW6Lr3PnCfbC
   R71UHj5APtXigt41e+o5ahJfBOm6J1VD+fqeiC7jxyrYGMXsSWw0y6HjL
   aJ3PS6H11bcqUc4O/f0WD3lKdjdERsXATvDWs/KI+YvrokXglLsxuS+Va
   rETPVkk8S8bbH97SgwMk8GqqJWWW8GGgeRGJbZiLm8lg0ebHJhGhhOph+
   w==;
X-CSE-ConnectionGUID: MzNI6M6sTDCf0F57Yxpk1Q==
X-CSE-MsgGUID: kKuW7OqRTXKnBbNQs9ktVA==
X-IronPort-AV: E=Sophos;i="6.12,190,1728921600"; 
   d="scan'208";a="32605710"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2024 08:28:38 +0800
IronPort-SDR: 6747aa99_nc6jhrZVXwzqz63LCw37U+6wcjoFAjcvgBMJqhAMWxyC0g+
 Iphk8m5FKbrX4YP2B3Ms1o9t7tB6n0wzyyTnZBA==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2024 15:26:17 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 27 Nov 2024 16:28:37 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v4 0/4] p2sb: Fix unexpected P2SB device disappearance
Date: Thu, 28 Nov 2024 09:28:32 +0900
Message-ID: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the BIOS does not hide the P2SB device, it is expected to be visible from
userspace. However, the P2SB device disappears since the commit 5913320eb0b3
("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe") [1]. This
series addresses the problem. The first three patches are preliminary
refactoring for the fix. The last patch resolves the issue by caching the P2SB
device resources only if the BIOS hides the P2SB device.

[1] https://lore.kernel.org/lkml/ZzTI+biIUTvFT6NC@goliath/

Changes from v3:
* 4th patch: Added the missing ret=0 initialization in p2sb_cache_resources()
* Added Reviewed-by tags
* Link to v3: https://lore.kernel.org/platform-driver-x86/20241127060055.357498-1-shinichiro.kawasaki@wdc.com/

Changes from v2:
* Renamed the global flag from p2sb_hidden to p2sb_hidden_by_bios
* Moved P2SB hide and unhide code to p2sb_scan_and_cache()
* Introduced two helper functions which are called from p2sb_bar()
* Separated the preliminary refactoring work to 3 new patches
* Link to v2: https://lore.kernel.org/platform-driver-x86/20241125042326.304780-1-shinichiro.kawasaki@wdc.com/

Changes from v1:
* Put back P2SBC_HIDE flag reference code in the rescan_remove lock region
* Do not cache resources when the P2SB device is not hidden
* Added the Reported-by tag
* Link to v1: https://lore.kernel.org/platform-driver-x86/20241120064055.245969-1-shinichiro.kawasaki@wdc.com/

Shin'ichiro Kawasaki (4):
  p2sb: Factor out p2sb_read_from_cache()
  p2sb: Introduce the global flag p2sb_hidden_by_bios
  p2sb: Move P2SB hide and unhide code to p2sb_scan_and_cache()
  p2sb: Do not scan and remove the P2SB device when it is unhidden

 drivers/platform/x86/p2sb.c | 79 ++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 23 deletions(-)

-- 
2.47.0

