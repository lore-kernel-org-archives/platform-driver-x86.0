From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 1/1] asus-wireless: Fix identation
Date: Wed, 1 Feb 2017 07:24:20 -0500
Message-ID: <CA+A7VXU2yjb6dYExqZjsP3--6ePJzK+nbNKADv=rxUcGfzX8pQ@mail.gmail.com>
References: <20170126142554.8812-1-jprvita@endlessm.com> <CAHp75Vcq9p3jbyTQzg17eLBABTTDpz-mGGU03gVx+Q3Tsh2XgA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yb0-f196.google.com ([209.85.213.196]:35390 "EHLO
        mail-yb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751389AbdBAMZB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 07:25:01 -0500
In-Reply-To: <CAHp75Vcq9p3jbyTQzg17eLBABTTDpz-mGGU03gVx+Q3Tsh2XgA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 27 January 2017 at 10:28, Andy Shevchenko <andy.shevchenko@gmail.com> wr=
ote:
> On Thu, Jan 26, 2017 at 4:25 PM, Jo=C3=A3o Paulo Rechi Vita
> <jprvita@gmail.com> wrote:
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>> ---
>>  drivers/platform/x86/asus-wireless.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86=
/asus-wireless.c
>> index 9f31bc1a47d0..c9b5ac152cf1 100644
>> --- a/drivers/platform/x86/asus-wireless.c
>> +++ b/drivers/platform/x86/asus-wireless.c
>> @@ -77,7 +77,7 @@ static void led_state_update(struct work_struct *work)
>>  }
>>
>>  static void led_state_set(struct led_classdev *led,
>> -                                 enum led_brightness value)
>> +                         enum led_brightness value)
>
> I would see benefit if it would be one line.
>

Yes, I fixed this in a hurry and missed it actually fits in one line.
Thanks for catching it! I'll reply with an updated patch.
