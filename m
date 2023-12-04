Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PpRnePzw"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3873CCB;
	Mon,  4 Dec 2023 14:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701728267; x=1733264267;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Tg0LEBGOEm/+i42KJEjRQlUI2AXRIDHLFhFUEf1e68M=;
  b=PpRnePzwbdnB3jxLxYxpmhBu0ca7XcruEchamahUiPUzb/d+MsHC5XQZ
   Jp3BgI1PhaAY3P8iLt/HpYf7DnpecZp4rppIL+33SJr0xGAj2Pi5Jrtt7
   Z7sVIp9js9Xo0+KBhd92gvj39uiUC24yTGYXIOhVhFK0XAJOhkcMYDwmD
   nC4kcLkN+8O4+IlGYSJcKTjT28ti7W0SEyJlUkjpaFEcHcbJQCL5bxjOe
   tl1mAmqVGjhSxPzDSiH5tlqE1di3ZFWguQ/NhY7dpOphELQWMJgzgZ/ee
   3iTl+pLGIdfxLwic8DCjrzrtQXQhG/ytzAEopWPYDSEDx/3+q+8yojtZD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="480000868"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="480000868"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 14:17:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764111950"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="764111950"
Received: from spandruv-desk.jf.intel.com ([10.54.75.14])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 14:17:46 -0800
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	markgross@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 0/5] TPMI update for permissions
Date: Mon,  4 Dec 2023 14:17:35 -0800
Message-Id: <20231204221740.3645130-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Process read/write and enabled state for feature drivers. When a feature
is disabled, don't create a device to load a feature driver. When a read
is blocked then don't load feature drivers. When write is blocked continue
to function in read only mode.

v3:
	No code change. Rebased on top of 
https://kernel.googlesource.com/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86 review-hans

v2:
	Dropped patch platform/x86/intel/tpmi: Add additional TPMI header fields
	Addressed other review comments, details are in each patch

Srinivas Pandruvada (5):
  platform/x86/intel/tpmi: Don't create devices for disabled features
  platform/x86/intel/tpmi: Modify external interface to get read/write
    state
  platform/x86/intel/tpmi: Move TPMI ID definition
  platform/x86: ISST: Process read/write blocked feature status
  platform/x86/intel-uncore-freq: Process read/write blocked feature
    status

 .../intel/speed_select_if/isst_tpmi_core.c    | 25 +++++++++++++
 drivers/platform/x86/intel/tpmi.c             | 35 +++++++++----------
 .../uncore-frequency/uncore-frequency-tpmi.c  | 15 ++++++++
 include/linux/intel_tpmi.h                    | 18 ++++++++--
 4 files changed, 72 insertions(+), 21 deletions(-)

-- 
2.40.1

