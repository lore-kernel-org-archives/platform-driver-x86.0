From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-smbios: Fix error handling in
 build_tokens_sysfs()
Date: Sat, 20 Jan 2018 00:59:49 +0100
Message-ID: <20180119235949.324u2ysqxazn2tpc@pali>
References: <20180118104503.GA30055@mwanda>
 <5A607BF6.6090800@bfs.de>
 <20180118110334.v33ypxsavbmq6qpu@mwanda>
 <5A6082FA.1040608@bfs.de>
 <CAHp75Vc8jTpBEYc5eVx8saCXBU=SMEbbBO0zuD=8c+idSR1FFg@mail.gmail.com>
 <CAHp75Vewk1gu0y3=icJnrkv1NP+-tf-YWTTyU1Vf42FLG-c2Kg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:40557 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755949AbeASX7w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jan 2018 18:59:52 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75Vewk1gu0y3=icJnrkv1NP+-tf-YWTTyU1Vf42FLG-c2Kg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: wharms@bfs.de, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>

On Thursday 18 January 2018 21:24:44 Andy Shevchenko wrote:
> Walter, please, do not shrink Cc list until you sure person / people
> in question is/are not interested in the topic.
> 
> 
> On Thu, Jan 18, 2018 at 9:21 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Thu, Jan 18, 2018 at 1:20 PM, walter harms <wharms@bfs.de> wrote:
> >> Am 18.01.2018 12:03, schrieb Dan Carpenter:
> >>> On Thu, Jan 18, 2018 at 11:50:30AM +0100, walter harms wrote:
> >
> >>>>>  out_unwind_strings:
> >>>>> -   for (i = i-1; i > 0; i--) {
> >>>>> +   for (i = i-1; i >= 0; i--) {
> >>>>>             kfree(token_location_attrs[i].attr.name);
> >>>>>             kfree(token_value_attrs[i].attr.name);
> >>>>>     }
> >
> >>>> would you mind to reverse order here ?
> >>>> you know programmers are terrible at couting backwards.
> >>>
> >>> I prefer to always unwind in reverse order so I'd prefer to leave it
> >>> as-is.
> >
> >> It is just a comment from my side. we can leave the actual decision to the
> >> current maintainer.
> >
> > Right.
> > And maintainer would like to see simple:
> >
> > while (i--) {
> >     kfree(token_location_attrs[i].attr.name);
> >     kfree(token_value_attrs[i].attr.name);
> > }

For me this looks better.

> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> 
> 
> 

-- 
Pali Rohár
pali.rohar@gmail.com
