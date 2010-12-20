From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] x86,mrst: Intel Medfield over-current detection patch
Date: Mon, 20 Dec 2010 16:10:33 +0000
Message-ID: <20101220161033.GB25502@srcf.ucam.org>
References: <20101213112147.15213.12742.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:43745 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932643Ab0LTQKh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Dec 2010 11:10:37 -0500
Content-Disposition: inline
In-Reply-To: <20101213112147.15213.12742.stgit@bob.linux.org.uk>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Dec 13, 2010 at 11:53:41AM +0000, Alan Cox wrote:
> From: Durgadoss R <durgadoss.r@intel.com>
> 
> This patch enables over current detection on the Intel Medfield
> Platform. This driver provides sysfs interfaces to configure current
> thresholds. When the current being drawn on the platform exceeds
> the configured threshold, an interrupt is generated. This interrupt
> can be used to bring the current consumption down by taking necessary
> hardware or software actions.
> 
> Note that while we use hwmon style helpers and interface this is not an hwmon
> device and hwmon has no common API with this hardware. After discussion with
> the hwmon maintainers it was decided to make this an x86 platform driver.

Hm. Do you have a summary or a pointer to that discussion? This really 
does seem to be a hardware monitoring device, and so hwmon would seem 
the more natural home for it - I'd like some idea of what the 
justification was.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
