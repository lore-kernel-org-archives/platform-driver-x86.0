From: Darren Hart <dvhart@infradead.org>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 18 Dec 2015 16:02:53 -0800
Message-ID: <20151219000253.GA7244@malice.jf.intel.com>
References: <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl>
 <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl>
 <20151216093057.GQ13531@pali>
 <56713CFE.8090201@redhat.com>
 <20151217080510.GA3534@eudyptula.hq.kempniu.pl>
 <567284E7.3050103@redhat.com>
 <20151217184741.GG13531@pali>
 <567304EB.6000905@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:32888 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751422AbbLSAC6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Dec 2015 19:02:58 -0500
Content-Disposition: inline
In-Reply-To: <567304EB.6000905@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Thu, Dec 17, 2015 at 07:54:35PM +0100, Hans de Goede wrote:
> Hi,
>=20
> On 17-12-15 19:47, Pali Roh=E1r wrote:
> >Hi Hans! See my comments below about your patches.

=2E..

> >>@@ -159,7 +157,8 @@ static void dell_wmi_process_key(int reported_k=
ey)
> >>
> >>  	/* Don't report brightness notifications that will also come via=
 ACPI */
> >>  	if ((key->keycode =3D=3D KEY_BRIGHTNESSUP ||
> >>-	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) && acpi_video)
> >>+	     key->keycode =3D=3D KEY_BRIGHTNESSDOWN) &&
> >>+	    acpi_video_handles_brightness_key_presses())
> >
> >I do not like this, because that function uses mutex and is called e=
very
> >time when brightness key event is received by wmi notify handler.
>=20
> Right and this is going to happen 1000-s of times a second so is
> really going to be a performance problem (not).
>=20
> We cannot cache the return value as was being done before because it
> can change during startup depending in module loading order (the old
> code actually got this somewhat wrong), and taking a mutex in a code-=
path
> which gets executed only once a second tops is really a non issue.

Right, this is not a hot path, so the mutex is, indeed, not an issue.

--=20
Darren Hart
Intel Open Source Technology Center
