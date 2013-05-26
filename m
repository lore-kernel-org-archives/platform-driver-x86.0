From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH] sony-laptop: Reading gfx_switch_status in SVS13A15GLB
Date: Mon, 27 May 2013 07:16:07 +0900
Message-ID: <20130526221607.GA9539@kamineko.org>
References: <CANepG=Ot72gY8qacyTvte1oGO8ymEj69xgrvdKg1Q8McMddKLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:39248 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755240Ab3EZWQL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 26 May 2013 18:16:11 -0400
Content-Disposition: inline
In-Reply-To: <CANepG=Ot72gY8qacyTvte1oGO8ymEj69xgrvdKg1Q8McMddKLw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Serpell <daniel.serpell@gmail.com>, Arthur Wirski <awirski@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Sat, May 25, 2013 at 08:12:43PM -0400, Daniel Serpell wrote:
> Hi,
> 
> Thank you for your work in the sony-laptop kernel module.
> 
> I have a Vaio SVS13A15GLB laptop, and today tried the module in the
> kernel version 3.10-rc2, that allows reading back the status of the
> "gfx" switch.
> 
> But in my laptop, when the switch is in the STAMINA position, the
> driver reports "speed", and in the "SPEED" position, reports "stamina"
> :-(
> 
> Reading the status produced the following log in dmesg, with "debug=1":
> 
> In SPEED position:
> [30084.337256] sony_laptop: found handle 0x015b (offset: 0x05)
> [30084.337613] sony_laptop: __call_snc_method: [SN07:0x0000000000000005]
> [30084.337618] sony_laptop: called SN07 with 0x0005 (result: 0x0000)
> 
> In STAMINA position:
> [29976.398723] sony_laptop: found handle 0x015b (offset: 0x05)
> [29976.399087] sony_laptop: __call_snc_method: [SN07:0x0000000000000005]
> [29976.399092] sony_laptop: called SN07 with 0x0005 (result: 0x0001)
> 
> Reading the code, it seems that the status shown is not ok.
> 
> Attached is a patch to fix this.

oh, nice. we've been reporting the opposite for all this time... And it
looks like we're missing the AUTO value of the enum when setting the
buffer.
Mind adding that and resending the patch (as inline attachment)?

Arthur,
just in case, it's unlikely that two models of the same series have an
opposite behaviour, could you double check Daniel's comment?

Thanks!
-- 
mattia
:wq!
