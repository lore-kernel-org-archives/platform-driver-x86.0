From: Gyorgy Jeney <nog.lkml@gmail.com>
Subject: Re: On a sony VAIO Z12C5E: sony-laptop: Unknown event: 0x100 0xa6, etc.
Date: Thu, 25 Nov 2010 23:11:26 +0100
Message-ID: <AANLkTikovTWaR5jODHwmhaNSL8kzGvoXDsmaYCqgM-ra@mail.gmail.com>
References: <AANLkTi=kq35KAs0Wy=6PY7tZVAOaGRMH_KnSv+NC5NqC@mail.gmail.com>
	<20101124223058.GA30035@kamineko.org>
	<AANLkTi=XyJ199Fj5ckUDQ_tJ_nDcgo330rvcaLCuoZKh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:49806 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab0KYWL2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Nov 2010 17:11:28 -0500
Received: by wyb28 with SMTP id 28so1312286wyb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Nov 2010 14:11:26 -0800 (PST)
In-Reply-To: <AANLkTi=XyJ199Fj5ckUDQ_tJ_nDcgo330rvcaLCuoZKh@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthew Garrett <mjg@redhat.com>

On 24 November 2010 23:57, Gyorgy Jeney <nog.lkml@gmail.com> wrote:
> On 24 November 2010 23:30, Mattia Dongili <malattia@linux.it> wrote:
>> On Wed, Nov 24, 2010 at 07:22:55PM +0100, Gyorgy Jeney wrote:
>>> make these events "do the right thing".
>>
>> yes, it's easy with the information you provided.
>> The attached patch should get the keys reported on the input subsystem
>> and show up on the event device (check with evtest) and X (check with
>> xev).
>
> Thanks, I'll install your patch and test this tomorrow.

I patched a 2.6.37-rc3 kernel and it works perfectly for me.  I
noticed when applying the patch that there was an 8 line offset.  Does
this mean there is newer version of sony-laptop.c than is available in
2.6.37-rc3?

nog.
