From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [PATCH] X86: intel_ips, check for kzalloc properly
Date: Mon, 21 Jun 2010 08:34:18 -0700
Message-ID: <20100621083418.6315d1d5@virtuousgeek.org>
References: <1277132531-14242-1-git-send-email-jslaby@suse.cz>
	<20100621082535.14301a7c@virtuousgeek.org>
	<4C1F865C.1070707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpoproxy3-pub.bluehost.com ([67.222.54.6]:41623 "HELO
	cpoproxy3-pub.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S932756Ab0FUPgF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Jun 2010 11:36:05 -0400
In-Reply-To: <4C1F865C.1070707@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jiri Slaby <jirislaby@gmail.com>
Cc: Jiri Slaby <jslaby@suse.cz>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 21 Jun 2010 17:33:48 +0200
Jiri Slaby <jirislaby@gmail.com> wrote:

> On 06/21/2010 05:25 PM, Jesse Barnes wrote:
> > On Mon, 21 Jun 2010 17:02:11 +0200
> > Jiri Slaby <jslaby@suse.cz> wrote:
> > 
> >> Stanse found that there are two NULL checks missing in ips_monitor. So
> >> check their value too and bail out appropriately if the allocation
> >> failed.
> >>
> >> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> >> Cc: Jesse Barnes <jbarnes@virtuousgeek.org>
> >> Cc: Matthew Garrett <mjg@redhat.com>
> >> ---
> >>  drivers/platform/x86/intel_ips.c |    3 ++-
> >>  1 files changed, 2 insertions(+), 1 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> >> index cdaf40e..3c7ea9a 100644
> >> --- a/drivers/platform/x86/intel_ips.c
> >> +++ b/drivers/platform/x86/intel_ips.c
> >> @@ -931,7 +931,8 @@ static int ips_monitor(void *data)
> >>  	mch_samples = kzalloc(sizeof(u16) * IPS_SAMPLE_COUNT, GFP_KERNEL);
> >>  	cpu_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
> >>  	mchp_samples = kzalloc(sizeof(u32) * IPS_SAMPLE_COUNT, GFP_KERNEL);
> >> -	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples) {
> >> +	if (!mcp_samples || !ctv1_samples || !ctv2_samples || !mch_samples ||
> >> +			!cpu_samples || !mchp_samples) {
> >>  		dev_err(&ips->dev->dev,
> >>  			"failed to allocate sample array, ips disabled\n");
> >>  		kfree(mcp_samples);
> > 
> > Ah cool, am I also missing the appropriate kfree() calls for the last
> > two?  The context doesn't have it.  Otherwise,
> 
> I checked when I was patching that and the last is not freed there.
> However I didn't add it since at least one must be non-NULL and in this
> case it can be only the last. (Until somebody add another allocation
> indeed.) So should I add even the last free there?

Up to Matthew.  Not adding it will make people do a double take, but I
agree it'll be safe.

-- 
Jesse Barnes, Intel Open Source Technology Center
