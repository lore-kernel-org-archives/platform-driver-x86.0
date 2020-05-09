From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 1/2] [sony-laptop] SNC calls should handle BUFFER types
Date: Sat, 09 May 2020 11:15:31 +0200
Message-ID: <2337210.yqbmfTWyIV@kreacher>
References: <20200505111810.65586-1-malattia@linux.it> <20200505111810.65586-2-malattia@linux.it> <CAHp75Ve--kecWYufUiXUxUZM=tL3NgKtDNf6Ny4ds8GJVz_0pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ve--kecWYufUiXUxUZM=tL3NgKtDNf6Ny4ds8GJVz_0pA@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mattia Dongili <malattia@linux.it>, "Schmauss, Erik" <erik.schmauss@intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.co>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Dominik Mierzejewski <dominik@greysector.net>, William Bader <williambader@hotmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday, May 5, 2020 2:27:15 PM CEST Andy Shevchenko wrote:
> +Cc ACPI(CA) people
> 
> On Tue, May 5, 2020 at 1:16 PM <malattia@linux.it> wrote:
> > After commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
> > objects for ASL create_field() operator") ACPICA creates buffers even
> > when new fields are small enough to fit into an integer.
> 
> > Many SNC calls counted on the old behaviour.
> 
> Rafael, Erik, is it correct behaviour from ACPICA p.o.v. nowadays or
> should be fixed rather there?

The new behavior is correct and it is needed to avoid other failures elsewhere.

Unfortunately, all of the call sites assuming that the conversion will happen
need to be fixed.

Cheers!
