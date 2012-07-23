From: Corentin Chary <corentincj@iksaif.net>
Subject: Re: [PATCH 1/2] asus-wmi: record wlan status while controlling by
 user app
Date: Mon, 23 Jul 2012 09:33:44 +0200
Message-ID: <CAHR064hq1NSDY+B1Lgbx03uTZhD3TqEkcj7AfSRg4saoo5oJoQ@mail.gmail.com>
References: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064j1C=L9=tz2Hjf1N30YauEkPP+LmQXnpstbMPnCO_BS6A@mail.gmail.com>
	<CAMz9Wg95uOLPWHtBL5zAVWwNqE6Orj6cG8d0y0An8BtCAm1MFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:59178 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752073Ab2GWHdr convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Jul 2012 03:33:47 -0400
Received: by lbbgm6 with SMTP id gm6so7618295lbb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jul 2012 00:33:44 -0700 (PDT)
In-Reply-To: <CAMz9Wg95uOLPWHtBL5zAVWwNqE6Orj6cG8d0y0An8BtCAm1MFQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Jul 23, 2012 at 5:27 AM, AceLan Kao <acelan.kao@canonical.com> =
wrote:
> Dear Corentin,
>
> 2012/7/20 Corentin Chary <corentincj@iksaif.net>:
>> On Fri, Jul 20, 2012 at 5:26 AM, AceLan Kao <acelan.kao@canonical.co=
m> wrote:
>>> If the user bit is set, that mean BIOS can't set and record the wla=
n
>>> status, it will report the value read from id ASUS_WMI_DEVID_WLAN_L=
ED
>>> while we query the wlan status by id ASUS_WMI_DEVID_WLAN through WM=
I.
>>> So, we have to record wlan status in id ASUS_WMI_DEVID_WLAN_LED
>>> while setting the wlan status through WMI.
>>> This is also the behavior that windows app will do.
>>>
>>> Quote from ASUS application engineer
>>> =3D=3D=3D
>>> When you call WMIMethod(DSTS, 0x00010011) to get WLAN status, it ma=
y return
>>>
>>> (1) 0x00050001 (On)
>>> (2) 0x00050000 (Off)
>>> (3) 0x00030001 (On)
>>> (4) 0x00030000 (Off)
>>> (5) 0x00000002 (Unknown)
>>>
>>> (1), (2) means that the model has hardware GPIO for WLAN, you can c=
all
>>> WMIMethod(DEVS, 0x00010011, 1 or 0) to turn WLAN on/off
>>
>> Will it handle the LED too, or do you have to call 0x00010012 ?
> In this case, we don't have to worry about the LED, BIOS will pull
> up/down the LED pin
> after receiving the enable/disable wireless command through WMI.
>
>>
>>> (3), (4) means that the model doesn=E2=80=99t have hardware GPIO, y=
ou need to use
>>> API or driver library to turn WLAN on/off, and call
>>> WMIMethod(DEVS, 0x00010012, 1 or 0) to set WLAN LED status.
>>> After you set WLAN LED status, you can see the WLAN status is chang=
ed with
>>> WMIMethod(DSTS, 0x00010011). Because the status is recorded lastly
>>> (ex: Windows), you can use it for synchronization.
>>
>> That means WMIMethod(DSTS, 0x00010011, 0) will do nothing ? Or will =
it
>> control both the led and the device ?
> Yes, WMIMethod(DSTS, 0x00010011, 0) will do nothing if we try to
> enable/disable it.
> It won't turn on/off the wifi nor the LED.
> But, we still can read the status of wireless through this command, b=
ut
> need to use 0x00010012 to set wifi status.
>
>> How can you then call WMIMethod(DSTS, 0x00010012, 0/1) since nobody
>> switched wlan on or off ?
>> If you just want a way to control the led, expose it under
>> /sys/class/leds, and remove wlan from /sys/class/rfkill if it doesn'=
t
>> work.
> ASUS' BIOS engineer told us that it's a way to change the status of
> wifi(read from id 0x00010011)
> by writing the value to 0x00010012, and ms windows application do tha=
t as well.
> It's a poor design by ASUS' BIOS, they really surprise me while telli=
ng me that.
>
> But, the advantage of doing this is the value stored in the 0x0001001=
2
> (should be read from id 0x00010011) will be preserved to next reboot.
> So that we can track the status of wifi.
> And once we can get the correct wifi state, we then can block/unblock
> wifi while boot up.
> And it will have the same behavior as the one controlled by BIOS.

