From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Wed, 1 Jun 2016 07:37:04 +0300
Message-ID: <CAKErNvqbr+m5jrXPfWMV8RK6i8=rprHZ_HTuD-Q+k20xSANznQ@mail.gmail.com>
References: <1459544569-29865-1-git-send-email-list@eworm.de>
 <20160505234247.GG2113@f23x64.localdomain> <CA+A7VXVcq3JjJC54kXZkmvrLF1hktX_w+vXcU-vk5WA4nFeNLA@mail.gmail.com>
 <CAKErNvrs4300M+ap+O1R-44z_EE97O=hk74nOGT+MSsVmfL6Ew@mail.gmail.com>
 <CA+A7VXW8qCu-j4QGoDBZUym+sEsXgkzPTVTv7A4UoSDe+D1mig@mail.gmail.com>
 <CAKErNvpVwhL6AXgfeQcx_K0Zu=KpqptYjB9AO6ezpDjbqx=g7w@mail.gmail.com>
 <CA+A7VXUaT+XJPCfGYrJqtB+vr7OYjZgg1m6=oVwpfA3JM++1yw@mail.gmail.com>
 <CAKErNvrr1wNB_6a-DWjbM3LcgbWd-WFvF3gz1y97ikmqE4-Wtw@mail.gmail.com> <CA+A7VXVJ6eCXmzFmO4Ek4TxMNKFA+BoKyj0Fm7s0ycn+Ev5cTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:34345 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757186AbcFAEhh convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jun 2016 00:37:37 -0400
Received: by mail-lf0-f52.google.com with SMTP id k98so4686057lfi.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 May 2016 21:37:35 -0700 (PDT)
In-Reply-To: <CA+A7VXVJ6eCXmzFmO4Ek4TxMNKFA+BoKyj0Fm7s0ycn+Ev5cTg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com

2016-06-01 1:43 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.com=
>:
> On 26 May 2016 at 15:44, Maxim Mikityanskiy <maxtram95@gmail.com> wro=
te:
>> 2016-05-25 19:03 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail=
=2Ecom>:
>>> On 25 May 2016 at 02:26, Maxim Mikityanskiy <maxtram95@gmail.com> w=
rote:
>>>> 2016-05-24 23:32 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gma=
il.com>:
>>>>> On 19 May 2016 at 05:17, Maxim Mikityanskiy <maxtram95@gmail.com>=
 wrote:
>>>>>> 2016-05-16 19:04 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@g=
mail.com>:
>>>>>>>
>>>>>>> Adding Maxim Mikityanskiy and Hans de Goede to CC.
>>>>>>>
>>>>>>> On 5 May 2016 at 19:42, Darren Hart <dvhart@infradead.org> wrot=
e:
>>>>>>> > On Fri, Apr 01, 2016 at 11:02:49PM +0200, Christian Hesse wro=
te:
>>>>>>> >> From: Christian Hesse <mail@eworm.de>
>>>>>>> >>
>>>>>>> >> When Lenovo Yoga 700 is flipped to tablet mode it emmits eve=
nt 10. Let's
>>>>>>> >> send touchpad key codes so software can disable touchpad.
>>>>>>> >>
>>>>>>> >> Signed-off-by: Christian Hesse <mail@eworm.de>
>>>>>>> >> Signed-off-by: Michael Gisbers <michael@gisbers.de>
>>>>>>> >
>>>>>>> > Queued, thanks.
>>>>>>> >
>>>>>>> >> ---
>>>>>>> >>  drivers/platform/x86/ideapad-laptop.c | 1 +
>>>>>>> >>  1 file changed, 1 insertion(+)
>>>>>>> >>
>>>>>>> >> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers=
/platform/x86/ideapad-laptop.c
>>>>>>> >> index be3bc2f..1d49db1 100644
>>>>>>> >> --- a/drivers/platform/x86/ideapad-laptop.c
>>>>>>> >> +++ b/drivers/platform/x86/ideapad-laptop.c
>>>>>>> >> @@ -809,6 +809,7 @@ static void ideapad_acpi_notify(acpi_han=
dle handle, u32 event, void *data)
>>>>>>> >>                       case 6:
>>>>>>> >>                               ideapad_input_report(priv, vpc=
_bit);
>>>>>>> >>                               break;
>>>>>>> >> +                     case 10:
>>>>>>> >>                       case 5:
>>>>>>> >>                               ideapad_sync_touchpad_state(pr=
iv);
>>>>>>>
>>>>>>> I'm not sure this is the right action here: ideapad_sync_touchp=
ad()
>>>>>>> sends a sequence of KEY_TOUCHPAD_DISABLE and KEY_TOUCHPAD_ENABL=
ED,
>>>>>>> which are interpreted by userspace as "the touchpad has been
>>>>>>> {dis,en}abled by the hardware". The way userspace is expected t=
o react
>>>>>>> to it is by showing a notification of the fact to the user, but=
 not
