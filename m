Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B58F145B07
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687329; cv=none; b=ESWUSsXZ3T6gq+uloC0za0RjUyKU8ExNlqlwq51bX8T3TlbLt3lEmoqqwasTE3aQdm9gi6TwPXl0QeBBhp+CjUjz+4099YPnfb46xw1ceNd0zjfgIzprtm4rBRUotdFzhl5xrcq1cNRLVywZnh+7izWpgt83FGksc+oxYqlgN4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687329; c=relaxed/simple;
	bh=nrSk4FhIKefood87jwYqYCUsmC5o1tZQ+I36QXKdBz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BWoEMgZx4+142ANoRpQpZpXg+uO8zcE8yhV/GmD5V8OZoYoQZSggmbEPDRRO7IQLTLYzvZX0DT9lN9/aazulHcLa3HNwORF4LGrOgvTVZ2Yk+fTVWOBSnMbMrB+XslayDU8V9NOXGo869ZDmQzTKafdkIBRP1B4Tq7aX6iws6+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=GSa583Wk; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="GSa583Wk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732687328; x=1764223328;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nrSk4FhIKefood87jwYqYCUsmC5o1tZQ+I36QXKdBz0=;
  b=GSa583WkCPqzNm9p7VaRKtSVUEHTAj1mbuEHtYeqcS/+gui5bhQRI5Oa
   5PDP126CkNJop+wKbVLpMof4NxxnOQW/+jQN44q+ezmKALZWQTw6nbsZ1
   aiBI+SfOSIntCw5Mcger646KMFre0iPEzBLVD7zsVLvcFPurijZhD9Iw7
   9ac9TPindVuCjheGlZQUX/ypTX7OGFZkgpR/sX8Yqf5X6MU4qlj7Sf8ax
   8s/sSV3rMXQpyPtC0AtkA3edQGgWdxHgZh5jTImyh4FhDsgJFY7goCtdk
   Asl8KVKBGuASvjQZSQkQwkgEyIt4UH2B7uIuqx9X4ZbB2zg7f67FnWX0l
   Q==;
X-CSE-ConnectionGUID: Frkg8khFTwexIlingifliw==
X-CSE-MsgGUID: MNYwkXDiRnuQM3w5WnBbig==
X-IronPort-AV: E=Sophos;i="6.12,188,1728921600"; 
   d="scan'208";a="32533128"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 Nov 2024 14:00:57 +0800
IronPort-SDR: 6746a848_EkhcM7mIGu5u34N0eWPzgvcz2mbt6js1YEXWGsdHmHa7ule
 CzkwcnfyQ6iHujq1Y+iZT3xIlbN3XuiPnimblHQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2024 21:04:09 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 26 Nov 2024 22:00:57 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v3 0/4] p2sb: Fix unexpected P2SB device disappearance
Date: Wed, 27 Nov 2024 15:00:51 +0900
Message-ID: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
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

 drivers/platform/x86/p2sb.c | 77 ++++++++++++++++++++++++++-----------
 1 file changed, 55 insertions(+), 22 deletions(-)

-- 
2.47.0

