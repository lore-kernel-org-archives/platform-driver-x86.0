From: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 0/2] add sysfs for acpi interfaces of
	thinkpad hardware mute
Date: Wed, 14 Aug 2013 14:41:41 +0800
Message-ID: <CAJ=jquaCHpBPKVYHKKCyMoih3NVCL8VmyiiN5Vy0UmTTTrwKjQ@mail.gmail.com>
References: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
	<1376458937.30031.1.camel@x230>
	<CAJ=jqua8STZQideGbQTDh2W8iHcF4J9OJAC5tw-bkdBLLzsP2A@mail.gmail.com>
	<1376459647.30031.2.camel@x230>
	<CAJ=jqub1sRSzBRv_R6soDVAydRL+5nmA9-pMC4E+sgXhP6tbPw@mail.gmail.com>
	<1376460872.30031.4.camel@x230>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3026526156174336338=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1376460872.30031.4.camel@x230>
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

--===============3026526156174336338==
Content-Type: multipart/alternative; boundary=e89a8fb1f7886d1f3704e3e2a6b4

--e89a8fb1f7886d1f3704e3e2a6b4
Content-Type: text/plain; charset=ISO-8859-1

Hi Matthew,

The problem is that thinkpad-acpi does not aware of mute is changed by
either hotkey presses or in desktop.

I believe Lenovo has an application to handle it Windows in similar ways,
and the design makes controlling by user-applications more feasible.

Cheers,
Alex Hung


On Wed, Aug 14, 2013 at 2:14 PM, Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org
> wrote:

> On Wed, 2013-08-14 at 14:11 +0800, Alex Hung wrote:
>
> > One solution to the problem is to disable hardware mute. Mute hotkey
> > will only generate scancode but led will not be toggled.
>
> So this works, but muting doesn't control the LED? It seems like this is
> something that ought to be fixed in-kernel as well. Having an
> application to make the LED work isn't a terribly generic solution.
>
> --
> Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>
>



-- 
Cheers,
Alex Hung

--e89a8fb1f7886d1f3704e3e2a6b4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hi Matthew,<br><br>The problem is that thinkpad-acpi does not a=
ware of mute is changed by either hotkey presses or in desktop. <br><br>I b=
elieve Lenovo has an application to handle it Windows in similar ways, and =
the design makes controlling by user-applications more feasible.<br>
<br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-se=
rif">Cheers,<br>Alex Hung<br></div></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">On Wed, Aug 14, 2013 at 2:14 PM, Matthew Garret=
t <span dir=3D"ltr">&lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org" targe=
t=3D"_blank">matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2013-08-14 at 14:1=
1 +0800, Alex Hung wrote:<br>
<br>
&gt; One solution to the problem is to disable hardware mute. Mute hotkey<b=
r>
&gt; will only generate scancode but led will not be toggled.<br>
<br>
</div>So this works, but muting doesn&#39;t control the LED? It seems like =
this is<br>
something that ought to be fixed in-kernel as well. Having an<br>
application to make the LED work isn&#39;t a terribly generic solution.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Matthew Garrett &lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org">matthew.g=
arrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Cheers,<br>Alex Hung<br></div>
</div>

--e89a8fb1f7886d1f3704e3e2a6b4--


--===============3026526156174336338==
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
--===============3026526156174336338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============3026526156174336338==--
