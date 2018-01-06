From: Darren Hart <dvhart@infradead.org>
Subject: Re: platform/x86/thinkpad_acpi: Adjustments for four function
 implementations
Date: Fri, 5 Jan 2018 17:26:34 -0800
Message-ID: <20180106012634.GB5260@fury>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
 <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
 <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
 <20171223014033.jx7fzu7uzjfbzyca@khazad-dum.debian.net>
 <80ae8328-5851-01b0-cb31-474f7baf1686@users.sourceforge.net>
 <20180103001034.GC24794@fury>
 <9ea2c1c7-a07d-19c3-a2dc-0c69352d9558@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9ea2c1c7-a07d-19c3-a2dc-0c69352d9558@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 03, 2018 at 09:41:04AM +0100, SF Markus Elfring wrote:
> > I understand it can be frustrating to encounter different policies
> > across kernel maintainers.
> 
> The change acceptance is varying for special transformation patterns.
> 
> 
> > You'll even run in to this with maintainers of the same subsystem
> > from time to time.
> 
> Interesting, isn't it?
> 
> 
> > I'm supportive of cleaning up old code in general,
> 
> Nice.
> 
> 
> > and we routinely apply such patches as these developed with cocci.
> 
> Good to know …
> 
> 
> > 1. This is init code )so any space savings is short lived)
> 
> Would you dare to achieve another small improvement there?
> 
> 
> > So it isn't that we place a low value on coding style guidelines,
> > but rather we place higher value on not perturbing code
> 
> I can follow this view in principle.
> 
> 
> > we can't fully test without a demonstrable functional reasons to do so.
> 
> How do you think about to get a bit nicer run time characteristics?

If this was code that affected all systems, the impact would be greater
- and it would be much easier to test. As it applies only to Thinkpad
systems, far fewer total systems are affected, and it is much harder to
test/verify. For something like this, we (Andy and I) will typically
defer to the driver-specific maintainer. Henrique has declined the
patch, and I think the reasoning is defensible.

If you feel that is the wrong call, you will need to present convincing
evidence to Henrique that this is worth the risk. From what I've seen of
the patch series thus far... I don't think the advantages can be argued
to outweigh the risks - or that it would be worth the effort.

Henrique, I'm going to stop there and let you chime in if you feel
differently about any of the above.

-- 
Darren Hart
VMware Open Source Technology Center
