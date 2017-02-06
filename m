From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 7/8] asus-wireless: Export ids list
Date: Mon, 6 Feb 2017 14:18:54 -0500
Message-ID: <CA+A7VXXUyp0ypdo+SHEv6Y2EH__R1aOyb1VJ0zdmR3ytjY-rZg@mail.gmail.com>
References: <20170126153013.12753-1-jprvita@endlessm.com> <20170126153013.12753-8-jprvita@endlessm.com>
 <CAHp75Vf229bhmXD4zMydXCSSm4HEhOa9Y5S1trpQUfWnwq85MQ@mail.gmail.com>
 <CA+A7VXU3zNm2qHaM2hnaJ0GamrL5c0zCKC-MLgPZ+9M_DyKKkQ@mail.gmail.com> <CAHp75VfMKy47--izxLfXO6ZJXSwgDg3pgVFv_F93N2ELZmsqVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:36082 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751809AbdBFTTf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2017 14:19:35 -0500
In-Reply-To: <CAHp75VfMKy47--izxLfXO6ZJXSwgDg3pgVFv_F93N2ELZmsqVA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 4 February 2017 at 10:35, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> On Wed, Feb 1, 2017 at 2:23 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail=
.com> wrote:
>> On 27 January 2017 at 10:36, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
>>> On Thu, Jan 26, 2017 at 5:30 PM, Jo=C3=A3o Paulo Rechi Vita
>>> <jprvita@gmail.com> wrote:
>
> Fill commit message, btw.
>
>>>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>
>>>> -static const struct acpi_device_id device_ids[] =3D {
>>>> -       {"ATK4001", 0},
>>>> -       {"ATK4002", 0},
>>>> -       {"", 0},
>>>> -};
>>>> -MODULE_DEVICE_TABLE(acpi, device_ids);
>>>> +MODULE_DEVICE_TABLE(acpi, asus_wireless_ids);
>>>>
>>>
>>> No, Don't do this.
>>>
>>
>> Why?
>
> Table is a property of certain driver. You make it visible to parts
> that non need it.
> Moreover, you may here the list itself non-explicit, which reduces
> readability and understandability worse.
>
> If you would like to maintain a list of devices in two
> (semi-)independent modules, it would be not good looking in any case,
> either you make a hard dependency (if they already are it's okay to
> just export a function which helps you to find an ID in the list), or
> copy it in both modules.
>
> I need to check this as well.
>

Currently these modules do not depend on each other. There are
machines which only need asus-wmi, and not asus-wireless, and there
may be machines in the future which will only need asus-wireless and
not asus-wmi (not really seen any in that situation, but it is a
possibility), so I don't think adding a dependency here is the right
thing.

Duplicating code is not good, so I was trying to avoid it, but maybe
there isn't really any better way in this case.

>>>>  static u64 asus_wireless_method(acpi_handle handle, const char *metho=
d,
>>>>                                 int param)
>>>> @@ -130,8 +127,8 @@ static int asus_wireless_add(struct acpi_device *a=
dev)
>>>>         adev->driver_data =3D data;
>>>>
>>>>         hid =3D acpi_device_hid(adev);
>>>> -       for (i =3D 0; strcmp(device_ids[i].id, ""); i++) {
>>>
>>> This is wrong.
>>>
>>>> -               if (!strcmp(device_ids[i].id, hid)) {
>>>> +       for (i =3D 0; strcmp(asus_wireless_ids[i].id, ""); i++) {
>>>
>>> This is too.
>>>
>>> Potential infinite loop.
>>>
>>> On top of that seems you just introduced this by previous patches and
>>> changing here.
>>> Often it means you need to reconsider how you actually split the
>>> series on logical pieces.
>>>
>>
>> Can you please elaborate a bit more?
>
> The original code relies on "" in the first parameter which basically
> can be NULL. This fragile.
> But this is part subject to change in a sequential patch.
>
>> All this change does is to change
>> the name of the variable being iterated in the loop. As you said, the
>> loop was introduced in a previous series, and you didn't spot any
>> problems there.
>
> If I didn't spot it doesn't mean there is no issues, right? ;)
>
>> I don't think it makes sense to also rename the
>> variable in that other series, since I'm only renaming it because I'm
>> moving it to a header so it can be used by asus-wmi.c as well.
>
> The main problem with the above is introduction something that you are
> changing soon later.
>

Ok, I should probably have sent this as RFC, as it was actually the
case. But since I'm not going to export the ids list anymore, this
patch will be dropped from the next revision.
