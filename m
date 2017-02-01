From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 0/8] asus-wmi: Get rid of quirk_no_rfkill{,_wapf4}
Date: Wed, 1 Feb 2017 07:21:51 -0500
Message-ID: <CA+A7VXXgHVzSBZTeEhO2r75S-Te0UQ29voNiPkYE030Ji=WdzA@mail.gmail.com>
References: <20170126153013.12753-1-jprvita@endlessm.com> <CAHp75Vc=EiKAhbOaXuqymYSDbT-SNUFCJYoimKNnpf0MB-240A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:34615 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751325AbdBAMWd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 07:22:33 -0500
In-Reply-To: <CAHp75Vc=EiKAhbOaXuqymYSDbT-SNUFCJYoimKNnpf0MB-240A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 27 January 2017 at 10:37, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> On Thu, Jan 26, 2017 at 5:30 PM, Jo=C3=A3o Paulo Rechi Vita
> <jprvita@gmail.com> wrote:
>> This quirk avoids the conflicting usage of ASUS_WMI_DEVID_WLAN_LED (0x00=
010002)
>> by both asus-wireless and asus-wmi on machines where the BIOS can't set =
and
>> record the wlan status (wlan_ctrl_by_user in asus-wmi.c). At the moment =
we have
>> six models using that quirk upstream, but there are another fifteen for =
which
>> we have downstream patches, and will send upstream unless we find a more
>> dynamic solution. We also expect this list to continue growing.
>>
>> This series makes use of ASUS_WMI_DSTS_USER_BIT plus the status of the A=
SHS
>> device to skip asus_wmi_rfkill_init(). Since asus-wmi now needs to know =
the ASHS
>> _HIDs, I have moved device_ids[] to a new header file, asus-wireless.h. =
I'm not
>> sure if there are any best practices in the kernel community against hav=
ing one
>> module including headers from a different module, but I wanted to avoid
>> duplicating this list or creating an ordering dependency between the mod=
ules.
>> Any advice on alternatives here are welcome.
>>
>> PS: I don't think asus-wireless.h needs to also be listed in MAINTAINERS=
,
>> please correct me if I'm wrong.
>>
>> Jo=C3=A3o Paulo Rechi Vita (8):
>
>>   Revert "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UA"
>>   Revert "asus-wmi: Add quirk_no_rfkill_wapf4 for the Asus X456UF"
>>   Revert "asus-wmi: Add quirk_no_rfkill for the Asus Z550MA"
>>   Revert "asus-wmi: Add quirk_no_rfkill for the Asus U303LB"
>>   Revert "asus-wmi: Add quirk_no_rfkill for the Asus N552VW"
>>   Revert "asus-wmi: Create quirk for airplane_mode LED"
>
> Don't do this.
> Each of them will break the working case -> means regression on user expe=
rience.
>

They are being substituted by a generic fix implemented by the
following two  commits, so the user experience will not change at all
after the whole series get merged.

>>   asus-wireless: Export ids list
>>   asus-wmi: Don't register rfkill if ASHS and user bit are present
>>

Or your point is that these two should come before the reverts? I
thought patchsets were looked at as an unit from the user experience /
functionally perspective. Can you please advise on what is the correct
approach here?

Thanks again for your review on this series.
