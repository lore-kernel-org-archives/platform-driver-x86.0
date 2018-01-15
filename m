From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [patch v7 3/3] platform/mellanox: mlxreg-hotplug: modify to use
 regmap intreface
Date: Mon, 15 Jan 2018 22:21:33 +0200
Message-ID: <CAHp75Ve_shhVTRcDDinvzdxX4ByugLbB_50yNMn4n66yjqUKBg@mail.gmail.com>
References: <1515420999-4133-4-git-send-email-vadimp@mellanox.com>
 <201801101447.LGVbZ8Xz%fengguang.wu@intel.com> <20180115201528.GA10860@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:34723 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750812AbeAOUVe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jan 2018 15:21:34 -0500
In-Reply-To: <20180115201528.GA10860@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: kbuild test robot <lkp@intel.com>, Vadim Pasternak <vadimp@mellanox.com>, kbuild-all@01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>

On Mon, Jan 15, 2018 at 10:15 PM, Darren Hart <dvhart@infradead.org> wrote:
> On Wed, Jan 10, 2018 at 03:12:48PM +0800, kbuild test robot wrote:

>>    ERROR: "ia64_delay_loop" [drivers/spi/spi-thunderx.ko] undefined!
>> >> ERROR: "of_update_property" [drivers/platform/mellanox/mlxreg-hotplug.ko] undefined!
>>    ERROR: "ia64_delay_loop" [drivers/net/phy/mdio-cavium.ko] undefined!
>
> Vadim, three undefined errors. Assuming you successfully built the drivers prior
> to submission, this is likely due to a Kconfig dependency missing. Please
> correct and resubmit.

It's already v8 is there.

-- 
With Best Regards,
Andy Shevchenko
