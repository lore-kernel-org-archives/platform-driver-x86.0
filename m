From: Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH 1/1] ideapad-laptop: Handle Yoga in tablet mode
Date: Thu, 26 May 2016 22:44:47 +0300
Message-ID: <CAKErNvrr1wNB_6a-DWjbM3LcgbWd-WFvF3gz1y97ikmqE4-Wtw@mail.gmail.com>
References: <1459544569-29865-1-git-send-email-list@eworm.de>
 <20160505234247.GG2113@f23x64.localdomain> <CA+A7VXVcq3JjJC54kXZkmvrLF1hktX_w+vXcU-vk5WA4nFeNLA@mail.gmail.com>
 <CAKErNvrs4300M+ap+O1R-44z_EE97O=hk74nOGT+MSsVmfL6Ew@mail.gmail.com>
 <CA+A7VXW8qCu-j4QGoDBZUym+sEsXgkzPTVTv7A4UoSDe+D1mig@mail.gmail.com>
 <CAKErNvpVwhL6AXgfeQcx_K0Zu=KpqptYjB9AO6ezpDjbqx=g7w@mail.gmail.com> <CA+A7VXUaT+XJPCfGYrJqtB+vr7OYjZgg1m6=oVwpfA3JM++1yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:32847 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932097AbcEZTpT convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 May 2016 15:45:19 -0400
Received: by mail-lb0-f171.google.com with SMTP id k7so27222199lbm.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 May 2016 12:45:18 -0700 (PDT)
In-Reply-To: <CA+A7VXUaT+XJPCfGYrJqtB+vr7OYjZgg1m6=oVwpfA3JM++1yw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com

2016-05-25 19:03 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail.co=
m>:
> On 25 May 2016 at 02:26, Maxim Mikityanskiy <maxtram95@gmail.com> wro=
te:
>> 2016-05-24 23:32 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gmail=
=2Ecom>:
>>> On 19 May 2016 at 05:17, Maxim Mikityanskiy <maxtram95@gmail.com> w=
rote:
>>>> 2016-05-16 19:04 GMT+03:00 Jo=C3=A3o Paulo Rechi Vita <jprvita@gma=
il.com>:
>>>>>
>>>>> Adding Maxim Mikityanskiy and Hans de Goede to CC.
>>>>>
>>>>> On 5 May 2016 at 19:42, Darren Hart <dvhart@infradead.org> wrote:
>>>>> > On Fri, Apr 01, 2016 at 11:02:49PM +0200, Christian Hesse wrote=
:
>>>>> >> From: Christian Hesse <mail@eworm.de>
>>>>> >>
>>>>> >> When Lenovo Yoga 700 is flipped to tablet mode it emmits event=
 10. Let's
