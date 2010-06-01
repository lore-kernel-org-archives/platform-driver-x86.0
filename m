From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Vibrator Driver for Intel MID Platforms
Date: Tue, 1 Jun 2010 14:24:10 +0100
Message-ID: <20100601132410.GA7842@srcf.ucam.org>
References: <20100601115558.23256.16674.stgit@localhost.localdomain> <20100601130643.GA6849@srcf.ucam.org> <20100601133513.118825bb@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:33295 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755995Ab0FANYO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Jun 2010 09:24:14 -0400
Content-Disposition: inline
In-Reply-To: <20100601133513.118825bb@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Jun 01, 2010 at 01:35:13PM +0100, Alan Cox wrote:
> > > + *	If the PMIC hasn't been discovered or one is not found
> > > then
> > > + *	the calls will error for us.
> > 
> > Can't you do this at probe time?
> 
> We have to check for errors anyway. We could also check at probe time
> but that would add ordering issues or mean we needed the scu_ipc driver
> to create the platform device for the vibrator - which given it's not
> current discoverable is a bit ugly.

The ipc driver is presumably intended to probe first (and module 
dependencies will ensure that in the modular case). Once that probe has 
completed, isn't it expected that scu_ipc_ioread will error if there's 
no device?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
