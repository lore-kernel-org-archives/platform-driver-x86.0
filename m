From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 7/8] asus-wireless: Export ids list
Date: Sat, 4 Feb 2017 17:35:03 +0200
Message-ID: <CAHp75VfMKy47--izxLfXO6ZJXSwgDg3pgVFv_F93N2ELZmsqVA@mail.gmail.com>
References: <20170126153013.12753-1-jprvita@endlessm.com> <20170126153013.12753-8-jprvita@endlessm.com>
 <CAHp75Vf229bhmXD4zMydXCSSm4HEhOa9Y5S1trpQUfWnwq85MQ@mail.gmail.com> <CA+A7VXU3zNm2qHaM2hnaJ0GamrL5c0zCKC-MLgPZ+9M_DyKKkQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35669 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750876AbdBDPfE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Feb 2017 10:35:04 -0500
In-Reply-To: <CA+A7VXU3zNm2qHaM2hnaJ0GamrL5c0zCKC-MLgPZ+9M_DyKKkQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On Wed, Feb 1, 2017 at 2:23 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.c=
om> wrote:
> On 27 January 2017 at 10:36, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:
>> On Thu, Jan 26, 2017 at 5:30 PM, Jo=C3=A3o Paulo Rechi Vita
>> <jprvita@gmail.com> wrote:

Fill commit message, btw.

>>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>

>>> -static const struct acpi_device_id device_ids[] =3D {
>>> -       {"ATK4001", 0},
>>> -       {"ATK4002", 0},
>>> -       {"", 0},
>>> -};
>>> -MODULE_DEVICE_TABLE(acpi, device_ids);
>>> +MODULE_DEVICE_TABLE(acpi, asus_wireless_ids);
>>>
>>
>> No, Don't do this.
>>
>
> Why?

Table is a property of certain driver. You make it visible to parts
that non need it.
Moreover, you may here the list itself non-explicit, which reduces
readability and understandability worse.

If you would like to maintain a list of devices in two
(semi-)independent modules, it would be not good looking in any case,
either you make a hard dependency (if they already are it's okay to
just export a function which helps you to find an ID in the list), or
copy it in both modules.

I need to check this as well.

>>>  static u64 asus_wireless_method(acpi_handle handle, const char *method=
,
>>>                                 int param)
>>> @@ -130,8 +127,8 @@ static int asus_wireless_add(struct acpi_device *ad=
ev)
>>>         adev->driver_data =3D data;
>>>
>>>         hid =3D acpi_device_hid(adev);
>>> -       for (i =3D 0; strcmp(device_ids[i].id, ""); i++) {
>>
>> This is wrong.
>>
>>> -               if (!strcmp(device_ids[i].id, hid)) {
>>> +       for (i =3D 0; strcmp(asus_wireless_ids[i].id, ""); i++) {
>>
>> This is too.
>>
>> Potential infinite loop.
>>
>> On top of that seems you just introduced this by previous patches and
>> changing here.
>> Often it means you need to reconsider how you actually split the
>> series on logical pieces.
>>
>
> Can you please elaborate a bit more?

The original code relies on "" in the first parameter which basically
can be NULL. This fragile.
But this is part subject to change in a sequential patch.

> All this change does is to change
> the name of the variable being iterated in the loop. As you said, the
> loop was introduced in a previous series, and you didn't spot any
> problems there.

If I didn't spot it doesn't mean there is no issues, right? ;)

> I don't think it makes sense to also rename the
> variable in that other series, since I'm only renaming it because I'm
> moving it to a header so it can be used by asus-wmi.c as well.

The main problem with the above is introduction something that you are
changing soon later.

--=20
With Best Regards,
Andy Shevchenko
