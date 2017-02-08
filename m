From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 1/1] asus-wireless: Use the correct HSWC parameter for
 each HID
Date: Wed, 8 Feb 2017 12:04:25 -0500
Message-ID: <CA+A7VXWyth2ooHw2R4bjaoSR5Q49wgUBOXm6MNni=yigdYD_Xw@mail.gmail.com>
References: <20170126150031.11840-1-jprvita@endlessm.com> <20170126150031.11840-2-jprvita@endlessm.com>
 <CAHp75VfFGziE4iENsJqy8-HESK=HA8EYdGqQQ26EBqC3yv0KFg@mail.gmail.com>
 <CA+A7VXWjL4GZORhfELJroxR3-CRTrOP8uBUgqZYyjzU0KwMYiw@mail.gmail.com>
 <CAHp75VdH+t1uWDMwQrRPnPO=pTQ9kag6mJ0QqPAxi8fQ593w=w@mail.gmail.com>
 <CA+A7VXXM+n-=FCYXiL-nn_CgeRRr5XOC66f8+e4MFYpcO345AA@mail.gmail.com> <CAHp75VdbxEWj_2Qhfe5KPr95dcPLqipN5J68iedAWfa5Eind=A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdbxEWj_2Qhfe5KPr95dcPLqipN5J68iedAWfa5Eind=A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On 7 February 2017 at 18:37, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> On Tue, Feb 7, 2017 at 11:44 PM, Jo=C3=A3o Paulo Rechi Vita
> <jprvita@gmail.com> wrote:
>> On 4 February 2017 at 10:02, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
>>> On Wed, Feb 1, 2017 at 2:20 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gma=
il.com> wrote:
>>>> On 27 January 2017 at 10:26, Andy Shevchenko <andy.shevchenko@gmail.co=
m> wrote:
>>>>> On Thu, Jan 26, 2017 at 5:00 PM, Jo=C3=A3o Paulo Rechi Vita
>>>>> <jprvita@gmail.com> wrote:
>>>
>>>>>> +static const struct acpi_device_id device_ids[] =3D {
>>>>>> +       {"ATK4001", 0},
>>>>>> +       {"ATK4002", 0},
>>>>>
>>>>> ...and use it as a parameter here.
>>>>>
>>>>
>>>> I'm not exactly sure how to do that, as driver_data is a
>>>> kernel_ulong_t. Can you please elaborate a bit more?
>>>
>>> {"ATK4001", (kernel_ulong_t)atk4001_id_params},
>>>
>>
>> The code you suggested:
>>
>> static const struct hswc_params atk4001_id_params =3D {0x0, 0x1, 0x2};
>> static const struct acpi_device_id device_ids[] =3D {
>>        {"ATK4001", (kernel_ulong_t)atk4001_id_params},
>>        {"", 0},
>> };
>>
>> does not compile: "drivers/platform/x86/asus-wireless.c:44:2: error:
>> aggregate value used where an integer was expected", so I guess you
>> meant the address of that struct (&atk4001_id_params), right? I don't
>> see any way how we could have the actual data in .driver_data.
>
> Yes, you are right. I kept in mind array when was suggesting this.
>
>> Even after moving the parameters in the driver_data field of
>> device_ids[], I'm not able retrieve them with acpi_match_device(),
>> because the "struct device" from the "struct acpi_device" that comes
>> as an input parameter in asus_wireless_add() does not have a acpi
>> companion device associated with it, so acpi_match_device() returns
>> NULL. I still need to manually loop through device_ids[] in order to
>> retrieve the .driver_data associated with the HID, and I see the same
>> pattern in the i2c-scmi driver.
>
> And what prevents us to set companion device?
>

Assuming this in the scope of a platform driver (genuine question, as
I don't see anything under drivers/platform/ doing so), nothing
prevents us to set it. But when doing so, acpi_match_device() still
fails, because acpi_get_first_physical_node() returns a different
"struct dev *" in acpi_primary_dev_companion().

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
