From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch] dell-laptop: fix kbd_timeout handling
Date: Tue, 2 Dec 2014 23:33:25 -0800
Message-ID: <20141203073324.GA8568@vmdeb7>
References: <1417597233.14672.2.camel@Pali-Nokia-N900>
 <20141203100159.GA18731@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45652 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752038AbaLDEYn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Dec 2014 23:24:43 -0500
Content-Disposition: inline
In-Reply-To: <20141203100159.GA18731@mwanda>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, kbuild@01.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Wed, Dec 03, 2014 at 01:01:59PM +0300, Dan Carpenter wrote:
> The original code had a static checker warning:
> 
> 	drivers/platform/x86/dell-laptop.c:1389 kbd_led_timeout_store()
> 	warn: this array is probably non-NULL. 'quirks->kbd_timeouts'
> 
> This warning does indicate a bug.  I have added a .needs_kbd_timeouts
> flag which is true if the .kbd_timeouts[] array has been declared.
> Otherwise, in the original code the quirk_dell_vostro_v130 struct didn't
> have .kbd_timeouts[] declared so the loop:
> 
> 	for (i = 0; quirks->kbd_timeouts[i] != -1; i++) {
> 
> Would have read beyond the end of the struct with unpredictable results.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Thanks Dan,

Pali, any objections?

Dan, any objection to Pali rolling this into another revision? No point in
introducing the bug to next and mainline.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
