From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] acer-wmi: Using zero as the first WMI instance number
Date: Tue, 20 Jun 2017 14:45:56 -0700
Message-ID: <20170620214556.GA25900@fury>
References: <20170620090623.18364-1-jlee@suse.com>
 <20170620164851.GA32699@pali>
 <CAHp75Vd1ZRpZc3P5qnsiWTiURCUSOjsRfPKgShe3seJmsh1GRQ@mail.gmail.com>
 <201706202246.12941@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201706202246.12941@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, "Lee, Chun-Yi" <joeyli.kernel@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lee, Chun-Yi" <jlee@suse.com>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jun 20, 2017 at 10:46:12PM +0200, Pali Rohár wrote:
> On Tuesday 20 June 2017 19:22:46 Andy Shevchenko wrote:
> > On Tue, Jun 20, 2017 at 7:48 PM, Pali Rohár <pali.rohar@gmail.com>
> > wrote:
> > > On Tuesday 20 June 2017 17:06:23 Lee, Chun-Yi wrote:
> > >> Pali Rohár found that there have some wmi query/evaluation
> > >> code that they used 'one' as the first WMI instance number.
> > >> But the number is indexed from zero that it's must less than
> > >> the instance_count in _WDG.
> > >> 
> > >> This patch changes those instance number from one to zero.
> > >> 
> > >> Cc: Darren Hart <dvhart@infradead.org>
> > >> Cc: Andy Shevchenko <andy@infradead.org>
> > >> Cc: Pali Rohár <pali.rohar@gmail.com>
> > >> Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
> > > 
> > > Looks good, Reviewed-by: Pali Rohár <pali.rohar@gmail.com>
> > 
> > Unfortunately patchwork ignores this tag.
> > So, in the future please:
> > - put a tag on a separate line
> > - do _not_ prepend it by any characters including white spaces
> > (except new line :-) )
> 
> I have not known that those lines are parsed automatically.
> Will do it in future!

:-) Thanks!

For reference, Patchwork tally's such things in the patch list view:
https://patchwork.kernel.org/project/platform-driver-x86/list/

And, selfishly, the more normalized these are, the less likely Andy and I are to
make mistakes manipulating them into the patches.

-- 
Darren Hart
VMware Open Source Technology Center
