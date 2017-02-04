From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/1] asus-wireless: Use the correct HSWC parameter for
 each HID
Date: Sat, 4 Feb 2017 17:02:21 +0200
Message-ID: <CAHp75VdH+t1uWDMwQrRPnPO=pTQ9kag6mJ0QqPAxi8fQ593w=w@mail.gmail.com>
References: <20170126150031.11840-1-jprvita@endlessm.com> <20170126150031.11840-2-jprvita@endlessm.com>
 <CAHp75VfFGziE4iENsJqy8-HESK=HA8EYdGqQQ26EBqC3yv0KFg@mail.gmail.com> <CA+A7VXWjL4GZORhfELJroxR3-CRTrOP8uBUgqZYyjzU0KwMYiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:33743 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdBDPCW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2017 10:02:22 -0500
In-Reply-To: <CA+A7VXWjL4GZORhfELJroxR3-CRTrOP8uBUgqZYyjzU0KwMYiw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Wed, Feb 1, 2017 at 2:20 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.c=
om> wrote:
> On 27 January 2017 at 10:26, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>> On Thu, Jan 26, 2017 at 5:00 PM, Jo=C3=A3o Paulo Rechi Vita
>> <jprvita@gmail.com> wrote:

>>> +static const struct acpi_device_id device_ids[] =3D {
>>> +       {"ATK4001", 0},
>>> +       {"ATK4002", 0},
>>
>> ...and use it as a parameter here.
>>
>
> I'm not exactly sure how to do that, as driver_data is a
> kernel_ulong_t. Can you please elaborate a bit more?

{"ATK4001", (kernel_ulong_t)atk4001_id_params},

Similar for the other one.

--=20
With Best Regards,
Andy Shevchenko
