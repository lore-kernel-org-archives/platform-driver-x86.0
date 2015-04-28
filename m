From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 5/6] toshiba_bluetooth: Change BT status message to debug
Date: Tue, 28 Apr 2015 09:08:32 -0600
Message-ID: <CAGdLNWGJger9MRmd0NQaooiuMPjGJA1rG+xGSJWtF84UEU+CFQ@mail.gmail.com>
References: <1430166770-15060-1-git-send-email-coproscefalo@gmail.com>
	<1430166770-15060-6-git-send-email-coproscefalo@gmail.com>
	<87pp6oiu18.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87pp6oiu18.fsf@nemi.mork.no>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi there,

2015-04-28 1:36 GMT-06:00 Bj=C3=B8rn Mork <bjorn@mork.no>:
> Azael Avalos <coproscefalo@gmail.com> writes:
>
>> The function toshiba_bluetooth_status s currently printing the statu=
s
>> of the device whenever it is queried, but since the introduction of
>> the rfkill poll code, this value will get printed everytime the poll
>> occurs.
>>
>> This patch changes the level of the printed message from info to
>> debug, and also adds a few more debug messages printing the
>> killswitch, plug and power status of the device as well.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>> ---
>>  drivers/platform/x86/toshiba_bluetooth.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_bluetooth.c b/drivers/plat=
form/x86/toshiba_bluetooth.c
>> index 9867ccd..93b9688 100644
>> --- a/drivers/platform/x86/toshiba_bluetooth.c
>> +++ b/drivers/platform/x86/toshiba_bluetooth.c
>> @@ -99,7 +99,7 @@ static int toshiba_bluetooth_status(acpi_handle ha=
ndle)
>>               return -ENXIO;
>>       }
>>
>> -     pr_info("Bluetooth status %llu\n", status);
>> +     pr_debug("Bluetooth status %llu\n", status);
>>
>>       return status;
>>  }
>> @@ -157,6 +157,10 @@ static int toshiba_bluetooth_sync_status(struct=
 toshiba_bluetooth_dev *bt_dev)
>>       bt_dev->plugged =3D (status & BT_PLUGGED_MASK) ? true : false;
>>       bt_dev->powered =3D (status & BT_POWER_MASK) ? true : false;
>>
>> +     pr_debug("killswitch %d\n", bt_dev->killswitch);
>> +     pr_debug("plugged %d\n", bt_dev->plugged);
>> +     pr_debug("powered %d\n", bt_dev->powered);
>
>
> Those are terribly generic messages.  I don't think I would have gues=
sed
> which device was trying to tell me "powered 1" if I found it in the
> logs...

Well, I was under the impression that what really gets printed is:
toshiba_bluetooth: killswitch 1

and then a siple "dmesg | grep toshiba_bluetooth" would suffice,
but yeah, they are quite non obvious.

>
> How about using e.g dev_dbg() to get a bit more context here?
>
> You might also want to put all three into a single call, so that they
> make a single dynamic debug entry when dynamic debugging is enabled.
>

Alright, will do, I'll just wait on Darren's (or someone else) comments=
 and
send a v2.

> And looking at toshiba_bluetooth_status() I see that all callers have=
 a
> device. How about propagating the device to be able to use the dev_*
> printk's there as well?  Let the device identify itself instead of
> having to guess.
>
>
> Bj=C3=B8rn


Cheers
Azael



--=20
-- El mundo apesta y vosotros apestais tambien --
