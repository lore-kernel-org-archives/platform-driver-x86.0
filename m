From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] MAINTAINERS: Remove Toshiba Linux mailing list address
Date: Wed, 5 Aug 2015 13:25:35 -0700
Message-ID: <20150805202535.GC12131@vmdeb7>
References: <1438623848-3707-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58256 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752166AbbHEUZA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Aug 2015 16:25:00 -0400
Content-Disposition: inline
In-Reply-To: <1438623848-3707-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>, Jonathan Buzzard <jonathan@buzzard.org.uk>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 03, 2015 at 11:44:08AM -0600, Azael Avalos wrote:
> As of March 31th 2015, the mailing-list service finished [1].
> 
> This patch simply removes such address.
> 
> [1] http://goo.gl/F6jS5r
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
> Hi Darren,
> 
> I hope you can queue this patch through your tree, I ran the
> "get_maintainer.pl" script but didn't come up w/ a defined
> maintainer (other than the general mailing list).
> 

Jonathan maybe? On Cc.

> I wanted to send this patch since April, but somehow I kept
> delaying/forgeting it.

If Jonathan doesn't reply, I'll queue it up.

> 
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8133cef..87e5d0c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10296,7 +10296,6 @@ F:	drivers/platform/x86/toshiba_haps.c
>  
>  TOSHIBA SMM DRIVER
>  M:	Jonathan Buzzard <jonathan@buzzard.org.uk>
> -L:	tlinux-users@tce.toshiba-dme.co.jp
>  W:	http://www.buzzard.org.uk/toshiba/
>  S:	Maintained
>  F:	drivers/char/toshiba.c
> -- 
> 2.4.5

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
