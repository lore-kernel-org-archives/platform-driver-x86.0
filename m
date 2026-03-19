Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776DB39A068;
	Thu, 19 Mar 2026 05:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773899720; cv=none; b=e7J1548cQBBAc7Cljb5kukwaY/rfaDTjrXkhIk3/69WLVy44vBlCbreD0FPmOwEbOUHsDrD0tQ6OHLnwlGIa5AtzsMMlswRzP9WI3L3LfjanNbm82xvr+HA1WlyeHBhy/cLvEfE/TSHgb/iLm+OyxsyUKvT/QxTwEAvg4dvJXXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773899720; c=relaxed/simple;
	bh=REYc0dUIWX9AJSxx+SkJPZS1irHyLRx+3XAEbt5i4Fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3hr5GXmOm4g+poAEIiZpnrBQ4QRS8WFloSM55qbWD7oQvO3jjhYe9ZbPWB+YYzZbjmXbtzY+hTx+tp8S0MW0iu8r+SS0kYRZAPPaK9heD5XSF2zFREX2s1S6XgsdPiQp5qpmQo8zmT1ZUKkTDFnadMfElcV6ulhXchttqZo/ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbiVbPGJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbiVbPGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773899720; x=1805435720;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=REYc0dUIWX9AJSxx+SkJPZS1irHyLRx+3XAEbt5i4Fw=;
  b=jbiVbPGJb1joIzlHy3qhgTfPVsV1Uh7gvCGgN9jD+xkUFi2KYijC7WSj
   mANsP8qrLVIJcGIj07wQ9yvcsLBbmzcM0AJ5Pwm5soXqIv6zef5iOntqu
   Xf+BsxxAnAbvfBCx8JYdb09+t8EsggaOZsJ8/keL9xiuSCXfgf78b1PLD
   z1X4le2q7DULwWAWzqEqEjE0kTP50dAnz/GdRmWJvSN/Nd0giRJPW+txe
   6nLujJBJp1IJJfBkkJk/c9tONZ9VNQWJ72Yvcp4nkmWlDcj2zuopJU9Uc
   jE4KW+RE1Tq7t4PwyTeimBXHoXIHVE4P03hRxaMeAkFl/F4Qu0GnaAcCg
   w==;
X-CSE-ConnectionGUID: ZzAY3hHVSaSRUQUkklxznA==
X-CSE-MsgGUID: nt1k5XUoRRSvZGhS6OG4sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75084794"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="75084794"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 22:55:19 -0700
X-CSE-ConnectionGUID: 4S2bEEYxRHywxp2lRwnnbw==
X-CSE-MsgGUID: 6KNsID5nQfmJV2LLmbwQqA==
X-ExtLoop1: 1
Received: from rzhang1-mobl.sh.intel.com ([10.239.158.35])
  by fmviesa003.fm.intel.com with ESMTP; 18 Mar 2026 22:55:18 -0700
From: Zhang Rui <rui.zhang@intel.com>
To: srinivas.pandruvada@intel.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] tools/power/x86/intel-speed-select: Fix output when running on unsupported CLX platforms
Date: Thu, 19 Mar 2026 13:52:56 +0800
Message-ID: <20260319055256.3226034-3-rui.zhang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319055256.3226034-1-rui.zhang@intel.com>
References: <20260319055256.3226034-1-rui.zhang@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running intel-speed-select on unsupported CLX platforms, it prints
 intel-speed-select: Invalid CPU model (85)
 : Success
Because this is not a system error and errno is not set.

Replace err() with exit().

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
---
 tools/power/x86/intel-speed-select/isst-config.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index afef3af8b446..24be39c69a60 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -3246,8 +3246,10 @@ static void cmdline(int argc, char **argv)
 	}
 
 	ret = update_cpu_model();
-	if (ret)
-		err(-1, "Invalid CPU model (%d)\n", cpu_model);
+	if (ret) {
+		fprintf(stderr, "Invalid CPU model (%d)\n", cpu_model);
+		exit(1);
+	}
 	printf("Intel(R) Speed Select Technology\n");
 	printf("Executing on CPU model:%d[0x%x]\n", cpu_model, cpu_model);
 
-- 
2.43.0

