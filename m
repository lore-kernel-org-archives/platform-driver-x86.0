From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [REPOST][PATCH 0/2] x86/platform: intel-uncore-frequnecy bug fixes
Date: Mon, 17 Feb 2020 18:28:42 -0800
Message-ID: <20200218022844.179988-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

This patchset fix issue reported by static checker and potential
race condition.

Srinivas Pandruvada (2):
  platform/x86/intel-uncore-freq: Fix static checker issue and potential
    race condition
  platform/x86/intel-uncore-freq: Add release callback

 drivers/platform/x86/intel-uncore-frequency.c | 51 ++++++++++++-------
 1 file changed, 33 insertions(+), 18 deletions(-)

-- 
2.20.1
