From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 00/10] platform/x86: intel_mid_powerbtn: Fix, clean up, enhance
Date: Thu, 19 Jan 2017 18:39:39 +0200
Message-ID: <20170119163949.147183-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The series contains 3 groups of patches
- fix of the driver regarding interrupt flags
- several clean ups
- enhancement to enable on Intel Merrifield (Intel Edison board)

The driver has been tested on Intel Medfield tablet and Intel Edison board.

Andy Shevchenko (10):
  platform/x86: intel_mid_powerbtn: Set IRQ_ONESHOT
  platform/x86: intel_mid_powerbtn: Convert to use devm_*()
  platform/x86: intel_mid_powerbtn: Substitute mfld by mid
  platform/x86: intel_mid_powerbtn: Introduce driver data
  platform/x86: intel_mid_powerbtn: Factor out mfld_ack()
  platform/x86: intel_mid_powerbtn: Acknowledge interrupts
  platform/x86: intel_mid_powerbtn: Enable driver for Merrifield
  platform/x86: intel_mid_powerbtn: Join string literals
  platform/x86: intel_mid_powerbtn: Sort headers alphabetically
  platform/x86: intel_mid_powerbtn: Remove snail address

 drivers/platform/x86/intel_mid_powerbtn.c | 225 ++++++++++++++++++++++--------
 1 file changed, 164 insertions(+), 61 deletions(-)

-- 
2.11.0
