From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] Trivial: dell-wmi-aio Kconfig typo
Date: Tue, 17 May 2011 11:13:38 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1105171113310.28291@pobox.suse.cz>
References: <1305516803-10271-1-git-send-email-rafi@seas.upenn.edu>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:56816 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752162Ab1EQJNk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 May 2011 05:13:40 -0400
In-Reply-To: <1305516803-10271-1-git-send-email-rafi@seas.upenn.edu>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rafi Rubin <rafi@seas.upenn.edu>
Cc: colin.king@canonical.com, platform-driver-x86@vger.kernel.org

On Sun, 15 May 2011, Rafi Rubin wrote:

> Signed-off-by: Rafi Rubin <rafi@seas.upenn.edu>
> ---
>  drivers/platform/x86/Kconfig |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0485e39..485c09e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -111,7 +111,7 @@ config DELL_WMI_AIO
>  	  All-In-One machines.
>  
>  	  To compile this driver as a module, choose M here: the module will
> -	  be called dell-wmi.
> +	  be called dell-wmi-aio.
>  

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs
