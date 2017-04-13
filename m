From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/6] fujitsu-laptop: LED cleanup
Date: Thu, 13 Apr 2017 09:13:25 +0200
Message-ID: <20170413071325.GA1462@ozzy.nask.waw.pl>
References: <20170407130713.8417-1-kernel@kempniu.pl>
 <20170413064926.GG7972@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170413064926.GG7972@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> On Fri, Apr 07, 2017 at 03:07:07PM +0200, Micha?? K??pie?? wrote:
> > This patch series cleans up parts of fujitsu-laptop responsible for
> > handling LED class devices.  It was tested on a Lifebook E744.  It
> > depends on the previous patch series I submitted for fujitsu-laptop and
> > should be applied on top of the backlight cleanup series.
> > 
> >  drivers/platform/x86/Kconfig          |   2 +-
> >  drivers/platform/x86/fujitsu-laptop.c | 402 +++++++++++++++-------------------
> >  2 files changed, 176 insertions(+), 228 deletions(-)
> 
> FYI I should be able to complete my review of this series over the Easter
> weekend.  This week has been hectic to say the least.  Apologies for the
> delay.

As usual, no worries.  This buys me time to polish the next series.  By
the way, thank you for your patience in reviewing my submissions.  We
are getting there, I only have three more series queued after this one.

-- 
Best regards,
Michał Kępień
