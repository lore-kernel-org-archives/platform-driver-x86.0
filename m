From: Richard Hartmann <richih.mailinglist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers/platform/x86/thinkpad_acpi.c:
 Handle HKEY event 0x6040
Date: Sun, 30 Dec 2012 17:25:35 +0100
Message-ID: <CAD77+gROHKXOBDAy8A4sLnzSnZXTz-KKomk4nqrEfapjNo03vA@mail.gmail.com>
References: <CAD77+gROUfVX=9LPZc6_jf=2Bc_iaf5FW5Z2efwESzORNrq9dQ@mail.gmail.com>
	<1356817910-20890-1-git-send-email-richih.mailinglist@gmail.com>
	<20121230020008.GA24121@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6669642816924506954=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20121230020008.GA24121-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
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

--===============6669642816924506954==
Content-Type: multipart/alternative; boundary=bcaec553fde0d65e3204d2145908

--bcaec553fde0d65e3204d2145908
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 30, 2012 at 3:00 AM, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org
> wrote:


> Acked-by: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
>

Thanks for the two ACKs.

Just to make sure: From how I read the (outdated) Copyright section, you
are the maintainer of thinkpad_acpi and thus will copy over the ACKs into
my commit message, merge, and forward into what will become 3.9 at some
point, correct?


Richard

--bcaec553fde0d65e3204d2145908
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Sun, Dec 30, 2012 at 3:00 AM=
, Henrique de Moraes Holschuh <span dir=3D"ltr">&lt;<a href=3D"mailto:hmh@h=
mh.eng.br" target=3D"_blank">hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org</a>&gt;</span> wrote:<br><div c=
lass=3D"gmail_quote">

<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Acked-by: Henrique de Morae=
s Holschuh &lt;<a href=3D"mailto:hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org">hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org</a>&gt;<br>=
</blockquote>

<div><br></div><div style>Thanks for the two ACKs.</div><div style><br></di=
v><div style>Just to make sure: From how I read the (outdated) Copyright se=
ction, you are the maintainer of thinkpad_acpi and thus will copy over the =
ACKs into my commit message, merge, and forward into what will become 3.9 a=
t some point, correct?</div>

<div style><br></div><div style><br></div><div style>Richard</div></div></d=
iv></div>

--bcaec553fde0d65e3204d2145908--


--===============6669642816924506954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Master Visual Studio, SharePoint, SQL, ASP.NET, C# 2012, HTML5, CSS,
MVC, Windows 8 Apps, JavaScript and much more. Keep your skills current
with LearnDevNow - 3,200 step-by-step video tutorials by Microsoft
MVPs and experts. ON SALE this month only -- learn more at:
http://p.sf.net/sfu/learnmore_123012
--===============6669642816924506954==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============6669642816924506954==--
