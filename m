From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: add
 unsafe_leds parameter
Date: Mon, 3 Dec 2018 19:28:30 +0200
Message-ID: <CAHp75VfGO5=ztPSRDv2Md8dhOOU_g3YRmdQ0r-m=HgEe2ZAoZA@mail.gmail.com>
References: <CAGiEHCtu9-chj_wN1wau4aBzvcCR8Bmq1-2OZiHq0yqz3=BUSA@mail.gmail.com>
 <CAHp75Ve+Z5W=6SNx3eB1MrH=wDPTe9bjQGQ3tEGi9wYCXKD0Pg@mail.gmail.com>
 <CAHp75VfoogP8N0u7fzW7Xo3moSQxseAtFSu7H-yv6MczFFdakg@mail.gmail.com>
 <20181113174136.58198c3a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20181113174136.58198c3a-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Nov 13, 2018 at 6:41 PM Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> thanks for your replies.

Thanks for an update, though made in wrong format:
- no top post
- should be send as a separate patch in a separate thread
- should have increased version

But the main one is...

> > On Sat, 27 Oct 2018, Milan Hauth wrote:
> > > move CONFIG_THINKPAD_ACPI_UNSAFE_LEDS compile config
> > > to thinkpad_acpi.unsafe_leds module parameter
> > >
> > > so there is no more need to re-compile
> > > to control important LEDs, which is unsafe
> > >
> > > Signed-off-by: Milan Hauth <milahu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >
> > I am not confortable signing-off on this one.

...I'm not familiar with this interface and I rely on Henrique's
opinion, so, I can't take it.
Sorry.

-- 
With Best Regards,
Andy Shevchenko
