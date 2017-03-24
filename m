From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/8] fujitsu-laptop: use sparse keymaps for input event
 handling
Date: Fri, 24 Mar 2017 21:19:59 +1030
Message-ID: <20170324104959.GA31520@marvin.atrad.com.au>
References: <20170320093224.18541-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:53130 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751589AbdCXKuu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Mar 2017 06:50:50 -0400
Content-Disposition: inline
In-Reply-To: <20170320093224.18541-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 20, 2017 at 10:32:16AM +0100, Micha?? K??pie?? wrote:
> This series simplifies handling of both brightness key and hotkey input
> events on Fujitsu laptops by making use of sparse keymaps.  This not
> only makes the driver shorter and, hopefully, cleaner, but also enables
> us to get rid of the keycodeX fields inside struct fujitsu_bl, which
> facilitates further cleanups.  Also, to simplify error handling, input
> devices registered by fujitsu-laptop are migrated to the devres API
> along the way.
> 
> This series was tested on a Lifebook S7020 and a Lifebook E744.
> 
> This series depends on the platform cleanup series I posted last week.
> While that series has not yet been merged into testing, Jonathan has
> reviewed it and Darren also seemed to be okay with it, so I just assumed
> it will get merged soon.  I wanted to post this one as soon as possible
> as it requires a bit more thorough review and testing compared to the
> previous series I posted for fujitsu-laptop.

Thanks for posting this.  I have started going through this and hope to
complete my review by the end of this weekend.

Regards
  jonathan