>>>>>>> disabling the touchpad. This behavior can be confirmed in the o=
riginal
>>>>>>> commit message that introduced this change (I couldn't find any=
 actual
>>>>>>> documentation on this): "Input: add keycodes for touchpad on/of=
f keys"
>>>>>>> (0417596f66). I was actually going to propose a patch similar t=
o Hans'
>>>>>>> "ideapad-laptop: Disable touchpad interface on Yoga models"
>>>>>>> (f79a901331) for the Yoga 900, to avoid an "touchpad ON" OSD
>>>>>>> notification being shown to the user when returning for suspend=
=2E
>>>>>>>
>>>>>>> Also, I've been investigating touchpad-related problems in the =
Lenovo
>>>>>>> Yoga 900 recently, and trying to understand this code. IIUC
>>>>>>> ideadpad_sync_touchpad_state() was created as part of "ideapad:=
 add
>>>>>>> Lenovo IdeaPad Z570 support (part 2)" (07a4a4fc8) to allow user=
space
>>>>>>> to syncronize a touchpad-state-indicator LED with the actual to=
uchpad
>>>>>>> state, although it seems to me it only works if the touchpad is=
 always
>>>>>>> enabled by the hardware on resume (cc'ing the original patch au=
thor
>>>>>>> here for maybe a confirmation on how this is expected to work).
>>>>>>
>>>>>> This is a short explanation of this function.
>>>>>>
>>>>>> We call ideapad_sync_touchpad_state when a touchpad state change=
d
>>>>>> event arrives (touchpad on/off button pressed) or we need to rea=
d  out
>>>>>> the initial touchpad state. It is also called on resume because
>>>>>> possibly the touchpad state may be changed after resume, but I d=
on't
>>>>>> know which devices behave like that (and unfortunately I'm unabl=
e to
>>>>>> test it on my Z570 because now it's dead).
>>>>>>
>>>>>
>>>>> So if I'm following this correctly, on some ideapads (Z570 and ma=
ybe
>>>>> others) there is a ACPI notification when the touchpad on/off hot=
key
>>>>> is pressed, is that correct?
>>>>
>>>> Yes, exactly.
>>>>
>>>>> This is not what I see on the Yoga 900 or
>>>>> the Yoga 3, but a special scancode (0xbf on the Yoga 900, 0xbe on=
 the
>>>>> Yoga 3) come through the AT keyboard device. So here I'm using hw=
db to
>>>>> map these to KEY_TOUCHPAD_TOGGLE (pending upstream submission to
>>>>> udev).
>>>>
>>>> If KEY_TOUCHPAD_TOGGLE is sent to the userspace on the Yoga, no
>>>> KEY_TOUCHPAD_ON or KEY_TOUCHPAD_OFF should be ever sent. Only one =
of
>>>> these mechanisms should be used for userspace to handle this
>>>> correctly.
>>>>
>>>
>>> Agreed. That's why I was planning to propose a patch very similar t=
o
>>> Hans' (f79a901331 "ideapad-laptop: Disable touchpad interface on Yo=
ga
>>> models"), but it was later reverted by 3b264d279e. I wonder if ther=
e
>>> is a more specific way to tell one model from the other.
>>>
>>>>>> ideadpad_sync_touchpad_state serves several purposes:
>>>>>>
>>>>>> - It actually reads out current touchpad state. It is necessary =
when
>>>>>> we are reading the initial state, and also this read is necessar=
y on
>>>>>> touchpad state changed events, because on some laptops (e.g. Z57=
0)
>>>>>> touchpad LED only changes its state after this read.
>>>>>>
>>>>>
>>>>> On the Yogas I've been testing this the state being read on
>>>>> ideapad_sync_touchpad_state() never changes, so even if I press t=
he
>>>>> touchpad disable/enable hotkey before suspending, I always get
>>>>> KEY_TOUCHPAD_ON.
>>>>
>>>> So if VPCCMD_R_TOUCHPAD always returns the same value and not the
>>>> actual touchpad state, we should not send KEY_TOUCHPAD_ON on these
>>>> devices as it conflicts with KEY_TOUCHPAD_TOGGLE and doesn't refle=
ct
>>>> the real touchpad state. Is there any way to determine in runtime =
if
>>>> VPCCMD_R_TOUCHPAD works correctly on the device? BTW, could you se=
nd
>>>> me a DSDT dump from Yoga where it always shows touchpad on?
>>>>
>>>
>>> I imagine it is expected to return the same value because, from the
>>> hardware perspective, the touchpad is always enabled. I'm not sure =
of
>>> a good way to verify this, maybe disabling/re-enabling the i8042 AU=
X
>>> and checking its value when the module first loads (not sure if thi=
s
>>> is a good idea).
>>
>> Not sure how disabling/enabling AUX port will help us determine if E=
C
>> is capable of disabling touchpad and reporting disabled state.
>>
>
> If you disable the AUX port and read the touchpad state, on the Yoga
> you will still read the "enabled" value (1).
>
>>> The Yoga 900 DSDT can be found here:
>>> https://gist.githubusercontent.com/jprvita/5737de3cbb670e80973b7d4e=
51c38ab6/raw/189220cb746a719026bde2fa3e75ef5cb24e1931/yoga-900-dsdt.dsl
>>
>> Okay, I took a look at this DSDT, and the VPC interface used by
>> ideapad-laptop driver is completely opaque here. On my Z570 there wa=
s
>> XCMD method that was called from VPCW and handled all the commands. =
I
>> was hoping to find this method in Yoga DSDT to examine its code and
>> check if VPCCMD_R_TOUCHPAD actually returns any non-constant value o=
r
>> just reports a constant, but on this device VPCW just writes the
>> command to the register, and maybe EC handles it in its firmware. So
>> there is no XCMD method and the code that handles VPC commands is
>> unavailable.
>>
>> My idea was that it could be possible that on the Yoga
>> VPCCMD_R_TOUCHPAD returns always the same value, but the value is
>> neither 0 nor 1, but some other non-zero constant indicating that
>> touchpad state reporting does not work. Unfortunately DSDT did not
>> help me to check this hypothesis, but we still can check it by looki=
ng
>> at the value of the variable value in ideapad_sync_touchpad_state. I
>> think that most likely we will just get 1 there, but if we get anoth=
er
>> value it will be the nice way to distinguish devices where we need
>> touchpad control from others. (Actually we need to check also if it =
is
>> actually 1 on the devices with working touchpad control, because I
>> don't remember for sure and have no device to test it.)
>>
>
> It is always 1 on the Yoga 900.
>
>>>>>> - Then it disables/enables i8042 AUX port to disable/enable touc=
hpad.
>>>>>> It is also necessary, because some laptops (Z570) do not disable
>>>>>> touchpad in hardware although they are storing touchpad state.
>>>>>>
>>>>>
>>>>> Ok, but this will only work if the touchpad is connected through =
that
>>>>> bus. On the Yoga 900 and Yoga 3 the are connected via I2C, and I =
guess
>>>>> this might be true for other machines as well.
>>>>
>>>> If I remember correctly, some ideapads actually disable the touchp=
ad
>>>> in hardware and some (e.g. Z570) only toggle the LED. For those on=
es
>>>> that have PS/2 touchpad and don't disable it in hardware,
>>>> I8042_CMD_AUX_ENABLE/DISABLE works. I'm not sure if any ideapad ex=
ists
>>>> that has e.g. I2C touchpad and doesn't disable it in hardware, but
>>>> only toggles the LED. If such laptop is a case, i8042 method will =
not
>>>> work. Is there any better and universal way to disable touchpad fr=
om
>>>> the driver?
>>>>
>>>
>>> I don't know if such laptop model exists either, but we can probabl=
y
>>> leave this case for when (if) it shows up.
>>>
>>>>>> - Finally it sends userspace event with new touchpad state. It d=
oes
>>>>>> not send a sequence of KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON as y=
ou
>>>>>> mentioned, but only one of these key codes.
>>>>>>
>>>>>
>>>>> Right, I got confused when I wrote this email by the comments in =
the
>>>>> function implementation, but when I checked with evtest I did see=
 only
>>>>> one event being sent, indeed.
>>>>
>>>> OK, when I read those comments now, they look really confusing,
>>>> espessially "We send KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON" part. S=
orry
>>>> for this confusion, it should mean that we send one of those codes
>>>> depending on the touchpad state, not that we send both of them.
>>>>
>>>>>> The second point is kinda hack. In Linux there are two ways of
>>>>>> reporting touchpad state events to the userspace:
>>>>>>
>>>>>> - KEY_TOUCHPAD_TOGGLE for those laptops that do not disable touc=
hpad
>>>>>> in hardware and thus don't store touchpad state. The userspace s=
hould
>>>>>> listen for those key presses and disable/enable touchpad
>>>>>> programmatically (e.g. TouchpadOff in synaptics X11 driver).
>>>>>>
>>>>>
>>>>> Yes, when the notification for the disable/enable touchpad hotkey=
 goes
>>>>> through ACPI.
>>>>
>>>> Sorry, why is ACPI important in this case?
>>>>
>>>
>>> I mean, if the hardware sends a notification through ACPI that need=
s
>>> to be handled by the kernel, instead of a keypress event on the
>>> keyboard device with a special scancode. But anyway, my comment her=
e
>>> didn't really add anything.
>>>
>>>>>> - KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF for those laptops that fu=
lly
>>>>>> manage touchpad state in hardware and just report its state to t=
he
>>>>>> userspace so that notification can be shown. Userspace should no=
t
>>>>>> disable touchpad programmatically on these events, because it is
>>>>>> managed by hardware and may easily get out of sync if using mult=
iple
>>>>>> user sessions.
>>>>>>
>>>>>
>>>>> Yes, and that is what I tried to explain on my previous comment. =
In
>>>>> this case userspace will usually want to notify the user that the
>>>>> touchpad state has been changed.
>>>>>
>>>>>> Ideapad Z570 matches none of these options. It looks more like t=
he
>>>>>> second one, it stores the touchpad state in hardware, controls t=
he
>>>>>> LED, but it lacks the ability to disable the touchpad in hardwar=
e. So
>>>>>> we need to keep track of the hardware state and disable i8042 AU=
X port
>>>>>> from the driver when necessary.
>>>>>>
>>>>>
>>>>> Isn't the case that what it actually stores under VPCCMD_R_TOUCHP=
AD is
>>>>> only the touchpad LED state?
>>>>
>>>> Yes, Z570 only stores the LED state.
>>>>
>>>>> If so, wouldn't it work if when ACPI
>>>>> notifies the kernel of event 5 (the touchpad disable/enable key h=
as
>>>>> been pressed) we simply sent KEY_TOUCHPAD_TOGGLE to userspace? I'=
m not
>>>>> entirely sure what would be best way to keep the LED in sync with=
 the
>>>>> touchpad state in that case, the only way I can think of if to ex=
pose
>>>>> the LED to userspace so it can update it accordingly.
>>>>
>>>> No, sadly it wouldn't work correctly, because on Z570 we can't cha=
nge
>>>> the LED state programmatically. There is VPCCMD_W_TOUCHPAD, but as=
 far
>>>> as I remember it doesn't work at least on Z570.
>>>>
>>>
>>> So what you are saying is that the only way to update the LED state=
 is
>>> to kill the i8042 AUX port.
>>
>> Not exactly. We can't update the LED state, so the firmware updates
>> it, and we just need to obey it and switch touchpad on/off
>> accordingly.
>>
>>> In this case I can't think of a different
>>> way for this to work on the Z570 and other models that have a touch=
pad
>>> LED. So it seems to me we should keep the current logic but make su=
re
>>> it only runs on machines that actually need it. I'm now wondering i=
f
>>> this actually really needs to be called on resume, tho.
>>
>> Interesting question, it's really worth checking if it is necessary =
on
>> resume, but unfortunately I can't do this test because my Z570 is
>> dead, it does not turn on.
>>
>
> Maybe we could remove that call and see if someone complains? Not a
> very nice policy, tho.

I'd prefer testing it in advance on a potentially affected device.
Things may break for users, but only a few of them would file a bug
report or investigate the problem by themselves and post to the mail
list.

> --
> Jo=C3=A3o Paulo Rechi Vita
> http://about.me/jprvita
