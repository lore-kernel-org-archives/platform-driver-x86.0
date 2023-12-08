Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NU1AVFIs"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02162E9;
	Fri,  8 Dec 2023 08:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702054374; x=1733590374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sv7CcY7QDnpJw6EE95LUk2yATH8dqXWZ/BDiRwAFkPU=;
  b=NU1AVFIso5/XeCSA2D60Mwcy4EuqPdhEPXUr2NthjBo0eYCX21fCDmLU
   KLC6KtdSRVHehT36NqlbzDg7XepL0iKbCh/tlCeJ3AQThIxOgrE4E6BL3
   KoRJzACbIK6ppTGKraNcOq952vIv43ieoOp5JD5V2z8n7mOsaG3sXyMQU
   dXFB8BDkuvAUAEsE7CJfb3JZvj+DGU49W+U9/D6rmBMNGuZe+AY/Nl6DC
   HZfX1zoQwGMbSo8At8nA8TGpsfx+3rokxmB+2q3YzrQdj94qNbabVg+3m
   e2wwXcQG66FiTO/57mb2jn7d3IgFx21+hrP+W2iLp9Y9sY+R4K3PTey9D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="391600083"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="391600083"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 08:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="890183287"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="890183287"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 08 Dec 2023 08:52:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 201B5154; Fri,  8 Dec 2023 18:52:51 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v1 1/1] clk: x86: lpss-atom: Drop unneeded 'extern' in the header
Date: Fri,  8 Dec 2023 18:52:38 +0200
Message-ID: <20231208165238.3309058-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'extern' for the functions is not needed, drop it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/platform_data/x86/clk-lpss.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/x86/clk-lpss.h b/include/linux/platform_data/x86/clk-lpss.h
index 41df326583f9..7f132029316a 100644
--- a/include/linux/platform_data/x86/clk-lpss.h
+++ b/include/linux/platform_data/x86/clk-lpss.h
@@ -15,6 +15,6 @@ struct lpss_clk_data {
 	struct clk *clk;
 };
 
-extern int lpss_atom_clk_init(void);
+int lpss_atom_clk_init(void);
 
 #endif /* __CLK_LPSS_H */
-- 
2.43.0.rc1.1.gbec44491f096

