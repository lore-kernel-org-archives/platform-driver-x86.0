From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] Sony laptop: Some Sony Vaia laptops do not enable wwan
 power by default.
Date: Wed, 13 Jul 2011 07:29:16 +0900
Message-ID: <20110712222914.GA3016@kamineko.org>
References: <4E1C6E7A.3030705@canonical.com>
 <20110712160156.GA8388@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:61809 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756025Ab1GLW2d (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jul 2011 18:28:33 -0400
Received: by iwn6 with SMTP id 6so5038874iwn.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jul 2011 15:28:33 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20110712160156.GA8388@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Tim Gardner <tim.gardner@canonical.com>, platform-driver-x86@vger.kernel.org

On Tue, Jul 12, 2011 at 05:01:56PM +0100, Matthew Garrett wrote:
> On Tue, Jul 12, 2011 at 09:55:38AM -0600, Tim Gardner wrote:
> > Ubuntu has been carrying this patch for a couple of years because I
> > keep forgetting to upstream it. Does anyone think it still makes
> > sense, or should setting WWAN power be done in user space ?
> 
> Userspace, but also somebody needs to figure out how to identify whether 
> old-style Vaios support each of these features and expose them as proper 
> rfkill devices.

the problem with that has always been that we don't know how to probe
the SPIC device. We also don't know how to read the state of the rfkill
switch. I imagine we could guess but I'm not sure how useful that is.

-- 
mattia
:wq!
