From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] platform/x86: wmi: Fix printing info about WDG structure
Date: Thu, 08 Jun 2017 08:38:07 -0700
Message-ID: <1496936287.1929.18.camel@perches.com>
References: <1495885877-7906-1-git-send-email-pali.rohar@gmail.com>
         <201705271517.30111@pali>
         <CAHp75VfkudDRNTh9dR=y4G5HD+OaPoxjxVZgw6=9-YpOn4sJSA@mail.gmail.com>
         <201705272248.13257@pali>
         <CAHp75VdmMwEvho-2tRoYz3CGz2QvLr40G6Nf7wQ76LCtxFjT4g@mail.gmail.com>
         <20170608151618.GE32509@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170608151618.GE32509@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andy@infradead.org>, Andy Lutomirski <luto@kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2017-06-08 at 08:16 -0700, Darren Hart wrote:
> On Sat, May 27, 2017 at 11:49:22PM +0300, Andy Shevchenko wrote:
> > On Sat, May 27, 2017 at 11:48 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > > On Saturday 27 May 2017 15:33:14 Andy Shevchenko wrote:
> > > > On Sat, May 27, 2017 at 4:17 PM, Pali Rohár <pali.rohar@gmail.com>
> > > > wrote:
> > > > Okay, got it. But on your opinion does it make sense to do
> > > > 
> > > > pr_info("\tobject_id: %2pE\n", g->object_id);
> > > > 
> > > > instead?
> > > > 
> > > > For ASCII it will go as is previously, otherwise escaping would be
> > > > done.
> > > 
> > > Both is OK for me. Do you want to send a new patch with %2pE?
> > 
> > To me it looks slightly cleaner.
> 
> I don't want to let this one fall through the cracks. Pali, is a new one coming?

Perhaps
	pr_info("\t%*pE\n", (int)sizeof(g->object_id), g->object_id);
