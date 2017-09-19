From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: NULL pointer dereference in call_fext_func [fujitsu_laptop]
Date: Tue, 19 Sep 2017 17:40:38 +0930
Message-ID: <20170919081038.GE10399@marvin.atrad.com.au>
References: <541b9a7a-2224-9b81-aef3-3f06491f91e3@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:39598 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751550AbdISILa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 04:11:30 -0400
Content-Disposition: inline
In-Reply-To: <541b9a7a-2224-9b81-aef3-3f06491f91e3@suse.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: kernel@kempniu.pl, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>

On Tue, Sep 19, 2017 at 09:56:47AM +0200, Jiri Slaby wrote:
> we have this report from 4.13.1:
> BUG: unable to handle kernel NULL pointer dereference at 00000004
> IP: call_fext_func.isra.3+0x82/0xf0 [fujitsu_laptop]
> *pdpt = 0000000035e79001 *pde = 0000000000000000
> :
> It looks like fext is NULL, but bl_update_status passes it down to
> call_fext_func which obviously blows up.
> 
> This was originally reported here:
> https://bugzilla.suse.com/show_bug.cgi?id=1058814

Thanks for the report.

This issue is already being discussed.  See the platform drivers thread
"[PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is not
presnt".

> Any ideas?

Until the above post to platform drivers it was thought that all Fujitsu
laptops had FUJ02E3 since this was what was observed on all models we had
access to.

An interim patch is under consideration.

Regards
  jonathan
