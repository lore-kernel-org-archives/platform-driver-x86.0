From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 0/2] tools/power/x86/intel-speed-select: Bug fixes for
Date: Tue,  3 Mar 2020 14:50:42 -0800
Message-ID: <20200303225044.362525-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, prarit@redhat.com, linux-kernel@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

The latest code at 5.6-* cycle has two bugs related to CPU count and
sending of CLOS_PM_QOS_CONFIG.

Srinivas Pandruvada (2):
  tools/power/x86/intel-speed-select: Fix mailbox usage for
    CLOS_PM_QOS_CONFIG
  tools/power/x86/intel-speed-select: Fix last cpu number

 tools/power/x86/intel-speed-select/isst-config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.24.1
