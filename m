From: Shuduo Sang <shuduo.sang-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH] support thinkpad HKEY interface
	version 0x200
Date: Fri, 4 Apr 2014 00:21:04 +0800
Message-ID: <CA+BAWBQcu4KBG3hmuqBMmWeqE1k9itgXyDtMRibZZOLvvAdwHQ@mail.gmail.com>
References: <531F0073.7060103@canonical.com>
	<20140403154427.GB32027@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0207000382947524565=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20140403154427.GB32027-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Bruce Ma <bruce.ma-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

--===============0207000382947524565==
Content-Type: multipart/alternative; boundary=001a11336baa13b94c04f625cc49

--001a11336baa13b94c04f625cc49
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 3, 2014 at 11:44 PM, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org
> wrote:

> On Tue, 11 Mar 2014, Shuduo Sang wrote:
> > Please kindly review following patch. It support new BIOS which shiped
> > with Thinkpad X1 Carbon 2nd generation. Without it, hotkey mask be
> > routed to wrong branch and some hot key will not work.
>
> Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
>
> Can you guys get documentation on the new mode from Lenovo?
>

Yes, actually it's a joint-effort to officially enable X1 carbon 2nd
generation by Canonical and Lenovo.


>
> --
>   "One disk to rule them all, One disk to find them. One disk to bring
>   them all and in the darkness grind them. In the Land of Redmond
>   where the shadows lie." -- The Silicon Valley Tarot
>   Henrique Holschuh
>

--001a11336baa13b94c04f625cc49
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Thu, Apr 3, 2014 at 11:44 PM, Henrique de Moraes Holschuh <span =
dir=3D"ltr">&lt;<a href=3D"mailto:hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" target=3D"_blank">hmh@hmh=
.eng.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On Tue, 11 Mar 2014, Shuduo =
Sang wrote:<br>
&gt; Please kindly review following patch. It support new BIOS which shiped=
<br>
&gt; with Thinkpad X1 Carbon 2nd generation. Without it, hotkey mask be<br>
&gt; routed to wrong branch and some hot key will not work.<br>
<br>
</div>Acked-by: Henrique de Moraes Holschuh &lt;<a href=3D"mailto:hmh@hmh.e=
ng.br">hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org</a>&gt;<br>
<br>
Can you guys get documentation on the new mode from Lenovo?<br></blockquote=
><div><br></div><div>Yes, actually it&#39;s a joint-effort to officially en=
able X1 carbon 2nd generation by Canonical and Lenovo.</div><div>=A0</div>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
=A0 &quot;One disk to rule them all, One disk to find them. One disk to bri=
ng<br>
=A0 them all and in the darkness grind them. In the Land of Redmond<br>
=A0 where the shadows lie.&quot; -- The Silicon Valley Tarot<br>
=A0 Henrique Holschuh<br>
</font></span></blockquote></div><br></div></div>

--001a11336baa13b94c04f625cc49--


--===============0207000382947524565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------

--===============0207000382947524565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============0207000382947524565==--
