From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: platform/x86/thinkpad_acpi: Adjustments for four function
 implementations
Date: Wed, 3 Jan 2018 09:41:04 +0100
Message-ID: <9ea2c1c7-a07d-19c3-a2dc-0c69352d9558@users.sourceforge.net>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
 <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
 <ea910da9-ca59-b895-b071-35d9c5cbd112@users.sourceforge.net>
 <20171223014033.jx7fzu7uzjfbzyca@khazad-dum.debian.net>
 <80ae8328-5851-01b0-cb31-474f7baf1686@users.sourceforge.net>
 <20180103001034.GC24794@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180103001034.GC24794@fury>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> I understand it can be frustrating to encounter different policies
> across kernel maintainers.

The change acceptance is varying for special transformation patterns.


> You'll even run in to this with maintainers of the same subsystem
> from time to time.

Interesting, isn't it?


> I'm supportive of cleaning up old code in general,

Nice.


> and we routinely apply such patches as these developed with cocci.

Good to know …


> 1. This is init code )so any space savings is short lived)

Would you dare to achieve another small improvement there?


> So it isn't that we place a low value on coding style guidelines,
> but rather we place higher value on not perturbing code

I can follow this view in principle.


> we can't fully test without a demonstrable functional reasons to do so.

How do you think about to get a bit nicer run time characteristics?

Regards,
Markus
