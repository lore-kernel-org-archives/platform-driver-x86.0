Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F6DC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat,  6 Feb 2021 03:09:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5336A64FD3
	for <platform-driver-x86@archiver.kernel.org>; Sat,  6 Feb 2021 03:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbhBFDJY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Feb 2021 22:09:24 -0500
Received: from mga05.intel.com ([192.55.52.43]:32905 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232022AbhBFDGD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Feb 2021 22:06:03 -0500
IronPort-SDR: tw7PXXxI2KVwKORt6/OaB4lJImVKDjF75HzKwA4mI2mQOdG/Fbmhiyb7JRReJckX7QRQmYqVeU
 8yUQ8LbHM5TA==
X-IronPort-AV: E=McAfee;i="6000,8403,9886"; a="266332459"
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; 
   d="scan'208";a="266332459"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 15:55:46 -0800
IronPort-SDR: mzEFQ8P3+uwG+yT+BXEx1bjQs03CTbcGuetsFWaArIHeSckfPZW8/4qEhGn/XwwZUZKJdSUa9D
 w5oEgBcD+H0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,156,1610438400"; 
   d="scan'208";a="434649192"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2021 15:55:44 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l8Awx-00022f-12; Fri, 05 Feb 2021 23:55:43 +0000
Date:   Sat, 06 Feb 2021 07:55:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:intel-mid-removal] BUILD SUCCESS
 ca338fed2a5fce66660904d7ab50bec061d2c8a2
Message-ID: <601ddae9.93KBVH83iX5dSZMn%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/linux-platform-drivers-x86.git intel-mid-removal
branch HEAD: ca338fed2a5fce66660904d7ab50bec061d2c8a2  platform/x86: intel_scu_wdt: Drop mistakenly added const

elapsed time: 726m

configs tested: 93
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                          gemini_defconfig
powerpc                      obs600_defconfig
arm                            xcep_defconfig
mips                             allmodconfig
nios2                            alldefconfig
c6x                                 defconfig
openrisc                            defconfig
m68k                         amcore_defconfig
powerpc                   motionpro_defconfig
arm                        mvebu_v7_defconfig
arm                        vexpress_defconfig
mips                       bmips_be_defconfig
powerpc                      pmac32_defconfig
arm                           tegra_defconfig
sh                           sh2007_defconfig
m68k                           sun3_defconfig
mips                 decstation_r4k_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210205
i386                 randconfig-a005-20210205
i386                 randconfig-a003-20210205
i386                 randconfig-a006-20210205
i386                 randconfig-a002-20210205
i386                 randconfig-a004-20210205
x86_64               randconfig-a013-20210204
x86_64               randconfig-a014-20210204
x86_64               randconfig-a015-20210204
x86_64               randconfig-a011-20210204
x86_64               randconfig-a016-20210204
x86_64               randconfig-a012-20210204
i386                 randconfig-a013-20210205
i386                 randconfig-a016-20210205
i386                 randconfig-a014-20210205
i386                 randconfig-a012-20210205
i386                 randconfig-a015-20210205
i386                 randconfig-a011-20210205
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a006-20210204
x86_64               randconfig-a001-20210204
x86_64               randconfig-a005-20210204
x86_64               randconfig-a002-20210204
x86_64               randconfig-a004-20210204
x86_64               randconfig-a003-20210204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
