From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v2 00/16] samsung-laptop updates
Date: Sat, 26 Nov 2011 20:23:21 -0800
Message-ID: <20111127042321.GH17802@kroah.com>
References: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2.smtp.messagingengine.com ([66.111.4.26]:53953 "EHLO
	out2.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751241Ab1K0KW6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Nov 2011 05:22:58 -0500
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 269C521868
	for <platform-driver-x86@vger.kernel.org>; Sun, 27 Nov 2011 05:22:58 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1322301613-8801-1-git-send-email-corentincj@iksaif.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Matthew Garrett <mjg@redhat.com>

On Sat, Nov 26, 2011 at 10:59:57AM +0100, Corentin Chary wrote:
> Hi Matthew, Greg
> 
> I recently got a Samsung Series 9 from Intel, so I took some
> time to add support for some features.
> 
> In this series, I moved a lot of code, tried to follow more
> closely the SABI interface, added some features, and did
> some cleanups.
> 
> Patches were tested on my laptop, N210 and N150. I'd greatly
> appreciateany feedback from other models.
> 
> I also propose myself as a maintainer for this driver, since
> thislaptop is now my primary system.

Very nice fixes, thanks for making the requested changes.

I've now acked all of these patches, Matthew, please queue them up for
the 3.3 kernel.

greg k-h
