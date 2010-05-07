From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH -next] eeepc-wmi: depends on BACKLIGHT_CLASS_DEVICE
Date: Fri, 7 May 2010 19:26:47 +0100
Message-ID: <20100507182647.GC24478@srcf.ucam.org>
References: <20100507155520.75026a8b.sfr@canb.auug.org.au> <20100507112411.0212242d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42098 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755511Ab0EGS04 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 May 2010 14:26:56 -0400
Content-Disposition: inline
In-Reply-To: <20100507112411.0212242d.randy.dunlap@oracle.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Fri, May 07, 2010 at 11:24:11AM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> eeepc-wmi uses backlight*() interfaces so it should depend on
> BACKLIGHT_CLASS_DEVICE.
> 
> eeepc-wmi.c:(.text+0x2d7f54): undefined reference to `backlight_force_update'
> eeepc-wmi.c:(.text+0x2d8012): undefined reference to `backlight_device_register'
> eeepc-wmi.c:(.devinit.text+0x1c31c): undefined reference to `backlight_device_unregister'
> eeepc-wmi.c:(.devexit.text+0x2f8b): undefined reference to `backlight_device_unregister'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>

Thanks, applied for -next. I'll send this one for .34 as well.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
