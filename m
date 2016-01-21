From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Thu, 21 Jan 2016 02:57:20 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42C0FA4D4@BGSMSX102.gar.corp.intel.com>
References: <1453269897-14601-1-git-send-email-souvik.k.chakravarty@intel.com>
 <1453273246.22381.1.camel@perches.com>
 <20160120164758.GD1979@malice.jf.intel.com>
 <5F7315E704FA0841B5DFCE90329B2BB42C0FA4C4@BGSMSX102.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:41705 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758765AbcAUC5Z convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jan 2016 21:57:25 -0500
In-Reply-To: <5F7315E704FA0841B5DFCE90329B2BB42C0FA4C4@BGSMSX102.gar.corp.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>, Darren Hart <dvhart@infradead.org>, Joe Perches <joe@perches.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Or rather I will send this in as a fix.

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driv=
er-
> x86-owner@vger.kernel.org] On Behalf Of Chakravarty, Souvik K
> Sent: Thursday, January 21, 2016 8:21 AM
> To: Darren Hart <dvhart@infradead.org>; Joe Perches <joe@perches.com>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
> interfaces
>=20
>=20
>=20
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Thursday, January 21, 2016 5:05 AM
> > To: Joe Perches <joe@perches.com>
> > Cc: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; platfor=
m-
> > driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debug=
fs
> > interfaces
> >
> > On Tue, Jan 19, 2016 at 11:00:46PM -0800, Joe Perches wrote:
> > > On Wed, 2016-01-20 at 11:34 +0530, Souvik Kumar Chakravarty wrote=
:
> > > > This implements debugfs interfaces for reading the telemetry
> > > > samples from SSRAM and configuring firmware trace verbosity.
> > > []
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > []
> > > > @@ -5698,6 +5698,7 @@ S:	Maintained
> > > > =A0F:	drivers/platform/x86/intel_telemetry_core.c
> > > > =A0F:	arch/x86/include/asm/intel_telemetry.h
> > > > =A0F:	drivers/platform/x86/intel_telemetry_pltdrv.c
> > > > +F:	drivers/platform/x86/intel_telemetry_debugfs.c
> > >
> > > Maybe most of these should be deleted and this should be a single
> > > entry:
> > >
> > > F:	drivers/platform/x86/intel_telemetry*
> >
> > Indeed, thanks for catching that Joe.
>=20
> Seems fair. I can do a respin.
> >
> > --
> > Darren Hart
> > Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86"
> in the body of a message to majordomo@vger.kernel.org More majordomo
> info at  http://vger.kernel.org/majordomo-info.html
