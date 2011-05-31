From: Florian Heyer <heyho@flanto.de>
Subject: Re: Wifi switch not working, linux on IdeaPad S205
Date: Wed, 01 Jun 2011 01:42:14 +0200
Message-ID: <4DE57CD6.5030609@flanto.de>
References: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from melmac.flanto.de ([78.46.67.50]:46937 "EHLO melmac.flanto.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932942Ab1EaXmX (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 May 2011 19:42:23 -0400
In-Reply-To: <4DE5FD4D020000230002D5D4@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: ike.pan@canonical.com, platform-driver-x86@vger.kernel.org

On 06/01/2011 12:50 AM, Joey Lee wrote:
>
> After traced S205 DSDT, I thought you will got a result is 0x71, please
> help to use acer_ec.pl to confirm this register changed. Please give me
> the value when wireless on/off.

Hello Joey,

just short testing: the hardware wifi switch (not the wifi key 
combination fn+f5) toggles register 0x0C from 0 (off) to 64 (on). Wifi 
goes on/off (after having first loaded/unloaded acer_wmi).

The wifi key combination fn+f5 doesn't seem to change anything (i have 
to look again to be sure).

>
> And,
> Please attached on dmidecode, just need:
> 	dmidecode>  dmidecode.log

ok, i'll provide that tomorrow.


regards
-- 
Florian Heyer - heyho@flanto.de
