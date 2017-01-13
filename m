From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH] platform/x86: Add IMS/ZII SCU driver
Date: Fri, 13 Jan 2017 18:15:09 +0800
Message-ID: <201701131816.MMxSdYfR%fengguang.wu@intel.com>
References: <20170111212644.9217-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:11692 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751355AbdAMKQU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2017 05:16:20 -0500
Content-Disposition: inline
In-Reply-To: <20170111212644.9217-1-f.fainelli@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: kbuild-all@01.org, platform-driver-x86@vger.kernel.org, cphealy@gmail.com, Guenter Roeck <linux@roeck-us.net>, Florian Fainelli <f.fainelli@gmail.com>, Darren Hart <dvhart@infradead.org>, open list <linux-kernel@vger.kernel.org>

Hi Guenter,

[auto build test WARNING on platform-drivers-x86/for-next]
[also build test WARNING on v4.10-rc3 next-20170113]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Florian-Fainelli/platform-x86-Add-IMS-ZII-SCU-driver/20170113-163943
base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/platform/x86/scu.c:1541:3-8: No need to set .owner here. The core will do it.

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
