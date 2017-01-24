From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Tue, 24 Jan 2017 22:23:41 +1030
Message-ID: <20170124115341.GE4013@marvin.atrad.com.au>
References: <20170113110240.622-1-kernel@kempniu.pl>
 <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:46136 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbdAXLzw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Jan 2017 06:55:52 -0500
Content-Disposition: inline
In-Reply-To: <20170113131915.GA745@ozzy.nask.waw.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 13, 2017 at 02:19:15PM +0100, Micha?? K??pie?? wrote:
> > It might be worth glancing through these because the resulting renames in
> > particular definitely improved the clarity of the driver:
> > 
> >   Date: Thu, 17 Sep 2009
> >   From: Alan Jenkins
> >   Subject: [PATCH 1/4] fujitsu-laptop: renames and cleanup
> >            [PATCH 2/4] fujitsu-laptop: restructure initialisation
> >            [PATCH 3/4] fujitsu-laptop: autodetect lcd interface on unknown models
> >            [PATCH 4/4] fujitsu-laptop: simplify modalias (autoload)
> 
> These subjects suggest that it makes little sense for me to duplicate
> Alan's work.  I have a lot more cleanups on my todo list, but the more I
> change, the less sense Alan's patches will make.  I guess the most
> reasonable course of action would be for you to go through Alan's series
> after all so that I will only need to send fixes for whatever he has
> missed.  Feel free to suggest otherwise, though.

That certainly seems like a good way forward.  I am now back from travel and
will try to get onto these patches as soon as possible.  Hopefully I will
have something to report soon.

Regards
  jonathan
