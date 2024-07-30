Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87542183CA3;
	Tue, 30 Jul 2024 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355315; cv=none; b=u3/aSiBMRpzbSOOQ4AIzlGfJeFmw18WMJ8PYmNZi6W2sSDvRZ/McstSWcm44YLl0YjmTVBFAVHtsnAnd8QogIWQUrT184VCC4CmmXj2a7+5gThL0RTHNXtdklsRAj+o9HMHKQs6C5LyYAHi0rscj/Bphdm/+Z0XR/tdXXZhDrWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355315; c=relaxed/simple;
	bh=XQy05sJWLOWoOX9vKpeZuA5x5ljPKp5f2+7IJ273STM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MSnuS3gLs9s8D9fMSfwCACXUWf07gduKDLCwxJdYFzg8bP9M6OUQ3rk9+wpJMGB77i+RHdcQM7ChJeMaBGfKnbJN+uMrCl80DFa9WY69z4G8LXUEGctuAHwROoW7Jr+2mdHi4lExjAArScz63XeFmFRV40nIGsnCBHyXJhRTC8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UbywbkZv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UbywbkZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722355313; x=1753891313;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XQy05sJWLOWoOX9vKpeZuA5x5ljPKp5f2+7IJ273STM=;
  b=UbywbkZvPI5AKtSqm2eE5mKUIH6fJJR+U4xh/cuWWTF4pN7LaKbTDXwV
   jfhlI+T3EI/TxNPNUn4hHMd/0VKHhFh3cXKvfg9rj/xovPwEemBn5EDY7
   GxCbn/V8JcUYzxsv1IzYMqrgSaJxM7PLYWY8A2EkbuU/om5HhbL6X6z4A
   wque1aTD9L52bllYHRl+cht7U9n3qtXVuo2DTGRaYeB8AYwGqvIn5iAUx
   6Aj4r8T7As/f6sJincegWLDFI+WqK41qX9dxsQ86mWPy/1/wQDmgVSTbc
   VLd8XwNKkdOJBburER2IwJSUBmMQEAFeF7Prt6UQ/KhTtGnkFktQmRvjh
   Q==;
X-CSE-ConnectionGUID: feTksAQHQSWI/PEjCOSDOA==
X-CSE-MsgGUID: nk5rodnFRbKKns8tXCPP8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23975890"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="23975890"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 09:01:51 -0700
X-CSE-ConnectionGUID: tIUUA4/1Tn+QqTkzeSv7MQ==
X-CSE-MsgGUID: zx5MPu9mSjeYXUUIjdDBqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="77629255"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 09:01:51 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Jithu Joseph <jithu.joseph@intel.com>
Cc: Ashok Raj <ashok.raj@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shankar Ravi V <ravi.v.shankar@intel.com>
Subject: [PATCH v1] platform/x86/intel/ifs: Initialize union ifs_status to zero
Date: Tue, 30 Jul 2024 15:59:30 +0000
Message-Id: <20240730155930.1754744-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the IFS scan test exits prematurely due to a timeout before
completing a single run, the union ifs_status remains uninitialized,
leading to incorrect test status reporting. To prevent this, always
initialize the union ifs_status to zero.

Fixes: 2b40e654b73a ("platform/x86/intel/ifs: Add scan test support")
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Jithu Joseph <jithu.joseph@intel.com>
Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/ifs/runtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/ifs/runtest.c b/drivers/platform/x86/intel/ifs/runtest.c
index 282e4bfe30da..be3d51ed0e47 100644
--- a/drivers/platform/x86/intel/ifs/runtest.c
+++ b/drivers/platform/x86/intel/ifs/runtest.c
@@ -221,8 +221,8 @@ static int doscan(void *data)
  */
 static void ifs_test_core(int cpu, struct device *dev)
 {
+	union ifs_status status = {};
 	union ifs_scan activate;
-	union ifs_status status;
 	unsigned long timeout;
 	struct ifs_data *ifsd;
 	int to_start, to_stop;
-- 
2.25.1

