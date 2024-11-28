Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DE18F64
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Nov 2024 00:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732753721; cv=none; b=ULmxfExaK5vMd94tz2WcaUGp/c0tKa2/sESj4wmI2wGdWAWd3Nm0LWZDA0g3Xonj3mP6UQ1ZsGC1ytD9BPXS3MxfyOxW0+vVl2UgsEGznlsgIXVITzdLMdssw4GoBOShSuVmjDOZSgH3yxaKdCuz9gpto+pEOwKgaV9ZNQ3mlcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732753721; c=relaxed/simple;
	bh=xCOEMF2Sh/NT04znjzWMhJmjRlVobjhxjRKkKX0ZD6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WoJzqBXH/VHWeRmQlF1RoNsz7uCMoDfdAH+1pqayam6vU/8p1cVAeSP0inwVexpk5R0gJt1RuVvxqd8FtxDPatTtPmGLYYvpELbOxQllmFkWgR74xDeE3ig1WG064+//o1EgpB8h1XKMTdCgsVWq+Yh75OFvk3LxDEFiNAu6yow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=luPEq8Xc; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="luPEq8Xc"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732753720; x=1764289720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xCOEMF2Sh/NT04znjzWMhJmjRlVobjhxjRKkKX0ZD6c=;
  b=luPEq8XcQ/lmqV/HJsqyppWecDTAv5p2mv4ccpX/rkZBE+9plnJ2lqhc
   76GfEbGpEKKqpMApihY9jTFg1sUFzuHmKQwJRhLPLfuPHl/6L725Nt+w/
   cK6/nCwMW260+RQ0XzNQeugZce3a4N9TuuENj1meiYHffjB+NzI5NRuvy
   IZ7dpD7RmlQ/LdBqm54oB0U0baFzLiWlkT4fxPhcJzYdwrQa/fJVL5psv
   K8SB3xjrQsqjLfQbm1hv/qBNorXSx7Jjk9nHecD2dH/Zpijp1Bog9UVsr
   37aADHiRRvi4FhHVmok/RRzmICxSPJ2LAMGe28VFuUKA/dENEz7czTNKa
   Q==;
X-CSE-ConnectionGUID: orvgEYTtTgOLmIm+180Z3g==
X-CSE-MsgGUID: SLy1PDcNQw2MeMVwQm+02w==
X-IronPort-AV: E=Sophos;i="6.12,190,1728921600"; 
   d="scan'208";a="32605714"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 28 Nov 2024 08:28:40 +0800
IronPort-SDR: 6747aa9b_/aMirHOsDEWtXiGlDyHwbwfdrWWiLw35vuw8X4AOuamzjz2
 IeuXSkY6xE4IZ6BE6kRf53PbuOwflnrfpVvOsow==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Nov 2024 15:26:20 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip01.wdc.com with ESMTP; 27 Nov 2024 16:28:39 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v4 2/4] p2sb: Introduce the global flag p2sb_hidden_by_bios
Date: Thu, 28 Nov 2024 09:28:34 +0900
Message-ID: <20241128002836.373745-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
References: <20241128002836.373745-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To prepare for the following fix, introduce the global flag
p2sb_hidden_by_bios. Check if the BIOS hides the P2SB device and store
the result in the flag. This allows to refer to the check result across
functions.

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/p2sb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index aa34b8a69bc1..273ac90c8fbd 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -42,6 +42,7 @@ struct p2sb_res_cache {
 };
 
 static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
+static bool p2sb_hidden_by_bios;
 
 static void p2sb_get_devfn(unsigned int *devfn)
 {
@@ -157,13 +158,14 @@ static int p2sb_cache_resources(void)
 	 * Unhide the P2SB device here, if needed.
 	 */
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
-	if (value & P2SBC_HIDE)
+	p2sb_hidden_by_bios = value & P2SBC_HIDE;
+	if (p2sb_hidden_by_bios)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
 
 	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
 
 	/* Hide the P2SB device, if it was hidden */
-	if (value & P2SBC_HIDE)
+	if (p2sb_hidden_by_bios)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
 
 	pci_unlock_rescan_remove();
-- 
2.47.0

