From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/2] [sony-laptop] SNC calls should handle BUFFER types
Date: Tue, 5 May 2020 15:27:15 +0300
Message-ID: <CAHp75Ve--kecWYufUiXUxUZM=tL3NgKtDNf6Ny4ds8GJVz_0pA@mail.gmail.com>
References: <20200505111810.65586-1-malattia@linux.it> <20200505111810.65586-2-malattia@linux.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20200505111810.65586-2-malattia@linux.it>
Sender: linux-acpi-owner@vger.kernel.org
To: Mattia Dongili <malattia@linux.it>, "Schmauss, Erik" <erik.schmauss@intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.co>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Dominik Mierzejewski <dominik@greysector.net>, William Bader <williambader@hotmail.com>
List-Id: platform-driver-x86.vger.kernel.org

+Cc ACPI(CA) people

On Tue, May 5, 2020 at 1:16 PM <malattia@linux.it> wrote:
> After commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
> objects for ASL create_field() operator") ACPICA creates buffers even
> when new fields are small enough to fit into an integer.

> Many SNC calls counted on the old behaviour.

Rafael, Erik, is it correct behaviour from ACPICA p.o.v. nowadays or
should be fixed rather there?

-- 
With Best Regards,
Andy Shevchenko
