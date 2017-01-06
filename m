From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] platform/x86: Remove PMIC GPIO block support
Date: Fri, 6 Jan 2017 22:40:37 +0200
Message-ID: <CAHp75VfB2_oetm_k2staYWBUvxyxnL2GAO6=c78NGR2fFfw6JQ@mail.gmail.com>
References: <20170105113228.132165-1-andriy.shevchenko@linux.intel.com> <201701061940.KHCVPyOr%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36840 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760553AbdAFUkj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Jan 2017 15:40:39 -0500
In-Reply-To: <201701061940.KHCVPyOr%fengguang.wu@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, kbuild-all@01.org, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jan 6, 2017 at 1:54 PM, kbuild test robot <lkp@intel.com> wrote:
> Hi Andy,
>
> [auto build test ERROR on platform-drivers-x86/for-next]
> [also build test ERROR on v4.10-rc2 next-20170105]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/platform-x86-Remove-PMIC-GPIO-block-support/20170106-185609
> base:   git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next
> config: i386-allmodconfig (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> All errors (new ones prefixed by >>):

Yes, yes. It's not an error, just dependency. Removal of the users of
this header is pending for tip tree.

>
>>> arch/x86/platform/intel-mid/sfi.c:18:35: fatal error: linux/intel_pmic_gpio.h: No such file or directory
>     #include <linux/intel_pmic_gpio.h>
>                                       ^
>    compilation terminated.
>
> vim +18 arch/x86/platform/intel-mid/sfi.c
>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17   2   * intel_mid_sfi.c: Intel MID SFI initialization code
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17   3   *
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17   4   * (C) Copyright 2013 Intel Corporation
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17   5   * Author: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17   6   *
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17   7   * This program is free software; you can redistribute it and/or
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17   8   * modify it under the terms of the GNU General Public License
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17   9   * as published by the Free Software Foundation; version 2
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  10   * of the License.
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  11   */
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  12
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  13  #include <linux/init.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  14  #include <linux/kernel.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  15  #include <linux/interrupt.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  16  #include <linux/scatterlist.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  17  #include <linux/sfi.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17 @18  #include <linux/intel_pmic_gpio.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  19  #include <linux/spi/spi.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  20  #include <linux/i2c.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  21  #include <linux/skbuff.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  22  #include <linux/gpio.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  23  #include <linux/gpio_keys.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  24  #include <linux/input.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  25  #include <linux/platform_device.h>
> aeedb370 Kuppuswamy Sathyanarayanan 2013-10-17  26  #include <linux/irq.h>
>
> :::::: The code at line 18 was first introduced by commit
> :::::: aeedb370e7398fb5b39185b295d36f2da0653215 intel_mid: Moved SFI related code to sfi.c
>
> :::::: TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> :::::: CC: H. Peter Anvin <hpa@linux.intel.com>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
With Best Regards,
Andy Shevchenko
