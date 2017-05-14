From: Adam Goode <agoode-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] thinkpad_acpi: Add support for
 status (external cover) LED
Date: Sun, 14 May 2017 11:18:03 -0400
Message-ID: <CAOf41Nn+okQww7EwzcaZ0cdPHF_LzD55feQF0nh9rWUZu2RACw@mail.gmail.com>
References: <20170119172132.36029-1-agoode@google.com>
	<20170507163812.GA14896@xo-6d-61-c0.localdomain>
	<20170507234903.GA15137@khazad-dum.debian.net>
	<20170512104315.GC6780@amd>
	<20170512172321.GA16100@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8210133816317762205=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20170512172321.GA16100-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

--===============8210133816317762205==
Content-Type: multipart/alternative; boundary="94eb2c0b8f78463283054f7d740e"

--94eb2c0b8f78463283054f7d740e
Content-Type: text/plain; charset="UTF-8"

Yes, I'll give it a respin "soon" :)


Adam

On Fri, May 12, 2017 at 1:23 PM, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org
> wrote:

> On Fri, 12 May 2017, Pavel Machek wrote:
> > On Sun 2017-05-07 20:49:03, Henrique de Moraes Holschuh wrote:
> > > On Sun, 07 May 2017, Pavel Machek wrote:
> > > > On Thu 2017-01-19 12:21:32, Adam Goode wrote:
> > > > > This allows the control of the red status LED, which is the dot of
> the "i"
> > > > > in the word "ThinkPad" on the outside cover of newer models.
> > > > >
> > > > > In the manual, both this LED and the power LED are referred to as
> > > > > the "system-status indicators" without distinction between the
> two, so
> > > > > I chose "status" as the LED name.
> > > >
> > > > Could we name it something like external_status or something?
> "status" is way too generic.
> > >
> > > "thinkdot" ;-)
> >
> > Sounds good to me ;-).
>
> Ok.  Adam, care to respin this when you have the time?
>
> --
>   Henrique Holschuh
>

--94eb2c0b8f78463283054f7d740e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I&#39;ll give it a respin &quot;soon&quot; :)<div><br=
></div><div><br></div><div>Adam</div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Fri, May 12, 2017 at 1:23 PM, Henrique de Mora=
es Holschuh <span dir=3D"ltr">&lt;<a href=3D"mailto:hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" target=
=3D"_blank">hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Fri, 12 May 2017, Pavel Machek wrote:<br>
&gt; On Sun 2017-05-07 20:49:03, Henrique de Moraes Holschuh wrote:<br>
&gt; &gt; On Sun, 07 May 2017, Pavel Machek wrote:<br>
&gt; &gt; &gt; On Thu 2017-01-19 12:21:32, Adam Goode wrote:<br>
&gt; &gt; &gt; &gt; This allows the control of the red status LED, which is=
 the dot of the &quot;i&quot;<br>
&gt; &gt; &gt; &gt; in the word &quot;ThinkPad&quot; on the outside cover o=
f newer models.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; In the manual, both this LED and the power LED are refe=
rred to as<br>
&gt; &gt; &gt; &gt; the &quot;system-status indicators&quot; without distin=
ction between the two, so<br>
&gt; &gt; &gt; &gt; I chose &quot;status&quot; as the LED name.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Could we name it something like external_status or something=
? &quot;status&quot; is way too generic.<br>
&gt; &gt;<br>
&gt; &gt; &quot;thinkdot&quot; ;-)<br>
&gt;<br>
&gt; Sounds good to me ;-).<br>
<br>
</span>Ok.=C2=A0 Adam, care to respin this when you have the time?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
=C2=A0 Henrique Holschuh<br>
</font></span></blockquote></div><br></div>

--94eb2c0b8f78463283054f7d740e--


--===============8210133816317762205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
--===============8210133816317762205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============8210133816317762205==--
