From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 1/1] fujitsu-laptop: use FB_BLANK_* constants
Date: Mon, 19 Jan 2015 10:33:08 +1030
Message-ID: <20150119000307.GA20491@marvin.atrad.com.au>
References: <0150118191421.GJ56582@vmdeb7>
 <1421609326-3610-1-git-send-email-kernel@mkarcher.dialup.fu-berlin.de>
 <20150118222232.GA64157@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:41762 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751185AbbASADp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 18 Jan 2015 19:03:45 -0500
Content-Disposition: inline
In-Reply-To: <20150118222232.GA64157@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jan 18, 2015 at 02:22:32PM -0800, Darren Hart wrote:
> On Sun, Jan 18, 2015 at 08:28:46PM +0100, Michael Karcher wrote:
> > Replace the magic numbers in fujitsu-laptop.c by the appropriate FB_BLANK
> > constants, as indicated by the comment for backlight_properties.power in
> > include/linux/backlight.h.
> > 
> > Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
> 
> Thanks Michael, queued for 3.20.

Acked-by: Jonathan Woithe <jwoithe@just42.net>
