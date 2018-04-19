From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wireless: Fix NULL pointer dereference
Date: Thu, 19 Apr 2018 06:59:43 -0700
Message-ID: <CA+A7VXUb-u9=MDRrZxpwGiuFwQAdYCJoxaZHjLPLAcYc6PTEHQ@mail.gmail.com>
References: <20180407053729.5434-1-jprvita@endlessm.com> <20180407155006.GA11256@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180407155006.GA11256@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Corentin Chary <corentin.chary@gmail.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, linux@endlessm.com, Dun Hum <bitter.taste@gmx.com>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Apr 7, 2018 at 8:50 AM, Darren Hart <dvhart@infradead.org> wrote:
> On Fri, Apr 06, 2018 at 10:37:29PM -0700, Jo=C3=A3o Paulo Rechi Vita wrot=
e:
>> When the module is removed the led workqueue is destroyed in the remove
>> callback, before the led device is unregistered from the led subsystem.
>>
>> This leads to a NULL pointer derefence when the led device is
>> unregistered automatically later as part of the module removal cleanup.
>> Bellow is the backtrace showing the problem.
>>
>
> Thanks Jo=C3=A3o Paulo,
> ...
>
>> Unregistering the led device on the remove callback before destroying th=
e
>> workqueue avoids this problem.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=3D196097
>>
>> Reported-by: Dun Hum <bitter.taste@gmx.com>
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>> ---
>>  drivers/platform/x86/asus-wireless.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/x86=
/asus-wireless.c
>> index 343e12547660..ecd715c82de5 100644
>> --- a/drivers/platform/x86/asus-wireless.c
>> +++ b/drivers/platform/x86/asus-wireless.c
>> @@ -181,6 +181,7 @@ static int asus_wireless_remove(struct acpi_device *=
adev)
>>  {
>>       struct asus_wireless_data *data =3D acpi_driver_data(adev);
>>
>> +     devm_led_classdev_unregister(&adev->dev, &data->led);
>>       if (data->wq)
>>               destroy_workqueue(data->wq);
>>       return 0;
>
> asus_wireless_add only calls devm_led_classdev_register() iff the workque=
ue is
> successfully created. It seems like it would make sense to move the
> devm_led_classdev_unregister() call within the 'if (data->wq)' condition =
block.
>

I agree. I didn't do it this way initially as I believe the call to
devm_led_classdev_unregister() would be harmless in any case, but it
indeed best to avoid it if we can.

> This should also cc stable.
>

Adding to v2.

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
