From: Alan Cox <alan@linux.intel.com>
Subject: Re: [RESEND PATCH] From: Sreedhara DS <sreedhara.ds@intel.com>
Date: Thu, 22 Jul 2010 15:45:42 +0100
Message-ID: <20100722154542.3c9de0ec@linux.intel.com>
References: <20100713095944.3399.28528.stgit@localhost.localdomain>
	<20100722150310.GB25002@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:25992 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751758Ab0GVPR5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Jul 2010 11:17:57 -0400
In-Reply-To: <20100722150310.GB25002@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

On Thu, 22 Jul 2010 16:03:10 +0100
Matthew Garrett <mjg59@srcf.ucam.org> wrote:

> On Tue, Jul 13, 2010 at 10:59:52AM +0100, Alan Cox wrote:
> > intel_scu_ipc: Resync with development branch
> > 
> > - Add support for Medfield (different message format)
> > - Use the mrst_platform_id to autodetect the correct type of message
> > - delete unused interfaces
> > - fix reversing of command/sub argments in simple_command
> > - fix a crash if the i2c interface is called before the device is
> > found
> > - new PCI identifier
> 
> This doesn't apply against the -next tree. Have I missed an
> intermediate patch?

I sent a couple of more urgent bits direct to Linus. I'll resync and
send you the other bits.
