From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: Using zero as the first WMI instance number
Date: Wed, 21 Jun 2017 12:35:13 +0800
Message-ID: <20170621043513.GN3016@linux-l9pv.suse>
References: <20170620090623.18364-1-jlee@suse.com>
 <20170620164851.GA32699@pali>
 <CAHp75Vd1ZRpZc3P5qnsiWTiURCUSOjsRfPKgShe3seJmsh1GRQ@mail.gmail.com>
 <201706202246.12941@pali>
 <20170620214556.GA25900@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:50005 "EHLO
        smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750759AbdFUEf1 (ORCPT
        <rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
        Wed, 21 Jun 2017 00:35:27 -0400
Content-Disposition: inline
In-Reply-To: <20170620214556.GA25900@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>

On Tue, Jun 20, 2017 at 02:45:56PM -0700, Darren Hart wrote:
> On Tue, Jun 20, 2017 at 10:46:12PM +0200, Pali Rohár wrote:
> > On Tuesday 20 June 2017 19:22:46 Andy Shevchenko wrote:
> > > On Tue, Jun 20, 2017 at 7:48 PM, Pali Rohár <pali.rohar@gmail.com>
> > > wrote:
> > > > On Tuesday 20 June 2017 17:06:23 Lee, Chun-Yi wrote:
> > > >> Pali Rohár found that there have some wmi query/evaluation
> > > >> code that they used 'one' as the first WMI instance number.
> > > >> But the number is indexed from zero that it's must less than
> > > >> the instance_count in _WDG.
> > > >> 
> > > >> This patch changes those instance number from one to zero.
> > > >> 
> > > >> Cc: Darren Hart <dvhart@infradead.org>
> > > >> Cc: Andy Shevchenko <andy@infradead.org>
> > > >> Cc: Pali Rohár <pali.rohar@gmail.com>
> > > >> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > > > 
> > > > Looks good, Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
> > > 
> > > Unfortunately patchwork ignores this tag.
> > > So, in the future please:
> > > - put a tag on a separate line
> > > - do _not_ prepend it by any characters including white spaces
> > > (except new line :-) )

I see! I will also follow the rules in the future.

> > 
> > I have not known that those lines are parsed automatically.
> > Will do it in future!
> 
> :-) Thanks!
> 
> For reference, Patchwork tally's such things in the patch list view:
> https://patchwork.kernel.org/project/platform-driver-x86/list/
> 
> And, selfishly, the more normalized these are, the less likely Andy and I are to
> make mistakes manipulating them into the patches.
>

Joey Lee
