From: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH v3] eeepc-laptop: simplify parse_arg()
Date: Wed, 17 Sep 2014 23:39:34 +0200
Message-ID: <20140917213934.GC4432@gmail.com>
References: <7288841.ayNsq2yeGO@vostro.rjw.lan>
 <1410252608.22255.5.camel@x220>
 <20140910033304.GB39541@vmdeb7>
 <CAH6sp9NtLDG4AvpTF7KzxwxVhrj8ZzNLugwoU5=YrLp65AptQQ@mail.gmail.com>
 <20140910164916.GA48285@vmdeb7>
 <1410379520.11097.18.camel@x220>
 <20140911223739.GB18425@vmdeb7>
 <20140916234543.GA22408@vmdeb7>
 <1410980571.10248.6.camel@x220>
 <20140917203510.GA12682@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f49.google.com ([74.125.82.49]:62984 "EHLO
	mail-wg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932170AbaIQVji (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Sep 2014 17:39:38 -0400
Content-Disposition: inline
In-Reply-To: <20140917203510.GA12682@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Paul Bolle <pebolle@tiscali.nl>, Corentin Chary <corentin.chary@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Garrett <matthew.garrett@nebula.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 17, 2014 at 01:35:10PM -0700, Darren Hart wrote:
> On Wed, Sep 17, 2014 at 09:02:51PM +0200, Paul Bolle wrote:
> > parse_arg() has three possible return values:
> >     -EINVAL if sscanf(), in short, fails;
> >     zero if "count" is zero; and
> >     "count" in all other cases
> >=20
> > But "count" will never be zero. See, parse_arg() is called by the
> > various store functions. And the callchain of these functions start=
s
> > with sysfs_kf_write(). And that function checks for a zero "count".=
 So
> > we can stop checking for a zero "count", drop the "count" argument
> > entirely, and transform parse_arg() into a function that returns ze=
ro on
> > success or a negative error. That, in turn, allows to make those st=
ore
> > functions just return "count" on success. The net effect is that th=
e
> > code becomes a bit easier to understand.
> >=20
> > A nice side effect is that this GCC warning is silenced too:
> >     drivers/platform/x86/eeepc-laptop.c: In function =E2=80=98store=
_sys_acpi=E2=80=99:
> >     drivers/platform/x86/eeepc-laptop.c:279:10: warning: =E2=80=98v=
alue=E2=80=99 may be used uninitialized in this function [-Wmaybe-unini=
tialized]
> >       int rv, value;
> >=20
> > Which is, of course, the reason to have a look at parse_arg().
> >=20
> > Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> > ---
> > Still build tested only, but now on top of v3.17-rc5. Has Frans tes=
ted
> > writing zero length values to these sysfs files?
>=20
> Frans, can you confirm testing when you get a chance please?

Tested. Looks OK to me.

=46rans
