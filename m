From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH v3 1/2] platform/x86: asus-wmi: Call led hw_changed API on
 kbd brightness change
Date: Wed, 15 Aug 2018 17:49:15 +0800
Message-ID: <CAB4CAwdZYAKEDeboMFVpp9fnKPbdNZWP=VqroOOPmvcYwinX3A@mail.gmail.com>
References: <20180620144645.2084-1-chiu@endlessm.com> <CAB4CAwdCixoGj9t=1Nvcc52kAjmcMWobKt11pRa0vNyLdeA_rg@mail.gmail.com>
 <CAHp75VcvaJVuM=TL2AJaC=y5B9GRVbXO0DczfHWs+i03OJRXcw@mail.gmail.com>
 <CAB4CAwedViX=U0DJNsZeUhJinQ1UBQ3KVTuhRJO7ni-xvqbJ3Q@mail.gmail.com> <CAHp75Veu9+vQPjq+1uWnaocobcHUBpkHKx6OfKW3-E_UeVtKfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Veu9+vQPjq+1uWnaocobcHUBpkHKx6OfKW3-E_UeVtKfA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Hans de Goede <hdegoede@redhat.com>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Aug 15, 2018 at 5:45 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Aug 15, 2018 at 12:34 PM, Chris Chiu <chiu@endlessm.com> wrote:
>> On Mon, Jul 2, 2018 at 8:10 PM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Wed, Jun 27, 2018 at 1:27 PM, Chris Chiu <chiu@endlessm.com> wrote:
>>>> On Wed, Jun 20, 2018 at 10:46 PM, Chris Chiu <chiu@endlessm.com> wrote:
>>>>> Make asus-wmi notify on hotkey kbd brightness changes, listen for
>>>>> brightness events and update the brightness directly in the driver.
>>>>> Create new do_kbd_led_set function for in-driver update, and leave
>>>>> kbd_led_set for original led_classdev call path.
>>>>>
>>>>> Update the brightness by led_classdev_notify_brightness_hw_changed.
>>>>> This will allow userspace to monitor (poll) for brightness changes
>>>>> on the LED without reporting via input keymapping.
>>>
>>> LGTM, I'm about to push it to my review and testing queue, so, we will
>>> have 1 day or so time to gather objections if any.
>>> Thanks!
>>>
>>
>> Gentle ping. How's the review so far? Maybe need more time for more info?
>
> Sorry, I thought we have no objections and I pushed it to our for-next
> quite time ago [1].
> Should I do something differently?
>
> [1]: http://git.infradead.org/linux-platform-drivers-x86.git/commitdiff/dbb3d78f61badeadc7448f9d88a070a76612860f
>
> --
> With Best Regards,
> Andy Shevchenko

It's good to know. Thank you.

Chris
