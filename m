From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH RESEND] fujitsu-laptop: Drop unneeded include
Date: Thu, 20 Mar 2014 09:22:11 +0100
Message-ID: <1395303731.4532.4.camel@chaos.site>
References: <20140319193846.22821b12@endymion.delvare>
	 <1770609.RsqzMFrygU@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45156 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750743AbaCTIWN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Mar 2014 04:22:13 -0400
In-Reply-To: <1770609.RsqzMFrygU@vostro.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Woithe <jwoithe@just42.net>, Matthew Garrett <matthew.garrett@nebula.com>

Hi Rafael,

Le Wednesday 19 March 2014 =C3=A0 23:33 +0100, Rafael J. Wysocki a =C3=A9=
crit :
> On Wednesday, March 19, 2014 07:38:46 PM Jean Delvare wrote:
> > The fujitsu-laptop driver includes <linux/video_output.h> but doesn=
't
> > call any of its functions. Drop the unneeded include to avoid
> > unnecessary driver rebuilds.
> >=20
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Acked-by: Jonathan Woithe <jwoithe@just42.net>
> > Cc: Matthew Garrett <matthew.garrett@nebula.com>
>=20
> Well, thanks, but why didn't you send it to the same CC list as the o=
riginal
> patch set?  This doesn't make it particularly convenient to handle ..=
=2E

Sorry, I resent that one in a hurry and did not put enough thoughts int=
o
it, I'm afraid.

That being said, I don't think it is really a big problem. This is a
minor clean up, obviously correct and needed, so nobody is going to
argue against it. If you are the one applying the patch set then the
only important thing is that you have this extra patch available so tha=
t
you don't break the build.

If anyone else is really interested, well, I have explained the problem
in the other thread so they are at least aware of it, and they can
always contact me (or you) to get the missing piece. If they really
care, that is, which I somehow doubt.

Thanks,
--=20
Jean Delvare
SUSE L3 Support
