From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 1/1] ideapad-laptop: Add ideapad Y700 (15) to the
 no_hw_rfkill DMI list
Date: Mon, 22 Feb 2016 13:22:26 -0800
Message-ID: <20160222212226.GC14101@dvhart-mobl5.amr.corp.intel.com>
References: <Pine.NEB.4.64.1602180029370.7701@norge.freeshell.org>
 <20160219224312.GB23707@dvhart-mobl5.amr.corp.intel.com>
 <Pine.NEB.4.64.1602191935590.15324@faeroes.freeshell.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.NEB.4.64.1602191935590.15324@faeroes.freeshell.org>
Sender: linux-kernel-owner@vger.kernel.org
To: John Dahlstrom <jodarom@SDF.ORG>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 19, 2016 at 08:01:17PM -0600, John Dahlstrom wrote:
> On Fri, 19 Feb 2016, Darren Hart wrote:
> 
> >See stable_kernel_rules.txt for how to specify relevant versions. I'm curious
> >why there is a gap from 3.18 to 4.1.
> >
> >What you probably meant was:
> >
> >Cc: <stable@vger.kernel.org> # 3.18.x
> >
> >If you are going to take this approach, you may wish to verify that this applies
> >back to 3.18, otherwise you may need to specify dependencies (also described in
> >the stable_kernel_rules).
> >
> 
> Darren,
> 
> Thank you for your assistance.
> 
> The version gap in the earlier v3 comment reflected my earlier gap in
> verification. Today I stepped through the additional kernel versions to
> confirm the patch applies successfully to those versions, and have submitted
> the patch as v4.

In this case, the patch should only have a single Cc line to stable:

Cc: <stable@vger.kernel.org> # 3.18.x

I'll make the adjustment from your v4 myself to save you the resend ;-)

> 
> Kernel version 3.18.27 already handles the 17" model of the ideapad Y700, so
> it would seem odd not to also handle the 15" model.

We backport until it doesn't apply, but shouldn't be skipping versions as we go
back, that would be simply unmaintainable. So I'll mark it as 3.18.x.

-- 
Darren Hart
Intel Open Source Technology Center
