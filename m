From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad-acpi: disable alsa volume
 mixer for SL410/SL510
Date: Thu, 6 Oct 2011 15:12:20 -0300
Message-ID: <20111006181220.GA15950@khazad-dum.debian.net>
References: <1300181106-20219-1-git-send-email-keng-yu.lin@canonical.com>
 <20110316185755.GC7918@khazad-dum.debian.net>
 <CADXHx7b36g1+vo9cjuiq7VnjN3LWiwQtgepHjGU1P74ZsdtwQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:48439 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753290Ab1JFSMZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 6 Oct 2011 14:12:25 -0400
Content-Disposition: inline
In-Reply-To: <CADXHx7b36g1+vo9cjuiq7VnjN3LWiwQtgepHjGU1P74ZsdtwQw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Keng-Y=FC?= Lin <kengyu@canonical.com>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On Thu, 06 Oct 2011, Keng-Y=FC Lin wrote:
> On Thu, Mar 17, 2011 at 2:57 AM, Henrique de Moraes Holschuh
> <hmh@hmh.eng.br> wrote:
> > On Tue, 15 Mar 2011, Keng-Yu Lin wrote:
> >> The mute key on SL410/SL510 only works when the alsa volume mixer
> >> is not enabled. This patch makes the alsa volume mixer disabled
> >> on the matched SL410/SL510 EC versions.
> >
> > I'd like more data on this. =A0Is this some sort of weird interacti=
on with
> > userspace, or does the firmware actually changes behaviour when we
> > enable the MUTE HKEY event in the event mask?
>=20
> The firmware does not change its behaviour with the key enabled in th=
e keymask.
> The mute key (and the LED on it) of the two models works good without
> thinkpad_acpi loaded. So in the patch I like to exclude the volume
> control part for the two models.

If the firmware does not change behaviour, doesn't that mean the bug is
elsewhere?

Is the firmware reporting these keys somewhere else (e.g. through the
keyboard)?

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
