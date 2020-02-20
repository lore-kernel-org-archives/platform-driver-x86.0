From: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: [PATCH 0/2] arm64: Support to find mirrored memory ranges
Date: Thu, 20 Feb 2020 03:43:31 -0000 (UTC)
Message-ID: <1582289580-24045-1-git-send-email-jingxiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 21 Feb 2020 07:52:58 -0500
Sender: linux-kernel-owner@vger.kernel.org
To: ardb@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy@infradead.org
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, wangkefeng.wang@huawei.com, jingxiangfeng@huawei.com
List-Id: platform-driver-x86.vger.kernel.org

This series enable finding mirrored memory ranges
functionality on arm64 platform. This feature has been
implemented on the x86 platform, so we move some
functions from x86.

Jing Xiangfeng (2):
  efi: allow EFI_FAKE_MEMMAP on arm64 platform
  arm64/efi: support to find mirrored memory ranges

 arch/x86/include/asm/efi.h      |  5 -----
 arch/x86/platform/efi/efi.c     | 39 ---------------------------------------
 drivers/firmware/efi/Kconfig    |  2 +-
 drivers/firmware/efi/arm-init.c |  2 ++
 drivers/firmware/efi/efi.c      | 23 +++++++++++++++++++++++
 drivers/firmware/efi/memmap.c   | 16 ++++++++++++++++
 include/linux/efi.h             |  5 +++++
 7 files changed, 47 insertions(+), 45 deletions(-)

-- 
1.8.3.1
