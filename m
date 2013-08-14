From: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 0/2] add sysfs for acpi interfaces of
	thinkpad hardware mute
Date: Wed, 14 Aug 2013 15:08:14 +0800
Message-ID: <CAJ=jqubWWeWH+xsGrTVaNguNuw7gm2E=CZmXY_SxO+Bxg1Hxag@mail.gmail.com>
References: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
	<1376458937.30031.1.camel@x230>
	<CAJ=jqua8STZQideGbQTDh2W8iHcF4J9OJAC5tw-bkdBLLzsP2A@mail.gmail.com>
	<1376459647.30031.2.camel@x230>
	<CAJ=jqub1sRSzBRv_R6soDVAydRL+5nmA9-pMC4E+sgXhP6tbPw@mail.gmail.com>
	<1376460872.30031.4.camel@x230>
	<CAJ=jquaCHpBPKVYHKKCyMoih3NVCL8VmyiiN5Vy0UmTTTrwKjQ@mail.gmail.com>
	<1376463610.30031.6.camel@x230>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4120271812576126872=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1376463610.30031.6.camel@x230>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>
Cc: "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

--===============4120271812576126872==
Content-Type: multipart/alternative; boundary=e89a8ff1cefe627d9c04e3e30582

--e89a8ff1cefe627d9c04e3e30582
Content-Type: text/plain; charset=ISO-8859-1

Hi Mattew,

That sounds good. I will work on it.

Cheers,
Alex Hung


On Wed, Aug 14, 2013 at 3:00 PM, Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org
> wrote:

> On Wed, 2013-08-14 at 14:41 +0800, Alex Hung wrote:
> > Hi Matthew,
> >
> > The problem is that thinkpad-acpi does not aware of mute is changed by
> > either hotkey presses or in desktop.
>
> Ok, how about this. Register the LED with the kernel LED subsystem. Add
> a new LED trigger for volume-mute. Have the HDA driver call that trigger
> whenever the mute state changes.
>
> --
> Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>
>



-- 
Cheers,
Alex Hung

--e89a8ff1cefe627d9c04e3e30582
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hi Mattew, <br></div><div class=3D"gmail_default" style=3D"font=
-family:verdana,sans-serif"><br>That sounds good. I will work on it.<br><br=
>Cheers,<br>
Alex Hung<br></div></div><div class=3D"gmail_extra"><br><br><div class=3D"g=
mail_quote">On Wed, Aug 14, 2013 at 3:00 PM, Matthew Garrett <span dir=3D"l=
tr">&lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org" target=3D"_blank">mat=
thew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2013-08-14 at 14:4=
1 +0800, Alex Hung wrote:<br>
&gt; Hi Matthew,<br>
&gt;<br>
&gt; The problem is that thinkpad-acpi does not aware of mute is changed by=
<br>
&gt; either hotkey presses or in desktop.<br>
<br>
</div>Ok, how about this. Register the LED with the kernel LED subsystem. A=
dd<br>
a new LED trigger for volume-mute. Have the HDA driver call that trigger<br=
>
whenever the mute state changes.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Matthew Garrett &lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org">matthew.g=
arrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Cheers,<br>Alex Hung<br></div>
</div>

--e89a8ff1cefe627d9c04e3e30582--


--===============4120271812576126872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Get 100% visibility into Java/.NET code with AppDynamics Lite!
It's a free troubleshooting tool designed for production.
Get down to code-level detail for bottlenecks, with <2% overhead. 
Download for free and get started troubleshooting in minutes. 
http://pubads.g.doubleclick.net/gampad/clk?id=48897031&iu=/4140/ostg.clktrk
--===============4120271812576126872==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============4120271812576126872==--
