From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dell-smbios: fix string overflow
Date: Wed, 8 Nov 2017 21:01:26 +0100
Message-ID: <CAK8P3a3MWcd6=u3Dkr3=MgunBV2ZDJoU8D8myutvP28zPs5LSg@mail.gmail.com>
References: <20171108120844.3196747-1-arnd@arndb.de> <8b46d25f-f9e6-d2e5-1b7c-abbc6dd47298@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:44546 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752615AbdKHUB1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Nov 2017 15:01:27 -0500
In-Reply-To: <8b46d25f-f9e6-d2e5-1b7c-abbc6dd47298@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: sathyanarayanan.kuppuswamy@linux.intel.com
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Edward O'Callaghan <quasisec@google.com>, Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 8, 2017 at 7:22 PM, sathyanarayanan kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> Hi,
>
> I recommend using "platform/x86: dell-smbios:" in commit header.

Ok, noted. I usually try to follow the lines for each maintainer, but
I'm not always
keeping track of each one, sorry.

> On 11/08/2017 04:08 AM, Arnd Bergmann wrote:
>>
>> The new sysfs code overwrites two fixed-length character arrays
>> that are each one byte shorter than they need to be, to hold
>> the trailing \0:
>>
>> drivers/platform/x86/dell-smbios.c: In function 'build_tokens_sysfs':
>> drivers/platform/x86/dell-smbios.c:494:42: error: 'sprintf' writing a
>> terminating nul past the end of the destination [-Werror=format-overflow=]
>>     sprintf(buffer_location, "%04x_location",
>> drivers/platform/x86/dell-smbios.c:494:3: note: 'sprintf' output 14 bytes
>> into a destination of size 13
>> drivers/platform/x86/dell-smbios.c:506:36: error: 'sprintf' writing a
>> terminating nul past the end of the destination [-Werror=format-overflow=]
>>     sprintf(buffer_value, "%04x_value",
>> drivers/platform/x86/dell-smbios.c:506:3: note: 'sprintf' output 11 bytes
>> into a destination of size 10
>
> Don't need to include the error log in commit message. Just explaining the
> issue is good enough.

I always include the messages I get, it helps a lot when you run into a related
problem and find it in either the git log or using google search.

It's particularly useful when patches that introduce warnings get backported
to stable kernels.

      Arnd
