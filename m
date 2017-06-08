From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 09/16] platform/x86: wmi: Instantiate all devices before
 adding them
Date: Thu, 8 Jun 2017 06:43:41 +0200
Message-ID: <20170608044341.GA1171@kmp-mobile.hq.kempniu.pl>
References: <cover.1495862272.git.dvhart@infradead.org>
 <a25645295f6aaf80407ff851baa14ec039c885aa.1495862272.git.dvhart@infradead.org>
 <20170601204339.GA1842@kmp-mobile.hq.kempniu.pl>
 <20170606030302.GC27270@fury>
 <CALCETrVU6epBh-OynBs+ryhSNmt_hr8VjiOhjfxjdWwvHj2r0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-acpi-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALCETrVU6epBh-OynBs+ryhSNmt_hr8VjiOhjfxjdWwvHj2r0Q@mail.gmail.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario_limonciello@dell.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Rafael Wysocki <rjw@rjwysocki.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> On Mon, Jun 5, 2017 at 8:03 PM, Darren Hart <dvhart@infradead.org> wrote:
> > On Thu, Jun 01, 2017 at 10:43:39PM +0200, Michał Kępień wrote:
> >> I know I have probably started sounding like a broken record by now, but
> >> I still have not seen any response (apart from the typos getting fixed)
> >> to my comments on this patch which I posted in January 2016 [1].
> >>
> >> None of the issues I found back then are really critical, but I did
> >> point out a potential memory leak (granted, an unlikely one), so it
> >> might be a good idea to at least take a second look before merging.
> >>
> >> [1] https://www.spinics.net/lists/platform-driver-x86/msg08201.html
> >
> > Thanks for being persistent, some good points in there. I'd like to just squash
> > these into this patch (9/16), but I'll include them here for an ack from you and
> > Andy L. that this is what you meant, and consistent with his
> > intent/understanding:
> >
> 
> Looks good to me.

Same here.

-- 
Best regards,
Michał Kępień
