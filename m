From: "Guilherme G. Piccoli" <gpiccoli-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: Advice on oops - memory trap on non-memory access instruction
	(invalid CR2?)
Date: Tue, 15 Oct 2019 12:21:45 -0300
Message-ID: <331f83c2-1d52-dfdb-1006-e910ff20c3a5@canonical.com>
References: <66eeae28-bfd3-c7a0-011c-801981b74243@canonical.com>
	<alpine.DEB.2.21.1910141602270.2531@nanos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <alpine.DEB.2.21.1910141602270.2531-ecDvlHI5BZPZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, mfo-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, ioanna-maria.alifieraki-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, jay.vosburgh-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, gavin.guo-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On 14/10/2019 11:10, Thomas Gleixner wrote:
> On Mon, 14 Oct 2019, Guilherme G. Piccoli wrote:
>> Modules linked in: <...>
>> CPU: 40 PID: 78274 Comm: qemu-system-x86 Tainted: P W  OE
> 
> Tainted: P     - Proprietary module loaded ...
> 
> Try again without that module

Thanks Thomas, for the prompt response. This is some ScaleIO stuff, I
guess it's part of customer setup, and I agree would be better to not
have this kind of module loaded. Anyway, the analysis of oops show a
quite odd situation that we'd like to at least have a strong clue before
saying the scaleio stuff is the culprit.

> 
> Tainted: W     - Warning issued before
> 
> Are you sure that that warning is harmless and unrelated?
> 

Sorry I didn't mention that before, the warn is:

[5946866.593060] WARNING: CPU: 42 PID: 173056 at
/build/linux-lts-xenial-80t3lB/linux-lts-xenial-4.4.0/arch/x86/events/intel/core.c:1868
intel_pmu_handle_irq+0x2d4/0x470()
[5946866.593061] perfevents: irq loop stuck!

It happened ~700 days before the oops (yeah, the uptime is quite large,
about 900 days when the oops happened heh).


>> 4.4.0-45-generic #66~14.04.1-Ubuntu
> 
> Does the same problem happen with a not so dead kernel? CR2 handling got
> quite some updates/fixes since then.

Unfortunately we don't have ways to test that for now, but your comment
is quite interesting - we can take a look in the CR2 fixes since v4.4.

But what do you think about having a #PF while the instruction pointed
in the oops Code section (and the RIP address) is not a memory-related insn?

Thanks,


Guilherme
> 
> Thanks,
> 
> 	tglx
> 
> 
