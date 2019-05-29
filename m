From: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: linux-next: Tree for May 28 (platform/olpc/olpc-xo175-ec)
Date: Wed, 29 May 2019 08:27:45 +0200
Message-ID: <d8518bc65fd909723904637b19332760768f73e7.camel@v3.sk>
References: <20190528145838.23b73e25@canb.auug.org.au>
         <68b2b71a-970b-8e0e-1ee3-e05a51c3bdf2@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <68b2b71a-970b-8e0e-1ee3-e05a51c3bdf2@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Lennert Buytenhek <buytenh@wantstofly.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2019-05-28 at 11:05 -0700, Randy Dunlap wrote:
> On 5/27/19 9:58 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20190524:
> > 
> 
> on x86, there are some issues with drivers/platform/olpc/olpc-xo175-ec.c:
> 
> a. when CONFIG_SPI is not set/enabled:
> 
> WARNING: unmet direct dependencies detected for SPI_SLAVE
>   Depends on [n]: SPI [=n]
>   Selected by [y]:
>   - OLPC_XO175_EC [=y] && (ARCH_MMP || COMPILE_TEST [=y])
> 
> ld: drivers/platform/olpc/olpc-xo175-ec.o: in function `olpc_xo175_ec_remove':
> olpc-xo175-ec.c:(.text+0x79): undefined reference to `spi_slave_abort'
> ld: drivers/platform/olpc/olpc-xo175-ec.o: in function `olpc_xo175_ec_send_command':
> olpc-xo175-ec.c:(.text+0x24d): undefined reference to `spi_async'
> ld: drivers/platform/olpc/olpc-xo175-ec.o: in function `olpc_xo175_ec_cmd':
> olpc-xo175-ec.c:(.text+0xb3c): undefined reference to `spi_slave_abort'
> ld: drivers/platform/olpc/olpc-xo175-ec.o: in function `olpc_xo175_ec_spi_driver_init':
> olpc-xo175-ec.c:(.init.text+0xa): undefined reference to `__spi_register_driver'
> 
> b. when CONFIG_INPUT is not set/enabled:
> 
> ERROR: "input_register_device" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
> ERROR: "input_set_capability" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
> ERROR: "devm_input_allocate_device" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
> ERROR: "input_event" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
> 
> c. when some power mgt. Kconfig symbol is not set/enabled:
> 
> ERROR: "power_supply_put" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
> ERROR: "power_supply_changed" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
> ERROR: "power_supply_get_by_name" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
> 
> d. drivers/platform/olpc/Kconfig needs to use "menuconfig" like all of the other
>    Kconfig files in drivers/platform/ so that its menu is listed in the correct
>    place in *config interfaces.

Hi

Thanks for the heads up.

I think YueHaibing <yuehaibing@huawei.com> sent in patches for a. and
b. -- I'll follow up with the fixes for the rest.

> :(

:(

Lubo
