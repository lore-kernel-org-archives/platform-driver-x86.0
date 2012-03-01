From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH v2] platform/x86: Add driver for Apple gmux device
Date: Thu, 1 Mar 2012 08:53:28 -0600
Message-ID: <20120301145328.GA27955@ubuntu-macmini>
References: <1329921457-26887-1-git-send-email-seth.forshee@canonical.com>
 <CACxGe6sAcubJvc6LaVRxt+XzBz0jKpxSAPLdOvXkQz=NkXG5vQ@mail.gmail.com>
 <20120229175327.GA20565@ubuntu-macmini>
 <CACxGe6uc+LZjuMLS5DZELzAsHsnhObL6mdPzdMnNVbfriTfNwg@mail.gmail.com>
 <20120229195042.GB20565@ubuntu-macmini>
 <CACxGe6tK85FgYAT-1JQbLxEhRS34v2MPsx8urXADi6v2FnQ2gw@mail.gmail.com>
 <20120229220809.GC20565@ubuntu-macmini>
 <CACxGe6tLCYhuiAH1Q1PoWTzFLmZ0watw==0g76J1hS-Qurzyrw@mail.gmail.com>
 <20120229225650.GD20565@ubuntu-macmini>
 <CAHR064ikTm5dD-R6JE84XUTzNH5fRz9Xi4uKaK9cMn=MkrxCHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51482 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752442Ab2CAOxc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 1 Mar 2012 09:53:32 -0500
Content-Disposition: inline
In-Reply-To: <CAHR064ikTm5dD-R6JE84XUTzNH5fRz9Xi4uKaK9cMn=MkrxCHg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 01, 2012 at 10:19:58AM +0100, Corentin Chary wrote:
> On Wed, Feb 29, 2012 at 11:56 PM, Seth Forshee
> <seth.forshee@canonical.com> wrote:
> > On Wed, Feb 29, 2012 at 04:32:28PM -0600, Grant Likely wrote:
> >> On Wed, Feb 29, 2012 at 4:08 PM, Seth Forshee
> >> <seth.forshee@canonical.com> wrote:
> >> > On Wed, Feb 29, 2012 at 03:23:20PM -0600, Grant Likely wrote:
> >> >> On Wed, Feb 29, 2012 at 1:50 PM, Seth Forshee
> >> >> <seth.forshee@canonical.com> wrote:
> >> >> > On Wed, Feb 29, 2012 at 12:43:23PM -0600, Grant Likely wrote:
> >> >> >> On Wed, Feb 29, 2012 at 11:53 AM, Seth Forshee
> >> >> >> <seth.forshee@canonical.com> wrote:
> >> >> >> > On Wed, Feb 29, 2012 at 11:46:39AM -0600, Grant Likely wro=
te:
> >> >> >> >> On Wed, Feb 22, 2012 at 8:37 AM, Seth Forshee
> >> >> >> >> <seth.forshee@canonical.com> wrote:
> >> >> >> >> > Apple laptops with hybrid graphics have a device named =
gmux that
> >> >> >> >> > controls the muxing of the LVDS panel between the GPUs =
as well as screen
> >> >> >> >> > brightness. This driver adds support for the gmux devic=
e. Only backlight
> >> >> >> >> > control is supported initially.
> >> >> >> >> >
> >> >> >> >> > Signed-off-by: Seth Forshee <seth.forshee@canonical.com=
>
> >> >> >> >>
> >> >> >> >> Works for me.
> >> >> >> >>
> >> >> >> >> Tested-by: Grant Likely <grant.likely@secretlab.ca>
> >> >> >> >>
> >> >> >> >> Now I just need to figure out how to get the desktop back=
light widget
> >> >> >> >> to use gmux_backlight instead of acpi_video0...
> >> >> >> >
> >> >> >> > The easy way is to pass acpi_backlight=3Dvendor to the ker=
nel, then you
> >> >> >> > won't have acpi_vidoe0.
> >> >> >>
> >> >> >> That did it, thanks. =C2=A0I'm assume something is in the wo=
rks to set it
> >> >> >> up automatically?
> >> >> >
> >> >> > Not that I'm aware of. A number machines have this problem, t=
hat the
> >> >> > standard ACPI backlight interfaces are implemented but don't =
work. This
> >> >> > generally isn't detectable in software; with the Apples at le=
ast
> >> >> > everything looks like it's working except that the brightness=
 doesn't
