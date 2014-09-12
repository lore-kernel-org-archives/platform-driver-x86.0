From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] eeepc-laptop: fix a Wuninitialized warning
Date: Fri, 12 Sep 2014 13:53:37 -0700
Message-ID: <20140912205337.GB23114@vmdeb7>
References: <1410511466-1070-1-git-send-email-chenhanxiao@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50718 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752817AbaILUxn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Sep 2014 16:53:43 -0400
Content-Disposition: inline
In-Reply-To: <1410511466-1070-1-git-send-email-chenhanxiao@cn.fujitsu.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

On Fri, Sep 12, 2014 at 04:44:26PM +0800, Chen Hanxiao wrote:

Hi Chen,

I don't see such a warning with gcc 4.9.1. Which compiler are you using?

Please include these sorts of details (which compiler, etc.) when submitting
patches. I will never merge a patch without a complete commit message.


> Signed-off-by: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
> ---
>  drivers/platform/x86/eeepc-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
> index bd533c2..738fc0c 100644
> --- a/drivers/platform/x86/eeepc-laptop.c
> +++ b/drivers/platform/x86/eeepc-laptop.c
> @@ -276,7 +276,7 @@ static ssize_t store_sys_acpi(struct device *dev, int cm,
>  			      const char *buf, size_t count)
>  {
>  	struct eeepc_laptop *eeepc = dev_get_drvdata(dev);
> -	int rv, value;
> +	int rv, value = -1;
>  
>  	rv = parse_arg(buf, count, &value);

Inspecting the code, I don't see how this could possibly result in the use of an
uninitialized variable.

-- 
Darren Hart
Intel Open Source Technology Center
