From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Re: [PATCH V2 2/4] misc/pvpanic: add MMIO support
Date: Fri, 26 Oct 2018 09:11:01 +0200
Message-ID: <CAK8P3a0Y7en4Aa_-ho7fdp17SsG=XnTePhTeqxFmr5PE4LvHeA@mail.gmail.com>
References: <CAHp75Ves+GCP8ZfOCXDcZNkyEo31hiPTyarRoYvhkjHeV+9dug@mail.gmail.com>
 <201810261140543493998@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201810261140543493998@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: peng.hao2@zte.com.cn
Cc: andy.shevchenko@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com
List-Id: platform-driver-x86.vger.kernel.org

On 10/26/18, peng.hao2@zte.com.cn <peng.hao2@zte.com.cn> wrote:
>>
>> On some architectures (e.g. arm64), it's preferable to use MMIO, since
>> this can be used standalone. Add MMIO support to the pvpanic driver.
>>
>>
>>No global variables, please.

There obviously has to be at least one global variable here, since the
caller of panic() has no context about the device that provides
the MMIO register. But I agree that using ioreadxx() here would
be nice to simplify the code, and it avoids having separate variables
for pio and mmio mode.

>>If your switch to ioreadxx()iowritexx() it would really help you here.
>>
> I can use iowrite8, but here:
>  if (base)
>       iounmap(base);
> I found the nearest API pci_iounmap, but it's a bit strange to see how this
> function is
> used here from the name of the function.
> And I do not confirm that this API is suitable for all architectures.

From reading the driver, I think you either come from a caller that
always uses PIO or from one that always uses MMIO, and they
are paired with probe/remove, so you can assign the global
__iomem pointer using either ioport_map() or ioremap(), and
undo that using ioport_unmap/iounmap respectively, while the
user just uses iowrite8() unconditionally. This is allowed by the
iowritexx() interfaces.

Alternatively, using devm_ioremap_resource() should work for
either pio or mmio, but it requires a device pointer, which in turn
means you have to slightly rewrite the ACPI portion to use a
platform_driver instead.

      Arnd
