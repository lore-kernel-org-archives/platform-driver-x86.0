From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] dell-smbios: fix string overflow
Date: Wed, 8 Nov 2017 21:02:38 +0100
Message-ID: <CAK8P3a2p6y=wXFxSvLmuWONZAJUPrDNBTj8jSke8MAsZbY2fXA@mail.gmail.com>
References: <20171108120844.3196747-1-arnd@arndb.de> <8b46d25f-f9e6-d2e5-1b7c-abbc6dd47298@linux.intel.com>
 <01d8cf85a7984a3cb1dd92771b65b8ea@ausx13mpc120.AMER.DELL.COM> <CAHp75VckzSdKtqSNDUKBAvOzx-iu67vwJwb8pbdPBrtyPLqBew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:45789 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751749AbdKHUCj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Nov 2017 15:02:39 -0500
In-Reply-To: <CAHp75VckzSdKtqSNDUKBAvOzx-iu67vwJwb8pbdPBrtyPLqBew@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Edward O'Callaghan <quasisec@google.com>, Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Nov 8, 2017 at 8:03 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Nov 8, 2017 at 8:30 PM,  <Mario.Limonciello@dell.com> wrote:
>
> % make W=1
>
> which implies some warning, W=2 a lot more.
>
> [1]: http://patches.linaro.org/cover/107779/
>
> [2]: commit bd664f6b3e376a8ef4990f87d08271cc2d01ba9a
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Wed Jul 12 19:25:47 2017 -0700
>
>    disable new gcc-7.1.1 warnings for now

I have reverted that patch locally and this is the first time I
actually hit a warning
since it landed, but that reminds me that I should check whether all my
workarounds have landed in mainline and we are ready to turn it on globally
again.

     Arnd
