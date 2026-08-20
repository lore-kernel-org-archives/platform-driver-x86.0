Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA50A3D9DD8;
	Thu, 20 Aug 2026 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787259107; cv=none; b=MKM5ZoTFHSgFLthanBpryU9crS4KG8/c0qBpDsggdMQaFmNLBkxopINVSMODvF7qH2zSEhLLSaNOXejcK0JzZ3kqNKx7xs7FQa7ngdGtwCTubvxWfEO7ind6fMDIc5xf0IZ/wMAQtRUNyXgbtNcRWmwNvRgbzZxzvIrh16kRWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787259107; c=relaxed/simple;
	bh=5JYsgsD4t4mdxUqPlogQk4Ky3KfJzy8FPXEag7iJ7Ao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5oFqjvkZH0RBcylUvvtUg3h23jrs7j4lJx/l6ViJWey4ZXUoko1y02ye95LblGDJ6fYHwfE/7+ujR12Ivyx/R2nOSns3ttTgHB3BmnAc2hOlKqALW7MNBzb9ttE+5CSsIYR1F2/wwB8oyRD91CpaGxI6kL4qTWxtncwvUgat9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlXI8Qzh; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlXI8Qzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787259105; x=1818795105;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5JYsgsD4t4mdxUqPlogQk4Ky3KfJzy8FPXEag7iJ7Ao=;
  b=WlXI8QzhVaJoL5BxvZwrR4/KsCkCmpw/Nth7o+C5MvEBxjj86uaAjprJ
   6ORYmdfp9tQPwRhoat+nFIHOd50gL7CnWIapGhaeFBRHelB9FrgWsOFkf
   zhgHk/lgF0GdpVyeBVQtf5khmc/ca0A7pya8ZYX9Zv7zwaZT8vYgTj/ug
   Tyn5/wjVDoAT7zSMYy9vykCn4og3sPQvTFY1SkOMUqSFPmlLBjmXmiXhb
   16d24ISaFOkPS21Go+ZSuQt0rwWm+vZzdSpqjxw83xkkitSWm1k1HB8OW
   7QWoUdQjz3qY1SKLHE/Ss2I2DBbMX/L3GNZNnFjHycVgCgbVz1IDpuZdF
   w==;
X-CSE-ConnectionGUID: mWsFg4s7QaebybYYXoUmnQ==
X-CSE-MsgGUID: QJm+DcghSX6b0xqkOhRXeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87868011"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="87868011"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 13:51:42 -0700
X-CSE-ConnectionGUID: HUXJ0w/GSSCwMsq83MSmdg==
X-CSE-MsgGUID: /FmhL/ZhQf+uPPNOcx6DIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; 
   d="scan'208";a="264844353"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.149])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 13:51:41 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 341C711FA3A;
	Thu, 20 Aug 2026 23:51:48 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1wx9jo-0000000CDC3-1BYz;
	Thu, 20 Aug 2026 23:51:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] Fix static analyser and compiler warnings in int3472
Date: Thu, 20 Aug 2026 23:51:46 +0300
Message-ID: <20260820205148.2910639-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

These two patches address smatch and compiler warnings in int3472.

Just compile tested for now. :-)

Sakari Ailus (2):
  platform/x86: int3472: Address Coccinelle warning on an error print
  platform/x86: int3472: Fix uninitialised variable warning

 drivers/platform/x86/intel/int3472/discrete.c | 21 +++++++++----------
 drivers/platform/x86/intel/int3472/tps68470.c |  2 +-
 2 files changed, 11 insertions(+), 12 deletions(-)

-- 
2.47.3

