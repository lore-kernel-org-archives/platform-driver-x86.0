From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [lkp-robot] [platform/x86]  b925ff7dcd:
 BUG:unable_to_handle_kernel
Date: Mon, 13 Feb 2017 09:14:40 +0100
Message-ID: <20170213081440.GA1093@ozzy.nask.waw.pl>
References: <20170208134633.5152-9-kernel@kempniu.pl>
 <20170213024015.GC28502@yexl-desktop>
 <20170213043427.GQ18615@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34795 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752087AbdBMIOp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2017 03:14:45 -0500
Received: by mail-lf0-f65.google.com with SMTP id q89so7637443lfi.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2017 00:14:44 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20170213043427.GQ18615@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: kernel test robot <xiaolong.ye@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, lkp@01.org

> Michael
> 
> On Mon, Feb 13, 2017 at 10:40:15AM +0800, kernel test robot wrote:
> > FYI, we noticed the following commit:
> > 
> > commit: b925ff7dcd1fc45b86baaebd3442f8b484123716 ("platform/x86: fujitsu-laptop: only register backlight device if FUJ02B1 is present")
> > url: https://github.com/0day-ci/linux/commits/Micha-K-pie/fujitsu-laptop-renames-and-cleanups/20170209-030748
> > base: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next
> > 
> > in testcase: boot
> > 
> > on test machine: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -m 360M
> > 
> > caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> > :
> > [    4.656202] fujitsu_laptop: call_fext_func: FUNC interface is not present
> > [    4.657478] BUG: unable to handle kernel NULL pointer dereference at 00000008
> > [    4.658433] IP: fujitsu_init+0x137/0x1b7
> > [    4.659208] *pdpt = 0000000000000000 *pde = f000ff53f000ff53 
> > :
> 
> I'm away from my Fujitsu hardware right now, and in any case this does not
> get triggered on it.
> 
> I note that prior to the bug we get "FUNC interface is not present". 
> Therefore something called call_fext_func() some time before the NULL
> pointer dereference.  As far as I can tell the only such call which could be
> made prior to or within fujitsu_init() is from fujitsu_init(), but this is
> conditional on acpi_video_get_backlight_type() returning
> acpi_backlight_vendor (line 1269).  Obviously if this conditional were
> passed but fujitsu_bl->bl_device were NULL then we would get the NULL
> dereference.

Yes, this is exactly what is happening.

> 
> If ACPI_FUJITSU_LAPTOP_HID

I think you meant ACPI_FUJITSU_BL_HID.

> is not present then presumedly the
> 
>   acpi_bus_register_driver(&acpi_fujitsu_bl_driver)
> 
> call in fujitsu_init() will fail and nothing further would happen. 
> Therefore this HID must be in the system.

Not really.  acpi_bus_register_driver() is just a wrapper around
driver_register().  In other words, whether or not a given HID is
present in the firmware does not have any influence on the return code
of that function.

In fact, the bug only happens when ACPI_FUJITSU_BL_HID is _not_ present.
Or, putting it differently, on all Skylake machines (when
acpi_backlight=vendor).  Once again I am really glad the kernel test
robot is there to counter my carelessness...

> 
> However, the acpi_fujitsu_bl_add() callback wouldn't necessarily get run by
> acpi_bus_register_driver(), would it?  I'm not too familiar with the lower
> level ACPI functions but a quick trip through the source suggested that the
> add callback isn't called via acpi_bus_register_driver().  This would mean
> that that fujitsu_bl->bl_device would not yet be initialised when referenced
> within fujitsu_init() at line 1271 or 1273.  If this were the case then I
> see two options:
> 
>  1) Don't move the backlight registration out of fujitsu_init().
> 
>  2) Move the remaining backlight code (lines 1268-1274) into
>     acpi_fujitsu_bl_add().
> 
> Item 1 effectively amounts to dropping this commit.  I'm not sure option 2
> is workable because of the code's reliance on FUJ02E3; is that guaranteed to
> be useable by the time acpi_fujitsu_bl_add() is called?

To keep things simple, I think we should drop this particular patch for
now.  Darren, Andy, could you skip it when applying this series?
Patches 9 and 10 do not rely on this one being applied.  Thanks and
sorry for the trouble.  v2 of my fujitsu_init() cleanup series will fix
this properly.

> 
> The only problem with the above theory is that it doesn't explain why the
> NULL pointer dereference wasn't triggered on my Fujitsu hardware when this
> code was tested on it.

Because the bug is not triggered as long as FUJ02B1 is present.

> If the ACPI bus probed/added asynchronously I guess
> there could be a race whereby acpi_fujitsu_bl_add() may or may not have
> completed by the time fujitsu_init() referenced fujitsu_bl->bl_device.  That
> doesn't seem right to me though.

When acpi_bus_register_driver() is called, the .add callback is
"synchronously" called for all ACPI devices handled by the registered
driver that are yet unbound to any driver.  So if FUJ02B1 is present,
acpi_fujitsu_bl_add() is called and bl_device is allocated.  However, if
that ACPI device is not present (like on Skylakes) and
acpi_backlight=vendor, we get a NULL dereference.

-- 
Best regards,
Michał Kępień
