From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Platform: add Samsung Laptop platform driver
Date: Fri, 25 Feb 2011 13:03:34 -0800
Message-ID: <20110225210334.GB16860@kroah.com>
References: <20110209224006.GA11202@kroah.com>
 <AANLkTikrr6Gu_qoq73ASC95E0HQC1p6KzDPLxo=J_rva@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikrr6Gu_qoq73ASC95E0HQC1p6KzDPLxo=J_rva@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 16, 2011 at 01:06:00PM +0300, Nikolai Kondrashov wrote:
> Hi Greg,
> 
> On 02/10/2011 01:40 AM, Greg KH wrote:
> > This adds the samsung-laptop driver to the kernel.  It now supports
> > all known Samsung laptops.
> Thank you for this patch :)!
> 
> I've tried it with both 2.6.37 and 2.6.32 on my NP-N210-JA02RU and it fails
> the insertion with ENODEV without "force" and with "This computer does not
> support SABI" with "force".
> 
> I'm ready to provide any diagnostics information you may need and test the
> patches.
> 
> Please find the dmidecode output attached.

This should work, as we support the N150/N210/N220 versions.

Can you provide the output of:
	grep . /sys/class/dmi/id/*

so I can verify this?

thanks,

greg k-h