So, in this case, 0x00010012 controls:
- The LED
- The LED *and* the WLAN device
- The WLAN device
- Nothing, it just stores a value

Just to be sure to understand ... Be sure to add a comment when using
0x00010012 to tell exactly what it does.

>>
>>> (5) means that the model doesn=E2=80=99t have WLAN device.
>>>
>>> WLAN is the ONLY special case with upper rule.
>>>
>>> For other device, like Bluetooth, you just need use
>>> WMIMethod(DSTS, 0x00010013) to get, and WMIMethod(DEVS, 0x00010013,=
 1 or 0)
>>> to set.
>>> =3D=3D=3D
>>>
>>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>>> ---
>>>  drivers/platform/x86/asus-wmi.c |   27 ++++++++++++++++++++++++++-
>>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86=
/asus-wmi.c
>>> index 556cbb4..638facf 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -98,6 +98,7 @@ MODULE_LICENSE("GPL");
>>>  #define ASUS_WMI_DEVID_WIRELESS_LED    0x00010002
>>>  #define ASUS_WMI_DEVID_CWAP            0x00010003
>>>  #define ASUS_WMI_DEVID_WLAN            0x00010011
>>> +#define ASUS_WMI_DEVID_WLAN_LED                0x00010012
>>
>> What's the difference between this one and ASUS_WMI_DEVID_WIRELESS_L=
ED ?
>> What is really  0x00010002 ?
> That's another weird part, that's the name defined in the ASUS WMI sp=
ec.
> Please see the attached pic.
> 0x00010002 is the read one which can control the wireless LED,
> I don't know why there is another one exists in the spec.
>
>>>  #define ASUS_WMI_DEVID_BLUETOOTH       0x00010013
>>>  #define ASUS_WMI_DEVID_GPS             0x00010015
>>>  #define ASUS_WMI_DEVID_WIMAX           0x00010017
>>> @@ -723,10 +724,34 @@ error_workqueue:
>>>   */
>>>  static int asus_rfkill_set(void *data, bool blocked)
>>>  {
>>> +       static u32 wlan_status =3D 0xffffffff;
>>
>> Don't use a static variable, add a field into struct asus_wmi instea=
d.
> got it.
>
>>
>>>         struct asus_rfkill *priv =3D data;
>>>         u32 ctrl_param =3D !blocked;
>>> +       u32 dev_id =3D priv->dev_id;
>>> +       int result;
>>>
>>> -       return asus_wmi_set_devstate(priv->dev_id, ctrl_param, NULL=
);
>>> +       /*
>>> +        * If the user bit is set, BIOS can't set and record the wl=
an status,
>>> +        * it will report the value read from id ASUS_WMI_DEVID_WLA=
N_LED
>>> +        * while we query the wlan status through WMI.
>>> +        * So, we have to record wlan status in id ASUS_WMI_DEVID_W=
LAN_LED
>>> +        * while setting the wlan status through WMI.
>>> +        * This is also the behavior that windows app will do.
>>> +        */
>>> +       if (dev_id =3D=3D ASUS_WMI_DEVID_WLAN) {
>>> +               if (wlan_status =3D=3D 0xffffffff)
>>> +                       asus_wmi_get_devstate(priv->asus,
>>> +                                             ASUS_WMI_DEVID_WLAN,
>>> +                                             &wlan_status);
>>
>> Maybe you could read that on startup instead of using lazy loading ?
>> Read the state of the wlan device, and set a flag "led should be con=
trolled"
> ok
>
>>
>>> +               if (wlan_status &
>>> +                  (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_USER=
_BIT))
>>> +                       dev_id =3D ASUS_WMI_DEVID_WLAN_LED;
>>> +       }
>>> +
>>> +       result =3D asus_wmi_set_devstate(dev_id, ctrl_param, NULL);
>>> +
>>> +       return result;
>>>  }
>>>
>>>  static void asus_rfkill_query(struct rfkill *rfkill, void *data)
>>
>> While this patch work, I'll prefer an approach using a led class and=
 a
>> led trigger. The led trigger would be set by default, but the user
>> would also be able to switch the trigger to another one, or to contr=
ol
>> the led using /sys/class/leds/
> I think the problem is not so seriously, we just need to record the w=
ifi status
> if the wifi device is controlled by application.
> And the solution is to store the status in 0x00010012.
> So that rfkill could work as expected.
>
> Best regards,
> AceLan Kao.
>
> --
> Chia-Lin Kao(AceLan)
> http://blog.acelan.idv.tw/
> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)



--=20
Corentin Chary
http://xf.iksaif.net
