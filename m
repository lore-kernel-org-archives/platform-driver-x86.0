From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 0/7] sony-laptop fixes on 3.5-rc1
Date: Tue, 26 Jun 2012 06:36:36 +0900
Message-ID: <20120625213635.GB21336@kamineko.org>
References: <20120531220257.GA3986@kamineko.org>
 <1339215494-4020-1-git-send-email-malattia@linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:56551 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757430Ab2FYVgi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Jun 2012 17:36:38 -0400
Content-Disposition: inline
In-Reply-To: <1339215494-4020-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

On Sat, Jun 09, 2012 at 01:18:07PM +0900, Mattia Dongili wrote:
> Hi Matthew,
> 
> here's a few fixes on top of the patches you took for 3.5.
> I may have more coming but I'm a bit short of time these days so I'm sending
> these first.

Hi Matthew,

have you got any time to look at these patches and the additional fix I
sent later[1]?
If you need a shorter list for 3.5 I can also prepare a different set of
must-be-in-3.5.

> --- 
> Dan Carpenter (2):
>       sony-laptop: fix sony_nc_sysfs_store()
>       sony-laptop: fix a couple signedness bugs
> 
> Marco Chiappero (1):
>       sony-laptop: notify userspace of GFX switch position changes
> 
> Mattia Dongili (4):
>       sony-laptop: use an enum for SNC event types
>       sony-laptop: store battery care limits on batteries
>       sony-laptop: add lid backlight support for handle 0x143
>       sony-laptop: input initialization should be done before SNC

[1]: sony-laptop: correct find_snc_handle failure checks

Thanks
-- 
mattia
:wq!
