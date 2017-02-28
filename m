From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 0/4] fujitsu_init() cleanup
Date: Tue, 28 Feb 2017 16:40:06 +0200
Message-ID: <CAHp75VfrJfMuw0_N5pBu9Y-S+XOKpwESa5CdMFXS1mXci+5HQA@mail.gmail.com>
References: <20170113110240.622-1-kernel@kempniu.pl> <20170113121758.GA9036@marvin.atrad.com.au>
 <20170113131915.GA745@ozzy.nask.waw.pl> <20170203140507.GB11947@ozzy.nask.waw.pl>
 <20170227071909.GA9386@ozzy.nask.waw.pl> <20170228061755.GA4228@fedora>
 <20170228080704.GA32366@kroah.com> <20170228083328.GA3277@ozzy.nask.waw.pl>
 <20170228112447.GB31575@marvin.atrad.com.au> <20170228132440.GB3277@ozzy.nask.waw.pl>
 <20170228140152.GA7073@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:34068 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751898AbdB1Ot3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Feb 2017 09:49:29 -0500
In-Reply-To: <20170228140152.GA7073@kroah.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 28, 2017 at 4:01 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Feb 28, 2017 at 02:24:40PM +0100, Micha=C5=82 K=C4=99pie=C5=84 wr=
ote:
>> > On Tue, Feb 28, 2017 at 09:33:28AM +0100, Micha?? K??pie?? wrote:
>> > > GregKH wrote:

>> Greg objected to that, arguing that there might be userspace
>> applications using these attributes under their current path.  I do not
>> know of such an application.  My question to Darren was thus: do we move
>> dock, lid and radios and rip the platform driver and platform device out
>> of fujitsu-laptop or should these attributes rather stay where they are?
>
> I would say just to leave them as-is, there's no harm in those 40 lines,
> and you really don't want to break someone's existing setup for no good
> reason.

Micha=C5=82, from design point of view you can split it to two parts if
*makes sense* / *needed*: core and platform driver.

--=20
With Best Regards,
Andy Shevchenko
