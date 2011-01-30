From: Jeff Chua <jeff.chua.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: thinkpad-acpi: fn-f4 issues
Date: Mon, 31 Jan 2011 01:19:16 +0800
Message-ID: <AANLkTikjA=F7Q6zdZ8Gnq57NxBfr2vyU4eshmnZytw-m@mail.gmail.com>
References: <Pine.LNX.4.64.1101251740380.3737@boston.corp.fedex.com>
	<20110125151346.GB14803@khazad-dum.debian.net>
	<AANLkTim9cN8KXx5DVrH_nBzVjnmuYsxOHwP4msBKs=gS@mail.gmail.com>
	<20110126003034.GC25953@khazad-dum.debian.net>
	<AANLkTinazKxNF27m_PkE097hnfZtOqBuAmLZYXydWCpL@mail.gmail.com>
	<20110129175533.GB26442@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4951048368927492020=="
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <20110129175533.GB26442-ZGHd14iZgfaRjzvQDGKj+xxZW9W5cXbT@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>
Cc: platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>, Dominik Kopp <my-cLfUZQbDmUvC3qMLbI8+1w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

--===============4951048368927492020==
Content-Type: multipart/alternative; boundary=90e6ba6e8c96b8ea8b049b137f10

--90e6ba6e8c96b8ea8b049b137f10
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jan 30, 2011 at 1:55 AM, Henrique de Moraes Holschuh <hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org
> wrote:

> On Wed, 26 Jan 2011, Jeff Chua wrote:
>
> > xev reported both up/down. I'm using mplayer and it doesn't see those
> > events.
>
> Now I am confused.  Did you get any xev events for Fn+F4?  Or do you mean
> volume up/down?
>

No event for Fn+F4 with CONFIG_THINKPAD_ACPI_HOTKEY_POLL=y, and Suspend
doesn't work.

With CONFIG_THINKPAD_ACPI_HOTKEY_POLL unset, Syspend works with Fn+F4.

xev reported events when volume up/down are pressed.


> > Mute is working fine.  And on a separate topic, I simply couldn't get the
> > "mic" to work. Alsamixer reported these ...
>
> I wouldn't know what to do about that, but I bet someone on the thinkpad-ml
> does, so maybe you should ask there.  You did check that the mic-mute
> button
> is not active, I assume?
>

There's no option to unmute the mic. I've tried alsamixer, but couldn't find
it there.

Thanks,
Jeff

--90e6ba6e8c96b8ea8b049b137f10
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Sun, Jan 30, 2011 at 1:55 AM, Henriqu=
e de Moraes Holschuh <span dir=3D"ltr">&lt;<a href=3D"mailto:hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org=
" target=3D"_blank">hmh-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">

<div>On Wed, 26 Jan 2011, Jeff Chua wrote:<br>
</div><div><br>
&gt; xev reported both up/down. I&#39;m using mplayer and it doesn&#39;t se=
e those<br>
&gt; events.<br>
<br>
</div>Now I am confused. =A0Did you get any xev events for Fn+F4? =A0Or do =
you mean<br>
volume up/down?<br><div></div></blockquote><div><br>No event for Fn+F4 with=
 CONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy, and Suspend doesn&#39;t work.<br><br=
>With CONFIG_THINKPAD_ACPI_HOTKEY_POLL unset, Syspend works with Fn+F4.<br>
<br>xev reported events when volume up/down are pressed.<br>=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0pt 0.8ex;border-left:1=
px solid rgb(204, 204, 204);padding-left:1ex"><div>

&gt; Mute is working fine. =A0And on a separate topic, I simply couldn&#39;=
t get the<br>
&gt; &quot;mic&quot; to work. Alsamixer reported these ...<br>
<br>
</div>I wouldn&#39;t know what to do about that, but I bet someone on the t=
hinkpad-ml<br>
does, so maybe you should ask there. =A0You did check that the mic-mute but=
ton<br>
is not active, I assume?<br></blockquote><div><br>There&#39;s no option to =
unmute the mic. I&#39;ve tried alsamixer, but couldn&#39;t find it there. <=
br></div><br>Thanks,<br>Jeff<br><br>
</div>

--90e6ba6e8c96b8ea8b049b137f10--


--===============4951048368927492020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

------------------------------------------------------------------------------
Special Offer-- Download ArcSight Logger for FREE (a $49 USD value)!
Finally, a world-class log management solution at an even better price-free!
Download using promo code Free_Logger_4_Dev2Dev. Offer expires 
February 28th, so secure your free ArcSight Logger TODAY! 
http://p.sf.net/sfu/arcsight-sfd2d
--===============4951048368927492020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ibm-acpi-devel mailing list
ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel

--===============4951048368927492020==--
