From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Thu, 2 Jun 2016 21:10:14 +0300
Message-ID: <CAKErNvrZRoo_PGKppbka795bZnpaG2YoKs2fgHpU_GRrmJLK-A@mail.gmail.com>
References: <1459544569-29865-1-git-send-email-list@eworm.de>
 <20160505234247.GG2113@f23x64.localdomain> <CA+A7VXVcq3JjJC54kXZkmvrLF1hktX_w+vXcU-vk5WA4nFeNLA@mail.gmail.com>
 <CAKErNvrs4300M+ap+O1R-44z_EE97O=hk74nOGT+MSsVmfL6Ew@mail.gmail.com>
 <CA+A7VXW8qCu-j4QGoDBZUym+sEsXgkzPTVTv7A4UoSDe+D1mig@mail.gmail.com>
 <CAKErNvpVwhL6AXgfeQcx_K0Zu=KpqptYjB9AO6ezpDjbqx=g7w@mail.gmail.com>
 <CA+A7VXUaT+XJPCfGYrJqtB+vr7OYjZgg1m6=oVwpfA3JM++1yw@mail.gmail.com>
 <CAKErNvrr1wNB_6a-DWjbM3LcgbWd-WFvF3gz1y97ikmqE4-Wtw@mail.gmail.com>
 <CA+A7VXVJ6eCXmzFmO4Ek4TxMNKFA+BoKyj0Fm7s0ycn+Ev5cTg@mail.gmail.com>
 <CAKErNvqbr+m5jrXPfWMV8RK6i8=rprHZ_HTuD-Q+k20xSANznQ@mail.gmail.com> <CA+A7VXWbmXH9gkbWuM+-NpSZDZrfDZLgdfE_VB2RNooh85sakA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34776 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161535AbcFBSKq convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2016 14:10:46 -0400
Received: by mail-lf0-f67.google.com with SMTP id 65so5871951lfq.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jun 2016 11:10:45 -0700 (PDT)
In-Reply-To: <CA+A7VXWbmXH9gkbWuM+-NpSZDZrfDZLgdfE_VB2RNooh85sakA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com

2016-06-02 17:38 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.co=
m>:
> On 1 June 2016 at 00:37, Maxim Mikityanskiy <maxtram95@gmail.com> wro=
te:
>> 2016-06-01 1:43 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.=
com>:
>>> On 26 May 2016 at 15:44, Maxim Mikityanskiy <maxtram95@gmail.com> w=
rote:
>>>> 2016-05-25 19:03 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gma=
il.com>:
>>>>> On 25 May 2016 at 02:26, Maxim Mikityanskiy <maxtram95@gmail.com>=
 wrote:
>>>>>> 2016-05-24 23:32 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@g=
mail.com>:
>>>>>>> On 19 May 2016 at 05:17, Maxim Mikityanskiy <maxtram95@gmail.co=
m> wrote:
>>>>>>>> 2016-05-16 19:04 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita=
@gmail.com>:
>>>>>>>>>
>>>>>>>>> Adding Maxim Mikityanskiy and Hans de Goede to CC.
>>>>>>>>>
>>>>>>>>> On 5 May 2016 at 19:42, Darren Hart <dvhart@infradead.org> wr=
ote:
>>>>>>>>> > On Fri, Apr 01, 2016 at 11:02:49PM +0200, Christian Hesse w=
rote:
>>>>>>>>> >> From: Christian Hesse <mail@eworm.de>
>>>>>>>>> >>
>>>>>>>>> >> When Lenovo Yoga 700 is flipped to tablet mode it emmits e=
vent 10. Let's
>>>>>>>>> >> send touchpad key codes so software can disable touchpad.
>>>>>>>>> >>
>>>>>>>>> >> Signed-off-by: Christian Hesse <mail@eworm.de>
>>>>>>>>> >> Signed-off-by: Michael Gisbers <michael@gisbers.de>
>>>>>>>>> >
>>>>>>>>> > Queued, thanks.
>>>>>>>>> >
>>>>>>>>> >> ---
>>>>>>>>> >>  drivers/platform/x86/ideapad-laptop.c | 1 +
>>>>>>>>> >>  1 file changed, 1 insertion(+)
>>>>>>>>> >>
>>>>>>>>> >> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drive=
rs/platform/x86/ideapad-laptop.c
>>>>>>>>> >> index be3bc2f..1d49db1 100644
>>>>>>>>> >> --- a/drivers/platform/x86/ideapad-laptop.c
>>>>>>>>> >> +++ b/drivers/platform/x86/ideapad-laptop.c
>>>>>>>>> >> @@ -809,6 +809,7 @@ static void ideapad_acpi_notify(acpi_h=
andle handle, u32 event, void *data)
>>>>>>>>> >>                       case 6:
>>>>>>>>> >>                               ideapad_input_report(priv, v=
pc_bit);
>>>>>>>>> >>                               break;
>>>>>>>>> >> +                     case 10:
>>>>>>>>> >>                       case 5:
>>>>>>>>> >>                               ideapad_sync_touchpad_state(=
priv);
>>>>>>>>>
>>>>>>>>> I'm not sure this is the right action here: ideapad_sync_touc=
hpad()
>>>>>>>>> sends a sequence of KEY_TOUCHPAD_DISABLE and KEY_TOUCHPAD_ENA=
BLED,
>>>>>>>>> which are interpreted by userspace as "the touchpad has been
>>>>>>>>> {dis,en}abled by the hardware". The way userspace is expected=
 to react
