From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] ideapad-laptop: include Yoga 3 1170 in add rfkill
 whitelist
Date: Mon, 9 Nov 2015 13:46:46 -0800
Message-ID: <20151109214646.GJ18221@malice.jf.intel.com>
References: <3945339.hkrnUBKIiS@wuerfel>
 <4760270.MzzySUYc0g@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47085 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751361AbbKIVqu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 Nov 2015 16:46:50 -0500
Content-Disposition: inline
In-Reply-To: <4760270.MzzySUYc0g@wuerfel>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, linux-kernel@vger.kernel.org

On Fri, Nov 06, 2015 at 11:26:59PM +0100, Arnd Bergmann wrote:
> This changes the entry to the whitelist of machines that do not have
> a physical rfkill switch. Unfortunately, the Yoga 3 generation seems
> to use upper-case letters for the YOGA 3 Pro-1370, while it uses normal
> capitalization for its Yoga 3 1170 and 1470 siblings.
> 
> In order to catch all variants of the Yoga 3, I'm changing both
> the entry for the 1470 (using "Yoga" as the name) and the entry for
> the Pro 1370 (using all-caps "YOGA") to not match the exact model number
> but only the generation. This way, the 1170 and 1470 models share one
> entry, but if the firmware changes from one format to the other, it will
> still work.
> 
> The second entry for Yoga 2 Pro that was recently added for some
> reason ended up not being added in alphanumeric order, and I'm
> moving the Yoga 3 1470 entry down while making the change, so they
> are sorted more logically.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Queued to testing, thank you.

-- 
Darren Hart
Intel Open Source Technology Center
