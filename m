From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH 0/3] Get rid of BUG()
Date: Thu, 26 Jan 2017 23:20:35 +0200
Message-ID: <20170126212038.12809-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:24393 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753516AbdAZVUp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2017 16:20:45 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>

The use of BUG() is not favored for any new kernel code. This patch set
implements more reasonable error recovery. In all cases the recovery is not
ideal but it is an improvement to the current situation.

In addition, sgx_free_page() has been simplified by removing the parameter for
skipping EREMOVE. EREMOVE can be successfully executed for an unused EPC page.

Jarkko Sakkinen (3):
  intel_sgx: do not use BUG() in sgx_free_page()
  intel_sgx: remove flags parameter from sgx_free_page()
  intel_sgx: fix error paths for EBLOCK and ETRACK

 drivers/platform/x86/intel_sgx.h            |  4 +-
 drivers/platform/x86/intel_sgx_ioctl.c      | 12 ++--
 drivers/platform/x86/intel_sgx_page_cache.c | 89 +++++++++++++++--------------
 drivers/platform/x86/intel_sgx_util.c       |  6 +-
 drivers/platform/x86/intel_sgx_vma.c        |  6 +-
 5 files changed, 55 insertions(+), 62 deletions(-)

-- 
2.9.3
