From: Shuduo Sang <shuduo.sang-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: [PATCH V4 RESEND] Support Thinkpad X1 Carbon
	2nd gen's adaptive keyboard
Date: Tue, 1 Apr 2014 08:32:06 +0800
Message-ID: <CA+BAWBQV4d3ZdocJvdJBVzM6E9qhZs=FYe_BKfx3ffCzUvBFzQ@mail.gmail.com>
References: <531EECF9.1040600@canonical.com>
	<1396288189.17715.101062725.0503948F@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8312143081284735287=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1396288189.17715.101062725.0503948F-2RFepEojUI2N1INw9kWLP6GC3tUn3ZHUQQ4Iyu8u01E@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: matthew.garrett-05XSO3Yj/JvQT0dZR+AlfA@public.gmane.org, Bruce Ma <bruce.ma-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

--===============8312143081284735287==
Content-Type: multipart/alternative; boundary=001a1134044e94910f04f5f04e65

--001a1134044e94910f04f5f04e65
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 1, 2014 at 1:49 AM, Henrique de Moraes Holschuh
<hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>wrote:

> On Tue, Mar 11, 2014, at 8:01, Shuduo Sang wrote:
> > Resend patch V4. Support Thinkpad X1 Carbon 2nd generation's adaptive
> > keyboard.
> >
> > Hi Henrique, could you please have a chance to review it?
>
> I am unable to do a full review right now, but we can always adjust
> minor details of the feature with later patches and the previous reviews
> did help clean up the feature.
>
> However: as far as I am concerned, this is an experimental feature until
> it matures for a while.  I'd rather we plug this somehow to the
> thinkpad-acpi input map, for example.
>
>
Yes, I tried to use input map but worry old logic need change many since
the new event number
is far to old. The functionality is verified well and get official
recognised by Lenovo.


> Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
>

There are two more patches for X1 carbon adaptive keyboard need review.

[PATCH] save and restore adaptive keyboard mode for suspend and, resume
[PATCH] support thinkpad HKEY interface version 0x200

They are verified by me and other X1 carbon users.

Thanks Henrique.



>
> --
>   "One disk to rule them all, One disk to find them. One disk to bring
>   them all and in the darkness grind them. In the Land of Redmond
>   where the shadows lie." -- The Silicon Valley Tarot
>   Henrique Holschuh
>

--001a1134044e94910f04f5f04e65
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Apr 1, 2014 at 1:49 AM, Henrique de Moraes Holschuh <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" target=3D"_blank">hmh@hmh.=
eng.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"">On Tue, Mar 11, 2014, at 8:01, Shuduo Sang=
 wrote:<br>


&gt; Resend patch V4. Support Thinkpad X1 Carbon 2nd generation&#39;s adapt=
ive<br>
&gt; keyboard.<br>
&gt;<br>
&gt; Hi Henrique, could you please have a chance to review it?<br>
<br>
</div>I am unable to do a full review right now, but we can always adjust<b=
r>
minor details of the feature with later patches and the previous reviews<br=
>
did help clean up the feature.<br>
<br>
However: as far as I am concerned, this is an experimental feature until<br=
>
it matures for a while. =A0I&#39;d rather we plug this somehow to the<br>
thinkpad-acpi input map, for example.<br>
<div class=3D""><div class=3D"h5"><br></div></div></blockquote><div><br></d=
iv><div>Yes, I tried to use input map but worry old logic need change many =
since the new event number</div><div>is far to old. The functionality is ve=
rified well and get official recognised by Lenovo.</div>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div class=3D""><div class=3D"h5">
Acked-by: Henrique de Moraes Holschuh &lt;<a href=3D"mailto:hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org"=
>hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org</a>&gt;<br></div></div></blockquote><div><br></div><div>The=
re are two more patches for X1 carbon adaptive keyboard need review.=A0<br>

</div><div><br></div><div>[PATCH] save and restore adaptive keyboard mode f=
or suspend and, resume<br></div><div>[PATCH] support thinkpad HKEY interfac=
e version 0x200<br></div><div><br></div><div>They are verified by me and ot=
her X1 carbon users.</div>

<div><br></div><div>Thanks Henrique.<br></div><div><br></div><div>=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">

<div class=3D""><div class=3D"h5">
<br>
</div></div><span class=3D""><font color=3D"#888888">--<br>
=A0 &quot;One disk to rule them all, One disk to find them. One disk to bri=
ng<br>
=A0 them all and in the darkness grind them. In the Land of Redmond<br>
=A0 where the shadows lie.&quot; -- The Silicon Valley Tarot<br>
=A0 Henrique Holschuh<br>
</font></span></blockquote></div><br></div></div>

--001a1134044e94910f04f5f04e65--


--===============8312143081284735287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------

--===============8312143081284735287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============8312143081284735287==--
