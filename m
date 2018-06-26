From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: 4.17.0-rc3+ BUG kmalloc-2048: Poison overwritten (USB hub
 disconnect)
Date: Tue, 26 Jun 2018 12:50:10 +0300
Message-ID: <e81b49c5-4239-3e45-21bc-23e842b7ebf5@linux.intel.com>
References: <CAOMGZ=ErZHAY7XF8XnPP-rAZahx4giOcntJj+JENuZOH-kZ3kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMGZ=ErZHAY7XF8XnPP-rAZahx4giOcntJj+JENuZOH-kZ3kg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vegard Nossum <vegard.nossum@gmail.com>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi

On 26.06.2018 11:20, Vegard Nossum wrote:
> Hi,
> 
> I've been seeing variants of this when I plug/unplug my ThinkPad T460
> from the docking station:
> 
> usb 2-4: USB disconnect, device number 30
> usb 2-4.1: USB disconnect, device number 31
> thinkpad_acpi: undocked from hotplug port replicator
> thinkpad_acpi: EC reports that Thermal Table has changed
> usb 1-4: USB disconnect, device number 61
> usb 1-4.1: USB disconnect, device number 63
> usb 1-4.4: USB disconnect, device number 62
> =============================================================================
> BUG kmalloc-2048 (Tainted: G    B            ): Poison overwritten
> -----------------------------------------------------------------------------
> 
> INFO: 0x00000000f262b063-0x00000000ccb4f11c. First byte 0x0 instead of 0x6b
> INFO: Allocated in usb_alloc_dev+0x35/0x329 age=6894431 cpu=0 pid=27384
>          __slab_alloc+0x20/0x40
>          kmem_cache_alloc_trace+0x1ee/0x230
>          usb_alloc_dev+0x35/0x329
>          hub_event+0xba8/0x15c0
>          process_one_work+0x148/0x3d0
>          worker_thread+0x4b/0x460
>          kthread+0x102/0x140
>          ret_from_fork+0x35/0x40
> INFO: Freed in usb_release_dev+0x60/0x70 age=0 cpu=0 pid=32750
>          kfree+0x176/0x1a0
>          usb_release_dev+0x60/0x70
>          device_release+0x32/0x90
>          kobject_put+0x82/0x190
>          put_device+0x17/0x20
>          usb_disconnect+0x1b2/0x290
>          usb_disconnect+0x1f3/0x290
>          hub_event+0x94f/0x15c0
>          process_one_work+0x148/0x3d0
>          worker_thread+0x4b/0x460
>          kthread+0x102/0x140
>          ret_from_fork+0x35/0x40
> INFO: Slab 0x00000000f6509278 objects=13 used=13 fp=0x          (null)
> flags=0x17fffc000008100
> INFO: Object 0x00000000a7692b6c @offset=4776 fp=0x0000000078ed8ddc
> 
> I don't have the source/config for this kernel anymore, sorry. Will
> probably try a newer kernel at some point to see if it's still
> present, it might already be fixed. I just wanted to send a report
> just in case it has enough info for somebody to spot what went wrong
> without too much effort.
> 
> See attachment for fuller log + timestamps. The tainted bits are from
> earlier reports of the same type.
> 
> 

Does  patch
2278446 xhci: Fix USB3 NULL pointer dereference at logical disconnect.
help?

It should be in 4.17-rc6

-Mathias
