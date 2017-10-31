From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v11 08/15] platform/x86: dell-smbios: Add a sysfs
 interface for SMBIOS tokens
Date: Tue, 31 Oct 2017 08:24:06 -0700
Message-ID: <20171031152406.GA55546@localhost.localdomain>
References: <cover.1508515469.git.mario.limonciello@dell.com>
 <363404cf80b9060fca645b5e64bda8de75f59b56.1508515469.git.mario.limonciello@dell.com>
 <20171030115608.r2y7w33an47fkple@pali>
 <d36f99812e794d5baf53a989f7286e4e@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40418 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751565AbdJaPYL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2017 11:24:11 -0400
Content-Disposition: inline
In-Reply-To: <d36f99812e794d5baf53a989f7286e4e@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, greg@kroah.com, gnomes@lxorguk.ukuu.org.uk

On Mon, Oct 30, 2017 at 01:36:16PM +0000, Mario.Limonciello@dell.com wrote:
> > 
> > Hint: you can move this check out of j-loop as condition is independent
> > of it.
> 
> That's true, thanks.
> 
> > 
> > Also how many tokens are there? Is not quadratic solution too slow?
> > 
> 
> ~< 250 on most machines is what I've seen.  To me that that's a small
> enough number that this is quick.  It only happens at initialization.

Agreed, not a hot path. Prefer simplicity to performance here.

-- 
Darren Hart
VMware Open Source Technology Center
