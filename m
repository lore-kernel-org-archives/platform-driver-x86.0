From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: Advice on oops - memory trap on non-memory access instruction
	(invalid CR2?)
Date: Mon, 14 Oct 2019 16:10:15 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1910141602270.2531@nanos.tec.linutronix.de>
References: <66eeae28-bfd3-c7a0-011c-801981b74243@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <66eeae28-bfd3-c7a0-011c-801981b74243-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: "Guilherme G. Piccoli" <gpiccoli-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: halves-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, mfo-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, ioanna-maria.alifieraki-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, jay.vosburgh-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, gavin.guo-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 14 Oct 2019, Guilherme G. Piccoli wrote:
> Modules linked in: <...>
> CPU: 40 PID: 78274 Comm: qemu-system-x86 Tainted: P W  OE

Tainted: P     - Proprietary module loaded ...

Try again without that module

Tainted: W     - Warning issued before

Are you sure that that warning is harmless and unrelated?

> 4.4.0-45-generic #66~14.04.1-Ubuntu

Does the same problem happen with a not so dead kernel? CR2 handling got
quite some updates/fixes since then.

Thanks,

	tglx
