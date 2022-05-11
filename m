Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52C20C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 15:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344070AbiEKPyH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 11:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243134AbiEKPyG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 11:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D9A2BAFAED
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652284436;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IwrxWlDkRYEZxUPCibFUkteoAJ+YBJnBk276PVcc9II=;
        b=Eddy7VevPmUpF3An6l6DUtmIYU+P0L0RSvqiNaUs7dVmHXzy/168ASHUBzgyXEtKk5qv0Y
        av4o/V6XONSgMmfUVk5tFKihiUUeF424u7MDDWMjQr61MSa4X3R74uz03NpAv8Wr1QuC66
        t2TxbIvKBYwEq/sYbMeupPYY1/NII5A=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-SivLpIfCMjG2HRp7mLf5UQ-1; Wed, 11 May 2022 11:53:55 -0400
X-MC-Unique: SivLpIfCMjG2HRp7mLf5UQ-1
Received: by mail-ed1-f71.google.com with SMTP id r26-20020a50aada000000b00425afa72622so1550951edc.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 08:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IwrxWlDkRYEZxUPCibFUkteoAJ+YBJnBk276PVcc9II=;
        b=EOBN5l6AlZksFivlXHdRhPD/YsFxOnQAynUYMfaXUlNXvDpJsiVFq86rzRYwk/3VXZ
         LHHV3qE7vHenv1W4oVGclKTc3AzdtlnZA9iN6D5K7/f1G5RB/8wHGaPVHKcTc/4Ut6q4
         xRHa+XNYUA4MEkyPjxeng6eqXh/TVf5MRasKdriukG/17S9QRGQIpTExySqc7ivqfpmU
         0zqZRzzKPk0opw8WcEXbr92Sg88yabXxvCV4tdJphkx+f1CrgeKU/hSnbQHyjCsWMoMm
         laQgoP1NGgIlkgjFRtVpwoI5kguFHanCNB3UHx7NMI+uh3Sj6PwMn2R3cPXhoMKEWGGO
         MRlw==
X-Gm-Message-State: AOAM530ppxJIyKRL7a1At72XSk00+VhqbKaMDm/Etq1xWSVWKU1drD1p
        cGp57ztfGadQkbUZFGFvbZtHa8QS7YUDtns93sYHh7pJG6/vf/7TniTGcdxPq6klwDGbmdTz0RY
        dWNopPct/6jgqAI9+aAxrP28/hYwKe3dpDQ==
X-Received: by 2002:a17:906:c142:b0:6f5:2632:adb7 with SMTP id dp2-20020a170906c14200b006f52632adb7mr24687702ejc.637.1652284434599;
        Wed, 11 May 2022 08:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK3Nm8WXoopAHEkKYllofwom5n4jcVxKk9ixK/73qGrQuL+lw3yNSJ0WX+Sqog3OO2Tooytg==
X-Received: by 2002:a17:906:c142:b0:6f5:2632:adb7 with SMTP id dp2-20020a170906c14200b006f52632adb7mr24687683ejc.637.1652284434391;
        Wed, 11 May 2022 08:53:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id jz21-20020a17090775f500b006f3ef214e77sm1097647ejc.221.2022.05.11.08.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 08:53:53 -0700 (PDT)
Message-ID: <ef0e965d-f66a-3b02-1687-781a84b8db8a@redhat.com>
Date:   Wed, 11 May 2022 17:53:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Display error on
 turbo mode disabled
Content-Language: en-US
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220510023421.3930540-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220510023421.3930540-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/10/22 04:34, Srinivas Pandruvada wrote:
> For Intel SST turbo-freq feature to be enabled, the turbo mode on the
> platform must be enabled also. If turbo mode is disabled, display error
> while enabling turbo-freq feature.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> Since this is a trivial patch, I am not sending a PULL request.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
>  tools/power/x86/intel-speed-select/isst-config.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
> index 060390e88e37..9d35614995ee 100644
> --- a/tools/power/x86/intel-speed-select/isst-config.c
> +++ b/tools/power/x86/intel-speed-select/isst-config.c
> @@ -1892,6 +1892,12 @@ static void set_fact_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
>  	int ret;
>  	int status = *(int *)arg4;
>  
> +	if (status && no_turbo()) {
> +		isst_display_error_info_message(1, "Turbo mode is disabled", 0, 0);
> +		ret = -1;
> +		goto disp_results;
> +	}
> +
>  	ret = isst_get_ctdp_levels(cpu, &pkg_dev);
>  	if (ret) {
>  		isst_display_error_info_message(1, "Failed to get number of levels", 0, 0);

