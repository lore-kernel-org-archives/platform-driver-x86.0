Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBBFC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 05:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34C7F64F51
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 05:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhBDFIu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 00:08:50 -0500
Received: from mga18.intel.com ([134.134.136.126]:61498 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229754AbhBDFIu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 00:08:50 -0500
IronPort-SDR: a5WhTg3xKoQtqIWul1dIuhMRUDwoBMEEkR5gouW5ueJpLd51jTG0NT6biUffJ4hz4YBAzdX5cK
 0z50UuqIfQyg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="168854626"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="168854626"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 21:08:06 -0800
IronPort-SDR: x/yfqbpHOrQyPcwNCfclM1iXozcoy5mGIdRLCoMoQZrbU+kHi8HWnrjPM0EA/VoChJqU1qlTL3
 LirENfkz7R+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="356260391"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 03 Feb 2021 21:08:05 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l7Ws8-0000lM-H5; Thu, 04 Feb 2021 05:08:04 +0000
Date:   Thu, 04 Feb 2021 13:07:11 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:fixes] BUILD SUCCESS
 215164bfb7144c5890dd8021ff06e486939862d4
Message-ID: <601b80ff.QEgAwOnqv23hqNUR%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/linux-platform-drivers-x86.git fixes
branch HEAD: 215164bfb7144c5890dd8021ff06e486939862d4  platform/x86: dell-wmi-sysman: fix a NULL pointer dereference

elapsed time: 728m

configs tested: 156
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
s390                       zfcpdump_defconfig
mips                           ip28_defconfig
sh                           se7724_defconfig
c6x                                 defconfig
xtensa                              defconfig
arm                      jornada720_defconfig
mips                           ip27_defconfig
powerpc                     powernv_defconfig
arm                        mvebu_v7_defconfig
ia64                         bigsur_defconfig
mips                            gpr_defconfig
arm                         cm_x300_defconfig
sh                          urquell_defconfig
arm                        spear6xx_defconfig
sh                ecovec24-romimage_defconfig
c6x                        evmc6472_defconfig
powerpc                       ebony_defconfig
m68k                             allmodconfig
arm                       multi_v4t_defconfig
sh                              ul2_defconfig
riscv                             allnoconfig
nios2                         3c120_defconfig
m68k                       m5475evb_defconfig
openrisc                            defconfig
mips                           ip32_defconfig
powerpc                        cell_defconfig
powerpc                      makalu_defconfig
powerpc                  mpc866_ads_defconfig
sh                           se7751_defconfig
sh                            migor_defconfig
sh                          polaris_defconfig
ia64                          tiger_defconfig
mips                       lemote2f_defconfig
arm                        oxnas_v6_defconfig
mips                        nlm_xlp_defconfig
powerpc                      ppc44x_defconfig
arc                      axs103_smp_defconfig
arc                            hsdk_defconfig
arc                        nsim_700_defconfig
powerpc                      ppc6xx_defconfig
powerpc                     tqm8548_defconfig
powerpc                 mpc837x_rdb_defconfig
powerpc                 mpc836x_rdk_defconfig
nios2                               defconfig
h8300                     edosk2674_defconfig
sh                          rsk7201_defconfig
xtensa                  nommu_kc705_defconfig
powerpc                          g5_defconfig
arm                        cerfcube_defconfig
powerpc                     akebono_defconfig
arm                       imx_v4_v5_defconfig
riscv                            alldefconfig
parisc                generic-64bit_defconfig
mips                      maltasmvp_defconfig
sh                        edosk7705_defconfig
arm                            zeus_defconfig
arm                         at91_dt_defconfig
powerpc                      pmac32_defconfig
s390                          debug_defconfig
mips                         bigsur_defconfig
arm                          lpd270_defconfig
nds32                             allnoconfig
c6x                              allyesconfig
arm                       netwinder_defconfig
xtensa                          iss_defconfig
arm                         orion5x_defconfig
arm                          collie_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
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
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                               tinyconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20210202
i386                 randconfig-a005-20210202
i386                 randconfig-a003-20210202
i386                 randconfig-a006-20210202
i386                 randconfig-a002-20210202
i386                 randconfig-a004-20210202
i386                 randconfig-a001-20210203
i386                 randconfig-a005-20210203
i386                 randconfig-a003-20210203
i386                 randconfig-a006-20210203
i386                 randconfig-a002-20210203
i386                 randconfig-a004-20210203
i386                 randconfig-a001-20210204
i386                 randconfig-a005-20210204
i386                 randconfig-a003-20210204
i386                 randconfig-a006-20210204
i386                 randconfig-a002-20210204
i386                 randconfig-a004-20210204
x86_64               randconfig-a013-20210202
x86_64               randconfig-a014-20210202
x86_64               randconfig-a015-20210202
x86_64               randconfig-a016-20210202
x86_64               randconfig-a011-20210202
x86_64               randconfig-a012-20210202
i386                 randconfig-a013-20210202
i386                 randconfig-a016-20210202
i386                 randconfig-a014-20210202
i386                 randconfig-a012-20210202
i386                 randconfig-a015-20210202
i386                 randconfig-a011-20210202
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
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
x86_64               randconfig-a006-20210202
x86_64               randconfig-a001-20210202
x86_64               randconfig-a005-20210202
x86_64               randconfig-a002-20210202
x86_64               randconfig-a004-20210202
x86_64               randconfig-a003-20210202
x86_64               randconfig-a006-20210204
x86_64               randconfig-a001-20210204
x86_64               randconfig-a005-20210204
x86_64               randconfig-a002-20210204
x86_64               randconfig-a004-20210204
x86_64               randconfig-a003-20210204

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
