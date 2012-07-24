From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH 1/2] asus-wmi: record wlan status while controlling by
 user app
Date: Tue, 24 Jul 2012 14:37:05 +0800
Message-ID: <CAMz9Wg_r3CDuKU_VK_=OT39vQj0JWPZQnw3h2T+sw80sTiqAdA@mail.gmail.com>
References: <1342754788-22880-1-git-send-email-acelan.kao@canonical.com>
	<CAHR064j1C=L9=tz2Hjf1N30YauEkPP+LmQXnpstbMPnCO_BS6A@mail.gmail.com>
	<CAMz9Wg95uOLPWHtBL5zAVWwNqE6Orj6cG8d0y0An8BtCAm1MFQ@mail.gmail.com>
	<CAHR064hq1NSDY+B1Lgbx03uTZhD3TqEkcj7AfSRg4saoo5oJoQ@mail.gmail.com>
	<CAMz9Wg_Bg6aWEd1tUZjKRMhd5cAT3ndSp6BDMNj4So=2+U_yVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-gh0-f174.google.com ([209.85.160.174]:44072 "EHLO
	mail-gh0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753941Ab2GXGhH convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Jul 2012 02:37:07 -0400
Received: by ghrr11 with SMTP id r11so6310459ghr.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jul 2012 23:37:06 -0700 (PDT)
In-Reply-To: <CAMz9Wg_Bg6aWEd1tUZjKRMhd5cAT3ndSp6BDMNj4So=2+U_yVg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentincj@iksaif.net>
Cc: platform-driver-x86@vger.kernel.org

Dear Corentin,

=46rom ASUS, for old machines, they use 0x00010012 to turn on/off the w=
lan led
but now use 0x00010002
So, 0x00010012 is reused to store the wlan status nowadays if wlan is
controlled by user.

Best regards,
AceLan Kao.

2012/7/23 AceLan Kao <acelan.kao@canonical.com>:
> Dear Corentin,
>
> 2012/7/23 Corentin Chary <corentincj@iksaif.net>:
>> On Mon, Jul 23, 2012 at 5:27 AM, AceLan Kao <acelan.kao@canonical.co=
m> wrote:
>>> Dear Corentin,
>>>
>>> 2012/7/20 Corentin Chary <corentincj@iksaif.net>:
>>>> On Fri, Jul 20, 2012 at 5:26 AM, AceLan Kao <acelan.kao@canonical.=
com> wrote:
>>>>> If the user bit is set, that mean BIOS can't set and record the w=
lan
>>>>> status, it will report the value read from id ASUS_WMI_DEVID_WLAN=
_LED
>>>>> while we query the wlan status by id ASUS_WMI_DEVID_WLAN through =
WMI.
>>>>> So, we have to record wlan status in id ASUS_WMI_DEVID_WLAN_LED
>>>>> while setting the wlan status through WMI.
>>>>> This is also the behavior that windows app will do.
>>>>>
>>>>> Quote from ASUS application engineer
>>>>> =3D=3D=3D
>>>>> When you call WMIMethod(DSTS, 0x00010011) to get WLAN status, it =
may return
>>>>>
>>>>> (1) 0x00050001 (On)
>>>>> (2) 0x00050000 (Off)
>>>>> (3) 0x00030001 (On)
>>>>> (4) 0x00030000 (Off)
>>>>> (5) 0x00000002 (Unknown)
>>>>>
>>>>> (1), (2) means that the model has hardware GPIO for WLAN, you can=
 call
>>>>> WMIMethod(DEVS, 0x00010011, 1 or 0) to turn WLAN on/off
>>>>
>>>> Will it handle the LED too, or do you have to call 0x00010012 ?
>>> In this case, we don't have to worry about the LED, BIOS will pull
>>> up/down the LED pin
>>> after receiving the enable/disable wireless command through WMI.
>>>
>>>>
>>>>> (3), (4) means that the model doesn=92t have hardware GPIO, you n=
eed to use
>>>>> API or driver library to turn WLAN on/off, and call
>>>>> WMIMethod(DEVS, 0x00010012, 1 or 0) to set WLAN LED status.
>>>>> After you set WLAN LED status, you can see the WLAN status is cha=
nged with
>>>>> WMIMethod(DSTS, 0x00010011). Because the status is recorded lastl=
y
>>>>> (ex: Windows), you can use it for synchronization.
>>>>
>>>> That means WMIMethod(DSTS, 0x00010011, 0) will do nothing ? Or wil=
l it
>>>> control both the led and the device ?
>>> Yes, WMIMethod(DSTS, 0x00010011, 0) will do nothing if we try to
>>> enable/disable it.
>>> It won't turn on/off the wifi nor the LED.
>>> But, we still can read the status of wireless through this command,=
 but
>>> need to use 0x00010012 to set wifi status.
>>>
>>>> How can you then call WMIMethod(DSTS, 0x00010012, 0/1) since nobod=
y
>>>> switched wlan on or off ?
>>>> If you just want a way to control the led, expose it under
>>>> /sys/class/leds, and remove wlan from /sys/class/rfkill if it does=
n't
>>>> work.
>>> ASUS' BIOS engineer told us that it's a way to change the status of
>>> wifi(read from id 0x00010011)
>>> by writing the value to 0x00010012, and ms windows application do t=
hat as well.
>>> It's a poor design by ASUS' BIOS, they really surprise me while tel=
ling me that.
>>>
>>> But, the advantage of doing this is the value stored in the 0x00010=
012
>>> (should be read from id 0x00010011) will be preserved to next reboo=
t.
>>> So that we can track the status of wifi.
>>> And once we can get the correct wifi state, we then can block/unblo=
ck
>>> wifi while boot up.
>>> And it will have the same behavior as the one controlled by BIOS.
>>
>> So, in this case, 0x00010012 controls:
>> - The LED
>> - The LED *and* the WLAN device
>> - The WLAN device
>> - Nothing, it just stores a value
>>
>> Just to be sure to understand ... Be sure to add a comment when usin=
g
>> 0x00010012 to tell exactly what it does.
> From what I have heard, it should be 4 (stores a value but should be
> read from 0x00010011, instead of from 0x00010012)
> But I also raise this question to our PM and he will help us to
> clarify this from ASUS tomorrow.
>
>>
>>>>
>>>>> (5) means that the model doesn=92t have WLAN device.
>>>>>
>>>>> WLAN is the ONLY special case with upper rule.
>>>>>
>>>>> For other device, like Bluetooth, you just need use
>>>>> WMIMethod(DSTS, 0x00010013) to get, and WMIMethod(DEVS, 0x0001001=
3, 1 or 0)
>>>>> to set.
>>>>> =3D=3D=3D
>>>>>
>>>>> Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
>>>>> ---
>>>>>  drivers/platform/x86/asus-wmi.c |   27 +++++++++++++++++++++++++=
+-
>>>>>  1 file changed, 26 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x=
86/asus-wmi.c
>>>>> index 556cbb4..638facf 100644
>>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>>> @@ -98,6 +98,7 @@ MODULE_LICENSE("GPL");
>>>>>  #define ASUS_WMI_DEVID_WIRELESS_LED    0x00010002
>>>>>  #define ASUS_WMI_DEVID_CWAP            0x00010003
>>>>>  #define ASUS_WMI_DEVID_WLAN            0x00010011
>>>>> +#define ASUS_WMI_DEVID_WLAN_LED                0x00010012
>>>>
>>>> What's the difference between this one and ASUS_WMI_DEVID_WIRELESS=
_LED ?
>>>> What is really  0x00010002 ?
>>> That's another weird part, that's the name defined in the ASUS WMI =
spec.
>>> Please see the attached pic.
>>> 0x00010002 is the read one which can control the wireless LED,
>>> I don't know why there is another one exists in the spec.
>>>
>>>>>  #define ASUS_WMI_DEVID_BLUETOOTH       0x00010013
>>>>>  #define ASUS_WMI_DEVID_GPS             0x00010015
>>>>>  #define ASUS_WMI_DEVID_WIMAX           0x00010017
>>>>> @@ -723,10 +724,34 @@ error_workqueue:
>>>>>   */
>>>>>  static int asus_rfkill_set(void *data, bool blocked)
>>>>>  {
>>>>> +       static u32 wlan_status =3D 0xffffffff;
>>>>
>>>> Don't use a static variable, add a field into struct asus_wmi inst=
ead.
>>> got it.
>>>
>>>>
>>>>>         struct asus_rfkill *priv =3D data;
>>>>>         u32 ctrl_param =3D !blocked;
>>>>> +       u32 dev_id =3D priv->dev_id;
>>>>> +       int result;
>>>>>
>>>>> -       return asus_wmi_set_devstate(priv->dev_id, ctrl_param, NU=
LL);
>>>>> +       /*
>>>>> +        * If the user bit is set, BIOS can't set and record the =
wlan status,
>>>>> +        * it will report the value read from id ASUS_WMI_DEVID_W=
LAN_LED
>>>>> +        * while we query the wlan status through WMI.
>>>>> +        * So, we have to record wlan status in id ASUS_WMI_DEVID=
_WLAN_LED
>>>>> +        * while setting the wlan status through WMI.
>>>>> +        * This is also the behavior that windows app will do.
>>>>> +        */
>>>>> +       if (dev_id =3D=3D ASUS_WMI_DEVID_WLAN) {
>>>>> +               if (wlan_status =3D=3D 0xffffffff)
>>>>> +                       asus_wmi_get_devstate(priv->asus,
>>>>> +                                             ASUS_WMI_DEVID_WLAN=
,
>>>>> +                                             &wlan_status);
>>>>
>>>> Maybe you could read that on startup instead of using lazy loading=
 ?
>>>> Read the state of the wlan device, and set a flag "led should be c=
ontrolled"
>>> ok
>>>
>>>>
>>>>> +               if (wlan_status &
>>>>> +                  (ASUS_WMI_DSTS_PRESENCE_BIT | ASUS_WMI_DSTS_US=
ER_BIT))
>>>>> +                       dev_id =3D ASUS_WMI_DEVID_WLAN_LED;
>>>>> +       }
>>>>> +
>>>>> +       result =3D asus_wmi_set_devstate(dev_id, ctrl_param, NULL=
);
>>>>> +
>>>>> +       return result;
>>>>>  }
>>>>>
>>>>>  static void asus_rfkill_query(struct rfkill *rfkill, void *data)
>>>>
>>>> While this patch work, I'll prefer an approach using a led class a=
nd a
>>>> led trigger. The led trigger would be set by default, but the user
>>>> would also be able to switch the trigger to another one, or to con=
trol
>>>> the led using /sys/class/leds/
>>> I think the problem is not so seriously, we just need to record the=
 wifi status
>>> if the wifi device is controlled by application.
>>> And the solution is to store the status in 0x00010012.
>>> So that rfkill could work as expected.
>>>
>>> Best regards,
>>> AceLan Kao.
>>>
>>> --
>>> Chia-Lin Kao(AceLan)
>>> http://blog.acelan.idv.tw/
>>> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
>>
>>
>>
>> --
>> Corentin Chary
>> http://xf.iksaif.net
>> --
>> To unsubscribe from this list: send the line "unsubscribe platform-d=
river-x86" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Chia-Lin Kao(AceLan)
> http://blog.acelan.idv.tw/
> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)



--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
