From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] drivers/x86: add thinkpad-wmi
Date: Thu, 7 Sep 2017 18:02:24 +0800
Message-ID: <201709071725.1hbpOsaR%fengguang.wu@intel.com>
References: <20170904082110.30925-1-corentin.chary@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170904082110.30925-1-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Corentin,

[auto build test WARNING on platform-drivers-x86/for-next]
[also build test WARNING on v4.13 next-20170906]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Corentin-Chary/drivers-x86-add-thinkpad-wmi/20170907-125653
base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/platform/x86/thinkpad-wmi.c:1196:3-8: No need to set .owner here. The core will do it.
--
>> drivers/platform/x86/thinkpad-wmi.c:1205:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
