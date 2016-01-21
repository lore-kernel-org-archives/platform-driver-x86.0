From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Thu, 21 Jan 2016 02:50:35 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42C0FA4C4@BGSMSX102.gar.corp.intel.com>
References: <1453269897-14601-1-git-send-email-souvik.k.chakravarty@intel.com>
 <1453273246.22381.1.camel@perches.com>
 <20160120164758.GD1979@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:14605 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758565AbcAUCuj convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jan 2016 21:50:39 -0500
In-Reply-To: <20160120164758.GD1979@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Joe Perches <joe@perches.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Thursday, January 21, 2016 5:05 AM
> To: Joe Perches <joe@perches.com>
> Cc: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; platform-
> driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
> interfaces
>=20
> On Tue, Jan 19, 2016 at 11:00:46PM -0800, Joe Perches wrote:
> > On Wed, 2016-01-20 at 11:34 +0530, Souvik Kumar Chakravarty wrote:
> > > This implements debugfs interfaces for reading the telemetry samp=
les
> > > from SSRAM and configuring firmware trace verbosity.
> > []
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > []
> > > @@ -5698,6 +5698,7 @@ S:	Maintained
> > > =A0F:	drivers/platform/x86/intel_telemetry_core.c
> > > =A0F:	arch/x86/include/asm/intel_telemetry.h
> > > =A0F:	drivers/platform/x86/intel_telemetry_pltdrv.c
> > > +F:	drivers/platform/x86/intel_telemetry_debugfs.c
> >
> > Maybe most of these should be deleted and this should be a single
> > entry:
> >
> > F:	drivers/platform/x86/intel_telemetry*
>=20
> Indeed, thanks for catching that Joe.

Seems fair. I can do a respin.
>=20
> --
> Darren Hart
> Intel Open Source Technology Center
