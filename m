From: Matthew Garrett <mjg@redhat.com>
Subject: Re: [PATCH] dell-wmi: fix a memory leak
Date: Thu, 1 Jul 2010 14:53:48 +0100
Message-ID: <20100701135348.GF31804@srcf.ucam.org>
References: <1277889946.30827.2.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:54682 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754327Ab0GANx4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 1 Jul 2010 09:53:56 -0400
Content-Disposition: inline
In-Reply-To: <1277889946.30827.2.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Len Brown <len.brown@intel.com>, Dmitry Torokhov <dtor@mail.ru>, =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, platform-driver-x86@vger.kernel.org

On Wed, Jun 30, 2010 at 05:25:46PM +0800, Axel Lin wrote:
> If dell_new_hk_type is true, dell_legacy_wmi_keymap will point to a memory
> allocated in setup_new_hk_map().
> In this case, the memory is not freed in current implementation.
> This patch fixes the leak by kfree(dell_wmi_keymap) if dell_new_hk_type is true.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Applied, thanks.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
