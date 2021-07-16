Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E595EC12002
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Jul 2021 16:22:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBCCA613BB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Jul 2021 16:22:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhGPQZQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Jul 2021 12:25:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhGPQZP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Jul 2021 12:25:15 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA9B4C06175F
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jul 2021 09:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=jtN6JamnSGyvIFW3qah4s4ISRAMXIiTDVNwya3LR8cA=; b=jsUVUW6XYhWxH2ddcfuAgTt6SZ
        dazFmGqCBfLtlTAvMnhFLNJSgZ9e/I5eTRJFjaQC0FrQ+Axs5sB9y+LzMlGybGZ4jQVf/PYytauVc
        KQUS2QBsOLuM13S2IkG/IYGs1BWvKzggymJtnw8x8lakQZ2KJWasNe1XVmV2w1Sn1JDLKq7v+BPUz
        nrLyT3ymJ5ggPS/rQB8p259rsp0qgQGpTGFaOqNU2dumOrsXG50KQ3Hu3/UvVv9B0hpiLj/lZMgk3
        SmwU3MFrqd0TRySk7PNDeB5eoI7splSihnK8E5d6PYY6xcZf3D2FKpcUO/xUcOJQoV5hVcz3ADCxB
        i1QR6CKg==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m4QbS-004qsI-AC; Fri, 16 Jul 2021 16:22:18 +0000
Subject: Re: [PATCH] platform/x86: amd-pmc: Fix undefined reference to
 __udivdi3
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hdegoede@redhat.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210716153802.2929670-1-Shyam-sundar.S-k@amd.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6311088f-d2f0-f10b-8678-917c2fbe246e@infradead.org>
Date:   Fri, 16 Jul 2021 09:22:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716153802.2929670-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/16/21 8:38 AM, Shyam Sundar S K wrote:
> It was reported that on i386 config
> 
> ------
> on i386:
> 
> ld: drivers/platform/x86/amd-pmc.o: in function `s0ix_stats_show':
> amd-pmc.c:(.text+0x100): undefined reference to `__udivdi3'
> -------
> 
> The reason for this is that 64-bit integer division is not supported
> on 32-bit architecture. Use do_div macro to fix this.
> 
> Fixes: b9a4fa6978be ("platform/x86: amd-pmc: Add support for logging s0ix counters")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org> # and build-tested

Thanks.

> ---
>  drivers/platform/x86/amd-pmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 680f94c7e075..45ce1d5e1e6d 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -189,7 +189,8 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
>  	exit_time = exit_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_EXIT_TIME_L_OFFSET);
>  
>  	/* It's in 48MHz. We need to convert it */
> -	residency = (exit_time - entry_time) / 48;
> +	residency = exit_time - entry_time;
> +	do_div(residency, 48);
>  
>  	seq_puts(s, "=== S0ix statistics ===\n");
>  	seq_printf(s, "S0ix Entry Time: %lld\n", entry_time);
> 


-- 
~Randy
