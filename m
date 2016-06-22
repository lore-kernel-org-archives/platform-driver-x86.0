From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 0/4] dell-wmi: Changes in WMI event code handling
Date: Wed, 22 Jun 2016 12:31:25 +0200
Message-ID: <20160622103125.GC29844@pali>
References: <1466020153-10877-1-git-send-email-pali.rohar@gmail.com>
 <20160621180617.GD3685@f23x64.localdomain>
 <e3fabd2ab50d46389400cfb8900bad4d@ausx13mpc120.AMER.DELL.COM>
 <201606212029.28029@pali>
 <20160621183327.GA18073@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:35334 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834AbcFVKcS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 06:32:18 -0400
Received: by mail-lb0-f176.google.com with SMTP id o4so19889922lbp.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2016 03:31:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160621183327.GA18073@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Mario_Limonciello@dell.com, dvhart@infradead.org, gabriele.mzt@gmail.com, luto@kernel.org, alex.hung@canonical.com, kernel@kempniu.pl, platform-driver-x86@vger.kernel.org

On Tuesday 21 June 2016 19:33:27 Matthew Garrett wrote:
> On Tue, Jun 21, 2016 at 08:29:27PM +0200, Pali Roh=C3=A1r wrote:
>=20
> > Is there some way to disable this insane nonsense activity of BIOS,=
=20
> > firmware or whatever it is doing in HW to send *one* key scancode w=
hen=20
> > pressing *one* key?
>=20
> There's certainly no generic cross-vendor way to do so, so userspace =
has=20
> to deal in any case.

And is there vendor specific way? If yes, we can at least for some
vendors fix it (implementation could be not be part of kernel...).

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