>>>>> >> send touchpad key codes so software can disable touchpad.
>>>>> >>
>>>>> >> Signed-off-by: Christian Hesse <mail@eworm.de>
>>>>> >> Signed-off-by: Michael Gisbers <michael@gisbers.de>
>>>>> >
>>>>> > Queued, thanks.
>>>>> >
>>>>> >> ---
>>>>> >>  drivers/platform/x86/ideapad-laptop.c | 1 +
>>>>> >>  1 file changed, 1 insertion(+)
>>>>> >>
>>>>> >> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/p=
latform/x86/ideapad-laptop.c
>>>>> >> index be3bc2f..1d49db1 100644
>>>>> >> --- a/drivers/platform/x86/ideapad-laptop.c
>>>>> >> +++ b/drivers/platform/x86/ideapad-laptop.c
>>>>> >> @@ -809,6 +809,7 @@ static void ideapad_acpi_notify(acpi_handl=
e handle, u32 event, void *data)
>>>>> >>                       case 6:
>>>>> >>                               ideapad_input_report(priv, vpc_b=
it);
>>>>> >>                               break;
>>>>> >> +                     case 10:
>>>>> >>                       case 5:
>>>>> >>                               ideapad_sync_touchpad_state(priv=
);
>>>>>
>>>>> I'm not sure this is the right action here: ideapad_sync_touchpad=
()
>>>>> sends a sequence of KEY_TOUCHPAD_DISABLE and KEY_TOUCHPAD_ENABLED=
,
>>>>> which are interpreted by userspace as "the touchpad has been
>>>>> {dis,en}abled by the hardware". The way userspace is expected to =
react
>>>>> to it is by showing a notification of the fact to the user, but n=
ot
>>>>> disabling the touchpad. This behavior can be confirmed in the ori=
ginal
>>>>> commit message that introduced this change (I couldn't find any a=
ctual
>>>>> documentation on this): "Input: add keycodes for touchpad on/off =
keys"
>>>>> (0417596f66). I was actually going to propose a patch similar to =
Hans'
>>>>> "ideapad-laptop: Disable touchpad interface on Yoga models"
>>>>> (f79a901331) for the Yoga 900, to avoid an "touchpad ON" OSD
>>>>> notification being shown to the user when returning for suspend.
>>>>>
>>>>> Also, I've been investigating touchpad-related problems in the Le=
novo
>>>>> Yoga 900 recently, and trying to understand this code. IIUC
>>>>> ideadpad_sync_touchpad_state() was created as part of "ideapad: a=
dd
>>>>> Lenovo IdeaPad Z570 support (part 2)" (07a4a4fc8) to allow usersp=
ace
>>>>> to syncronize a touchpad-state-indicator LED with the actual touc=
hpad
>>>>> state, although it seems to me it only works if the touchpad is a=
lways
>>>>> enabled by the hardware on resume (cc'ing the original patch auth=
or
>>>>> here for maybe a confirmation on how this is expected to work).
>>>>
>>>> This is a short explanation of this function.
>>>>
>>>> We call ideapad_sync_touchpad_state when a touchpad state changed
>>>> event arrives (touchpad on/off button pressed) or we need to read =
 out
>>>> the initial touchpad state. It is also called on resume because
>>>> possibly the touchpad state may be changed after resume, but I don=
't
>>>> know which devices behave like that (and unfortunately I'm unable =
to
>>>> test it on my Z570 because now it's dead).
>>>>
>>>
>>> So if I'm following this correctly, on some ideapads (Z570 and mayb=
e
>>> others) there is a ACPI notification when the touchpad on/off hotke=
y
>>> is pressed, is that correct?
>>
>> Yes, exactly.
>>
>>> This is not what I see on the Yoga 900 or
>>> the Yoga 3, but a special scancode (0xbf on the Yoga 900, 0xbe on t=
he
>>> Yoga 3) come through the AT keyboard device. So here I'm using hwdb=
 to
>>> map these to KEY_TOUCHPAD_TOGGLE (pending upstream submission to
>>> udev).
>>
>> If KEY_TOUCHPAD_TOGGLE is sent to the userspace on the Yoga, no
>> KEY_TOUCHPAD_ON or KEY_TOUCHPAD_OFF should be ever sent. Only one of
>> these mechanisms should be used for userspace to handle this
>> correctly.
>>
>
> Agreed. That's why I was planning to propose a patch very similar to
> Hans' (f79a901331 "ideapad-laptop: Disable touchpad interface on Yoga
> models"), but it was later reverted by 3b264d279e. I wonder if there
> is a more specific way to tell one model from the other.
>
>>>> ideadpad_sync_touchpad_state serves several purposes:
>>>>
>>>> - It actually reads out current touchpad state. It is necessary wh=
en
>>>> we are reading the initial state, and also this read is necessary =
on
>>>> touchpad state changed events, because on some laptops (e.g. Z570)
>>>> touchpad LED only changes its state after this read.
>>>>
>>>
>>> On the Yogas I've been testing this the state being read on
>>> ideapad_sync_touchpad_state() never changes, so even if I press the
>>> touchpad disable/enable hotkey before suspending, I always get
>>> KEY_TOUCHPAD_ON.
>>
>> So if VPCCMD_R_TOUCHPAD always returns the same value and not the
>> actual touchpad state, we should not send KEY_TOUCHPAD_ON on these
>> devices as it conflicts with KEY_TOUCHPAD_TOGGLE and doesn't reflect
>> the real touchpad state. Is there any way to determine in runtime if
>> VPCCMD_R_TOUCHPAD works correctly on the device? BTW, could you send
>> me a DSDT dump from Yoga where it always shows touchpad on?
>>
>
> I imagine it is expected to return the same value because, from the
> hardware perspective, the touchpad is always enabled. I'm not sure of
> a good way to verify this, maybe disabling/re-enabling the i8042 AUX
> and checking its value when the module first loads (not sure if this
> is a good idea).

