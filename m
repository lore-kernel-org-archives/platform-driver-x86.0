From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] pvpanic: handle missing _STA correctly'
Date: Mon, 1 Jun 2015 19:38:32 +0200
Message-ID: <20150601173832.GB87111@vmdeb7>
References: <1432930732-16568-1-git-send-email-rkrcmar@redhat.com>
 <20150601093322.4ec8de60@nial.brq.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39913 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751888AbbFARiR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 1 Jun 2015 13:38:17 -0400
Content-Disposition: inline
In-Reply-To: <20150601093322.4ec8de60@nial.brq.redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, Jun 01, 2015 at 09:33:22AM +0200, Igor Mammedov wrote:
> On Fri, 29 May 2015 22:18:52 +0200
> Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com> wrote:
>=20
> > pvpanic was not properly detected when _STA was missing.
> >=20
> > ACPI 6.0 April 2015, 6.3.7 _STA (Status)
> >   If a device object (including the processor object) does not have=
 an
> >   _STA object, then OSPM assumes that all of the above bits are set
> >   (i.e., the device is present, enabled, shown in the UI, and
> >   functioning).
> >=20
> > Not adhering to the specification made pvpanic dormant under QEMU 2=
=2E3.
> >=20
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>

Queued, thanks.

--=20
Darren Hart
Intel Open Source Technology Center
