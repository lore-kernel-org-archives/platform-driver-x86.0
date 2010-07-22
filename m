From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [RESEND PATCH] From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Thu, 22 Jul 2010 16:03:10 +0100
Message-ID: <20100722150310.GB25002@srcf.ucam.org>
References: <20100713095944.3399.28528.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:34809 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907Ab0GVPDN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Jul 2010 11:03:13 -0400
Content-Disposition: inline
In-Reply-To: <20100713095944.3399.28528.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Jul 13, 2010 at 10:59:52AM +0100, Alan Cox wrote:
> intel_scu_ipc: Resync with development branch
> 
> - Add support for Medfield (different message format)
> - Use the mrst_platform_id to autodetect the correct type of message
> - delete unused interfaces
> - fix reversing of command/sub argments in simple_command
> - fix a crash if the i2c interface is called before the device is found
> - new PCI identifier

This doesn't apply against the -next tree. Have I missed an intermediate 
patch?

-- 
Matthew Garrett | mjg59@srcf.ucam.org
