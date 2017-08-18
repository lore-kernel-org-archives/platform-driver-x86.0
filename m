From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Expose conservation mode switch
Date: Fri, 18 Aug 2017 15:46:36 +0300
Message-ID: <CAHp75VezdV7fsD9_vRtP44VFQ97zpB2qUGji=8Ry9T2batt4TA@mail.gmail.com>
References: <cd64f959-5fa0-50e2-183a-70c28aa121d9@in04.sg> <CAHp75Vc8r0YWUZ77+nFmwn5_Yz7XqhJ5C+qRcjemmtmK+=YXXA@mail.gmail.com>
 <20170815224250.GA28337@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:34546 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750953AbdHRMqh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 08:46:37 -0400
In-Reply-To: <20170815224250.GA28337@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Hao Wei Tee <angelsl@in04.sg>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Ike Panhc <ike.pan@canonical.com>

On Wed, Aug 16, 2017 at 1:42 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Mon, Aug 14, 2017 at 06:32:48PM +0300, Andy Shevchenko wrote:
>> On Mon, Aug 14, 2017 at 5:17 PM, Hao Wei Tee <angelsl@in04.sg> wrote:
>> > +static int method_gbmd(acpi_handle handle, unsigned long *ret)
>> > +{
>> > +       int val;
>> > +       int result = read_method_int(handle, "GBMD", &val);
>>
>> Reversed X-mas tree order in new code, please.
>
> Generally yes, but of here they are using &val in the second initializer.
>
> So either as is or:
>
> int result;
> int val;
>
> result = read_method_int(handle, "GBMD", &val)
>
> I tend to accept it as is when there is a declaration order dependency like
> this.

There is a new version which I applied, there is no dependencies left.

-- 
With Best Regards,
Andy Shevchenko
