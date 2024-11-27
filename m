Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948961474BC
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Nov 2024 06:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.71.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687332; cv=none; b=Fk0e/fu14fDNkpAZoLoHqUaodWM470LTaOeS8lyjkELCws+XLmdQeAZ9acFScT8LlrPwF4Au89JtALG8wXh5ilG1kguoVXd9ChwECVERMpzpNsmdZdIR9QzC600Am5UvuyP/3HCiq9Ty5QfIklBA0jfIGZwnVK+QW+PQIx8LxLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687332; c=relaxed/simple;
	bh=QSmWT2jN+fewdeYHq6ovSD9BZRlI+wJSwGbjpMbLWeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtqLderM3Unp4Nc+RSTExrD0Oxv3fzt9+cT7DfKT7PflcjrZFvPegAift4N7241Xb17bq0je03b1I/KI4msCsvBtUC39IyXk6Ehi15eiRZ9IWfhIyGYxbqGV5l3Tf+a0zN2ZcHE7qfilRsvapMZVdDnjOwzQwPYu0xFctft42bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=FKYoPX0l; arc=none smtp.client-ip=216.71.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FKYoPX0l"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1732687330; x=1764223330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QSmWT2jN+fewdeYHq6ovSD9BZRlI+wJSwGbjpMbLWeQ=;
  b=FKYoPX0lCxWKXRS5qE+1+LmnNHRQ6pjxTROaviOVbj55s0By7PfLX+C9
   FcXOaFLmWcP62NL8wpUj4Huc2ThKSNUViYn46deaL6zKhxsF5Dz72L16L
   7I+up1p3rB9Pl0DPgMyG6zJFNGloiKx4FolNHzkKxO9KrcknvjcDn+Ex9
   3/eknExjtBgfXIlTKiVU7lunOA+jKRs1VW13LlET396Xsw0y+ziYBiwJr
   FOb9uB2P2e06PLjvP50Zl//J8zEvjO0bBqaAXBr+Atk+ZUOwNmesN1pJU
   gc5ygSzvwHhKW3FfTjxGu5aSQ4PK+4d8YVLVGwIHWPiKoEFepfXKzdyZ2
   Q==;
X-CSE-ConnectionGUID: YsiPGi/HR4OgynCh2N4Pzw==
X-CSE-MsgGUID: DXV7DEk6SBGb1l4OKSWndQ==
X-IronPort-AV: E=Sophos;i="6.12,188,1728921600"; 
   d="scan'208";a="32533134"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 27 Nov 2024 14:01:00 +0800
IronPort-SDR: 6746a84b_LgD09TGmig8SqIQjoERcYxdOX155gX4uoiZcQhdpiVLxiTY
 2hyunWLDFwtamwUvWkkoZGTAoxJJA4TbYvIfjPQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Nov 2024 21:04:11 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 26 Nov 2024 22:01:00 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: ilpo.jarvinen@linux.intel.com,
	danielwa@cisco.com,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v3 2/4] p2sb: Introduce the global flag p2sb_hidden_by_bios
Date: Wed, 27 Nov 2024 15:00:53 +0900
Message-ID: <20241127060055.357498-3-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
References: <20241127060055.357498-1-shinichiro.kawasaki@wdc.com>
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

