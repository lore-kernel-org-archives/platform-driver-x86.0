From: kbuild test robot <lkp@intel.com>
Subject: Re: [patch v1 1/2] drivers/platform/x86: move module mlx-platform
 from arch/x86 to drivers/platform/x86
Date: Fri, 28 Oct 2016 01:26:50 +0800
Message-ID: <201610280123.armLK3d5%fengguang.wu@intel.com>
References: <1477576758-102003-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477576758-102003-1-git-send-email-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, dvhart@infradead.org, fengguang.wu@intel.com, davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us, andriy.shevchenko@linux.intel.com, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi Vadim,

[auto build test WARNING on platform-drivers-x86/for-next]
[also build test WARNING on next-20161027]
[cannot apply to v4.9-rc2]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
[Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
[Check https://git-scm.com/docs/git-format-patch for more information]

url:    https://github.com/0day-ci/linux/commits/vadimp-mellanox-com/drivers-platform-x86-move-module-mlx-platform-from-arch-x86-to-drivers-platform-x86/20161028-000047
base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/platform/x86/mlx-platform.c:219:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
