From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5] platform/x86: thinkpad_acpi: lap or
 desk mode interface
Date: Fri, 10 Jul 2020 15:20:41 +0300
Message-ID: <CAHp75Ve-qOs8VosoxEaHH1EnK-r16Sx0ki3uj14yZJWyuwC88w@mail.gmail.com>
References: <markpearson@lenovo.com>
 <20200703012353.26413-1-markpearson@lenovo.com>
 <CAHp75Vcs15wGCzwW8Pq7AXyqQnvnopNdFP1nDE0nf+ZTz=9zFw@mail.gmail.com>
 <7c1698a6-ebd6-553d-a686-d9bd4e5a5e99@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <7c1698a6-ebd6-553d-a686-d9bd4e5a5e99-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thinkpad-acpi devel ML <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 10, 2020 at 11:00 AM Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> Hi,
>
> On 7/9/20 8:02 PM, Andy Shevchenko wrote:
> > On Fri, Jul 3, 2020 at 4:24 AM Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org> wrote:
> >>
> >> Newer Lenovo Thinkpad platforms have support to identify whether the
> >> system is on-lap or not using an ACPI DYTC event from the firmware.
> >>
> >> This patch provides the ability to retrieve the current mode via sysfs
> >> entrypoints and will be used by userspace for thermal mode and WWAN
> >> functionality
> >
> > Hans, do you think it's good to have custom ABI for this? I think you
> > may be know better what types of ABI we already have for such thing.
>
> Actually, Mark asked me the same question before submitting his
> patch upstream. I'm never a fan of custom ABI for this. But for now
> the solution Lenovo has chosen to deal with thermal management
> issues on modern hw is unique to Lenovo and we do not have anything
> like this anywhere else.
>
> So for now I believe that a custom ABI is best.
>
> If we see this becoming a common feature on more platforms then we can
> design a generic API for it once we have a better idea how this would
> look like when implemented by others and then thinkpad_acpi can easily
> add support for the new generic interface, while keeping its own
> custom interface for backward compatibility.

Thank you very much for the elaborative comment, appreciated!

-- 
With Best Regards,
Andy Shevchenko
