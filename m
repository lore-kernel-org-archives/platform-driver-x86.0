From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Allocate buffer on heap rather
 than globally
Date: Tue, 30 Jan 2018 20:14:26 +0200
Message-ID: <CAHp75VcqCdEQjUCoSGz87Mb3HFomfOwKWxC7S2CjtqSAZQEpsA@mail.gmail.com>
References: <1517331540-13266-1-git-send-email-mario.limonciello@dell.com> <20180130171745.i5wwcwr4qdbcoxhm@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180130171745.i5wwcwr4qdbcoxhm@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 30, 2018 at 7:17 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> wro=
te:
> On Tuesday 30 January 2018 10:59:00 Mario Limonciello wrote:
>> There may be race conditions with multiple different functions working
>> on a module wide buffer causing one function to get the wrong results.
>
> Yes, this is better. We really do not need to allocate shared buffer in
> dell-laptop anymore. Before this buffer was specially allocated in first
> 4GB addresses space because its physical addresses was passed into SMM.

+1.

>> -static void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
>> +static void dell_set_arguments(struct calling_interface_buffer *buffer,
>> +                            u32 arg0, u32 arg1, u32 arg2, u32 arg3)
>
> Hm... this function has too many parameters :-(
>
> What about following API?
>
> static struct calling_interface_buffer dell_set_arguments(u32 arg0, u32 a=
rg1, u32 arg2, u32 arg3);
>
> It would return filled structure (not a pointer !)

I do not think it's a good idea. Either we allocate request on a heap
and return a pointer, or we fill the struct with some data on spot.

To naming:

for allocation: ..._alloc_request()
for filling: _fill_request() / _prepare_request()

or alike.

_set_arguments() not good enough to me.

> and caller would be
> able to use it as:
>
>   struct calling_interface_buffer buffer;
>   buffer =3D dell_set_arguments(0x2, 0, 0, 0);
>   ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);

See above.

> And maybe after this change, function dell_set_arguments() could have
> better name, e.g. dell_prepare_request() (or dell_prepare_request_buffer)
> as "set arguments" is not really what would function do (as it return
> something).

Agree.

>
>   struct calling_interface_buffer buffer;
>   buffer =3D dell_prepare_request_buffer(0x2, 0, 0, 0);
>   ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
>
> Andy, any suggestion or opinion?

See above.

--=20
With Best Regards,
Andy Shevchenko
