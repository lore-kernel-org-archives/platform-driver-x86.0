From: Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/5] PCI: Recognize Thunderbolt devices
Date: Sat, 25 Feb 2017 08:40:03 +0100
Message-ID: <20170225074003.GA905@wunner.de>
References: <cover.1487938188.git.lukas@wunner.de>
 <c42a235e126f273e9b8712a7154f813f757db507.1487938188.git.lukas@wunner.de>
 <20170224221724.GA26430@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout3.hostsharing.net ([176.9.242.54]:32997 "EHLO
        mailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751513AbdBYHjo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Feb 2017 02:39:44 -0500
Content-Disposition: inline
In-Reply-To: <20170224221724.GA26430@bhelgaas-glaptop.roam.corp.google.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: dri-devel@lists.freedesktop.org, Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-pci@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, amd-gfx@lists.freedesktop.org, Peter Wu <peter@lekensteyn.nl>

On Fri, Feb 24, 2017 at 04:17:24PM -0600, Bjorn Helgaas wrote:
> On Fri, Feb 24, 2017 at 08:19:45PM +0100, Lukas Wunner wrote:
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -358,6 +358,7 @@ struct pci_dev {
> >  	unsigned int	is_virtfn:1;
> >  	unsigned int	reset_fn:1;
> >  	unsigned int    is_hotplug_bridge:1;
> > +	unsigned int	is_thunderbolt:1; /* Thunderbolt controller */
> 
> I'm not really keen on having this in the PCI core because the core
> doesn't need this or even know what it means.
> 
> pci_find_next_ext_capability() is available to drivers, and if
> Thunderbolt-connectedness is useful information to apple-gmux or GPU
> drivers, it's fine with me if you want to use it there.  I just don't
> see the benefit to having it in the core.

The above contradicts your statement 3 days earlier:

	"Assuming we need it, having it in struct pci_dev is fine.
	 There's no point in looking up the VSEC capability more than once."
	(http://www.spinics.net/lists/linux-pci/msg58532.html)

Please explain.

Thanks,

Lukas
