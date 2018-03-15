From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] platform/x86: dell: avoid link error with modular ACPI_SMI
Date: Thu, 15 Mar 2018 21:03:19 +0100
Message-ID: <CAK8P3a1NwqyU+DRe=TK9PCnZetbQkragayW4oufV-_eTd+wd+Q@mail.gmail.com>
References: <20180315153934.3844276-1-arnd@arndb.de> <17477AD6-0C60-40B4-AE86-56FD4AA6208F@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <17477AD6-0C60-40B4-AE86-56FD4AA6208F@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>, Hans de Goede <hdegoede@redhat.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Mar 15, 2018 at 7:36 PM,  <dvhart@infradead.org> wrote:
>
>
> On March 15, 2018 8:39:07 AM PDT, Arnd Bergmann <arnd@arndb.de> wrote:
>>The new DELL_LAPTOP dependencies allowed one configuration that should
>>not
>>have been possible, with DELL_SMBIOS_WMI built-in, but ACPI_SMI as a
>>module:
>
>
> Hi Arnd, do you have the latest changes from me? The
> platform-drivers-x86-v4.16-7 PR to Linus yesterday has a fix for
> the ACPI_WMI dependency. Linus merged it yesterday.

I wrote my patch based on yesterday's linux-next, which didn't
have the fix. Today's version has it, and looks good.

My approach was slightly different from yours, so I didn't
get a conflict when rebasing, but either one is sufficient.

     Arnd
