From: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 5/8] minnowboard-gpio: Export MinnowBoard expansion GPIO
Date: Thu, 27 Jun 2013 21:27:16 -0700
Message-ID: <1372393636.9243.0.camel@envy.home>
References: <cover.1372211451.git.dvhart@linux.intel.com>
	 <c7bed09378e5edf88872e277b238ecc3f52634aa.1372211451.git.dvhart@linux.intel.com>
	 <1372233328.24799.48.camel@smile> <1372263718.8177.74.camel@envy.home>
	 <1372321107.24799.75.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1372321107.24799.75.camel@smile>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, peter.p.waskiewicz.jr@intel.com, danders@circuitco.com, vishal.l.verma@intel.com, Matthew Garrett <matthew.garrett@nebula.com>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2013-06-27 at 11:18 +0300, Andy Shevchenko wrote:
> On Wed, 2013-06-26 at 09:21 -0700, Darren Hart wrote: 
> > On Wed, 2013-06-26 at 10:55 +0300, Andy Shevchenko wrote:
> 
> > > > + out:
> > > > +	return err;
> > > 
> > > Are you planning to add something else to 'out' path?
> > > Otherwise I think it will look better if you do return instead of
> > > [useless] gotos.
> > 
> > I suppose this is a matter of preference. I am allergic to multiple
> > return points. However, your argument is consistent with CodingStyle
> > Chapter 7 in that it states "and some common work such as cleanup has to
> > be done." If that "and" is a required sort of &&, then I should change
> > it. Do others have a strong opinion here?
> 
> There was recently similar discussion. Author finally agreed to change:
> http://www.spinics.net/lists/arm-kernel/msg252108.html
> 
> "I did say in the changelog I opted for goto over return. But since
> everybody keeps preferring returns..."

OK, I'll fix that up in V2 and use that model in the future. Thank you
for being persistent.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel
