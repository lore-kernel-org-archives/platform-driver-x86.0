From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] asus-wmi: Set specified XUSB2PR value for X550LB
Date: Sun, 4 Dec 2016 03:33:30 +0200
Message-ID: <CAHp75VfQkcivJUvcGZxafO2nMufyr3ZCKJLuo+OaC=0nveNBhA@mail.gmail.com>
References: <1472745355-13428-1-git-send-email-kai.chiuan@gmail.com>
 <20160909165820.GB17607@f23x64.localdomain> <CAHR064hBWJo7N417mZWVT4EN_EBCULLcn_HUbFnguA_4O3+inQ@mail.gmail.com>
 <CAHp75VddH=yVOy-GAvvypucQg3yvOb2K=s2iY_suC8NSyES+3w@mail.gmail.com> <CAHR064i=i-zizZ49ZfjZogzomCkwX9ADAu-1BNo7gASk0LDL1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:32936 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751902AbcLDBdb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Dec 2016 20:33:31 -0500
Received: by mail-oi0-f50.google.com with SMTP id w63so306187682oiw.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 03 Dec 2016 17:33:31 -0800 (PST)
In-Reply-To: <CAHR064i=i-zizZ49ZfjZogzomCkwX9ADAu-1BNo7gASk0LDL1Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Kai-Chuan Hsieh <kai.chiuan@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Sat, Dec 3, 2016 at 8:46 PM, Corentin Chary <corentin.chary@gmail.com> wrote:
> Acked-by: Corentin Chary <corentin.chary@gmail.com>

Thanks!
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>


> On Sun, Nov 20, 2016 at 1:59 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Sun, Sep 11, 2016 at 5:50 PM, Corentin Chary
>> <corentin.chary@gmail.com> wrote:
>>> I'm not sure what this has to do with the acpi/wmi driver, but I'm
>>> fine to merge it there if there isn't a better place.
>>
>> Corentin, I read this as your Ack. Tell me if it's not the case.
>>
>>> Kai-Chuan:
>>> - Can you double-check that there is no BIOS update fixing this ?
>>> - Can you double-check that there isn't similar code somewhere else in
>>> the kernel ?

-- 
With Best Regards,
Andy Shevchenko
