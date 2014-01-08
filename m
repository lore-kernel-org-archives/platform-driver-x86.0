From: "David E. Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH v6][RESEND] platform: x86: New BayTrail IOSF-SB MBI driver
Date: Tue, 7 Jan 2014 21:27:17 -0800
Message-ID: <20140108052717.GA31745@linux.intel.com>
References: <1388427149-25456-1-git-send-email-david.e.box@linux.intel.com>
 <4364833.i22acYTaeM@vostro.rjw.lan>
 <20140107214300.GA30423@linux.intel.com>
 <3119193.jBSlNlK309@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:20960 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750790AbaAHF2s (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Jan 2014 00:28:48 -0500
Content-Disposition: inline
In-Reply-To: <3119193.jBSlNlK309@vostro.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>

On Wed, Jan 08, 2014 at 01:11:22AM +0100, Rafael J. Wysocki wrote:
> Well, I personally think that this code should go into arch/x86/ as library code
> needed to access IOSF Sideband on some platforms.

I don't disagree. However for the record this is not the first time it has been
discussed and I already moved it from arch/x86 to platform on the suggestion of
several maintainers. I will keep the interface generic except that it has to be
stated that it will only support those platforms that can enumerate this device
using PCI. Plus I learned there are others who plan to patch when it gets
accepted to support other platforms using different methods of
enumeration/communication. I would thik this probably cements its placement in
arch/x86.

> I probably would make modules
> depending on it select it, so for example if the RAPL driver is going to be
> built, your driver should be build either and rather unconditionally in that
> case.
> 

Wouldn't such a dependency be handled by the RAPL driver et al. How can I force
modules to build this driver? Reverse dependency? Also the biggest consumer of
the driver doesn't have code upstream yet.

> So the rule should be "if something *may* need it, build it" in my opinion.

You suggest that even though non-IOSF systems don't need this driver to enable
RAPL, it should build anyway since it's a dependency for systems that do have
IOSF? Even if this is what you suggest I'd prefer the owner of the driver that
has the dependency be the one to patch this driver to make in build in that
case. I do not know all who would use it.

Dave Box
