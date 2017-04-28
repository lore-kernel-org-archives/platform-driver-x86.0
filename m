From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] dell-laptop: Adds support for keyboard backlight timeout
 AC settings
Date: Fri, 28 Apr 2017 09:27:23 +0200
Message-ID: <20170428072723.GM26695@pali>
References: <1492976447-10339-1-git-send-email-pali.rohar@gmail.com>
 <CAHp75VfCiqeddWu9xfMud4sEWAvk+CDXTkgO5zbb++QhiTL=Bw@mail.gmail.com>
 <20170425125453.GK30553@pali>
 <CAHp75VdjZ4Ti1YPZVq8_fjUh0xuDbQ-EtZQQjaWQf2fhZs2mRw@mail.gmail.com>
 <20170425134044.GL30553@pali>
 <c140b70b460f45afa43bdfd7dec723b3@ausx13mpc120.AMER.DELL.COM>
 <e217a6c7-7c13-37bc-369a-cd464a5c6fbe@ivanov.biz>
 <20170426224049.GB3879@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33062 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753333AbdD1H10 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Apr 2017 03:27:26 -0400
Content-Disposition: inline
In-Reply-To: <20170426224049.GB3879@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Arcadiy Ivanov <arcadiy@ivanov.biz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mario.Limonciello@dell.com, andy.shevchenko@gmail.com, mjg59@srcf.ucam.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 26 April 2017 15:40:49 Darren Hart wrote:
> On Tue, Apr 25, 2017 at 05:50:57PM -0400, Arcadiy Ivanov wrote:
> > On 2017-04-25 09:49, Mario.Limonciello@dell.com wrote:
> > > > -----Original Message-----
> > > > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > > > Sent: Tuesday, April 25, 2017 8:41 AM
> > > > To: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > > Cc: Matthew Garrett <mjg59@srcf.ucam.org>; Darren Hart
> > > > <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>; Arcadiy Ivanov
> > > > <arcadiy@ivanov.biz>; Limonciello, Mario <Mario_Limonciello@Dell.com>;
> > > > Platform Driver <platform-driver-x86@vger.kernel.org>; linux-
> > > > kernel@vger.kernel.org
> > > > Subject: Re: [PATCH] dell-laptop: Adds support for keyboard backlight timeout AC
> > > > settings
> > > > 
> > > > On Tuesday 25 April 2017 16:32:36 Andy Shevchenko wrote:
> > > > > On Tue, Apr 25, 2017 at 3:54 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > > > > > On Tuesday 25 April 2017 15:36:56 Andy Shevchenko wrote:
> > > > > > > On Sun, Apr 23, 2017 at 10:40 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > > > > > > This patch misses few others that were applied to our testing / for-next.
> > > > > > Ah... sorry for that :-( And I was in impression that there were fixes
> > > > > > for that code which use mutexes... Now I know why I have not seen them!
> > > > > > 
> > > > > > > I have applied it to testing with corrected conflict (easy to fix),
> > > > > > > though check if everything still as supposed to be.
> > > > > > Can you send a link to your fix?
> > > > > Sure, here it is:
> > > > > http://git.infradead.org/linux-platform-drivers-
> > > > x86.git/commit/bcf7d8a30e2888f78a19778a16d3dd8c10b4b0ad
> > > > 
> > > > It is OK.
> > > > 
> > > Pali,
> > > 
> > > Considering this is negatively affecting folks on stable kernel releases too
> > > when using this newer HW, would you consider to send to @stable too?
> > > 
> > > Thanks,

I'm fine with it, if Greg or stable maintainers approve this change.

> > I second that. Thanks!
> > 
> 
> In order for this to go back to stable, we will need to include the list of
> dependencies per stable-kernel-rules.txt. This can be done after it is merged,
> but if you can provide the set of Cc: stable lines needed, we can look at
> getting this into testing now so no further action will be required.
> 
> ...
> 
> Upon closer inspection, this does fail the 100 lines including context stable
> rule by an additional 55 lines. This is a process issue I've been thinking about
> for a while and trying to find the best way to express this problem and what a
> viable solution might look like. As it stands, fixes such as these are
> effectively limited to current and future kernel versions. I do think there is a
> need for vendors to be able to update their drivers upstream to work with current
> hardware without requiring a bleeding edge kernel. Perhaps "leaf node drivers"
> should have a looser set of stable rules, but that is not currently the way the
> upstream stable kernel rules work (at least as far as I understand them).
> 
> +Greg KH who has the ultimate say on this. Greg, have I misrepresented anything
> here?
> 

-- 
Pali Rohár
pali.rohar@gmail.com
