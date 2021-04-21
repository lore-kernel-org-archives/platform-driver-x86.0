Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE934C43460
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 14:11:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B97F61451
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 14:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238743AbhDUOL4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Apr 2021 10:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34190 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234800AbhDUOLy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Apr 2021 10:11:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619014281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=no9E22n6xFp0ErmLBps/AYHPNqCND0cR48PHFS1zZb0=;
        b=OrQUISG2vGkKlYNv//vvUswWMuo/rnM+9reFCDGT4c5bVgQSIzNSIhHaP6BrJVkpuXDJML
        tNKWb37KHqfjcEByXIOUKRpGAJGF0xlHZ2xxGMKuHFEILx5TYeZIvk73JfSG+PVd8xh0Go
        wIBzhu4vmcQSpEpMODRiT5vzRsK1n3g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-CnLIZ41lPlyjOvTUBlTADg-1; Wed, 21 Apr 2021 10:11:18 -0400
X-MC-Unique: CnLIZ41lPlyjOvTUBlTADg-1
Received: by mail-ed1-f72.google.com with SMTP id w15-20020a056402268fb02903828f878ec5so15102361edd.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Apr 2021 07:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=no9E22n6xFp0ErmLBps/AYHPNqCND0cR48PHFS1zZb0=;
        b=A4oeG3a2Tc0ks3FRhziJNXuELmaDkxo4n3C+qTWTVnr3hA/3396xw783+vbvKvY6kZ
         k97WnFq80D1AAHwwCqFxpmv+gzg58pdJGcwr8plaNMl9Fb5/lxLtaqthjvQyfKgUrDhV
         02udB2hRbqeDoBUlb02yt0KDk5nsXe/cufPl1sSnQNMcQH4FG9bh4JSpYDhxOdU3JQSd
         eDZbEM9JDm4B5EILIQ/+9ch0k9DlYnSGdWznsjpuxFY06aOT/kAES05QbMJwEx93GXRN
         OCjVX2I/R1N/1C/s6rHVYw9IDly7u1UlNEbDbYv1MMtHZxJLvEc6j0t7a78powYUn1SZ
         J3cw==
X-Gm-Message-State: AOAM5333wFsvBlW/4gIcpRmNENIiwPlAMi5Ow2Mx852ympC7QIXNdCza
        zJ6KvpUgtX+i+YVP0Ys5L/zVIHmqGEYpn85scs1W2HTf5L3mApAFGaOi56LPQT10IftIjmmj+Dj
        MrCNZjqJPCG/Jq6ot2lrk6sBzA+187JRcyg==
X-Received: by 2002:a05:6402:40c9:: with SMTP id z9mr39325081edb.24.1619014276819;
        Wed, 21 Apr 2021 07:11:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrqZt+nvJogt73yI9Jd+E2aQ0gY3a+a2uV/BTiXvfbZcykZA0uU7drO20nWxyzpawU6I76Xg==
X-Received: by 2002:a05:6402:40c9:: with SMTP id z9mr39325055edb.24.1619014276660;
        Wed, 21 Apr 2021 07:11:16 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bu26sm2497436ejb.30.2021.04.21.07.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 07:11:16 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_pmc_core: re-write copy in
 pmc_core_lpm_latch_mode_write()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc:     David E Box <david.e.box@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        "David E. Box" <david.e.box@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YH/xicL9RXjH2pvD@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <87e61d84-e23e-1ccc-c4ed-57ffa0ed95fb@redhat.com>
Date:   Wed, 21 Apr 2021 16:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YH/xicL9RXjH2pvD@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dan,

On 4/21/21 11:34 AM, Dan Carpenter wrote:
> There are two bugs in this code:
> 1) "ret" is unsigned so the error handling is broken.

This is already fixed in the latest for-next branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

> 2) simple_write_to_buffer() is innappropriate.  It will succeed even if
>    we are only able to copy a single byte of data from user space.  This
>    could lead to an information leak if the buf[] array is not fully
>    initialized.
> 
> I've fixed it to use strncpy_from_user() and to return -EINVAL if the
> user supplied string is not NUL terminated.

This is a debugfs interface, AFAIK there is no guarantee that:

echo foo > /sys/kernel/debug/foo/bar

Will result in the buf of the write(fd, buf, 4 /* 3 chars + '\n' */)
call actually being 0 terminated ?  I know that with sysfs the sysfs
code takes care of 0 termination, but I don't believe that that is the
case in debugfs ?

So it would see that the original code which does not assume 0
termination of the user-input is correct here.

Except that you are right that this could result in processing
whatever was leftover in the buffer, since simple_write_to_buffer()
may write less then count bytes to buf.

This should fix that however, while sticking with simple_write_to_buffer():

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index d174aeb492e0..ac753e1b2cd4 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -1371,7 +1371,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
 	if (ret < 0)
 		return ret;
 
-	buf[count] = '\0';
+	buf[ret] = '\0';
 
 	/*
 	 * Allowed strings are:

I think that that would be a better fix ?

Regards,

Hans


> 
> Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 3ae00ac85c75..c989796a5d52 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1360,18 +1360,19 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
>  	struct pmc_dev *pmcdev = s->private;
>  	bool clear = false, c10 = false;
>  	unsigned char buf[8];
> -	size_t ret;
> -	int idx, m, mode;
> +	int idx, m, mode, ret;
> +	size_t len;
>  	u32 reg;
>  
> -	if (count > sizeof(buf) - 1)
> +	if (count > sizeof(buf))
>  		return -EINVAL;

Assuming that the buffer passed to a debugfs write is guaranteed to be 0 terminated
then this is not necessary, if we hit this case then the ret == len check below
will trigger?

>  
> -	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
> +	len = min(count, sizeof(buf));
> +	ret = strncpy_from_user(buf, userbuf, len);
>  	if (ret < 0)
>  		return ret;
> -
> -	buf[count] = '\0';
> +	if (ret == len)
> +		return -EINVAL;
>  
>  	/*
>  	 * Allowed strings are:
> 

