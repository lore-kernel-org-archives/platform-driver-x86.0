From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH] sony-laptop: use platform_device_unregister in
	sony_pf_remove
Date: Thu, 1 Jul 2010 14:54:01 +0100
Message-ID: <20100701135401.GG31804@srcf.ucam.org>
References: <1277950681.30073.1.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54713 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755910Ab0GANyK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 1 Jul 2010 09:54:10 -0400
Content-Disposition: inline
In-Reply-To: <1277950681.30073.1.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Mattia Dongili <malattia@linux.it>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, platform-driver-x86@vger.kernel.org

On Thu, Jul 01, 2010 at 10:18:01AM +0800, Axel Lin wrote:
> platform_device_unregister calls platform_device_del and platform_device_put,
> thus this change is logically equivalent to original code.
> 
> I made this change because the documents in platform.c shows that:
> platform_device_del and platform_device_put must _only_ be externally called
> in error cases.  All other usage is a bug.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Applied, thanks.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
