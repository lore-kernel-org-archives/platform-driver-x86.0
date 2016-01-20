From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Wed, 20 Jan 2016 15:34:52 -0800
Message-ID: <20160120164758.GD1979@malice.jf.intel.com>
References: <1453269897-14601-1-git-send-email-souvik.k.chakravarty@intel.com>
 <1453273246.22381.1.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:32869 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752516AbcATXez (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jan 2016 18:34:55 -0500
Content-Disposition: inline
In-Reply-To: <1453273246.22381.1.camel@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jan 19, 2016 at 11:00:46PM -0800, Joe Perches wrote:
> On Wed, 2016-01-20 at 11:34 +0530, Souvik Kumar Chakravarty wrote:
> > This implements debugfs interfaces for reading the telemetry
> > samples from SSRAM and configuring firmware trace verbosity.
> []
> > diff --git a/MAINTAINERS b/MAINTAINERS
> []
> > @@ -5698,6 +5698,7 @@ S:	Maintained
> > =A0F:	drivers/platform/x86/intel_telemetry_core.c
> > =A0F:	arch/x86/include/asm/intel_telemetry.h
> > =A0F:	drivers/platform/x86/intel_telemetry_pltdrv.c
> > +F:	drivers/platform/x86/intel_telemetry_debugfs.c
>=20
> Maybe most of these should be deleted and
> this should be a single entry:
>=20
> F:	drivers/platform/x86/intel_telemetry*

Indeed, thanks for catching that Joe.

--=20
Darren Hart
Intel Open Source Technology Center
