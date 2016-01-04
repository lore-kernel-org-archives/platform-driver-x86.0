From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/1] apple-gmux: Add initial documentation
Date: Mon, 4 Jan 2016 12:31:50 -0800
Message-ID: <20160104203150.GA4219@malice.jf.intel.com>
References: <cover.1451909346.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36958 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753297AbcADUbx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Jan 2016 15:31:53 -0500
Content-Disposition: inline
In-Reply-To: <cover.1451909346.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Seth Forshee <seth.forshee@canonical.com>, Andreas Heider <andreas@meetr.de>, Matthew Garrett <mjg59@srcf.ucam.org>, Bernhard Froemel <froemel@vmars.tuwien.ac.at>, Bruno Premont <bonbons@linux-vserver.org>, Bruno Bierbaumer <bruno@bierbaumer.net>, William Brown <william@blackhats.net.au>, Pierre Moreau <pierre.morrow@free.fr>

On Mon, Jan 04, 2016 at 05:52:06PM +0100, Lukas Wunner wrote:
> Initial documentation for apple-gmux. If anyone has additions or
> corrections please let me know.
> 
> This uses asciidoc markup, an HTML rendered version is available here:
> http://wunner.de/gpu_docs/handlers.html
> 
> If you prefer perusing the patch in a browser:
> https://github.com/l1k/linux/commit/68eb066089346b4ba9aefdcbc69e66524427515e
> 
> @Darren Hart:
> Barring any objections, please kindly provide an ack for merging via
> drm-next or drm-intel as I will post a new iteration of my GPU switching
> patches shortly which are based on this patch and which should also go in
> via drm-next/drm-intel. Thank you!

Eek, apologies for my previous email, I missed the cover letter and reviewed 1/1
independently.

For platform/drivers/x86: Acked-by: Darren Hart <dvhart@linux.intel.com>

> 
> 
> Lukas Wunner (1):
>   apple-gmux: Add initial documentation
> 
>  Documentation/DocBook/gpu.tmpl    |  22 ++++++++
>  drivers/platform/x86/apple-gmux.c | 113 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 135 insertions(+)
> 
> -- 
> 1.8.5.2 (Apple Git-48)
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
