Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F111FC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 May 2022 15:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbiEKP4Z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 May 2022 11:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344214AbiEKP4N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 May 2022 11:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E3D9286F3
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 08:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652284571;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2Mh3inTeIDOo85ciNLhJraJn+1Plr8Qa3Kd2pi/okJ8=;
        b=hNQU/1vudOK348a8xtfNrbNF/zVfNFWIhEbhj4//xDsJvXIRnqh9lfbU/2CQh/SjBYnhdO
        9XswlmW/VNshV15zIKCq8RAECQCkFIzhzP7Arty+dAiG49SKq/9lMxUsSPEHGcwp2U2MwD
        WP2xAcZHjZyVOGvtp0I/lmvbt97hfF0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34--3iD0fDfOK65MfxOj3JK7A-1; Wed, 11 May 2022 11:56:10 -0400
X-MC-Unique: -3iD0fDfOK65MfxOj3JK7A-1
Received: by mail-ed1-f71.google.com with SMTP id a19-20020aa7d913000000b004284eecb34aso1594655edr.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 May 2022 08:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2Mh3inTeIDOo85ciNLhJraJn+1Plr8Qa3Kd2pi/okJ8=;
        b=xiPIC2aQSecT0YC3hszDOq9rVdxhnrhxecvNdUz88G7IrGB00pDkbEyz9/kYELYqCl
         NI2jsQNdtX+7fH8LcaA1S5cRnX6suiCqMS1wYV0bdaiaGy9hxqrvV3MgWzE7VpQQMF6Z
         tTVcn+tQUuUHAX1pfnJfp+l0OGwXCi/XMKWXiutUm8XfBIoCw4Yo8x4OoiAGGUNXBhVM
         lP3ulfWrW9Jp4x7yRX7ubkaKwA1xduYy8OC6W3X7gA5KveIuM/SF1Q0X69G7jLwYH+RS
         mNiX1t0EeaoQpRBGX5tl4qzK1o+LsUzXkPb/FU48ts66WctwplH9XIEeHnWTFY9uGTvn
         apww==
X-Gm-Message-State: AOAM533eHOFIWShS0VEoqV2KkIbw5jeykD+cYyqxP8BY2PrngUtGjHez
        xwK2nQt4AqOOdTlNheo3C5rfMBbbIgx0qEFvk5zrhqedGOtD4KP3Y7JL8V4kgtPgOJEqhlZioQd
        bsmFuDDN74R7fEsKxzM/SOYexjw0uEM0kwQ==
X-Received: by 2002:a17:907:7244:b0:6f4:b93e:58a6 with SMTP id ds4-20020a170907724400b006f4b93e58a6mr24969819ejc.543.1652284569330;
        Wed, 11 May 2022 08:56:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUpXlveqJO5jCVPlVUgX9uBZ8ZXqoTYyuSpX0oWZBkPZpB1IPmGRhUeoeREm30aeOGDGnd+w==
X-Received: by 2002:a17:907:7244:b0:6f4:b93e:58a6 with SMTP id ds4-20020a170907724400b006f4b93e58a6mr24969804ejc.543.1652284569151;
        Wed, 11 May 2022 08:56:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id q9-20020a17090676c900b006f3ef214e63sm1098915ejn.201.2022.05.11.08.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 08:56:08 -0700 (PDT)
Message-ID: <e2f85541-3e7b-6120-1c44-70ec4447291c@redhat.com>
Date:   Wed, 11 May 2022 17:56:08 +0200
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
Content-Transfer-Encoding: 8bit
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

Note not related to this patch, but when test building intel-speed-select
I got the following compiler warning:

  CC      hfi-events.o
In function ‘process_hfi_event’,
    inlined from ‘handle_event’ at hfi-events.c:220:5:
hfi-events.c:184:9: warning: ‘perf_cap.cpu’ may be used uninitialized [-Wmaybe-uninitialized]
  184 |         process_level_change(perf_cap->cpu);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
hfi-events.c: In function ‘handle_event’:
hfi-events.c:193:25: note: ‘perf_cap.cpu’ was declared here
  193 |         struct perf_cap perf_cap;
      |                         ^~~~~~~~


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

