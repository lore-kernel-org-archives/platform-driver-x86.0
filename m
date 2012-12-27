From: Richard Hartmann <richih.mailinglist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers/platform/x86/thinkpad_acpi.c:
	Handle HKEY event 0x6040
Date: Thu, 27 Dec 2012 14:14:43 +0100
Message-ID: <CAD77+gTj+EvuOTU9SZBXOv92YmBdy3EgH9vHwypeFtAJY6+Eyw@mail.gmail.com>
References: <1356543973-18459-1-git-send-email-richih.mailinglist@gmail.com>
	<20121227103843.GB7894@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1232563585559858204=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20121227103843.GB7894-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

--===============1232563585559858204==
Content-Type: multipart/alternative; boundary=bcaec553fde0bf582504d1d555a1

--bcaec553fde0bf582504d1d555a1
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 27, 2012 at 11:38 AM, Henrique de Moraes Holschuh <
hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org> wrote:


> /* fallthrough */
>
[...]

> and letting it proceed to the TP_HKEY_EV_KEY_NUMLOCK block.
>

OK.


Also, do we have any confirmed reports about the lid switch
> causing event 0x6040?  It doesn't look right... the comment
> might need to be updated.
>

I could not reproduce it on my X220. Would you prefer even stronger wording
or should I get of it entirely?


-- 
Richard

--bcaec553fde0bf582504d1d555a1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Dec 27, 2012 at 11:38 AM, Henrique de Moraes Holsc=
huh <span dir=3D"ltr">&lt;<a href=3D"mailto:hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" target=3D"_blan=
k">hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div =
class=3D"gmail_quote">

<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex">/* fallthrough */<br></blockquote><div>[.=
..]=C2=A0</div>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">and letting it proceed to the TP_HKEY_EV_KEY_NUMLOCK block=
.<br>

</blockquote><div><br></div><div>OK.=C2=A0=C2=A0</div><div><br></div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex">


Also, do we have any confirmed reports about the lid switch<br>
causing event 0x6040? =C2=A0It doesn&#39;t look right... the comment<br>
might need to be updated.<br></blockquote><div><br></div><div style>I could=
 not reproduce it on my X220. Would you prefer even stronger wording or sho=
uld I get of it entirely?</div><div style><br></div></div><div><br></div>

-- <br>Richard
</div></div>

--bcaec553fde0bf582504d1d555a1--


--===============1232563585559858204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Master Visual Studio, SharePoint, SQL, ASP.NET, C# 2012, HTML5, CSS,
MVC, Windows 8 Apps, JavaScript and much more. Keep your skills current
with LearnDevNow - 3,200 step-by-step video tutorials by Microsoft
MVPs and experts. ON SALE this month only -- learn more at:
http://p.sf.net/sfu/learnmore_122712
--===============1232563585559858204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============1232563585559858204==--
