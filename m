From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Wed, 1 Jul 2015 00:09:41 +0800
Message-ID: <CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
	<20150626145621.GU2890@pali>
	<CAJ=jqub8adCQBWPsmg+Wov0G4WqZbhsjxttWq6CA8Uddqmj4Cw@mail.gmail.com>
	<20150629122953.GF16230@pali>
	<CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
	<20150630085814.GE27720@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f175.google.com ([209.85.220.175]:35171 "EHLO
	mail-qk0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753032AbbF3QJm convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Jun 2015 12:09:42 -0400
Received: by qkbp125 with SMTP id p125so9764028qkb.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2015 09:09:41 -0700 (PDT)
In-Reply-To: <20150630085814.GE27720@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

Thanks for the information, and I really appreciate it.

I took a quick look at my HP laptop and it has a led as below:

/sys/class/leds/hp::hddprotect$ cat trigger
[none] AC-online BAT0-charging-or-full BAT0-charging BAT0-full
BAT0-charging-blink-full-solid usb-gadget usb-host cpu0 cpu1 cpu2 cpu3
cpu4 cpu5 cpu6 cpu7 mmc0 rfkill1 rfkill2 rfkill8

and I learned that LED can be triggered by rfkill.  I also checked
asus-wmi and its default_trigger is its rfkill name "asus-wlan".

ATK4001 is an independent ACPI device, and Method(HSWC) is its method
to control LED (actually it has other functions but only LED is needed
so far). asus-rbtn does not have anything to be triggered because it
only translate an ACPI event to KEY_RFKILL unless a rfkill is created,
but this wouldn't make sense that I use both rfkill and led when I can
only use one.

The other concern is that I'd like the LED to be ORed by both WLAN and
BT in long term.  default_trigger seems to be linked to one trigger.

On Tue, Jun 30, 2015 at 4:58 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> Hi!
>
> Ideally, try to touch led trigger configuration from userspace yourse=
lf,
> so you will see how it works. Take some machine which has some
> configurable led exported in /sys/class/leds/ and try to set some
> trigger via "trigger" entry.
>
> I think that default trigger for led device (from kernel) can be set =
via
> "default_trigger" property in struct led_classdev. See file linux/led=
s.h
>
> On Tuesday 30 June 2015 16:38:18 Alex Hung wrote:
>> Pali,
>>
>> Thanks for comments, but will you be able to provide more details so
>> it is more clear how this works?
>>
>> On Mon, Jun 29, 2015 at 8:29 PM, Pali Roh=C3=A1r <pali.rohar@gmail.c=
om> wrote:
>> > On Friday 26 June 2015 23:24:10 Alex Hung wrote:
>> >> On Fri, Jun 26, 2015 at 10:56 PM, Pali Roh=C3=A1r <pali.rohar@gma=
il.com> wrote:
>> >> > Hi!
>> >> >
>> >> > On Wednesday 24 June 2015 10:57:51 Alex Hung wrote:
>> >> >> ASUS introduced a new approach to handle wireless hotkey
>> >> >> since Windows 8.  When the hotkey is pressed, BIOS generates
>> >> >> a notification 0x88 to a new ACPI device, ATK4001.  This
>> >> >> new driver not only translates the notification to KEY_RFKILL
>> >> >> but also toggles its LED accordingly.
>> >> >>
>> >> >> Signed-off-by: Alex Hung <alex.hung@canonical.com>
>> >> >
>> >> > ...
>> >> >
>> >> >> +static int asus_radio_led_set(bool blocked)
>> >> >> +{
>> >> >> +     acpi_status status;
>> >> >> +     union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
>> >> >> +     struct acpi_object_list args =3D { 1, &arg0 };
>> >> >> +     unsigned long long output;
>> >> >> +
>> >> >> +     arg0.integer.value =3D blocked;
>> >> >> +     status =3D acpi_evaluate_integer(asus_rbtn_device->handl=
e, "HSWC",
>> >> >> +                                    &args, &output);
>> >> >
>> >> > What is this ACPI call doing? Just set LED control? Or somethin=
g more?
>> >> >
>> >> >> +     if (!ACPI_SUCCESS(status) || output =3D=3D 0) {
>> >> >> +             pr_err("fail to change wireless LED.\n");
>> >> >> +             return -EINVAL;
>> >> >> +     }
>> >> >> +
>> >> >> +     return 0;
>> >> >> +}
>> >> >> +
>> >> >> +static int asus_rfkill_set(void *data, bool blocked)
>> >> >> +{
>> >> >> +     radio_led_state =3D blocked ? 0 : 1;
>> >> >> +
>> >> >> +     return asus_radio_led_set(radio_led_state);
>> >> >> +}
>> >> >
>> >> > In my opinion this is not good idea that "rfkill block" call fr=
om
>> >> > userspace just change LED on/off state and nothing more...
>> >> >
>> >> > If above ACPI call just change LED, then should not be this in =
LED
>> >> > subsystem instead rfkill one? Or why do you prefer to use rfkil=
l
>> >> > interface instead led?
>> >>
>> >> It indeed controls LED only at the moment.  My intention was to h=
ave
>> >> have everything work without the need to modify any userspace
>> >> applications.  Current it is 1) aus-rbtn issues KEY_RFKILL 2) an
>> >> userspace application changes rfkill states, and 3) both radio an=
d LED
>> >> work.  It will also work when a user enable/disable wireless devi=
ces
>> >> on a user application which uses rfkill interface.
>> >>
>> >> Come to think about it now, I may have to handle LED with WLAN an=
d BT
>> >> but I will have to find a system with both devices later.
>> >>
>> >> I am not too familiar with userspace applications v.s. LED.  Is i=
t
>> >> possible to do the same (i.e. without touching userspace)? I thin=
k
>> >> rfkill is good interface to handle whatever needs doing when chan=
ging
>> >> wireless states, such as LED controls.  However, if other approac=
h can
>> >> meet the need I am happy to investigate.
>> >>
>> >
>> > There are triggers for led which automatically enable/disable led.=
 I
>> > think that configuring default wifi/bluetooth trigger for that new=
 led
>> > could work...
>> >
>> > --
>> > Pali Roh=C3=A1r
>> > pali.rohar@gmail.com
>>
>>
>>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Cheers,
Alex Hung
