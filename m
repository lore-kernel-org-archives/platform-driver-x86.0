From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [lkp-robot] [platform/x86]  b925ff7dcd:
 BUG:unable_to_handle_kernel
Date: Mon, 13 Feb 2017 15:04:27 +1030
Message-ID: <20170213043427.GQ18615@marvin.atrad.com.au>
References: <20170208134633.5152-9-kernel@kempniu.pl>
 <20170213024015.GC28502@yexl-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:38782 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751014AbdBMEfv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Feb 2017 23:35:51 -0500
Content-Disposition: inline
In-Reply-To: <20170213024015.GC28502@yexl-desktop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kernel test robot <xiaolong.ye@intel.com>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, lkp@01.org

Michael

On Mon, Feb 13, 2017 at 10:40:15AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> 
> commit: b925ff7dcd1fc45b86baaebd3442f8b484123716 ("platform/x86: fujitsu-laptop: only register backlight device if FUJ02B1 is present")
> url: https://github.com/0day-ci/linux/commits/Micha-K-pie/fujitsu-laptop-renames-and-cleanups/20170209-030748
> base: git://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git for-next
> 
> in testcase: boot
> 
> on test machine: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -m 360M
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> :
> [    4.656202] fujitsu_laptop: call_fext_func: FUNC interface is not present
> [    4.657478] BUG: unable to handle kernel NULL pointer dereference at 00000008
> [    4.658433] IP: fujitsu_init+0x137/0x1b7
> [    4.659208] *pdpt = 0000000000000000 *pde = f000ff53f000ff53 
> :

I'm away from my Fujitsu hardware right now, and in any case this does not
get triggered on it.

I note that prior to the bug we get "FUNC interface is not present". 
Therefore something called call_fext_func() some time before the NULL
pointer dereference.  As far as I can tell the only such call which could be
made prior to or within fujitsu_init() is from fujitsu_init(), but this is
conditional on acpi_video_get_backlight_type() returning
acpi_backlight_vendor (line 1269).  Obviously if this conditional were
passed but fujitsu_bl->bl_device were NULL then we would get the NULL
dereference.

If ACPI_FUJITSU_LAPTOP_HID is not present then presumedly the

  acpi_bus_register_driver(&acpi_fujitsu_bl_driver)

call in fujitsu_init() will fail and nothing further would happen. 
Therefore this HID must be in the system.

However, the acpi_fujitsu_bl_add() callback wouldn't necessarily get run by
acpi_bus_register_driver(), would it?  I'm not too familiar with the lower
level ACPI functions but a quick trip through the source suggested that the
add callback isn't called via acpi_bus_register_driver().  This would mean
that that fujitsu_bl->bl_device would not yet be initialised when referenced
within fujitsu_init() at line 1271 or 1273.  If this were the case then I
see two options:

 1) Don't move the backlight registration out of fujitsu_init().

 2) Move the remaining backlight code (lines 1268-1274) into
    acpi_fujitsu_bl_add().

Item 1 effectively amounts to dropping this commit.  I'm not sure option 2
is workable because of the code's reliance on FUJ02E3; is that guaranteed to
be useable by the time acpi_fujitsu_bl_add() is called?

The only problem with the above theory is that it doesn't explain why the
NULL pointer dereference wasn't triggered on my Fujitsu hardware when this
code was tested on it.  If the ACPI bus probed/added asynchronously I guess
there could be a race whereby acpi_fujitsu_bl_add() may or may not have
completed by the time fujitsu_init() referenced fujitsu_bl->bl_device.  That
doesn't seem right to me though.

Regards
  jonathan
