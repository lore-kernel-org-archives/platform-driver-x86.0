From: Adam Goode <agoode@google.com>
Subject: Re: [ibm-acpi-devel] [PATCH 1/1] thinkpad_acpi: Add support for
 status (external cover) LED
Date: Sun, 12 Feb 2017 13:27:37 -0500
Message-ID: <CAOf41Nnj5gjeXDM=_cv1HfZa2Kc3Msgu3g8QB-Co-Sirw1zrTg@mail.gmail.com>
References: <20170119172132.36029-1-agoode@google.com> <CAOf41Nka4UNk_XUegEXAOHE-Xf0eOs71fuZgBKr0PHEL9sGyag@mail.gmail.com>
 <20170208010132.GB7028@khazad-dum.debian.net> <20170212182244.imjewspnt32lkeq2@earth>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170212182244.imjewspnt32lkeq2@earth>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Reichel <sre@kernel.org>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Feb 12, 2017 at 1:22 PM, Sebastian Reichel <sre@kernel.org> wrote:
> Hi,
>
> On Tue, Feb 07, 2017 at 11:01:32PM -0200, Henrique de Moraes Holschuh wrote:
>> Hello Adam,
>>
>> I apologise for the delay on answering you.
>>
>> On Tue, 31 Jan 2017, Adam Goode wrote:
>> > On Thu, Jan 19, 2017 at 12:21 PM, Adam Goode <agoode@google.com> wrote:
>> > > This allows the control of the red status LED, which is the dot of the "i"
>> > > in the word "ThinkPad" on the outside cover of newer models.
>> > >
>> > > In the manual, both this LED and the power LED are referred to as
>> > > the "system-status indicators" without distinction between the two, so
>> > > I chose "status" as the LED name.
>>
>> I seem to recall this LED had an ACPI interface that was specific for
>> it, and allowed it to on/off/sine-wave?
>
> I don't know what the ACPI interface looks like, but the lid status
> led goes into sine-wave mode during suspend. Note, that the power-led
> also goes into sine-wave mode during suspend and is already supported
> by thinkpad-acpi's LED code (without the sine-wave feature as far
> as I can tell).
>
>> > > Signed-off-by: Adam Goode <agoode@google.com>
>> > >
>> > > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/
>> > > thinkpad_acpi.c
>> > > index cacb43fb1df7..6577bf8e5635 100644
>> > > --- a/drivers/platform/x86/thinkpad_acpi.c
>> > > +++ b/drivers/platform/x86/thinkpad_acpi.c
>> > > @@ -5611,11 +5611,11 @@ static const char * const
>> > > tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
>> > >         "tpacpi::standby",
>> > >         "tpacpi::dock_status1",
>> > >         "tpacpi::dock_status2",
>> > > -       "tpacpi::unknown_led2",
>> > > +       "tpacpi::status",
>
> "status" looks a bit generic. I suggest "external_lid_status".
>
>> > >         "tpacpi::unknown_led3",
>> > >         "tpacpi::thinkvantage",
>> > >  };
>> > > -#define TPACPI_SAFE_LEDS       0x1081U
>> > > +#define TPACPI_SAFE_LEDS       0x1481U
>>
>> What happens on older Lenovo models (x00, x10, x20 series?)?  I think
>> the T410 already had it...
>>
>> Also, please add code to not export it to userspace (as a led class) on
>> IBM.
>
> Adam, can you prepare an updated patch? I would like to use this
> led to notify myself about events (i.e. compilation finished)
> while my thinkpad's lid is closed.
>

Yes, I will definitely prepare a new patch at some point. The only
hardware I have to test this on is an old IBM X40 and the Lenovo X260.
(I have a T410 with a busted screen that I could try it on maybe.) But
not much else.

I don't know if I can get to this in the next few weeks, since I am
travelling. If someone would like to clean up the patch and move
forward without me, no problem. Otherwise I will get to it eventually.


Thanks,

Adam


> -- Sebastian
