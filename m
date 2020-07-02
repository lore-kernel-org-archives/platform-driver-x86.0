From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [External] Re: [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Date: Thu, 2 Jul 2020 13:56:48 +0300
Message-ID: <CAHp75Vemyxv6KWBwAB+EyzvBRO_3OPaad9qCXdos_x8QhLupiw@mail.gmail.com>
References: <markpearson@lenovo.com>
 <20200629191748.3859-1-markpearson@lenovo.com>
 <CAHp75VeO5SzYs=kRh+BV_vydO7PTPLkmu8aiYXvSJFTewSTYwA@mail.gmail.com>
 <7d0e1dcc-7285-71e1-7125-604cb2630595@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <7d0e1dcc-7285-71e1-7125-604cb2630595-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Cc: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 2, 2020 at 1:45 PM Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org> wrote:
> On 7/2/2020 5:29 AM, Andy Shevchenko wrote:
> > On Mon, Jun 29, 2020 at 10:23 PM Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org> wrote:

...

> > You specifically added a new ABI, where is documentation? It's a show stopper.
> Ah - my apologies I didn't know that was a requirement.
>
> Any pointers on where to add it? I looked in Documentation/ABI and I
> couldn't find anything around thinkpad_acpi to add this to.
> Should there be a sysfs-devices-platform-thinkpad_acpi file?
>
> If that's the case I'm happy to look at creating that but as a first
> time kernel contributor would you object if I took that on as a separate
> exercise rather than as part of this patch. I'm guessing it would need
> more time, care and reviewers from other contributors to the
> thinkpad_acpi.c driver

Since it's an old driver its ABI is listed here

https://elixir.bootlin.com/linux/latest/source/Documentation/admin-guide/laptops/thinkpad-acpi.rst

...

> > Why not simple
> >
> >   if (output < 0)
> >     return output;
> Agreed. I'll fix

> > I think your prototype should be
> >
> > int foo(cmd, *output);
> Looking at it again - I agree.

And after returning only error codes, you may do above as simple as

int ret;

ret = ...(.., &output);
if (ret)
  return ret;
...
return 0;

...

> As a minor note I think these all arose because of getting checkpatch to
> run cleanly. I prefer one line too and if that's your preference it
> works for me.

Checkpatch shouldn't complain (update it if it does).

-- 
With Best Regards,
Andy Shevchenko
