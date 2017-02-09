From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/10] fujitsu-laptop: renames and cleanups
Date: Wed, 8 Feb 2017 17:36:16 -0800
Message-ID: <20170209013616.GA185952@localhost.localdomain>
References: <20170208134633.5152-1-kernel@kempniu.pl>
 <CAHp75VfaN+wefbk71OthMDTeDLc9pu7fwrnMm_0hrh8VocheHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75VfaN+wefbk71OthMDTeDLc9pu7fwrnMm_0hrh8VocheHw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 08, 2017 at 05:24:53PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 8, 2017 at 3:46 PM, Michał Kępień <kernel@kempniu.pl> wrote:

...

> 
> Nice clean up!
> So, I would apply 1-7, for the rest I need more time to review.

As a point of policy for this tree. If the patches touch a file with a driver
maintainer listed in MAINTAINERS, we need to make sure they are Cc'd and give
them an opportunity to review before we commit them to the queue. In this case,
Jonathan Woithe.

Jonathan has committed to review in the next couple of days, so lets please give
him first say on the patches.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
