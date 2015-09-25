From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-wmi: restore kbd led level after resume
Date: Fri, 25 Sep 2015 17:41:28 +0200
Message-ID: <20150925154128.GB38748@vmdeb7>
References: <1442222190-8591-1-git-send-email-linux@rempel-privat.de>
 <20150918223144.GO66179@vmdeb7>
 <55FCF67B.4020201@rempel-privat.de>
 <20150921171243.GB117557@vmdeb7>
 <56003E5B.8040402@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:52571 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756713AbbIYPlt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Sep 2015 11:41:49 -0400
Content-Disposition: inline
In-Reply-To: <56003E5B.8040402@rempel-privat.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, Sep 21, 2015 at 07:28:59PM +0200, Oleksij Rempel wrote:
> Am 21.09.2015 um 19:12 schrieb Darren Hart:
> > On Sat, Sep 19, 2015 at 07:45:31AM +0200, Oleksij Rempel wrote:
> >> Hi,
> >>
> >> Am 19.09.2015 um 00:31 schrieb Darren Hart:
> >>> On Mon, Sep 14, 2015 at 11:16:30AM +0200, Oleksij Rempel wrote:
> >>>> Afters suspend/resume cycle with closed lid the kbd backlight level
> >>>> is lost. This patch will will restore this value to last known level.
> >>>>
> >>>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>

Queued to testing, will be in -next next week unless Corentin raises an
objection.

-- 
Darren Hart
Intel Open Source Technology Center
