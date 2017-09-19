From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: NULL pointer dereference in call_fext_func [fujitsu_laptop]
Date: Tue, 19 Sep 2017 11:07:29 +0300
Message-ID: <CAHp75Vd=FnWaYg-gKoQO4p8UP3VVhOT9cQ-B-3b20u2KJBRDWQ@mail.gmail.com>
References: <541b9a7a-2224-9b81-aef3-3f06491f91e3@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:33976 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751509AbdISIHb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 04:07:31 -0400
In-Reply-To: <541b9a7a-2224-9b81-aef3-3f06491f91e3@suse.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Jonathan Woithe <jwoithe@just42.net>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>

On Tue, Sep 19, 2017 at 10:56 AM, Jiri Slaby <jslaby@suse.cz> wrote:
> Hi,
>
> we have this report from 4.13.1:
> BUG: unable to handle kernel NULL pointer dereference at 00000004
> IP: call_fext_func.isra.3+0x82/0xf0 [fujitsu_laptop]
> *pdpt = 0000000035e79001 *pde = 0000000000000000

Thanks for report.

Isn't it a duplicate of [1]? If so, perhaps you may continue that thread.

[1]: https://www.spinics.net/lists/platform-driver-x86/msg12834.html

-- 
With Best Regards,
Andy Shevchenko
