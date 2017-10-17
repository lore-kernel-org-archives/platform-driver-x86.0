From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v8 09/15] platform/x86: dell-smbios: Introduce dispatcher
 for SMM calls
Date: Tue, 17 Oct 2017 12:14:08 +0800
Message-ID: <201710171257.wrCR1WHe%fengguang.wu@intel.com>
References: <90a5cf6c25c99cf8937b8b1d6109817e9dc736a0.1507958847.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:47515 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752867AbdJQEO7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 00:14:59 -0400
Content-Disposition: inline
In-Reply-To: <90a5cf6c25c99cf8937b8b1d6109817e9dc736a0.1507958847.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: kbuild-all@01.org, dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, Mario Limonciello <mario.limonciello@dell.com>

Hi Mario,

[auto build test WARNING on platform-drivers-x86/for-next]
[also build test WARNING on v4.14-rc5 next-20171016]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Mario-Limonciello/Introduce-support-for-Dell-SMBIOS-over-WMI/20171017-103109
base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next


coccinelle warnings: (new ones prefixed by >>)

>> drivers/platform/x86/dell-smbios.c:108:2-3: Unneeded semicolon
   drivers/platform/x86/dell-smbios.c:87:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