>>>>>>>>> to it is by showing a notification of the fact to the user, b=
ut not
>>>>>>>>> disabling the touchpad. This behavior can be confirmed in the=
 original
>>>>>>>>> commit message that introduced this change (I couldn't find a=
ny actual
>>>>>>>>> documentation on this): "Input: add keycodes for touchpad on/=
off keys"
>>>>>>>>> (0417596f66). I was actually going to propose a patch similar=
 to Hans'
>>>>>>>>> "ideapad-laptop: Disable touchpad interface on Yoga models"
>>>>>>>>> (f79a901331) for the Yoga 900, to avoid an "touchpad ON" OSD
>>>>>>>>> notification being shown to the user when returning for suspe=
nd.
>>>>>>>>>
>>>>>>>>> Also, I've been investigating touchpad-related problems in th=
e Lenovo
>>>>>>>>> Yoga 900 recently, and trying to understand this code. IIUC
>>>>>>>>> ideadpad_sync_touchpad_state() was created as part of "ideapa=
d: add
>>>>>>>>> Lenovo IdeaPad Z570 support (part 2)" (07a4a4fc8) to allow us=
erspace
>>>>>>>>> to syncronize a touchpad-state-indicator LED with the actual =
touchpad
>>>>>>>>> state, although it seems to me it only works if the touchpad =
is always
>>>>>>>>> enabled by the hardware on resume (cc'ing the original patch =
author
>>>>>>>>> here for maybe a confirmation on how this is expected to work=
).
>>>>>>>>
>>>>>>>> This is a short explanation of this function.
>>>>>>>>
>>>>>>>> We call ideapad_sync_touchpad_state when a touchpad state chan=
ged
>>>>>>>> event arrives (touchpad on/off button pressed) or we need to r=
ead  out
>>>>>>>> the initial touchpad state. It is also called on resume becaus=
e
>>>>>>>> possibly the touchpad state may be changed after resume, but I=
 don't
>>>>>>>> know which devices behave like that (and unfortunately I'm una=
ble to
>>>>>>>> test it on my Z570 because now it's dead).
>>>>>>>>
>>>>>>>
>>>>>>> So if I'm following this correctly, on some ideapads (Z570 and =
maybe
>>>>>>> others) there is a ACPI notification when the touchpad on/off h=
otkey
>>>>>>> is pressed, is that correct?
>>>>>>
>>>>>> Yes, exactly.
>>>>>>
>>>>>>> This is not what I see on the Yoga 900 or
>>>>>>> the Yoga 3, but a special scancode (0xbf on the Yoga 900, 0xbe =
on the
>>>>>>> Yoga 3) come through the AT keyboard device. So here I'm using =
hwdb to
>>>>>>> map these to KEY_TOUCHPAD_TOGGLE (pending upstream submission t=
o
>>>>>>> udev).
>>>>>>
>>>>>> If KEY_TOUCHPAD_TOGGLE is sent to the userspace on the Yoga, no
>>>>>> KEY_TOUCHPAD_ON or KEY_TOUCHPAD_OFF should be ever sent. Only on=
e of
>>>>>> these mechanisms should be used for userspace to handle this
>>>>>> correctly.
>>>>>>
>>>>>
>>>>> Agreed. That's why I was planning to propose a patch very similar=
 to
