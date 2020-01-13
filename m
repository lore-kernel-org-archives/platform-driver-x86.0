From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 0/2] Intel Uncore frequency control
Date: Mon, 13 Jan 2020 10:00:13 -0800
Message-ID: <20200113180015.503314-1-srinivas.pandruvada@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: yu.chen.surf@gmail.com, andy@infradead.org, dvhart@infradead.org, andy@kernel.org, lenb@kernel.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

v3:
	Chen Yu pointed issue with rdmsrl, to change to rdmsrl_on_cpu

v2:
	Split the documentation patch to another patch to merge via different
	tree
	Add MAINTAINER entry

Srinivas Pandruvada (2):
  platform/x86: Add support for Uncore frequency control
  MAINTAINERS: Update for the intel uncore frequency control

 MAINTAINERS                                   |   6 +
 drivers/platform/x86/Kconfig                  |  11 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/intel-uncore-frequency.c | 437 ++++++++++++++++++
 4 files changed, 455 insertions(+)
 create mode 100644 drivers/platform/x86/intel-uncore-frequency.c

-- 
2.24.1
