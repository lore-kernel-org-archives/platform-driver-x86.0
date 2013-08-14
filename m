From: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 0/2] add sysfs for acpi interfaces of
	thinkpad hardware mute
Date: Wed, 14 Aug 2013 13:53:03 +0800
Message-ID: <CAJ=jqua8STZQideGbQTDh2W8iHcF4J9OJAC5tw-bkdBLLzsP2A@mail.gmail.com>
References: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
	<1376458937.30031.1.camel@x230>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4828216485645633505=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1376458937.30031.1.camel@x230>
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

--===============4828216485645633505==
Content-Type: multipart/alternative; boundary=e89a8ff250be7fa83b04e3e1f86d

--e89a8ff250be7fa83b04e3e1f86d
Content-Type: text/plain; charset=ISO-8859-1

Hi Matthew,

The scenario will be to have an user-application to listen to the mute key
event, compare to hardware mute against OS mute, and sync both mute. When
the application is loaded, it can use this interface to enable it; when it
is unloaded it can disable it.

A config option is also a good idea. I will develop another patch.

Cheers,
Alex Hung



On Wed, Aug 14, 2013 at 1:42 PM, Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org
> wrote:

> On Wed, 2013-08-14 at 13:40 +0800, Alex Hung wrote:
> > Newer Thinkpad models comes with a mute hotkey with a mute led. It also
> comes
> > with ACPI AML functions to control hardware mute + led. The patches add
> sysfs
> > nodes so it is possible to enable, disable and control from user-space.
>
> What's expected to use this interface? If it's supposed to be some
> system wide configuration at boot time, we should just add a config
> option to the kernel and let it be overridden by module parameter.
>
> --
> Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>
>



-- 
Cheers,
Alex Hung

--e89a8ff250be7fa83b04e3e1f86d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">Hi Matthew,<br><br></div><div class=3D"gmail_default" style=3D"=
font-family:verdana,sans-serif">The scenario will be to have an user-applic=
ation to listen to the mute key event, compare to hardware mute against OS =
mute, and sync both mute. When the application is loaded, it can use this i=
nterface to enable it; when it is unloaded it can disable it.<br>
<br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-se=
rif">A config option is also a good idea. I will develop another patch.<br>=
<br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-se=
rif">
Cheers,<br>Alex Hung<br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif"><br></div></div><div class=3D"gmail_extra"><br><br=
><div class=3D"gmail_quote">On Wed, Aug 14, 2013 at 1:42 PM, Matthew Garret=
t <span dir=3D"ltr">&lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org" targe=
t=3D"_blank">matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2013-08-14 at 13:4=
0 +0800, Alex Hung wrote:<br>
&gt; Newer Thinkpad models comes with a mute hotkey with a mute led. It als=
o comes<br>
&gt; with ACPI AML functions to control hardware mute + led. The patches ad=
d sysfs<br>
&gt; nodes so it is possible to enable, disable and control from user-space=
.<br>
<br>
</div>What&#39;s expected to use this interface? If it&#39;s supposed to be=
 some<br>
system wide configuration at boot time, we should just add a config<br>
option to the kernel and let it be overridden by module parameter.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Matthew Garrett &lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org">matthew.g=
arrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Cheers,<br>Alex Hung<br></div>
</div>

--e89a8ff250be7fa83b04e3e1f86d--


--===============4828216485645633505==
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
--===============4828216485645633505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============4828216485645633505==--