>>>>> Hans' (f79a901331 "ideapad-laptop: Disable touchpad interface on =
Yoga
>>>>> models"), but it was later reverted by 3b264d279e. I wonder if th=
ere
>>>>> is a more specific way to tell one model from the other.
>>>>>
>>>>>>>> ideadpad_sync_touchpad_state serves several purposes:
>>>>>>>>
>>>>>>>> - It actually reads out current touchpad state. It is necessar=
y when
>>>>>>>> we are reading the initial state, and also this read is necess=
ary on
>>>>>>>> touchpad state changed events, because on some laptops (e.g. Z=
570)
>>>>>>>> touchpad LED only changes its state after this read.
>>>>>>>>
>>>>>>>
>>>>>>> On the Yogas I've been testing this the state being read on
>>>>>>> ideapad_sync_touchpad_state() never changes, so even if I press=
 the
>>>>>>> touchpad disable/enable hotkey before suspending, I always get
>>>>>>> KEY_TOUCHPAD_ON.
>>>>>>
>>>>>> So if VPCCMD_R_TOUCHPAD always returns the same value and not th=
e
>>>>>> actual touchpad state, we should not send KEY_TOUCHPAD_ON on the=
se
>>>>>> devices as it conflicts with KEY_TOUCHPAD_TOGGLE and doesn't ref=
lect
>>>>>> the real touchpad state. Is there any way to determine in runtim=
e if
>>>>>> VPCCMD_R_TOUCHPAD works correctly on the device? BTW, could you =
send
>>>>>> me a DSDT dump from Yoga where it always shows touchpad on?
>>>>>>
>>>>>
>>>>> I imagine it is expected to return the same value because, from t=
he
>>>>> hardware perspective, the touchpad is always enabled. I'm not sur=
e of
>>>>> a good way to verify this, maybe disabling/re-enabling the i8042 =
AUX
>>>>> and checking its value when the module first loads (not sure if t=
his
>>>>> is a good idea).
>>>>
>>>> Not sure how disabling/enabling AUX port will help us determine if=
 EC
>>>> is capable of disabling touchpad and reporting disabled state.
>>>>
>>>
>>> If you disable the AUX port and read the touchpad state, on the Yog=
a
>>> you will still read the "enabled" value (1).
>>>
>>>>> The Yoga 900 DSDT can be found here:
>>>>> https://gist.githubusercontent.com/jprvita/5737de3cbb670e80973b7d=
4e51c38ab6/raw/189220cb746a719026bde2fa3e75ef5cb24e1931/yoga-900-dsdt.d=
sl
>>>>
>>>> Okay, I took a look at this DSDT, and the VPC interface used by
>>>> ideapad-laptop driver is completely opaque here. On my Z570 there =
was
>>>> XCMD method that was called from VPCW and handled all the commands=
=2E I
>>>> was hoping to find this method in Yoga DSDT to examine its code an=
d
>>>> check if VPCCMD_R_TOUCHPAD actually returns any non-constant value=
 or
>>>> just reports a constant, but on this device VPCW just writes the
>>>> command to the register, and maybe EC handles it in its firmware. =
So
>>>> there is no XCMD method and the code that handles VPC commands is
>>>> unavailable.
>>>>
>>>> My idea was that it could be possible that on the Yoga
>>>> VPCCMD_R_TOUCHPAD returns always the same value, but the value is
>>>> neither 0 nor 1, but some other non-zero constant indicating that
>>>> touchpad state reporting does not work. Unfortunately DSDT did not
>>>> help me to check this hypothesis, but we still can check it by loo=
king
>>>> at the value of the variable value in ideapad_sync_touchpad_state.=
 I
