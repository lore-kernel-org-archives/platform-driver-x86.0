From: Richard Hartmann <richih.mailinglist-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drivers/platform/x86/thinkpad_acpi.c:
 Handle HKEY event 0x6040
Date: Fri, 28 Dec 2012 12:44:06 +0100
Message-ID: <CAD77+gROUfVX=9LPZc6_jf=2Bc_iaf5FW5Z2efwESzORNrq9dQ@mail.gmail.com>
References: <1356543973-18459-1-git-send-email-richih.mailinglist@gmail.com>
	<20121227103843.GB7894@khazad-dum.debian.net>
	<CAD77+gTj+EvuOTU9SZBXOv92YmBdy3EgH9vHwypeFtAJY6+Eyw@mail.gmail.com>
	<20121228101013.GA15327@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5311513159511503523=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20121228101013.GA15327-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
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

--===============5311513159511503523==
Content-Type: multipart/alternative; boundary=bcaec54eeaea86dfdd04d1e82fd9

--bcaec54eeaea86dfdd04d1e82fd9
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 28, 2012 at 11:10 AM, Henrique de Moraes Holschuh <
hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org> wrote:


> If you cannot reproduce it, we can shalk it up to user error or to
> corrected
> firmware bug, so you can remove any mention of lid open/close to event
> 6040...
>

OK, great.

After some more testing, I suspect he closed the lid and then
(un)plugged/docked.


-- 
Richard

--bcaec54eeaea86dfdd04d1e82fd9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Fri, Dec 28, 2012 at 11:10 AM, Henrique de Moraes Holsc=
huh <span dir=3D"ltr">&lt;<a href=3D"mailto:hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" target=3D"_blan=
k">hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div =
class=3D"gmail_quote">

<div>=C2=A0=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">If you cannot reprodu=
ce it, we can shalk it up to user error or to corrected<br>
firmware bug, so you can remove any mention of lid open/close to event<br>
6040...<br></blockquote><div><br></div><div style>OK, great.</div><div styl=
e><br></div><div style>After some more testing, I suspect he closed the lid=
 and then (un)plugged/docked.</div><div style><br></div></div><div><br>

</div>-- <br>Richard
</div></div>

--bcaec54eeaea86dfdd04d1e82fd9--


--===============5311513159511503523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Master HTML5, CSS3, ASP.NET, MVC, AJAX, Knockout.js, Web API and
much more. Get web development skills now with LearnDevNow -
350+ hours of step-by-step video tutorials by Microsoft MVPs and experts.
SALE $99.99 this month only -- learn more at:
http://p.sf.net/sfu/learnmore_122812
--===============5311513159511503523==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============5311513159511503523==--
