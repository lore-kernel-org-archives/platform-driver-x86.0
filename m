From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH] asus-laptop: fix a memory leak in asus_laptop_get_info
	error path
Date: Thu, 1 Jul 2010 14:53:11 +0100
Message-ID: <20100701135311.GC31804@srcf.ucam.org>
References: <1277780987.5478.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54641 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752548Ab0GANxU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 1 Jul 2010 09:53:20 -0400
Content-Disposition: inline
In-Reply-To: <1277780987.5478.2.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Corentin Chary <corentincj@iksaif.net>, Len Brown <len.brown@intel.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Tue, Jun 29, 2010 at 11:09:47AM +0800, Axel Lin wrote:
> The callers of write_acpi_int_ret() pass ACPI_ALLOCATE_BUFFER,
> the caller must kfree the returned buffer if AE_OK is returned.
> 
> This patch adds a missing kfree(buffer.pointer) before return -ENOMEM
> if kstrdup fail.

Applied, thanks.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
