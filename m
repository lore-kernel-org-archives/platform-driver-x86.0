From: Florian Heyer <heyho@flanto.de>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Fri, 03 Jun 2011 14:49:58 +0200
Message-ID: <4DE8D876.7060304@flanto.de>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com> <4DE57CD6.5030609@flanto.de> <4DE62BA2020000230002D603@novprvlin0050.provo.novell.com> <4DE74CEF.3020608@flanto.de> <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from melmac.flanto.de ([78.46.67.50]:50780 "EHLO melmac.flanto.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754701Ab1FCMt6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 08:49:58 -0400
In-Reply-To: <4DE86E36020000230002D768@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org

On 02.06.2011 21:16, Joey Lee wrote:
> This is a problem on "Fn+F5" and "wireless hardware switch", does "Fn
> +F5" also can control wireless state? If yes, then it's a problem it
> have conflict with "wirelss hardware switch".
> 
> I mean, even 0x0C is "64", the Fn+F5 still can turn-off wireless, does
> it right?
> If the answer is yes, then we cann't use 0x0C to be killswitch state.

fn+f5 doesn't do anything no matter what state the wifi switch is.
Personally i wouldn't mind if only the wifi switch is supported, i mean,
you don't need a key combination if you have a real switch for wifi
(de)activation.

> What the value in 0x51 and 0x52? is 0, 1 or?

It's 0!

regards
-- 
Florian Heyer - heyho@flanto.de
