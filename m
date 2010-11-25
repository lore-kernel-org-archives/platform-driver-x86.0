From: Mattia Dongili <malattia@linux.it>
Subject: Re: On a sony VAIO Z12C5E: sony-laptop: Unknown event: 0x100 0xa6,
 etc.
Date: Fri, 26 Nov 2010 07:58:18 +0900
Message-ID: <20101125225818.GA9301@kamineko.org>
References: <AANLkTi=kq35KAs0Wy=6PY7tZVAOaGRMH_KnSv+NC5NqC@mail.gmail.com>
 <20101124223058.GA30035@kamineko.org>
 <AANLkTi=XyJ199Fj5ckUDQ_tJ_nDcgo330rvcaLCuoZKh@mail.gmail.com>
 <AANLkTikovTWaR5jODHwmhaNSL8kzGvoXDsmaYCqgM-ra@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:41162
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752387Ab0KYW6W (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 25 Nov 2010 17:58:22 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTikovTWaR5jODHwmhaNSL8kzGvoXDsmaYCqgM-ra@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gyorgy Jeney <nog.lkml@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthew Garrett <mjg@redhat.com>

On Thu, Nov 25, 2010 at 11:11:26PM +0100, Gyorgy Jeney wrote:
> On 24 November 2010 23:57, Gyorgy Jeney <nog.lkml@gmail.com> wrote:
> > On 24 November 2010 23:30, Mattia Dongili <malattia@linux.it> wrote:
> >> On Wed, Nov 24, 2010 at 07:22:55PM +0100, Gyorgy Jeney wrote:
> >>> make these events "do the right thing".
> >>
> >> yes, it's easy with the information you provided.
> >> The attached patch should get the keys reported on the input subsystem
> >> and show up on the event device (check with evtest) and X (check with
> >> xev).
> >
> > Thanks, I'll install your patch and test this tomorrow.
> 
> I patched a 2.6.37-rc3 kernel and it works perfectly for me.  I

Thanks

> noticed when applying the patch that there was an 8 line offset.  Does
> this mean there is newer version of sony-laptop.c than is available in
> 2.6.37-rc3?

No, it's just that the diff was not against a clean copy but against my
local version that has tiny adjustments that I never submitted.

Matthew,
Shall I reesend the patch with a proper subject or can you take the one
I posted earlier in this thread?

Thanks!
-- 
mattia
:wq!
