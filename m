Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399668;
	b=BEhcWI79qhTobkgOpkpPuEkapoJ+IzdJUpRMBc4kscybXRcWJJYzV8ONTFAtjytSg/qr
	 mtr/pdb4ZNL2CPvoQ3aLiFDj7p02k9vPMu/X+QJZIoFSj0LL8WSiceXXhFXPOn71DCewY
	 OaudDAu57lbdik3jRBUviVTeXWYXm4VWLsXpbmfZjFvI80rhSOFhHtBmM+I6vUAq7b9Yp
	 LhM/JsKGYCuusXqbK4MFK+SR+wQtIhTgA32VfBkq8oEUe8a0y3xp0fdwDW1Y26HhGaJ6q
	 KOylzkQwPEFWL1foZljETiieNzG6jvuD1WnBFnAlKDtAfooDaBLF6VvCHMtW3TQKO4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399668;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pKiPXekmrYSh434XUuytPkJn+qMxalVqnKPsT3NSXjE=;
	b=2yai1Ttn/Q5CXiwGe/Tn1arB//x32gO9JrVzlAEeSo0IV4uFMyxjGPWLDTY8cUP09CGB
	 cgmHt6P/MPcYmk66ilbWduu9a4vK2y8HBTLg1TEIaas5afUhFJqWTwqUjCp7+s9pnm00G
	 6779kh8w77QzhN6yyIFnFQfw8vVR1qULHhrJRr+DNeFHNiue+6UwnjA/Em574/coTMYcC
	 fAuaDKSJzmGkpFLY7YbNMrahMppa0OEYmBIygDkWBTpvbkwIOUkom8Bl+U8JDBeuPFjP2
	 CbfzCvhw6Yn+zgwd7nYhVNRU8rzzMHMT5nTLcDXRe5cjnJy8uOH+osXHenDYDI+VG8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iodg+mdT;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB04606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 12:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB04606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iodg+mdT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794399667; x=1825935667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rSeA/yYAvnnstkR56impJUvbAHls10w2NJviVx8G02A=;
  b=Iodg+mdTsVZTi696cOReDBXR2mBM+RPCgD99KhHGg6fvirddHMKXX+gY
   oNPguiOr0VgqiaBNoFL5pjVBj0DkqTYeCpzcVyPCdAi4Zk7YE+6HgC1Ej
   QklWff/yj3MsWZpFTWjNA+QR3pUTtH9JsiGVso4AjdLjCOtIBRQ/IOJVC
   aoHSrBGM18z+ZYOx9qp/WjIyLe3HnsVeoeT5Mj3Lac2Lw65n7yW+Xt3XA
   muD5yDiBGpbpO7VJeOh+vi+qugWpP1IdhKlGeJc2yC1c1WefJHNl8F8u7
   MmLOcorwSU+L62q9gtjgytsfSqoT5Iii7ljN61f/qbGRhk/84W2kSIfNr
   w==;
X-CSE-ConnectionGUID: TiBx0grDRj60ZB4LnPqv0g==
X-CSE-MsgGUID: ar/mSy9LQkqvkvPjxkeGLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3041580"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3041580"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:21:05 -0800
X-CSE-ConnectionGUID: 0F9n3eaLTkGs5aJ/54M4jg==
X-CSE-MsgGUID: yy8HnkNLTDaJK98uxfgENg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8270346"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 11 Nov 2026 04:21:03 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 924B699; Wed, 11 Nov 2026 13:21:02 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Update Intel SCU driver maintainer
Date: Wed, 11 Nov 2026 13:21:02 +0100
Message-ID: <20261111122102.1298285-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

My @linux.intel.com address will bounce soon so remove me as maintainer.
Ilpo kindly agreed to take over this driver.

Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 083881778ade..efbef2cad7fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13748,7 +13748,7 @@ S:	Supported
 F:	drivers/counter/intel-qep.c
 
 INTEL SCU DRIVERS
-M:	Mika Westerberg <mika.westerberg@linux.intel.com>
+M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
 S:	Maintained
 F:	drivers/platform/x86/intel_scu_*
 F:	include/linux/platform_data/x86/intel_scu_ipc.h
-- 
2.50.1

