From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 2/2] ideapad-laptop: Handle the App-controlled RF
 event
Date: Fri, 08 Jul 2011 03:52:46 -0600
Message-ID: <4E17600E020000230002F274@novprvlin0050.provo.novell.com>
References: <1309268154-6872-1-git-send-email-kengyu@canonical.com>
 <1309268154-6872-2-git-send-email-kengyu@canonical.com>
 <20110707151118.GB15366@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:55786 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750746Ab1GHJwu (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:3:2>);
	Fri, 8 Jul 2011 05:52:50 -0400
In-Reply-To: <20110707151118.GB15366@srcf.ucam.org>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kengyu@canonical.com
Cc: ike.pan@canonical.com, kent.lin@canonical.com, sylee@canonical.com, vanhoof@canonical.com, mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi Keng-Yu,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-07-07 =E6=96=BC 16:11 +0100=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> On Tue, Jun 28, 2011 at 02:35:54PM +0100, Keng-Yu Lin wrote:
>=20
> > On Linux, there is no such application. This patch implements
> > a toggle for all RF devices through accessing the EC I/O ports.
>=20
> Sure there is. Either the kernel can handle it via rfkill-input, or=20
> rfkilld can look after it. Please don't add your own implementation.
>=20

Welcome to use urfkill deaemon:
http://www.freedesktop.org/wiki/Software/urfkill


Thank's a lot!
Joey
