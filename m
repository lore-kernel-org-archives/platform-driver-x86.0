From: Arthur Wirski <awirski@gmail.com>
Subject: Re: [PATCH] sony-laptop: Reading gfx_switch_status in SVS13A15GLB
Date: Mon, 27 May 2013 19:34:17 +0200
Message-ID: <20130527173417.GA3214@dstarl>
References: <CANepG=Ot72gY8qacyTvte1oGO8ymEj69xgrvdKg1Q8McMddKLw@mail.gmail.com>
 <20130526221607.GA9539@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:43759 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755645Ab3E0Re0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 27 May 2013 13:34:26 -0400
Received: by mail-ee0-f43.google.com with SMTP id d41so4160128eek.30
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2013 10:34:25 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20130526221607.GA9539@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: Daniel Serpell <daniel.serpell@gmail.com>, platform-driver-x86@vger.kernel.org

On Mon, May 27, 2013 at 07:16:07AM +0900, Mattia Dongili wrote:
> On Sat, May 25, 2013 at 08:12:43PM -0400, Daniel Serpell wrote:
> > Hi,
> > 
> > Thank you for your work in the sony-laptop kernel module.
> > 
> > I have a Vaio SVS13A15GLB laptop, and today tried the module in the
> > kernel version 3.10-rc2, that allows reading back the status of the
> > "gfx" switch.
> > 
> > But in my laptop, when the switch is in the STAMINA position, the
> > driver reports "speed", and in the "SPEED" position, reports "stamina"
> > :-(
> > 
> > Reading the status produced the following log in dmesg, with "debug=1":
> > 
> > In SPEED position:
> > [30084.337256] sony_laptop: found handle 0x015b (offset: 0x05)
> > [30084.337613] sony_laptop: __call_snc_method: [SN07:0x0000000000000005]
> > [30084.337618] sony_laptop: called SN07 with 0x0005 (result: 0x0000)
> > 
> > In STAMINA position:
> > [29976.398723] sony_laptop: found handle 0x015b (offset: 0x05)
> > [29976.399087] sony_laptop: __call_snc_method: [SN07:0x0000000000000005]
> > [29976.399092] sony_laptop: called SN07 with 0x0005 (result: 0x0001)
> > 
> > Reading the code, it seems that the status shown is not ok.
> > 
> > Attached is a patch to fix this.
> 
> oh, nice. we've been reporting the opposite for all this time... And it
> looks like we're missing the AUTO value of the enum when setting the
> buffer.
> Mind adding that and resending the patch (as inline attachment)?
> 
> Arthur,
> just in case, it's unlikely that two models of the same series have an
> opposite behaviour, could you double check Daniel's comment?
> 
> Thanks!
> -- 
> mattia
> :wq!

I've double checked on Sony SVS151290S using 3.10.0-rc2
The results are the same as what Daniel has mentioned, the return string is incorrect.

Best Regards,
Arthur
