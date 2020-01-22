From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 00/10] platform/x86: intel_scu_ipc: A fix and cleanups
Date: Wed, 22 Jan 2020 19:28:03 +0300
Message-ID: <20200122162813.26070-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

As suggested by Greg in the discussion around my SCU/PMC IPC rework series [1],
I split the cleanups touching intel_scu_ipc driver in a separate series
that can be applied independly.

The first patch fixes interrupt support to work in Intel Merrifield. The
rest of the patches are cleanups mostly removing code that is not used
anywhere.

[1] https://lkml.org/lkml/2020/1/21/678

Mika Westerberg (10):
  platform/x86: intel_scu_ipc: Fix interrupt support
  platform/x86: intel_scu_ipc: Add constants for register offsets
  platform/x86: intel_scu_ipc: Remove Lincroft support
  platform/x86: intel_scu_ipc: Drop intel_scu_ipc_i2c_cntrl()
  platform/x86: intel_scu_ipc: Sleeping is fine when polling
  platform/x86: intel_scu_ipc: Drop unused prototype intel_scu_ipc_fw_update()
  platform/x86: intel_scu_ipc: Drop unused macros
  platform/x86: intel_scu_ipc: Drop intel_scu_ipc_io[read|write][8|16]()
  platform/x86: intel_scu_ipc: Drop intel_scu_ipc_raw_command()
  platform/x86: intel_scu_ipc: Reformat kernel-doc comments of exported functions

 arch/x86/include/asm/intel_scu_ipc.h |  20 --
 drivers/platform/x86/intel_scu_ipc.c | 414 ++++++---------------------
 2 files changed, 91 insertions(+), 343 deletions(-)

-- 
2.24.1
