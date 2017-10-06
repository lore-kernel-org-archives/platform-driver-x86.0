From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] drivers/x86: add thinkpad-wmi
Date: Fri, 6 Oct 2017 21:06:14 +0200
Message-ID: <CAHR064g6XuBWpO3uw2aZ6z5HyTRHbNx3du2R_2x=Gz+y2BCFUQ@mail.gmail.com>
References: <20170904082110.30925-1-corentin.chary@gmail.com>
 <CAHp75VcWfzEiZAt+ESoF==q0LnCgWRzBuo6FDizmSJ7V-8Rw3w@mail.gmail.com>
 <CAHR064i+x=MeuHxTfDNRUr1C_p2dW8+nORqtGQUcYE4Dcbyppg@mail.gmail.com>
 <CAHR064jrkntSf8_5kiL5x8B+_BwCHrrZajgedYe-FNt439wDpA@mail.gmail.com> <20171005024947.GJ25018@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:57337 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751484AbdJFTGP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2017 15:06:15 -0400
In-Reply-To: <20171005024947.GJ25018@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Yes, I'm just having trouble finding time to write it :)
I'll try to make that happen next week.

On Thu, Oct 5, 2017 at 4:49 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Sep 05, 2017 at 09:07:27AM +0200, Corentin Chary wrote:
>> [re-send for the mailing list, I forgot that gmail was stupid]
>>
>> On Tue, Sep 5, 2017 at 9:05 AM, Corentin Chary <corentin.chary@gmail.com> wrote:
>> >>
>> >> I didn't read the code, does it use WMI bus which Andy L. introduced
>> >> recently?
>> >>
>> >
>> > No, I wasn't aware of it. I checked the dell-wmi conversion patch and it
>> > should not be too hard.
>> > I'll probably sent that as a patch on top the existing driver (in the same
>> > series).
>
> Hi Corentin,
>
> Just to make sure I haven't missed it - I believe we're waiting for a v2 of this
> patch. Is that right?
>
> --
> Darren Hart
> VMware Open Source Technology Center



-- 
Corentin Chary
http://xf.iksaif.net
