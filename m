From: Marco Martin <notmart@gmail.com>
Subject: Re: [PATCH v7] Support intel-vbtn based tablet mode switch
Date: Mon, 29 Jan 2018 21:33:20 +0100
Message-ID: <CAD6_BoviBRVRSG++fYRZ1Pg7spMD=jS2j5zeVHTK7eTWVY3sgg@mail.gmail.com>
References: <1517070957-2372-1-git-send-email-notmart@gmail.com>
 <CAHp75Ve5C=AtmE1nir1nrjPv8KkdhmTLGj4A=6M5osJyidw8jg@mail.gmail.com> <e4b1efa4a7fd4024a578cd505beb8387@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e4b1efa4a7fd4024a578cd505beb8387@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bhushan Shah <bhush94@gmail.com>, =?UTF-8?Q?Stefan_Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jan 29, 2018 at 8:35 PM,  <Mario.Limonciello@dell.com> wrote:
>> -----Original Message-----
>> From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
>> Sent: Monday, January 29, 2018 12:57 PM
>> To: Marco Martin <notmart@gmail.com>
>> Cc: Platform Driver <platform-driver-x86@vger.kernel.org>; Limonciello, =
Mario
>> <Mario_Limonciello@Dell.com>; Andy Shevchenko <andy@infradead.org>; Pali
>> Roh=C3=A1r <pali.rohar@gmail.com>; Darren Hart <dvhart@infradead.org>; M=
atthew
>> Garrett <mjg59@srcf.ucam.org>; Linux Kernel Mailing List <linux-
>> kernel@vger.kernel.org>; Bhushan Shah <bhush94@gmail.com>
>> Subject: Re: [PATCH v7] Support intel-vbtn based tablet mode switch
>>
>> On Sat, Jan 27, 2018 at 6:35 PM, Marco Martin <notmart@gmail.com> wrote:
>> > Some laptops such as Dell Inspiron 7000 series have the
>> > tablet mode switch implemented in Intel ACPI,
>> > the events to enter and exit the tablet mode are 0xCC and 0xCD
>> >
>>
>> It doesn't apply :-(
>
> Marco, I can see it applies on 4.15 but it's not applying on platform-dri=
vers-x86/testing.
> It's most likely this commit you need to rebase on top of:

Ah, i see (i was trying on platform-drivers-x86 but master branch, sorry)
latest version is rebased on top of it, i seen the reason it didn't
apply was that the addition
 to sparse_keymap was already done in 1c8284 by Stefan Br=C3=BCns (whoops :=
)
However still needs the initialization part, so booting or
modprobe with the device already in tablet mode would initialize the
correct state

--
Marco Martin
