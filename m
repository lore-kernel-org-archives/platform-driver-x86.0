From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] X86: intel_ips, check for kzalloc properly
Date: Mon, 21 Jun 2010 08:25:35 -0700
Message-ID: <20100621082535.14301a7c@virtuousgeek.org>
References: <1277132531-14242-1-git-send-email-jslaby@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy3-pub.bluehost.com ([67.222.54.6]:56038 "HELO
	cpoproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S932718Ab0FUP1X (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Jun 2010 11:27:23 -0400
In-Reply-To: <1277132531-14242-1-git-send-email-jslaby@suse.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, jirislaby@gmail.com

On Mon, 21 Jun 2010 17:02:11 +0200
Jiri Slaby <jslaby@suse.cz> wrote:

> Stanse found that there are two NULL checks missing in ips_monitor. So
> check their value too and bail out appropriately if the allocation
> failed.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Jesse Barnes <jbarnes@virtuousgeek.org>
> Cc: Matthew Garrett <mjg@redhat.com>
> ---
>  drivers/platform/x86/intel_ips.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index cdaf40e..3c7ea9a 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -931,7 +931,8 @@ static int ips_monitor(void *data)
>  	mch_samples = kzalloc(sizeof(u16) * IPS_SAMPLE_COUNT, GFP_KERNEL);
>  	cpu_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
>  	mchp_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
> -	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples) {
> +	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples ||
> +			!cpu_samples || !mchp_samples) {
>  		dev_err(&ips->dev->dev,
>  			"failed to allocate sample array, ips disabled\n");
>  		kfree(mcp_samples);

Ah cool, am I also missing the appropriate kfree() calls for the last
two?  The context doesn't have it.  Otherwise,

Acked-by: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
Jesse Barnes, Intel Open Source Technology Center
