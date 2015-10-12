From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/5] intel_scu_ipc: bug fixes and amendments
Date: Mon, 12 Oct 2015 14:19:43 +0300
Message-ID: <1444648788-74265-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:20012 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751073AbbJLLTv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Oct 2015 07:19:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There are couple of bugfixes (patches 1 & 5) and amendments to the driver.

Patch series has been tested on Intel Medfield and Intel Edison (Merrifield)
boards.

Changes v2:
- improve patch 4 commit message (suggested by Darren)
- leave only fix of a potential bug in patch 5

Andy Shevchenko (5):
  intel_scu_ipc: fix error path by turning to devm_* / pcim_*
  intel_scu_ipc: propagate pointer to struct intel_scu_ipc_dev
  intel_scu_ipc: convert to use struct device *
  intel_scu_ipc: switch to use module_pci_driver() macro
  intel_scu_ipc: protect dev member assignment on ->remove()

 drivers/platform/x86/intel_scu_ipc.c | 189 +++++++++++++++++------------------
 1 file changed, 90 insertions(+), 99 deletions(-)

-- 
2.5.3
