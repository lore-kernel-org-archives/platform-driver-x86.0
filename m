From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 4/4] asus-wireless: Toggle airplane mode LED
Date: Tue, 5 Jan 2016 08:29:29 -0500
Message-ID: <CA+A7VXXgOxe6M9XfoeEerzhUtNA83eYju6-hEjy3++s4r3fBkg@mail.gmail.com>
References: <1451141797-1066-1-git-send-email-jprvita@endlessm.com>
 <1451141797-1066-5-git-send-email-jprvita@endlessm.com> <CAHp75Vc+drvNsT5+isZ_EYuneJOMnv9gUObRxkZVzCA+P3qR7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:34752 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188AbcAENaJ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jan 2016 08:30:09 -0500
In-Reply-To: <CAHp75Vc+drvNsT5+isZ_EYuneJOMnv9gUObRxkZVzCA+P3qR7w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>

On 27 December 2015 at 08:32, Andy Shevchenko <andy.shevchenko@gmail.co=
m> wrote:
> On Sat, Dec 26, 2015 at 4:56 PM, Jo=C3=A3o Paulo Rechi Vita
> <jprvita@gmail.com> wrote:
>> In the ASHS device we have the HSWC method, which basically calls ei=
ther
>> OWGD or OWGS, depending on its parameter:
>>
>>         Device (ASHS)
>>         {
>>                 Name (_HID, "ATK4002")  // _HID: Hardware ID
>>                 Method (HSWC, 1, Serialized)
>>                 {
>>                         If ((Arg0 < 0x02))
>>                         {
>>                                 OWGD (Arg0)
>>                                 Return (One)
>>                         }
>>                         If ((Arg0 =3D=3D 0x02))
>>                         {
>>                                 Local0 =3D OWGS ()
>>                                 If (Local0)
>>                                 {
>>                                         Return (0x05)
>>                                 }
>>                                 Else
>>                                 {
>>                                         Return (0x04)
>>                                 }
>>                         }
>>                         If ((Arg0 =3D=3D 0x03))
>>                         {
>>                                 Return (0xFF)
>>                         }
>>                         If ((Arg0 =3D=3D 0x04))
>>                         {
>>                                 OWGD (Zero)
>>                                 Return (One)
>>                         }
>>                         If ((Arg0 =3D=3D 0x05))
>>                         {
>>                                 OWGD (One)
>>                                 Return (One)
>>                         }
>>                         If ((Arg0 =3D=3D 0x80))
>>                         {
>>                                 Return (One)
>>                         }
>>                 }
>>                 Method (_STA, 0, NotSerialized)  // _STA: Status
>>                 {
>>                         If ((MSOS () >=3D OSW8))
>>                         {
>>                                 Return (0x0F)
>>                         }
>>                         Else
>>                         {
>>                                 Return (Zero)
>>                         }
>>                 }
>>         }
>>
>> On the Asus E202SA laptop, which does not have an airplane mode LED,
>> OWGD has an empty implementation and OWGS simply returns 0. On the A=
sus
>> X555UB these methods have the following implementation:
>>
>>         Method (OWGD, 1, Serialized)
>>         {
>>                 SGPL (0x0203000F, Arg0)
>>                 SGPL (0x0203000F, Arg0)
>>         }
>>
>>         Method (OWGS, 0, Serialized)
>>         {
>>                 Store (RGPL (0x0203000F), Local0)
>>                 Return (Local0)
>>         }
>>
>> Where OWGD(1) sets the airplane mode LED ON, OWGD(0) set it off, and
>> OWGS() returns its state.
>>
>> This commit makes use of a newly implemented RFKill LED trigger to
>> trigger the LED when the system enters or exits "Airplane Mode", the=
re
>> is, when all radios are blocked.
>>
>> Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
>> ---
>>  drivers/platform/x86/Kconfig         |  2 +
>>  drivers/platform/x86/asus-wireless.c | 81 +++++++++++++++++++++++++=
+++++++++++
>>  2 files changed, 83 insertions(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kco=
nfig
>> index d3a088b..3d8dc0b 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -592,6 +592,8 @@ config ASUS_WIRELESS
>>         depends on ACPI
>>         depends on INPUT
>>         default m
>> +       select NEW_LEDS
>> +       select LEDS_CLASS
>>         ---help---
>>           The Asus Wireless Radio Control handles the airplane mode =
hotkey
>>           present on some Asus laptops.
>> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform=
/x86/asus-wireless.c
>> index 7928efd..489ef83 100644
>> --- a/drivers/platform/x86/asus-wireless.c
>> +++ b/drivers/platform/x86/asus-wireless.c
>> @@ -17,13 +17,76 @@
>>  #include <linux/acpi.h>
>>  #include <linux/input.h>
>>  #include <linux/pci_ids.h>
>> +#include <linux/leds.h>
>>
>>  #define ASUS_WIRELESS_MODULE_NAME "Asus Wireless Radio Control Driv=
er"
>> +#define ASUS_WIRELESS_LED_STATUS 0x2
>> +#define ASUS_WIRELESS_LED_OFF 0x4
>> +#define ASUS_WIRELESS_LED_ON 0x5
>>
>>  struct asus_wireless_data {
>>         struct input_dev *inputdev;
>> +       struct acpi_device *acpidev;
>
> You can get this easily from struct device.
>

If I'm understanding it correctly that only works when the acpi device
is a companion to a physical device, which is not the case here
(ACPI_COMPANION(acpi_device->dev)=3D=3DNULL). I'm keeping this for now,
please let me know if I'm missing something.

>> +       struct workqueue_struct *wq;
>> +       struct work_struct led_work;
>> +       struct led_classdev led;
>> +       int led_state;
>>  };
>>
>> +static u64 asus_wireless_method(acpi_handle handle, const char *met=
hod,
>> +                               int param)
>> +{
>> +       union acpi_object obj;
>> +       struct acpi_object_list p;
>> +       acpi_status s;
>> +       u64 ret;
>> +
>> +       pr_debug("Evaluating method %s, parameter 0x%X\n", method, p=
aram);
>
> acpi_handle_* in such cases.
>

Ok.

>> +       obj.type =3D ACPI_TYPE_INTEGER;
>> +       obj.integer.value =3D param;
>> +       p.count =3D 1;
>> +       p.pointer =3D &obj;
>> +
>> +       s =3D acpi_evaluate_integer(handle, (acpi_string) method, &p=
, &ret);
>> +       if (!ACPI_SUCCESS(s))
>
> ACPI_FAILURE()
>

Ok.

>> +               pr_err("Failed to evaluate method %s, parameter 0x%X=
 (%d)\n",
>> +                      method, param, s);
>> +       pr_debug("%s returned 0x%X\n", method, (uint) ret);
>> +       return ret;
>> +}
>> +
>> +static enum led_brightness asus_wireless_led_get(struct led_classde=
v *led)
>> +{
>> +       struct asus_wireless_data *data;
>> +       int s;
>> +
>> +       data =3D container_of(led, struct asus_wireless_data, led);
>> +       s =3D asus_wireless_method(data->acpidev->handle, "HSWC",
>
> Usually we get a handle through specific macro ACPI_HANDLE from a
> struct device (see above).
>
>> +                                ASUS_WIRELESS_LED_STATUS);
>> +       if (s =3D=3D ASUS_WIRELESS_LED_ON)
>> +               return LED_FULL;
>> +       return LED_OFF;
>> +}
>> +
>> +static void asus_wireless_led_update(struct work_struct *work)
>> +{
>> +       struct asus_wireless_data *data;
>> +
>> +       data =3D container_of(work, struct asus_wireless_data, led_w=
ork);
>> +       asus_wireless_method(data->acpidev->handle, "HSWC", data->le=
d_state);
>
> Ditto.
>

These last two depend on ACPI_COMPANION as well. I'm changing this to
call acpi_device_handle() instead of accessing the pointer directly.

I will send an updated version shortly. Thanks again for your feedback.

--
Jo=C3=A3o Paulo Rechi Vita
http://about.me/jprvita