> >> >> > change (but not all Apple laptops are affected, so qurking ba=
sed on
> >> >> > manufacturer wouldn't work). All we're left with is DMI quirk=
ing, which
> >> >> > isn't practical. Maybe we could add something so a platform d=
river can
> >> >> > tell acpi_video that it knows the ACPI backlight doesn't work=
, but I
> >> >> > think on some platforms that still is going to be based off o=
f DMI
> >> >> > information.
> >> >>
> >> >> blacklisting based on specific product name (ie. MacBookPro8,*)=
 or
> >> >> machine model is probably the best. =C2=A0It wouldn't be the fi=
rst
> >> >> blacklist in the linux kernel.
> >> >
> >> > I think the blacklist would have to be against specific product =
names.
> >> > For example, the MacBook Pro 8,1 has a working acpi_video backli=
ght and
> >> > no gmux_backlight, the 8,2 has both but only gmux_backlight work=
s, and I
> >> > suspect the 8,3 is the same as the 8,2.
> >>
> >> I have the 8,3, and my testing confirms that.
> >>
> >> > We'd probably end up with an
> >> > entry in the blacklist for every single model whose acpi_video b=
acklight
> >> > doesn't work, adding entries for each new generation of MacBooks=
=2E
> >> >
> >> > And if we start blacklisting Macs we'd have start doing it for o=
ther
> >> > machines too, I guess. From what I've seen, open-ended blacklist=
s like
> >> > this get nacked pretty consistently nowadays.
> >>
> >> An alternative would be to blacklist or disable acpi0_backlight wh=
en
> >> the apple-gmux driver loads. =C2=A0I don't know how acceptable tha=
t is, but
> >> I also don't have much sympathy for nacking blacklists if there is=
n't
> >> a viable alternative.
> >
> > Yes, that's one idea I was thinking about. For all the machines I'v=
e
> > been able to get tested, if the gmux is present then it can control=
 the
> > backlight and acpi_video cannot, so that approach is reasonable for
> > Macs.
> >
> > There are quite a few machines in this situation though, and whatev=
er
> > solution is arrived at should be flexible enough to work beyond jus=
t
> > Macs. I'll try to find some time soon to explore this further and s=
ee if
> > I can come up with something.
>=20
> Old Samsung laptops have the same issue, and I ended up patching
> drivers/acpi/video_detect.c (check "[PATCH] ACPI / Video: blacklist
> some samsung laptops").
> Doing it in the vendor module is complicated, since, it will be loade=
d
> after the acpi video module most of the time, and that means addding
> acpi_backlight, then removing it, which will probably confuse
> usespace.
> Patching drivers/acpi/video_detect.c seems safer.

I certainly agree that it's the easiest solution, so maybe it is worth
trying first and seeing what the response is. But last I saw the patch
you're referring to hadn't been merged or even commented on yet. And I
can't help but note that you included as justification for the patch
that the acpi_video backlight works on newer Samsungs so the list
wouldn't grow ;)

Beyond Samsung and Apple I know that there are also Toshibas that suffe=
r
from this, and judging by the list from older versions of g-s-d [1] I'd
say there may well be others.

Seth

[1] http://git.gnome.org/browse/gnome-settings-daemon/tree/plugins/powe=
r/gsd-backlight-helper.c?id=3DGNOME_SETTINGS_DAEMON_3_2_2#n50
