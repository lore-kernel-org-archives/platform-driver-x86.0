From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] dell-smbios: fix string overflow
Date: Wed, 8 Nov 2017 21:03:09 +0200
Message-ID: <CAHp75VckzSdKtqSNDUKBAvOzx-iu67vwJwb8pbdPBrtyPLqBew@mail.gmail.com>
References: <20171108120844.3196747-1-arnd@arndb.de> <8b46d25f-f9e6-d2e5-1b7c-abbc6dd47298@linux.intel.com>
 <01d8cf85a7984a3cb1dd92771b65b8ea@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:55118 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752277AbdKHTDK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Nov 2017 14:03:10 -0500
In-Reply-To: <01d8cf85a7984a3cb1dd92771b65b8ea@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <Mario.Limonciello@dell.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, quasisec@google.com, Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 8, 2017 at 8:30 PM,  <Mario.Limonciello@dell.com> wrote:

>> I recommend using "platform/x86: dell-smbios:" in commit header.

While we (maintainers) are fixing this manually, it would be better if
contributors will do this themselves :-)

>> On 11/08/2017 04:08 AM, Arnd Bergmann wrote:
>> > The new sysfs code overwrites two fixed-length character arrays
>> > that are each one byte shorter than they need to be, to hold
>> > the trailing \0:
>> >
>> > drivers/platform/x86/dell-smbios.c: In function 'build_tokens_sysfs':
>> > drivers/platform/x86/dell-smbios.c:494:42: error: 'sprintf' writing a terminating
>> nul past the end of the destination [-Werror=format-overflow=]
>> >     sprintf(buffer_location, "%04x_location",
>> > drivers/platform/x86/dell-smbios.c:494:3: note: 'sprintf' output 14 bytes into a
>> destination of size 13
>> > drivers/platform/x86/dell-smbios.c:506:36: error: 'sprintf' writing a terminating
>> nul past the end of the destination [-Werror=format-overflow=]
>> >     sprintf(buffer_value, "%04x_value",
>> > drivers/platform/x86/dell-smbios.c:506:3: note: 'sprintf' output 11 bytes into a
>> destination of size 10
>> Don't need to include the error log in commit message. Just explaining
>> the issue is good enough.
>> >
>> > This changes it to just use kasprintf(), which always gets it right.

Good catch followed by a fix!

> Assuming Darren will do the fixup for title and message as recommended by
> Sathyanarayanan before committing:
> Acked-by: Mario Limonciello <mario.limonciello@dell.com>

> Thanks, for the fix.  For my own information and improvement, would you
> share how you caught that?  Just added "-Werror=format-overflow=" to CFLAGS?

> I wasn't seeing the compile errors with default flags in my own testing, so I'd like
> to make sure I'm doing better testing in the future.

gcc7 by its default [1], though you need to revert [2].

And always good to remember

% make W=1

which implies some warning, W=2 a lot more.

[1]: http://patches.linaro.org/cover/107779/

[2]: commit bd664f6b3e376a8ef4990f87d08271cc2d01ba9a
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Jul 12 19:25:47 2017 -0700

   disable new gcc-7.1.1 warnings for now


-- 
With Best Regards,
Andy Shevchenko
