From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] sonypi: Use struct dev_pm_ops for power management
Date: Wed, 27 Jun 2012 20:34:44 +0900
Message-ID: <20120627113443.GA20597@kamineko.org>
References: <201206232346.26432.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201206232346.26432.rjw@sisk.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Linux PM list <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jun 23, 2012 at 11:46:26PM +0200, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rjw@sisk.pl>
> 
> Make the sonypi driver define its PM callbacks through
> a struct dev_pm_ops object rather than by using legacy PM hooks
> in struct platform_driver.
> 
> Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>

Acked-by: Mattia Dongili <malattia@linux.it>

> ---
> 
> Hi,
> 
> If there are no objections, I'd like to push this patch for 3.6 through
> the linux-pm tree.
> 
> Unfortunately, I don't have the hardware to test it, but I hope it is simple
> enough for code inspection to suffice.

It looks ok to me. I do have the hardware but it's very old, last time I
booted that laptop is at least 5 years ago, not even sure it still boots
actually.

I'll give it a go if I get the time but don't count too much on it so
please include this in 3.6.

Thanks!
-- 
mattia
:wq!
