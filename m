From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-smbios: Fix error handling in build_tokens_sysfs()
Date: Thu, 18 Jan 2018 21:21:52 +0200
Message-ID: <CAHp75Vc8jTpBEYc5eVx8saCXBU=SMEbbBO0zuD=8c+idSR1FFg@mail.gmail.com>
References: <20180118104503.GA30055@mwanda> <5A607BF6.6090800@bfs.de>
 <20180118110334.v33ypxsavbmq6qpu@mwanda> <5A6082FA.1040608@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f174.google.com ([209.85.216.174]:32965 "EHLO
        mail-qt0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754170AbeARTVx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Jan 2018 14:21:53 -0500
In-Reply-To: <5A6082FA.1040608@bfs.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: wharms@bfs.de
Cc: kernel-janitors@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>

On Thu, Jan 18, 2018 at 1:20 PM, walter harms <wharms@bfs.de> wrote:
> Am 18.01.2018 12:03, schrieb Dan Carpenter:
>> On Thu, Jan 18, 2018 at 11:50:30AM +0100, walter harms wrote:

>>>>  out_unwind_strings:
>>>> -   for (i = i-1; i > 0; i--) {
>>>> +   for (i = i-1; i >= 0; i--) {
>>>>             kfree(token_location_attrs[i].attr.name);
>>>>             kfree(token_value_attrs[i].attr.name);
>>>>     }

>>> would you mind to reverse order here ?
>>> you know programmers are terrible at couting backwards.
>>
>> I prefer to always unwind in reverse order so I'd prefer to leave it
>> as-is.

> It is just a comment from my side. we can leave the actual decision to the
> current maintainer.

Right.
And maintainer would like to see simple:

while (i--) {
    kfree(token_location_attrs[i].attr.name);
    kfree(token_value_attrs[i].attr.name);
}

-- 
With Best Regards,
Andy Shevchenko
