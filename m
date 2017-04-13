From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 0/6] fujitsu-laptop: LED cleanup
Date: Thu, 13 Apr 2017 16:19:26 +0930
Message-ID: <20170413064926.GG7972@marvin.atrad.com.au>
References: <20170407130713.8417-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:42040 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750811AbdDMGuW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Apr 2017 02:50:22 -0400
Content-Disposition: inline
In-Reply-To: <20170407130713.8417-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 07, 2017 at 03:07:07PM +0200, Micha?? K??pie?? wrote:
> This patch series cleans up parts of fujitsu-laptop responsible for
> handling LED class devices.  It was tested on a Lifebook E744.  It
> depends on the previous patch series I submitted for fujitsu-laptop and
> should be applied on top of the backlight cleanup series.
> 
>  drivers/platform/x86/Kconfig          |   2 +-
>  drivers/platform/x86/fujitsu-laptop.c | 402 +++++++++++++++-------------------
>  2 files changed, 176 insertions(+), 228 deletions(-)

FYI I should be able to complete my review of this series over the Easter
weekend.  This week has been hectic to say the least.  Apologies for the
delay.

Regards
  jonathan
