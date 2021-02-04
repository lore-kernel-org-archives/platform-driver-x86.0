Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2B0C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 05:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0719A64F47
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 05:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbhBDFIu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 00:08:50 -0500
Received: from mga17.intel.com ([192.55.52.151]:30907 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhBDFIs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 00:08:48 -0500
IronPort-SDR: JIytQgueJw31sKi/gOm4GBTwo0b2bRGw5zd4nTR9/RS7hOU5r+wgIRJw9V9V9bkYjXtAzwLNPQ
 ZTO/8+p8+kCA==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160931036"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="160931036"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 21:08:07 -0800
IronPort-SDR: C74lcrLAkGqntePQOGFZBxvTN5dmP4Rrxcabao+ixET4l8Kwud95IC1U8Dcn/py1to5Enyz239
 o6uJB2GJqfXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; 
   d="scan'208";a="414673513"
Received: from lkp-server02.sh.intel.com (HELO 8b832f01bb9c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2021 21:08:05 -0800
Received: from kbuild by 8b832f01bb9c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l7Ws8-0000lJ-G3; Thu, 04 Feb 2021 05:08:04 +0000
Date:   Thu, 04 Feb 2021 13:07:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [platform-drivers-x86:for-next] BUILD REGRESSION
 60accc011af0ff869875b1ded81cbd0948267f05
Message-ID: <601b80fc.oHIG/GJZzcM6ofyv%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

tree/branch: git://git.infradead.org/linux-platform-drivers-x86.git for-next
branch HEAD: 60accc011af0ff869875b1ded81cbd0948267f05  platform/x86/intel-uncore-freq: Add Sapphire Rapids server support

Error/Warning reports:

https://lore.kernel.org/platform-driver-x86/202102040432.nrBYesxd-lkp@intel.com
https://lore.kernel.org/platform-driver-x86/202102040432.qcL72rtk-lkp@intel.com
https://lore.kernel.org/platform-driver-x86/202102040503.hpbrH6qm-lkp@intel.com

Error/Warning in current branch:

drivers/platform/x86/ideapad-laptop.c:659:5: warning: no previous prototype for 'dytc_profile_get' [-Wmissing-prototypes]
drivers/platform/x86/ideapad-laptop.c:676:5: warning: no previous prototype for 'dytc_cql_command' [-Wmissing-prototypes]
drivers/platform/x86/ideapad-laptop.c:713:5: warning: no previous prototype for 'dytc_profile_set' [-Wmissing-prototypes]
drivers/platform/x86/thinkpad_acpi.c:10081:5: warning: no previous prototype for 'dytc_profile_get' [-Wmissing-prototypes]
drivers/platform/x86/thinkpad_acpi.c:10095:5: warning: no previous prototype for 'dytc_cql_command' [-Wmissing-prototypes]
drivers/platform/x86/thinkpad_acpi.c:10133:5: warning: no previous prototype for 'dytc_profile_set' [-Wmissing-prototypes]
drivers/platform/x86/thinkpad_acpi.c:10186: undefined reference to `platform_profile_notify'
drivers/platform/x86/thinkpad_acpi.c:10226: undefined reference to `platform_profile_register'
drivers/platform/x86/thinkpad_acpi.c:10246: undefined reference to `platform_profile_remove'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- i386-allmodconfig
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_get
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_set
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
|-- i386-randconfig-a003-20210202
|   |-- drivers-platform-x86-thinkpad_acpi.c:undefined-reference-to-platform_profile_notify
|   |-- drivers-platform-x86-thinkpad_acpi.c:undefined-reference-to-platform_profile_register
|   |-- drivers-platform-x86-thinkpad_acpi.c:undefined-reference-to-platform_profile_remove
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
|-- i386-randconfig-a004-20210202
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
|-- i386-randconfig-r021-20210203
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_get
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_set
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
|-- x86_64-allmodconfig
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
|-- x86_64-allyesconfig
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_get
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_set
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
|-- x86_64-rhel
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_get
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_set
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
|-- x86_64-rhel-7.6-kselftests
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_get
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_set
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
|-- x86_64-rhel-8.3
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_get
|   |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_set
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
|   |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
|   `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set
`-- x86_64-rhel-8.3-kbuiltin
    |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_cql_command
    |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_get
    |-- drivers-platform-x86-ideapad-laptop.c:warning:no-previous-prototype-for-dytc_profile_set
    |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_cql_command
    |-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_get
    `-- drivers-platform-x86-thinkpad_acpi.c:warning:no-previous-prototype-for-dytc_profile_set

elapsed time: 727m

configs tested: 149
configs skipped: 2

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
nios2                         3c120_defconfig
m68k                       m5475evb_defconfig
openrisc                            defconfig
mips                           ip32_defconfig
powerpc                        cell_defconfig
powerpc                      makalu_defconfig
sh                            migor_defconfig
powerpc                  mpc866_ads_defconfig
sh                           se7751_defconfig
sh                          polaris_defconfig
ia64                          tiger_defconfig
mips                       lemote2f_defconfig
arm                        oxnas_v6_defconfig
mips                        nlm_xlp_defconfig
powerpc                      ppc44x_defconfig
sh                          landisk_defconfig
arm                       aspeed_g5_defconfig
mips                           xway_defconfig
mips                          ath79_defconfig
arm                           viper_defconfig
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
arm                             pxa_defconfig
arm                          moxart_defconfig
powerpc                      katmai_defconfig
powerpc                         wii_defconfig
powerpc                 mpc834x_mds_defconfig
s390                          debug_defconfig
nds32                             allnoconfig
mips                         bigsur_defconfig
c6x                              allyesconfig
arm                          lpd270_defconfig
arm                       netwinder_defconfig
xtensa                          iss_defconfig
arm                         orion5x_defconfig
arm                          collie_defconfig
powerpc                         ps3_defconfig
arc                    vdk_hs38_smp_defconfig
arm                            xcep_defconfig
arm                        multi_v5_defconfig
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
i386                 randconfig-a003-20210202
i386                 randconfig-a002-20210202
i386                 randconfig-a004-20210202
i386                 randconfig-a005-20210202
i386                 randconfig-a006-20210202
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
i386                 randconfig-a013-20210203
i386                 randconfig-a016-20210203
i386                 randconfig-a014-20210203
i386                 randconfig-a012-20210203
i386                 randconfig-a015-20210203
i386                 randconfig-a011-20210203
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                      rhel-8.3-kbuiltin
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a001-20210202
x86_64               randconfig-a002-20210202
x86_64               randconfig-a004-20210202
x86_64               randconfig-a003-20210202
x86_64               randconfig-a006-20210202
x86_64               randconfig-a005-20210202

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
