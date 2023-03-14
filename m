Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D80C6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Mar 2023 11:15:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjCNLPT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Mar 2023 07:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbjCNLOr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2023 07:14:47 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD1E591CA;
        Tue, 14 Mar 2023 04:14:16 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id p6so16249836plf.0;
        Tue, 14 Mar 2023 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678792450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBhu1FN466UkE4o6eU94H2J4IRVg/Q1QnTxXpOt69VA=;
        b=qd7r4pKNXtz7MiHAQFXtpUeuUPjHly6zNPeOuAxyYiGbCisNEBXZVWcqkTunaMefqz
         qbA1un1n68iYFYln/zHisX0Z3sUUdYKw69iIvTmO+8gVpsZuFoIhwR0gxuhAbroriZwZ
         l+IF7wF/Cin6sYeflY7XAUKoIcueFYitLH6U4GKE2kgtDSa8UHljZJ2aRaj0LdnMkG6C
         jRGu6lRx94HayJq9VHILaCMo+ehjE9oYZguUfGw0iDGUL4A0J0XAq/3qQQI0bRIz6ddE
         HH7hDyCHW3S1D8A3Bra/QMDgmrKGngBrSO5aux/brtSb1KRC9z987VTr81cIldPEqPdD
         HW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678792450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SBhu1FN466UkE4o6eU94H2J4IRVg/Q1QnTxXpOt69VA=;
        b=qQawpxP4McJbigO/c6FDRqcbal0pOGdl5wvGioNjGNr0hhbsMe2RHynSHUqq6hm0Fd
         pqkWkGSP/f0Q+4USCsT9CqaS7TC4GJK/k1GTBN7mQh8qU+kKq56CRjIyTQaP9bUJ8IOt
         lEG4cHgzVeYf+00vH5VMrLpxSMJhK6ByJTSTjpZMsE5K1HTrbOIweaVqplkre60Qk1PN
         HcstoXHCf9BNZ52bODx/4D9lfFGanazrXRsI3u3+8RHtWNaK3uF4TpFUT4pkGs9lbtvC
         0ghaSYCp9I4p5ovjOdyXGlA1CqLZ0xgH0Aq5JUbQm8wqNPBf7F76Xpx7TGyzp848bICf
         AWIA==
X-Gm-Message-State: AO0yUKXJ16ldD5D1nTGN9IY8fWOtZ/8iknQVYOQXNlU8EghUEAiOMJYF
        3cwOVmeDPItwLRkpL89y9MND90xWrQM=
X-Google-Smtp-Source: AK7set/KLYrI0c/e5MTvR6WqzEZJYWsVYxBp3N0uHvaqGzjknlppHwJAlcopmGtxIcTUTy3QsceCvQ==
X-Received: by 2002:a05:6a20:430c:b0:d5:3818:6427 with SMTP id h12-20020a056a20430c00b000d538186427mr3287895pzk.9.1678792450348;
        Tue, 14 Mar 2023 04:14:10 -0700 (PDT)
Received: from redecorated-mbp (124-148-239-17.tpgi.com.au. [124.148.239.17])
        by smtp.gmail.com with ESMTPSA id v6-20020a62a506000000b005a817ff3903sm1390802pfm.3.2023.03.14.04.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 04:14:10 -0700 (PDT)
Date:   Tue, 14 Mar 2023 22:13:58 +1100
From:   Orlando Chamberlain <orlandoch.dev@gmail.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: apple-gmux: return -EFAULT if copy fails
Message-ID: <20230314221358.1d5b076d@redecorated-mbp>
In-Reply-To: <0bdfa8c2-cb22-4bec-8773-584060613043@kili.mountain>
References: <0bdfa8c2-cb22-4bec-8773-584060613043@kili.mountain>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 10 Mar 2023 15:31:13 +0300
Dan Carpenter <error27@gmail.com> wrote:

> The copy_to/from_user() functions return the number of bytes remaining
> to be copied, but we want to return -EFAULT to the user.

I didn't realise that, thanks for fixing it!

Reviewed-by: Orlando Chamberlain <orlandlch.dev@gmail.com>
> 
> Fixes: ce3fef2eb235 ("platform/x86: apple-gmux: add debugfs
> interface") Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/platform/x86/apple-gmux.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/apple-gmux.c
> b/drivers/platform/x86/apple-gmux.c index 787cf2a7e268..77e63d2da7b6
> 100644 --- a/drivers/platform/x86/apple-gmux.c
> +++ b/drivers/platform/x86/apple-gmux.c
> @@ -694,7 +694,6 @@ static ssize_t
> gmux_selected_port_data_write(struct file *file, const char __user
> *userbuf, size_t count, loff_t *ppos) {
>  	struct apple_gmux_data *gmux_data = file->private_data;
> -	int ret;
>  
>  	if (*ppos)
>  		return -EINVAL;
> @@ -702,16 +701,16 @@ static ssize_t
> gmux_selected_port_data_write(struct file *file, if (count == 1) {
>  		u8 data;
>  
> -		ret = copy_from_user(&data, userbuf, 1);
> -		if (ret)
> -			return ret;
> +		if (copy_from_user(&data, userbuf, 1))
> +			return -EFAULT;
> +
>  		gmux_write8(gmux_data, gmux_data->selected_port,
> data); } else if (count == 4) {
>  		u32 data;
>  
> -		ret = copy_from_user(&data, userbuf, 4);
> -		if (ret)
> -			return ret;
> +		if (copy_from_user(&data, userbuf, 4))
> +			return -EFAULT;
> +
>  		gmux_write32(gmux_data, gmux_data->selected_port,
> data); } else
>  		return -EINVAL;

