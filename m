From: ong.hock.yu@intel.com
Subject: [PATCH] platform:x86: Remove Monitor MWAIT feature dependency
Date: Thu, 23 Jun 2016 14:59:57 +0800
Message-ID: <1466665198-14446-1-git-send-email-ong.hock.yu@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:20895 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751647AbcFWHB0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 03:01:26 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: souvik.k.chakravarty@intel.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, ong.hock.yu@intel.com

From: "Yu, Ong Hock" <ong.hock.yu@intel.com>

This patch is to remove the MWAIT feature dependency from the driver. Telemetry capability does not depend on this feature.
Please include me in the mailing list as I did not subscripe to open list.

Yu, Ong Hock (1):
  platform:x86 Remove Monitor MWAIT feature dependency

 drivers/platform/x86/intel_telemetry_debugfs.c | 2 +-
 drivers/platform/x86/intel_telemetry_pltdrv.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1
