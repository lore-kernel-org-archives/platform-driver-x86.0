Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA52421B908
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086718; cv=none; b=MILS2m3s7iprhvCnKWPp1cvtMNNgBz3WDoUqFwqedgccJY9w160ntrV9dFHLmeiHqyAY5IjrZDxSuKOB8iFtPTld0TFVT48ugSIvYyPs+z8hVmXjGCf2IfhQmKwItOq0ai+HyhbhLQEuKi7epKIT0K7WRgw93hijfHw5dlD5EJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086718; c=relaxed/simple;
	bh=4yg9zS1GLugV1I7PNA8tudWxeOtehVNHEoMkPVtbFwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kG69E5JWVGl6fHs8GfWHdrso7CaoTTJ2dEZGwPmRSxeStNRR8teqv5O59Ln+fYSK2qHPlmqNnvV9VJTJyKKxzCDKc5FsM8dzlJIFiNammuxdMbS4hTHIc7wxBreAE6Qn+j1gQgn+aGP63caj5zO0VkfTgKDgYeItEnBq0qprb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biN4ugob; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biN4ugob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752086716; x=1783622716;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4yg9zS1GLugV1I7PNA8tudWxeOtehVNHEoMkPVtbFwU=;
  b=biN4ugobZOxIHumO9poan24VNMS6GSleLOCVLMFRRlC0O4Z3ROn+RRIB
   X+qKaK4FPwWu1b83Tt6Zpp09SvqxAt0PNabli7SiN8sQSdxQ8HlhXEw3W
   aw4WcaDNXpgTVh5y9oVInLQlk5F6PXkEpi9breapQuv+AdMJbZ5EeWmCu
   RRB5/6xcnigsGLK+aUBTg3bILYhdQljMTC/MckSQUtSg5Q17nRZUQrLI7
   1gInlu3EjJB4zpHLyBYi3O6MJIoXLQXg2G0PzwJ8TPV9Al86HDxmpTOKd
   TrIneY2RpMQu6Y9Jwa/9sT23XGYtWhlY7PQYi5iTgMXsYYrUWm6TG2RW/
   Q==;
X-CSE-ConnectionGUID: jzgK0E4QTPKUt9vaitgUqQ==
X-CSE-MsgGUID: MbqrnISeSDuqa71FzQM6mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54451004"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54451004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:15 -0700
X-CSE-ConnectionGUID: 4Xn9772mTFKpbLvzmJL09Q==
X-CSE-MsgGUID: KVHJkegZTfmlbWlHN292dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="161404823"
Received: from mjruhl-desk.amr.corp.intel.com (HELO mjruhl-desk.intel.com) ([10.124.221.121])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 11:45:14 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: platform-driver-x86@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	david.e.box@linux.intel.com
Cc: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v7 00/12] Crashlog Type1 Version2 support
Date: Wed,  9 Jul 2025 14:44:46 -0400
Message-ID: <20250709184458.298283-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Intel BMG GPU device supports the crashlog feature, which was
exposed in an Xe driver patch (drm/xe/vsec: Support BMG devices),
however the version of crashlog used by the BMG GPU does not have
a supporing PMT driver.

Update the PMT crashlog driver to support the BMG crashlog feature.

v2:
 - fix a misconfig for the crashlog DVSEC info in the xe driver
 - address review comments
v3:
 - re-order bug fix patches for stable
 - added re-order trigger logic patch
 - added helper patch to address repeated code patterns
 - address review comments
v4:
 - added pcidev to intel_pmt_entry to address null issue
 - dropped endpoint update patches
 - patch cleanup and address review comments
v5:
 - renamed helpers to avoid namespace issues
 - separate mutex cleanup from gaurd usage
 - refactor base paramters to a separate patch (from version struct)
 - add r/b reviewed patches
v6:
 - use correct fixes tag for NULL pointer patch
 - added ack to Xe driver patch
 - bug fix for access helpers patch
v7:
 - added r/b to mutex clean up, refactor, and version struct patches
 - removed redundant comments
 - cleaned up and improved some commit message text
 - include attr_grp in crashlog info

Michael J. Ruhl (12):
  platform/x86/intel/pmt: fix a crashlog NULL pointer access
  drm/xe: Correct BMG VSEC header sizing
  platform/x86/intel/pmt: white space cleanup
  platform/x86/intel/pmt: mutex clean up
  platform/x86/intel/pmt: use guard(mutex)
  platform/x86/intel/pmt: re-order trigger logic
  platform/x86/intel/pmt: correct types
  platform/x86/intel/pmt: decouple sysfs and namespace
  platform/x86/intel/pmt: add register access helpers
  platform/x86/intel/pmt: refactor base parameter
  platform/x86/intel/pmt: use a version struct
  platform/x86/intel/pmt: support BMG crashlog

 drivers/gpu/drm/xe/xe_vsec.c              |  20 +-
 drivers/platform/x86/intel/pmt/class.c    |  15 +-
 drivers/platform/x86/intel/pmt/class.h    |   3 +-
 drivers/platform/x86/intel/pmt/crashlog.c | 459 +++++++++++++++++-----
 4 files changed, 386 insertions(+), 111 deletions(-)

-- 
2.50.0

