From: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 0/2] add sysfs for acpi interfaces of
	thinkpad hardware mute
Date: Wed, 14 Aug 2013 14:11:12 +0800
Message-ID: <CAJ=jqub1sRSzBRv_R6soDVAydRL+5nmA9-pMC4E+sgXhP6tbPw@mail.gmail.com>
References: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
	<1376458937.30031.1.camel@x230>
	<CAJ=jqua8STZQideGbQTDh2W8iHcF4J9OJAC5tw-bkdBLLzsP2A@mail.gmail.com>
	<1376459647.30031.2.camel@x230>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4667823545203421501=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1376459647.30031.2.camel@x230>
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

--===============4667823545203421501==
Content-Type: multipart/alternative; boundary=089e0158b00c6e173c04e3e239d5

--089e0158b00c6e173c04e3e239d5
Content-Type: text/plain; charset=ISO-8859-1

We are seeing bugs that mute led is out-of-sync with OS's mute.
Steps to duplicate:
1. Press mute hotkey - it generates scancode and turns on mute led
2. Unmute by desktop application.

Expected result: System is un-muted and led is turned off
Actual result: System, depending on models, can be muted or unmuted. The
led is always on.

One solution to the problem is to disable hardware mute. Mute hotkey will
only generate scancode but led will not be toggled.

The other solution will be to develop an application or improve existing
desktop daemons to handle the event as previously discussed, but it will
need to have the sysfs nodes for mute/led controls.


On Wed, Aug 14, 2013 at 1:54 PM, Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org
> wrote:

> On Wed, 2013-08-14 at 13:53 +0800, Alex Hung wrote:
> > Hi Matthew,
> >
> >
> > The scenario will be to have an user-application to listen to the mute
> > key event, compare to hardware mute against OS mute, and sync both
> > mute. When the application is loaded, it can use this interface to
> > enable it; when it is unloaded it can disable it.
>
> Is there any reason you'd want this rather than just having it generate
> a scancode and be under userspace control?
>
> --
> Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>
>



-- 
Cheers,
Alex Hung

--089e0158b00c6e173c04e3e239d5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">We are seeing bugs that mute led is out-of-sync with OS&#39;s m=
ute. <br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sa=
ns-serif">
Steps to duplicate:<br></div><div class=3D"gmail_default" style=3D"font-fam=
ily:verdana,sans-serif">1. Press mute hotkey - it generates scancode and tu=
rns on mute led<br></div><div class=3D"gmail_default" style=3D"font-family:=
verdana,sans-serif">
2. Unmute by desktop application. <br></div><div class=3D"gmail_default" st=
yle=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:verdana,sans-serif">Expected result: System is un-m=
uted and led is turned off<br>
</div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"=
>Actual result: System, depending on models, can be muted or unmuted. The l=
ed is always on.<br><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:verdana,sans-serif">
One solution to the problem is to disable hardware mute. Mute hotkey will o=
nly generate scancode but led will not be toggled.<br><br></div><div class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif">The other solut=
ion will be to develop an application or improve existing desktop daemons t=
o handle the event as previously discussed, but it will need to have the sy=
sfs nodes for mute/led controls.<br>
</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">O=
n Wed, Aug 14, 2013 at 1:54 PM, Matthew Garrett <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org" target=3D"_blank">matthew.garrett@=
nebula.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, 2013-08-14 at 13:5=
3 +0800, Alex Hung wrote:<br>
&gt; Hi Matthew,<br>
&gt;<br>
&gt;<br>
&gt; The scenario will be to have an user-application to listen to the mute=
<br>
&gt; key event, compare to hardware mute against OS mute, and sync both<br>
&gt; mute. When the application is loaded, it can use this interface to<br>
&gt; enable it; when it is unloaded it can disable it.<br>
<br>
</div>Is there any reason you&#39;d want this rather than just having it ge=
nerate<br>
a scancode and be under userspace control?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Matthew Garrett &lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org">matthew.g=
arrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Cheers,<br>Alex Hung<br></div>
</div>

--089e0158b00c6e173c04e3e239d5--


--===============4667823545203421501==
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
--===============4667823545203421501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============4667823545203421501==--
