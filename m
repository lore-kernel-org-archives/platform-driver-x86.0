From: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH 0/2] add sysfs for acpi interfaces of
	thinkpad hardware mute
Date: Wed, 14 Aug 2013 14:15:04 +0800
Message-ID: <CAJ=jquYAohZ3qSABKfkMV4wDmbW5s=ynnsjP4vT=n_CAAaJy1Q@mail.gmail.com>
References: <1376458802-11923-1-git-send-email-alex.hung@canonical.com>
	<1376458937.30031.1.camel@x230>
	<CAJ=jqua8STZQideGbQTDh2W8iHcF4J9OJAC5tw-bkdBLLzsP2A@mail.gmail.com>
	<1376459647.30031.2.camel@x230>
	<CAJ=jqub1sRSzBRv_R6soDVAydRL+5nmA9-pMC4E+sgXhP6tbPw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6227185993766436313=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <CAJ=jqub1sRSzBRv_R6soDVAydRL+5nmA9-pMC4E+sgXhP6tbPw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

--===============6227185993766436313==
Content-Type: multipart/alternative; boundary=047d7b47207842cf4a04e3e247fc

--047d7b47207842cf4a04e3e247fc
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 14, 2013 at 2:11 PM, Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:

> We are seeing bugs that mute led is out-of-sync with OS's mute.
> Steps to duplicate:
> 1. Press mute hotkey - it generates scancode and turns on mute led
> 2. Unmute by desktop application.
>
> Expected result: System is un-muted and led is turned off
> Actual result: System, depending on models, can be muted or unmuted. The
> led is always on.
>
> One solution to the problem is to disable hardware mute. Mute hotkey will
> only generate scancode but led will not be toggled.
>

The above can be addressed by a kernel parameter during boot time.



>
> The other solution will be to develop an application or improve existing
> desktop daemons to handle the event as previously discussed, but it will
> need to have the sysfs nodes for mute/led controls.
>
>
> On Wed, Aug 14, 2013 at 1:54 PM, Matthew Garrett <
> matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org> wrote:
>
>> On Wed, 2013-08-14 at 13:53 +0800, Alex Hung wrote:
>> > Hi Matthew,
>> >
>> >
>> > The scenario will be to have an user-application to listen to the mute
>> > key event, compare to hardware mute against OS mute, and sync both
>> > mute. When the application is loaded, it can use this interface to
>> > enable it; when it is unloaded it can disable it.
>>
>> Is there any reason you'd want this rather than just having it generate
>> a scancode and be under userspace control?
>>
>> --
>> Matthew Garrett <matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org>
>>
>
>
>
> --
> Cheers,
> Alex Hung
>



-- 
Cheers,
Alex Hung

--047d7b47207842cf4a04e3e247fc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quo=
te">On Wed, Aug 14, 2013 at 2:11 PM, Alex Hung <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org" target=3D"_blank">alex.hung@canonical.=
com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-family:v=
erdana,sans-serif">We are seeing bugs that mute led is out-of-sync with OS&=
#39;s mute. <br>
</div><div style=3D"font-family:verdana,sans-serif">
Steps to duplicate:<br></div><div style=3D"font-family:verdana,sans-serif">=
1. Press mute hotkey - it generates scancode and turns on mute led<br></div=
><div style=3D"font-family:verdana,sans-serif">
2. Unmute by desktop application. <br></div><div style=3D"font-family:verda=
na,sans-serif"><br></div><div style=3D"font-family:verdana,sans-serif">Expe=
cted result: System is un-muted and led is turned off<br>
</div><div style=3D"font-family:verdana,sans-serif">Actual result: System, =
depending on models, can be muted or unmuted. The led is always on.<br><br>=
</div><div style=3D"font-family:verdana,sans-serif">
One solution to the problem is to disable hardware mute. Mute hotkey will o=
nly generate scancode but led will not be toggled.<br></div></div></blockqu=
ote><div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if">
<br></div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-se=
rif">The above can be addressed by a kernel parameter during boot time. <br=
></div><br>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div dir=3D"ltr"><div style=3D"font-family:verdana,sans-serif"><br></div><d=
iv style=3D"font-family:verdana,sans-serif">The other solution will be to d=
evelop an application or improve existing desktop daemons to handle the eve=
nt as previously discussed, but it will need to have the sysfs nodes for mu=
te/led controls.<br>

</div></div><div class=3D"gmail_extra"><div><div class=3D"h5"><br><br><div =
class=3D"gmail_quote">On Wed, Aug 14, 2013 at 1:54 PM, Matthew Garrett <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org" target=3D"_=
blank">matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On Wed, 2013-08-14 at 13:53 +0800, Alex=
 Hung wrote:<br>
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
<span><font color=3D"#888888"><br>
--<br>
Matthew Garrett &lt;<a href=3D"mailto:matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org" target=3D=
"_blank">matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
</font></span></blockquote></div><br><br clear=3D"all"><br></div></div><spa=
n class=3D"HOEnZb"><font color=3D"#888888">-- <br><div dir=3D"ltr">Cheers,<=
br>Alex Hung<br></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Cheers=
,<br>Alex Hung<br></div>
</div></div>

--047d7b47207842cf4a04e3e247fc--


--===============6227185993766436313==
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
--===============6227185993766436313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============6227185993766436313==--
