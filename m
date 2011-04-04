From: Joe Perches <joe@perches.com>
Subject: Re: linux-next: Tree for April 4 [BROKEN thinkpad_acpi]
Date: Mon, 04 Apr 2011 05:49:29 -0700
Message-ID: <1301921369.1941.29.camel@Joe-Laptop>
References: <BANLkTikr62YPeDnkL3DKA1Nts5aRFxsO6Q@mail.gmail.com>
	 <20110404122225.GA15883@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.perches.com ([173.55.12.10]:4452 "EHLO mail.perches.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751288Ab1DDMta (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Apr 2011 08:49:30 -0400
In-Reply-To: <20110404122225.GA15883@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, sedat.dilek@gmail.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>

On Mon, 2011-04-04 at 13:22 +0100, Matthew Garrett wrote:
> On Mon, Apr 04, 2011 at 11:21:43AM +0200, Sedat Dilek wrote:
> > My build breaked today.
> > Looks like the issue was introduced by commit
> > 2af915b1eda9a671973256540035f8a6da1d57b4:
> > "thinkpad_acpi: Convert printks to pr_<level>"
> Yes, this seems to break the non-debug case. Joe, can you take a look? 

Sorry 'bout that.  I only compiled it allyesconfig.

It's vdbg_printk no_printk verification.

#ifdef CONFIG_THINKPAD_ACPI_DEBUG
#define vdbg_printk dbg_printk
static const char *str_supported(int is_supported);
#else
#define vdbg_printk(a_dbg_level, format, arg...)	\
	no_printk(format, ##arg)
#endif

Two ways to handle this.

1: add
static inline const char *str_supported(int is_supported) { return ""; }
to the #else

2: Remove no_printk verification and return it to do {} while (0)

Do you have a preference?
