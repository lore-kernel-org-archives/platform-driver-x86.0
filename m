From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Tue, 30 Jun 2015 16:38:18 +0800
Message-ID: <CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
	<20150626145621.GU2890@pali>
	<CAJ=jqub8adCQBWPsmg+Wov0G4WqZbhsjxttWq6CA8Uddqmj4Cw@mail.gmail.com>
	<20150629122953.GF16230@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:33336 "EHLO
	mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203AbbF3IiU convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Jun 2015 04:38:20 -0400
Received: by qkhu186 with SMTP id u186so1493997qkh.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2015 01:38:18 -0700 (PDT)
In-Reply-To: <20150629122953.GF16230@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

Pali,

Thanks for comments, but will you be able to provide more details so
it is more clear how this works?

On Mon, Jun 29, 2015 at 8:29 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> On Friday 26 June 2015 23:24:10 Alex Hung wrote:
>> On Fri, Jun 26, 2015 at 10:56 PM, Pali Roh=C3=A1r <pali.rohar@gmail.=
com> wrote:
>> > Hi!
>> >
>> > On Wednesday 24 June 2015 10:57:51 Alex Hung wrote:
>> >> ASUS introduced a new approach to handle wireless hotkey
>> >> since Windows 8.  When the hotkey is pressed, BIOS generates
>> >> a notification 0x88 to a new ACPI device, ATK4001.  This
>> >> new driver not only translates the notification to KEY_RFKILL
>> >> but also toggles its LED accordingly.
>> >>
>> >> Signed-off-by: Alex Hung <alex.hung@canonical.com>
>> >
>> > ...
>> >
>> >> +static int asus_radio_led_set(bool blocked)
>> >> +{
>> >> +     acpi_status status;
>> >> +     union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
>> >> +     struct acpi_object_list args =3D { 1, &arg0 };
>> >> +     unsigned long long output;
>> >> +
>> >> +     arg0.integer.value =3D blocked;
>> >> +     status =3D acpi_evaluate_integer(asus_rbtn_device->handle, =
"HSWC",
>> >> +                                    &args, &output);
>> >
>> > What is this ACPI call doing? Just set LED control? Or something m=
ore?
>> >
>> >> +     if (!ACPI_SUCCESS(status) || output =3D=3D 0) {
>> >> +             pr_err("fail to change wireless LED.\n");
>> >> +             return -EINVAL;
>> >> +     }
>> >> +
>> >> +     return 0;
>> >> +}
>> >> +
>> >> +static int asus_rfkill_set(void *data, bool blocked)
>> >> +{
>> >> +     radio_led_state =3D blocked ? 0 : 1;
>> >> +
>> >> +     return asus_radio_led_set(radio_led_state);
>> >> +}
>> >
>> > In my opinion this is not good idea that "rfkill block" call from
>> > userspace just change LED on/off state and nothing more...
>> >
>> > If above ACPI call just change LED, then should not be this in LED
>> > subsystem instead rfkill one? Or why do you prefer to use rfkill
>> > interface instead led?
>>
>> It indeed controls LED only at the moment.  My intention was to have
>> have everything work without the need to modify any userspace
>> applications.  Current it is 1) aus-rbtn issues KEY_RFKILL 2) an
>> userspace application changes rfkill states, and 3) both radio and L=
ED
>> work.  It will also work when a user enable/disable wireless devices
>> on a user application which uses rfkill interface.
>>
>> Come to think about it now, I may have to handle LED with WLAN and B=
T
>> but I will have to find a system with both devices later.
>>
>> I am not too familiar with userspace applications v.s. LED.  Is it
>> possible to do the same (i.e. without touching userspace)? I think
>> rfkill is good interface to handle whatever needs doing when changin=
g
>> wireless states, such as LED controls.  However, if other approach c=
an
>> meet the need I am happy to investigate.
>>
>
> There are triggers for led which automatically enable/disable led. I
> think that configuring default wifi/bluetooth trigger for that new le=
d
> could work...
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Cheers,
Alex Hung
