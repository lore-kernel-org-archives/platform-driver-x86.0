From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: wmi: Fix misuse of vsprintf extension %pULL
Date: Thu, 1 Mar 2018 10:05:25 -0800
Message-ID: <20180301180525.GB25613@fury>
References: <77b9d62ee2600bb01c08c618e67b63c8aaa35f49.1519920316.git.joe@perches.com>
 <CAHp75Ve6H9Ra4zm-EA6+1rHenoOkQJi9d=OJ+0B64HjxLkPBvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Ve6H9Ra4zm-EA6+1rHenoOkQJi9d=OJ+0B64HjxLkPBvQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Joe Perches <joe@perches.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 01, 2018 at 06:39:07PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 1, 2018 at 6:08 PM, Joe Perches <joe@perches.com> wrote:
> > %pULL doesn't officially exist but %pUL does.
> >
> > Miscellanea:
> >
> > o Add missing newlines to a couple logging messages
> 
> Darren, are you agree on the change?
> 
> To me it seems fine.

Yup, clearly a typo based on other usages within the file. Thanks Joe.

Applied.

-- 
Darren Hart
VMware Open Source Technology Center
