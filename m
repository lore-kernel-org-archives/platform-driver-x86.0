From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/3] platform/x86: intel_mid_powerbtn: Unify workflow
Date: Thu,  2 Feb 2017 19:54:25 +0200
Message-ID: <20170202175428.183482-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Currently there is a mess with PBSTATUS accessors between different
Intel MID platforms. Here is the set to fix it and make driver
eventually neat and almost clean.

Andy Shevchenko (3):
  platform/x86: intel_mid_powerbtn: Unify PBSTATUS access
  platform/x86: intel_mid_powerbtn: Move comment to where it belongs
  platform/x86: intel_mid_powerbtn: Unify IRQ acknowledegment

 drivers/platform/x86/intel_mid_powerbtn.c | 80 ++++++++++++-------------------
 1 file changed, 30 insertions(+), 50 deletions(-)

-- 
2.11.0
