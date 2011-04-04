From: Matthew Garrett <mjg@redhat.com>
Subject: Re: linux-next: Tree for April 4 [BROKEN thinkpad_acpi]
Date: Mon, 4 Apr 2011 14:00:36 +0100
Message-ID: <20110404130036.GB16669@srcf.ucam.org>
References: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com>
 <20110404122225.GA15883@srcf.ucam.org>
 <1301921369.1941.29.camel@Joe-Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:53999 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750885Ab1DDNAt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Apr 2011 09:00:49 -0400
Content-Disposition: inline
In-Reply-To: <1301921369.1941.29.camel@Joe-Laptop>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, sedat.dilek@gmail.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, ibm-acpi@hmh.eng.br

On Mon, Apr 04, 2011 at 05:49:29AM -0700, Joe Perches wrote:

> It's vdbg_printk no_printk verification.
> 
> #ifdef CONFIG_THINKPAD_ACPI_DEBUG
> #define vdbg_printk dbg_printk
> static const char *str_supported(int is_supported);
> #else
> #define vdbg_printk(a_dbg_level, format, arg...)	\
> 	no_printk(format, ##arg)
> #endif
> 
> Two ways to handle this.
> 
> 1: add
> static inline const char *str_supported(int is_supported) { return ""; }
> to the #else
> 
> 2: Remove no_printk verification and return it to do {} while (0)
> 
> Do you have a preference?

I don't. Henrique?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
