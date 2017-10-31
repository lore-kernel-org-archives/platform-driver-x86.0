From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: Sony-laptop: Use common error handling code in
 sony_nc_setup_rfkill()
Date: Tue, 31 Oct 2017 17:56:21 +0100
Message-ID: <136e2b05-a601-f8de-dd84-d72b765ea4df@users.sourceforge.net>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <dadb7068-e4ed-b91d-ce31-aca2d6afd9f3@users.sourceforge.net>
 <CAHp75VeDYakxD_g+N0RcmXFmGR3Du+p2yRaTiYhNxgr+0SQ9og@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeDYakxD_g+N0RcmXFmGR3Du+p2yRaTiYhNxgr+0SQ9og@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

>> I performed another simple software refactoring.
> 
> Which is _useless_ per se

I disagree in this case because the goal of a refactoring should be
to adjust something in a desired direction without changing
the provided functionality.


> by the reasons you had been told already _several_ times about.

There can be other reasons why you do not like a concrete change.


> Either you do a real fix (propagate correct error codes
> to upper layers), or just don't bother at all.

Have the involved contributors any preferences on organisation
of corresponding update steps?

* Correct exception handling first and then apply the shown
  source code reduction again.

* Combine better exception handling with smaller code
  in one patch.

* Addition of the tag “Fixes” in the commit message?

Regards,
Markus
