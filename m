From: Gyorgy Jeney <nog.lkml@gmail.com>
Subject: Re: On a sony VAIO Z12C5E: sony-laptop: Unknown event: 0x100 0xa6, etc.
Date: Wed, 24 Nov 2010 23:57:29 +0100
Message-ID: <AANLkTi=XyJ199Fj5ckUDQ_tJ_nDcgo330rvcaLCuoZKh@mail.gmail.com>
References: <AANLkTi=kq35KAs0Wy=6PY7tZVAOaGRMH_KnSv+NC5NqC@mail.gmail.com>
	<20101124223058.GA30035@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:56893 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756260Ab0KXW5a (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Nov 2010 17:57:30 -0500
Received: by ewy5 with SMTP id 5so162739ewy.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2010 14:57:29 -0800 (PST)
In-Reply-To: <20101124223058.GA30035@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthew Garrett <mjg@redhat.com>

On 24 November 2010 23:30, Mattia Dongili <malattia@linux.it> wrote:
> On Wed, Nov 24, 2010 at 07:22:55PM +0100, Gyorgy Jeney wrote:
>> CDROM eject key pressed: sony-laptop: Unknown event: 0x100 0xa4
>> CDROM eject key released: sony-laptop: Unknown event: 0x100 0x24
>>
>> What bothers me about this is I get a bunch of messages on my console
>> each time the DVD tray is opened, but I guess it shouldn't be hard to
>
> Humm, do you mean that you get that 0xa4 event when pressing the button
> _on_ the CD tray or is there an extra button somewhere that triggers
> that?

This model doesn't have a button on the tray.  The only eject button
is located above the keyboard to the right of the VAIO key.

>> make these events "do the right thing".
>
> yes, it's easy with the information you provided.
> The attached patch should get the keys reported on the input subsystem
> and show up on the event device (check with evtest) and X (check with
> xev).

Thanks, I'll install your patch and test this tomorrow.

> One last thing, to keep my DSDT list up-to-date would you mind sending
> me the dump of your laptop's DSDT table?

I was going to poke around with debug=1 added to the sony-laptop
module before sending that, but since you asked, I'll send this to you
privately now.

nog.
