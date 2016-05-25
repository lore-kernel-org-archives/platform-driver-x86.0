From: =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Subject: Re: [PATCH 2/5] asus-wmi: Create quirk for airplane_mode LED
Date: Wed, 25 May 2016 12:20:12 -0400
Message-ID: <CA+A7VXV87o1+-tfyWqhkT2NtTPzPmaX2hY3pwWVVPZUe6uuF8w@mail.gmail.com>
References: <1454951123-27470-1-git-send-email-jprvita@endlessm.com>
 <1454951123-27470-3-git-send-email-jprvita@endlessm.com> <CAHR064itbc5bWLxX3DyCMmQ3n1gq5SWFhSrBpDqTu=6VjUcsWw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHR064itbc5bWLxX3DyCMmQ3n1gq5SWFhSrBpDqTu=6VjUcsWw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>, linux@endlessm.com, =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On 25 May 2016 at 03:13, Corentin Chary <corentin.chary@gmail.com> wrot=
e:
> On Mon, Feb 8, 2016 at 6:05 PM, Jo=C3=A3o Paulo Rechi Vita <jprvita@g=
mail.com> wrote:
>> Some Asus laptops that have an "airplane mode" indicator LED, also h=
ave
>> the WMI WLAN user bit set, and the following bits in their DSDT:
>>
>> Scope (_SB)
>> {
>>   (...)
>>   Device (ATKD)
>>   {
>>     (...)
>>     Method (WMNB, 3, Serialized)
>>     {
>>       (...)
>>       If (LEqual (IIA0, 0x00010002))
>>       {
>>         OWGD (IIA1)
>>         Return (One)
>>       }
>>     }
>>   }
>> }
>>
>> So when asus-wmi uses ASUS_WMI_DEVID_WLAN_LED (0x00010002) to store =
the
>> wlan state, it drives the airplane mode indicator LED (through the c=
all
>> to OWGD) in an inverted fashion: the LED is ON when airplane mode is=
 OFF
>> (since wlan is ON), and vice-versa.
>>
>> This commit creates a quirk to not register a RFKill switch at all f=
or
>> these laptops, to allow the asus-wireless driver to drive the airpla=
ne
>> mode LED correctly. It also adds a match to that quirk for the Asus
>> X555UB.
>
> This is really something that should get merged, multiple users are
> affected by this. I do not own any of these laptops, but would there
> be a way to detect this behavior instead of having static quircks ?
>

I could not come up with a way to detect this, but I can probably
gather most (if not all) of the DSDTs if want to have a look at them.
In any case, I must say the asus-wireless patches that actually drive
the LED are still blocked on a couple of rfkill patches that implement
a new airplane-mode led trigger, which I'm trying to have merged for
the past two kernel releases. I can send a new series with only the
asus-wmi patches if you want to have them merged first, but in this
case the LED will not work (I imagine it will be always OFF) instead
of working in an inverted fashion. Just let me know!

Regards,
