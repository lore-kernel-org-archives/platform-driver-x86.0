From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3] eeepc-laptop: simplify parse_arg()
Date: Wed, 17 Sep 2014 13:14:36 -0700
Message-ID: <20140917201435.GA8615@vmdeb7>
References: <20140906021757.GA9197@vmdeb7>
 <7288841.ayNsq2yeGO@vostro.rjw.lan>
 <1410252608.22255.5.camel@x220>
 <20140910033304.GB39541@vmdeb7>
 <CAH6sp9NtLDG4AvpTF7KzxwxVhrj8ZzNLugwoU5=YrLp65AptQQ@mail.gmail.com>
 <20140910164916.GA48285@vmdeb7>
 <1410379520.11097.18.camel@x220>
 <20140911223739.GB18425@vmdeb7>
 <20140916234543.GA22408@vmdeb7>
 <1410980571.10248.6.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47260 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756085AbaIQUOn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Sep 2014 16:14:43 -0400
Content-Disposition: inline
In-Reply-To: <1410980571.10248.6.camel@x220>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Corentin Chary <corentin.chary@gmail.com>, Frans Klaver <fransklaver@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Garrett <matthew.garrett@nebula.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 17, 2014 at 09:02:51PM +0200, Paul Bolle wrote:
> parse_arg() has three possible return values:
>     -EINVAL if sscanf(), in short, fails;
>     zero if "count" is zero; and
>     "count" in all other cases
>=20
> But "count" will never be zero. See, parse_arg() is called by the
> various store functions. And the callchain of these functions starts
> with sysfs_kf_write(). And that function checks for a zero "count". S=
o
> we can stop checking for a zero "count", drop the "count" argument
> entirely, and transform parse_arg() into a function that returns zero=
 on
> success or a negative error. That, in turn, allows to make those stor=
e
> functions just return "count" on success. The net effect is that the
> code becomes a bit easier to understand.
>=20
> A nice side effect is that this GCC warning is silenced too:
>     drivers/platform/x86/eeepc-laptop.c: In function =E2=80=98store_s=
ys_acpi=E2=80=99:
>     drivers/platform/x86/eeepc-laptop.c:279:10: warning: =E2=80=98val=
ue=E2=80=99 may be used uninitialized in this function [-Wmaybe-uniniti=
alized]
>       int rv, value;
>=20
> Which is, of course, the reason to have a look at parse_arg().
>=20
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> ---
> Still build tested only, but now on top of v3.17-rc5. Has Frans teste=
d
> writing zero length values to these sysfs files?
>=20
> v3: store_sys_acpi() again returns -EIO if set_acpi() fails.
>=20
> v2: let store_sys_acpi() return whatever error set_acpi() returns
> instead of remapping it to EIO. The new line about that in the commit
> explanation is silly, but I couldn't come up with a better explanatio=
n.

Queued, thanks.

--=20
Darren Hart
Intel Open Source Technology Center