Not sure how disabling/enabling AUX port will help us determine if EC
is capable of disabling touchpad and reporting disabled state.

> The Yoga 900 DSDT can be found here:
> https://gist.githubusercontent.com/jprvita/5737de3cbb670e80973b7d4e51=
c38ab6/raw/189220cb746a719026bde2fa3e75ef5cb24e1931/yoga-900-dsdt.dsl

Okay, I took a look at this DSDT, and the VPC interface used by
ideapad-laptop driver is completely opaque here. On my Z570 there was
XCMD method that was called from VPCW and handled all the commands. I
was hoping to find this method in Yoga DSDT to examine its code and
check if VPCCMD_R_TOUCHPAD actually returns any non-constant value or
just reports a constant, but on this device VPCW just writes the
command to the register, and maybe EC handles it in its firmware. So
there is no XCMD method and the code that handles VPC commands is
unavailable.

My idea was that it could be possible that on the Yoga
VPCCMD_R_TOUCHPAD returns always the same value, but the value is
neither 0 nor 1, but some other non-zero constant indicating that
touchpad state reporting does not work. Unfortunately DSDT did not
help me to check this hypothesis, but we still can check it by looking
at the value of the variable value in ideapad_sync_touchpad_state. I
think that most likely we will just get 1 there, but if we get another
value it will be the nice way to distinguish devices where we need
touchpad control from others. (Actually we need to check also if it is
actually 1 on the devices with working touchpad control, because I
don't remember for sure and have no device to test it.)

>>>> - Then it disables/enables i8042 AUX port to disable/enable touchp=
ad.
>>>> It is also necessary, because some laptops (Z570) do not disable
>>>> touchpad in hardware although they are storing touchpad state.
>>>>
>>>
>>> Ok, but this will only work if the touchpad is connected through th=
at
>>> bus. On the Yoga 900 and Yoga 3 the are connected via I2C, and I gu=
ess
>>> this might be true for other machines as well.
>>
>> If I remember correctly, some ideapads actually disable the touchpad
>> in hardware and some (e.g. Z570) only toggle the LED. For those ones
>> that have PS/2 touchpad and don't disable it in hardware,
>> I8042_CMD_AUX_ENABLE/DISABLE works. I'm not sure if any ideapad exis=
ts
>> that has e.g. I2C touchpad and doesn't disable it in hardware, but
>> only toggles the LED. If such laptop is a case, i8042 method will no=
t
>> work. Is there any better and universal way to disable touchpad from
>> the driver?
>>
>
> I don't know if such laptop model exists either, but we can probably
> leave this case for when (if) it shows up.
>
>>>> - Finally it sends userspace event with new touchpad state. It doe=
s
>>>> not send a sequence of KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON as you
>>>> mentioned, but only one of these key codes.
>>>>
>>>
>>> Right, I got confused when I wrote this email by the comments in th=
e
>>> function implementation, but when I checked with evtest I did see o=
nly
>>> one event being sent, indeed.
>>
>> OK, when I read those comments now, they look really confusing,
>> espessially "We send KEY_TOUCHPAD_OFF and KEY_TOUCHPAD_ON" part. Sor=
ry
>> for this confusion, it should mean that we send one of those codes
>> depending on the touchpad state, not that we send both of them.
>>
>>>> The second point is kinda hack. In Linux there are two ways of
>>>> reporting touchpad state events to the userspace:
>>>>
>>>> - KEY_TOUCHPAD_TOGGLE for those laptops that do not disable touchp=
ad
>>>> in hardware and thus don't store touchpad state. The userspace sho=
uld
>>>> listen for those key presses and disable/enable touchpad
>>>> programmatically (e.g. TouchpadOff in synaptics X11 driver).
>>>>
>>>
>>> Yes, when the notification for the disable/enable touchpad hotkey g=
oes
>>> through ACPI.
>>
>> Sorry, why is ACPI important in this case?
>>
>
> I mean, if the hardware sends a notification through ACPI that needs
> to be handled by the kernel, instead of a keypress event on the
> keyboard device with a special scancode. But anyway, my comment here
> didn't really add anything.
>
>>>> - KEY_TOUCHPAD_ON and KEY_TOUCHPAD_OFF for those laptops that full=
y
>>>> manage touchpad state in hardware and just report its state to the
>>>> userspace so that notification can be shown. Userspace should not
>>>> disable touchpad programmatically on these events, because it is
>>>> managed by hardware and may easily get out of sync if using multip=
le
>>>> user sessions.
>>>>
>>>
>>> Yes, and that is what I tried to explain on my previous comment. In
>>> this case userspace will usually want to notify the user that the
>>> touchpad state has been changed.
>>>
>>>> Ideapad Z570 matches none of these options. It looks more like the
>>>> second one, it stores the touchpad state in hardware, controls the
>>>> LED, but it lacks the ability to disable the touchpad in hardware.=
 So
>>>> we need to keep track of the hardware state and disable i8042 AUX =
port
>>>> from the driver when necessary.
>>>>
>>>
>>> Isn't the case that what it actually stores under VPCCMD_R_TOUCHPAD=
 is
>>> only the touchpad LED state?
>>
>> Yes, Z570 only stores the LED state.
>>
>>> If so, wouldn't it work if when ACPI
>>> notifies the kernel of event 5 (the touchpad disable/enable key has
>>> been pressed) we simply sent KEY_TOUCHPAD_TOGGLE to userspace? I'm =
not
>>> entirely sure what would be best way to keep the LED in sync with t=
he
>>> touchpad state in that case, the only way I can think of if to expo=
se
>>> the LED to userspace so it can update it accordingly.
>>
>> No, sadly it wouldn't work correctly, because on Z570 we can't chang=
e
>> the LED state programmatically. There is VPCCMD_W_TOUCHPAD, but as f=
ar
>> as I remember it doesn't work at least on Z570.
>>
>
> So what you are saying is that the only way to update the LED state i=
s
> to kill the i8042 AUX port.

Not exactly. We can't update the LED state, so the firmware updates
it, and we just need to obey it and switch touchpad on/off
accordingly.

> In this case I can't think of a different
> way for this to work on the Z570 and other models that have a touchpa=
d
> LED. So it seems to me we should keep the current logic but make sure
> it only runs on machines that actually need it. I'm now wondering if
> this actually really needs to be called on resume, tho.

Interesting question, it's really worth checking if it is necessary on
resume, but unfortunately I can't do this test because my Z570 is
dead, it does not turn on.

> Because if we
> remove only that call, it will never be called on machines where ther=
e
> is no event 5 notification (well, except on startup, but that is not =
a
> problem in practice since there will probably be no userspace handler
> active yet to notify anything to the user).
>
>>>> So if on event 10 the touchpad state may be changed, we need to ca=
ll
>>>> ideadpad_sync_touchpad_state, otherwise I don't see why it is
>>>> necessary.
>>>>
>>>
>>> The commit message on the original commit on this thread says "Let'=
s
>>> send touchpad key codes so software can disable touchpad.", but as =
we
>>> just discussed userspace is not supposed to disable the touchpad on
>>> KEY_TOUCHPAD_DISABLE, so I guess it falls under the same category a=
s
>>> the IdeaPad Z570: the touchpad is connected via i8042 and it has a
>>> variable in ACPI to store the touchpad LED state.
>>
>> Yes, sure, those key codes sent from ideapad_sync_touchpad_state wil=
l
>> not be considered in userspace as a command to disable touchpad in
>> software.
>>
>
> Christian, can you detail a bit more what do you see on the Yoga 700
> opening the lid all the way into tablet mode, and when pressing the
> disable/enable hotkey? On the Yoga 900 I see an unhandled ACPI
> notification when opening the lid all the way (and when flipping it
> back to normal "laptop" position), but with value 1 instead of 10. Bu=
t
> I also see the same scancode sent by the touchpad disable/enable
> hotkey, so at least in my case nothing specific about the touchpad
> should be sent to userspace. Is there any generic "tablet mode" event
> (I see something in the surface driver, but it seems specific for tha=
t
> laptop)? I'm also interested in having this working smoothly in as
> much convertible models as possible.
>
> Regards,
>
> --
> Jo=C3=A3o Paulo Rechi Vita
> http://about.me/jprvita