>>>> think that most likely we will just get 1 there, but if we get ano=
ther
>>>> value it will be the nice way to distinguish devices where we need
>>>> touchpad control from others. (Actually we need to check also if i=
t is
>>>> actually 1 on the devices with working touchpad control, because I
>>>> don't remember for sure and have no device to test it.)
>>>>
>>>
>>> It is always 1 on the Yoga 900.
>>>
>>>>>>>> - Then it disables/enables i8042 AUX port to disable/enable to=
uchpad.
>>>>>>>> It is also necessary, because some laptops (Z570) do not disab=
le
>>>>>>>> touchpad in hardware although they are storing touchpad state.
>>>>>>>>
>>>>>>>
>>>>>>> Ok, but this will only work if the touchpad is connected throug=
h that
>>>>>>> bus. On the Yoga 900 and Yoga 3 the are connected via I2C, and =
I guess
>>>>>>> this might be true for other machines as well.
>>>>>>
>>>>>> If I remember correctly, some ideapads actually disable the touc=
hpad
>>>>>> in hardware and some (e.g. Z570) only toggle the LED. For those =
ones
>>>>>> that have PS/2 touchpad and don't disable it in hardware,
>>>>>> I8042_CMD_AUX_ENABLE/DISABLE works. I'm not sure if any ideapad =
exists
>>>>>> that has e.g. I2C touchpad and doesn't disable it in hardware, b=
ut
>>>>>> only toggles the LED. If such laptop is a case, i8042 method wil=
l not
>>>>>> work. Is there any better and universal way to disable touchpad =
from
>>>>>> the driver?
>>>>>>
>>>>>
>>>>> I don't know if such laptop model exists either, but we can proba=
bly
>>>>> leave this case for when (if) it shows up.
>>>>>
>>>>>>>> - Finally it sends userspace event with new touchpad state. It=
 does
>>>>>>>> not send a sequence of KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON as=
 you
>>>>>>>> mentioned, but only one of these key codes.
>>>>>>>>
>>>>>>>
>>>>>>> Right, I got confused when I wrote this email by the comments i=
n the
>>>>>>> function implementation, but when I checked with evtest I did s=
ee only
>>>>>>> one event being sent, indeed.
>>>>>>
>>>>>> OK, when I read those comments now, they look really confusing,
>>>>>> espessially "We send KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON" part.=
 Sorry
>>>>>> for this confusion, it should mean that we send one of those cod=
es
>>>>>> depending on the touchpad state, not that we send both of them.
>>>>>>
>>>>>>>> The second point is kinda hack. In Linux there are two ways of
>>>>>>>> reporting touchpad state events to the userspace:
>>>>>>>>
>>>>>>>> - KEY_TOUCHPAD_TOGGLE for those laptops that do not disable to=
uchpad
>>>>>>>> in hardware and thus don't store touchpad state. The userspace=
 should
>>>>>>>> listen for those key presses and disable/enable touchpad
>>>>>>>> programmatically (e.g. TouchpadOff in synaptics X11 driver).
>>>>>>>>
>>>>>>>
>>>>>>> Yes, when the notification for the disable/enable touchpad hotk=
ey goes
>>>>>>> through ACPI.
>>>>>>
>>>>>> Sorry, why is ACPI important in this case?
>>>>>>
>>>>>
>>>>> I mean, if the hardware sends a notification through ACPI that ne=
eds
>>>>> to be handled by the kernel, instead of a keypress event on the
>>>>> keyboard device with a special scancode. But anyway, my comment h=
ere
>>>>> didn't really add anything.
>>>>>
>>>>>>>> - KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF for those laptops that =
fully
>>>>>>>> manage touchpad state in hardware and just report its state to=
 the
>>>>>>>> userspace so that notification can be shown. Userspace should =
not
>>>>>>>> disable touchpad programmatically on these events, because it =
is
>>>>>>>> managed by hardware and may easily get out of sync if using mu=
ltiple
>>>>>>>> user sessions.
>>>>>>>>
>>>>>>>
>>>>>>> Yes, and that is what I tried to explain on my previous comment=
=2E In
>>>>>>> this case userspace will usually want to notify the user that t=
he
>>>>>>> touchpad state has been changed.
>>>>>>>
>>>>>>>> Ideapad Z570 matches none of these options. It looks more like=
 the
>>>>>>>> second one, it stores the touchpad state in hardware, controls=
 the
>>>>>>>> LED, but it lacks the ability to disable the touchpad in hardw=
are. So
>>>>>>>> we need to keep track of the hardware state and disable i8042 =
AUX port
>>>>>>>> from the driver when necessary.
>>>>>>>>
>>>>>>>
>>>>>>> Isn't the case that what it actually stores under VPCCMD_R_TOUC=
HPAD is
>>>>>>> only the touchpad LED state?
>>>>>>
>>>>>> Yes, Z570 only stores the LED state.
>>>>>>
>>>>>>> If so, wouldn't it work if when ACPI
>>>>>>> notifies the kernel of event 5 (the touchpad disable/enable key=
 has
>>>>>>> been pressed) we simply sent KEY_TOUCHPAD_TOGGLE to userspace? =
I'm not
>>>>>>> entirely sure what would be best way to keep the LED in sync wi=
th the
>>>>>>> touchpad state in that case, the only way I can think of if to =
expose
>>>>>>> the LED to userspace so it can update it accordingly.
>>>>>>
>>>>>> No, sadly it wouldn't work correctly, because on Z570 we can't c=
hange
>>>>>> the LED state programmatically. There is VPCCMD_W_TOUCHPAD, but =
as far
>>>>>> as I remember it doesn't work at least on Z570.
>>>>>>
>>>>>
>>>>> So what you are saying is that the only way to update the LED sta=
te is
>>>>> to kill the i8042 AUX port.
>>>>
>>>> Not exactly. We can't update the LED state, so the firmware update=
s
>>>> it, and we just need to obey it and switch touchpad on/off
>>>> accordingly.
>>>>
>>>>> In this case I can't think of a different
>>>>> way for this to work on the Z570 and other models that have a tou=
chpad
>>>>> LED. So it seems to me we should keep the current logic but make =
sure
>>>>> it only runs on machines that actually need it. I'm now wondering=
 if
>>>>> this actually really needs to be called on resume, tho.
>>>>
>>>> Interesting question, it's really worth checking if it is necessar=
y on
>>>> resume, but unfortunately I can't do this test because my Z570 is
>>>> dead, it does not turn on.
>>>>
>>>
>>> Maybe we could remove that call and see if someone complains? Not a
>>> very nice policy, tho.
>>
>> I'd prefer testing it in advance on a potentially affected device.
>> Things may break for users, but only a few of them would file a bug
>> report or investigate the problem by themselves and post to the mail
>> list.
>>
>
> Yes, I would prefer that too, but I don't have access to any atm (but
> I'm seeking one, as I mentioned in a separate message).

Another option is to repair my broken Z570, but it would take some
time. Also it was already repaired once but broke again with the
similar symptoms so I don't think it would live for long after the
repair.

> Going back to
> the matter of whether or not the Z570 & co need to call
> ideapad_sync_touchpad_state() on resume, the comments in the code may
> indicate you need to read VPCCMD_W_TOUCHPAD

We read from VPCCMD_R_TOUCHPAD, not _W_. W is not used in the driver
and has no effect on Z570.

> in order to have the LED
> be updated with the current touchpad status. So if the LED goes OFF
> during suspend (which it probably does), you may need to read the
> value in order to sync the LED state. Do you recall if that was the
> behavior? In that case I don't think we need to send a notification t=
o
> userspace, so we may split the KEY_TOUCHPAD_{ON,OFF} notification out
> of ideapad_sync_touchpad_state() and not send it on resume or when th=
e
> driver is loaded. What do you think?

OK, I can't recall what was the behavior on resume, but I have re-read
the commit message of
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D07a4a4fc83dd95bc7eb842cf9510ddcb45691a88
and it says "and corrects touchpad behavior on resume from suspend".
So there definitely were some problems without
ideapad_sync_touchpad_state call from ideapad_acpi_resume. I don't
remember exactly, but maybe it could be touchpad enabling (and LED
turning off) after every resume, i.e. not preserving touchpad state
across suspends and resumes.

What about notifications, I don't know for sure who needs to filter
identical touchpad events in a row, either the driver or the
userspace. Maybe it's worth looking at other drivers' code to see if
they try to keep track of touchpad state and don't send several
identical events in a row, and also to look at GNOME and KDE code to
see whether they just display notifications every time the keycode
arrives or they try to keep track of the touchpad state.

=46inally, I don't remember if I mentioned it already, but the usage of
i8042_command is wrong here and should be fixed. It should be wrapped
in i8042_lock_chip/i8042_unlock_chip, that's the thing that should be
fixed in the ideapad-laptop and some other platform drivers. It is
mentioned here:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/input/serio/i8042.c?id=3Drefs/tags/v4.7-rc1#n111

> --
> Jo=C3=A3o Paulo Rechi Vita
> http://about.me/jprvita
