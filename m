From: Andy Lutomirski <luto@kernel.org>
Subject: Re: RFC: WMI Enhancements
Date: Thu, 13 Apr 2017 08:44:28 -0700
Message-ID: <CALCETrWQY28h87_4oPGP=TMj8BEOrtC-+2rr2Q6qKb1H3W07tw@mail.gmail.com>
References: <20170412230854.GA11963@fury> <20170413073228.GB1462@ozzy.nask.waw.pl>
 <CALCETrXkx2QqDtKmajywpvtxqCXzrQ3nuW0aOeY6+Uxa-LOXiQ@mail.gmail.com> <201704131739.57956@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <201704131739.57956@pali>
Sender: linux-pm-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Darren Hart <dvhart@infradead.org>, Rafael Wysocki <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Corentin Chary <corentin.chary@gmail.com>, Mario Limonciello <Mario_Limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 13, 2017 at 8:39 AM, Pali Rohár <pali.rohar@gmail.com> wrote:
> On Thursday 13 April 2017 17:32:48 Andy Lutomirski wrote:
>> On Thu, Apr 13, 2017 at 12:32 AM, Michał Kępień <kernel@kempniu.pl>
>> wrote:
>> > What we still need, though, is an open source version of
>> > wmiofck.exe.  I am unaware of anything like that existing and
>> > installing the Windows Driver Kit just to run one command which
>> > spits out a single *.h file is not something I would describe as
>> > convenient (been there).
>>
>> I haven't tried to see whether they do what's needed, but there's
>> OpenWBEM and OpenPegasus.
>>
>> Anyway, if such a tool exists, it would be handy to expose the binary
>> MOF data to userspace so the tool could be used to help get WMI
>> working on new platforms.
>
> In this case, when WMI stay in kernel, MOF data could be exported via
> debugfs? I think there is no need to have them in sysfs stable ABI. As
> above usage (get WMI working on new platforms) looks like for debugging
> purpose.
>

That's a reasonable point.
