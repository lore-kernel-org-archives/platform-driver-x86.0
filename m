From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: eeepc: rfkill on 900A defunct
Date: Wed, 24 Nov 2010 14:57:50 +0000
Message-ID: <20101124145750.GA32033@srcf.ucam.org>
References: <4CED26EF.5000109@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:57069 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751351Ab0KXO55 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 24 Nov 2010 09:57:57 -0500
Content-Disposition: inline
In-Reply-To: <4CED26EF.5000109@suse.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: corentincj@iksaif.net, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Nov 24, 2010 at 03:53:35PM +0100, Jiri Slaby wrote:

> but without hotplug support (pciehp cannot be bound to it). However the
> eeepc-laptop driver expects the wifi on the 1st bus (pci_find_bus(0,
> 1)), so it operates on a NIC on this machine instead of wifi.

Yeah, this really needs to be fixed. We need to shift this code out of 
eeepc-laptop and just have the PCI core handle it - that is, if we get a 
hotplug notification, we need to rescan the slot even if we don't have a 
hotplug driver bound to it. Let me look into that.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
