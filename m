From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Allocate buffer on heap rather
 than globally
Date: Wed, 31 Jan 2018 18:53:19 +0200
Message-ID: <CAHp75VcqYgDCTPqjn9F1SpAbamgPk8B7s4zYAb8csD8oFpLihw@mail.gmail.com>
References: <1517331540-13266-1-git-send-email-mario.limonciello@dell.com>
 <20180130171745.i5wwcwr4qdbcoxhm@pali> <CAHp75VcqCdEQjUCoSGz87Mb3HFomfOwKWxC7S2CjtqSAZQEpsA@mail.gmail.com>
 <20180131090758.v6eyj35gymlfyzhk@pali> <bb29662337484ad8bd2350e6b68133d3@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bb29662337484ad8bd2350e6b68133d3@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 31, 2018 at 6:46 PM,  <Mario.Limonciello@dell.com> wrote:

>> > for allocation: ..._alloc_request()
>> > for filling: _fill_request() / _prepare_request()
>> >
>> > or alike.
>> >
>> > _set_arguments() not good enough to me.
>>
>> Ok. Then we need to stick with 5 arguments... What about name
>> dell_fill_request()? E.g.
>>
>>   struct calling_interface_buffer buffer;
>>   dell_fill_request(&buffer, 0x2, 0, 0, 0);
>>   ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
>>
>
> The other alternative is to just define the input of the structure immediately with
> an initializer, no multi argument filler function.  Like this:

Either would work for me, though one comment below.

> -       struct calling_interface_buffer buffer;


> +       struct calling_interface_buffer buffer = {CLASS_INFO,
> +                                                 SELECT_RFKILL,
> +                                                 {0, 0, 0, 0},
> +                                                 {0, 0, 0, 0}};

Looking to this approach I would rather provide a macro then.

#define FILL_REQUEST(a,b,c,d,...) \ // variant FILL_RFKILL_REQUEST(a,b,c,d)
(struct calling_interface_buffer) { \
 ... \
}

But then it is macro(s) vs. function(s) debate.

> -       dell_set_arguments(&buffer, 0, 0, 0, 0);
> -       ret = dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> +       ret = dell_send_request(&buffer);

-- 
With Best Regards,
Andy Shevchenko
