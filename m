From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: [PATCH v2 0/3] Sony-laptop: Adjustments for
 sony_nc_setup_rfkill()
Date: Fri, 3 Nov 2017 14:23:45 +0100
Message-ID: <340e5426-a9ba-2193-2735-85e918773785@users.sourceforge.net>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
 <CAHp75VfaWLSwzLpnWHj0sD9ZVVbSCi+ya_+PESXjU2FbHefE0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfaWLSwzLpnWHj0sD9ZVVbSCi+ya_+PESXjU2FbHefE0Q@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

> I have applied first two,

Thanks for another change acceptance.


> the last one is subject to discuss a necessity of it.

I can offer another bit of information for this software development discussion.

The following build settings were active in my “Makefile” for this Linux test case.

…
HOSTCFLAGS   = -Wall -Wmissing-prototypes -Wstrict-prototypes -O0 -fomit-frame-pointer -std=gnu89
…


The affected source file can be compiled for the processor architecture “x86_64”
by a tool like “GCC 6.4.1+r251631-1.3” from the software distribution
“openSUSE Tumbleweed” with the following command example.

my_cc=/usr/bin/gcc-6 \
&& my_module=drivers/platform/x86/sony-laptop.ko \
&& git checkout ':/^Sony-laptop: Delete an unnecessary variable initialisation in sony_nc_setup_rfkill' \
&& make -j4 CC="${my_cc}" HOSTCC="${my_cc}" allmodconfig "${my_module}" \
&& size "${my_module}" \
&& git checkout ':/^Sony-laptop: Use common error handling code in sony_nc_setup_rfkill' \
&& make -j4 CC="${my_cc}" HOSTCC="${my_cc}" allmodconfig "${my_module}" \
&& size "${my_module}"


Do you find the following details useful for further clarification?

text: -32
data: 0
bss:  0

Regards,
Markus
