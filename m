From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] gpio: Add PMIC GPIO block support
Date: Thu, 22 Jul 2010 16:01:41 +0100
Message-ID: <20100722150141.GA25002@srcf.ucam.org>
References: <20100713095544.3064.80122.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:34783 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751766Ab0GVPBo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Jul 2010 11:01:44 -0400
Content-Disposition: inline
In-Reply-To: <20100713095544.3064.80122.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Jul 13, 2010 at 10:56:25AM +0100, Alan Cox wrote:
> From: Alek Du <alek.du@intel.com>
> 
> Moorestown has PMIC chip which contains GPIO blocks. The PMIC chip is
> connected to Langwell by SPI interface. So this GPIO driver will be regarded
> as SPI GPIO expander though the actual GPIO access is through IPC and SRAM.
> The SPI master contoller will probe this device driver by parsing SPIB table.
> 
> Cleaned up for new IPC, GPE removed and some printk and other tidying by
> Alan Cox. Fixes for points noted by Matthew Garrett

Applied with some whitespace cleanup.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
