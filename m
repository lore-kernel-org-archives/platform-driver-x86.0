From: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for HKEY
 version 0x200
Date: Thu, 9 Jun 2016 18:04:52 -0300
Message-ID: <20160609210452.GA30888@khazad-dum.debian.net>
References: <20160607235338.GA3147@khazad-dum.debian.net>
	<1465397665-9343-1-git-send-email-cpaul@redhat.com>
	<CAALaSckmmACY6ZxBOKFumT0tJe1Yo24S7-5jsUuREw7SFrde-w@mail.gmail.com>
	<20160609195749.GN28348@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160609195749.GN28348-EK61lajVJsRSq9BJjBFyUp/QNRX+jHPU@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:THINKPAD ACPI EXTRAS DRIVER" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:THINKPAD ACPI EXTRAS DRIVER" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>, Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Marco Trevisan =?iso-8859-1?B?KFRyZXZp8W8p?= <mail-DXHccXIHLaFeoWH0uzbU5w@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 09 Jun 2016, Darren Hart wrote:
> On Thu, Jun 09, 2016 at 01:05:12AM -0400, Marco Trevisan (Trevi=F1o) wrot=
e:
> > 2016-06-08 10:54 GMT-04:00 Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> > > From: Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
> > >
> > > Lenovo Thinkpad devices T460, T460s, T460p, T560, X260 use
> > > HKEY version 0x200 without adaptive keyboard.
> > >
> > > HKEY version 0x200 has method MHKA with one parameter value.
> > > Passing parameter value 1 will get hotkey_all_mask (the same like
> > > HKEY version 0x100 without parameter). Passing parameter value 2 to
> > > MHKA method will retrieve hotkey_all_adaptive_mask. If 0 is returned =
in
> > > that case there is no adaptive keyboard available.
> > >
> > > Signed-off-by: Dennis Wassenberg <dennis.wassenberg-opNxpl+3fjRBDgjK7y7TUQ@public.gmane.org>
> > > Signed-off-by: Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > Tested-by: Lyude <cpaul-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > > Tested-by: Marco Trevisan <marco-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
> > > Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
> > =

> > Can you also Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org so that it can be imported
> > there once merged?
> =

> It doesn't meet stable kernel rules unfortunately, with 143 lines diff.
> =

> Henrique, do you want to weigh in on whether this goes back to stable?

It should be in a bunch of -rc kernel releases before we even consider
it.

> One thing I could do is include this in my 4.7-rc fixes branch instead of
> waiting for 4.8.

If Linus will take it, I don't see a problem with that.

-- =

  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh

---------------------------------------------------------------------------=
---
What NetFlow Analyzer can do for you? Monitors network bandwidth and traffic
patterns at an interface-level. Reveals which users, apps, and protocols ar=
e =

consuming the most bandwidth. Provides multi-vendor support for NetFlow, =

J-Flow, sFlow and other flows. Make informed decisions using capacity =

planning reports. https://ad.doubleclick.net/ddm/clk/305295220;132659582;e
