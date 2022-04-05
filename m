Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCD9C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Apr 2022 11:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237691AbiDELIr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Apr 2022 07:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351384AbiDEKCV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Apr 2022 06:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B25D6D39B
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Apr 2022 02:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649152297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H4qRK26d7ws7MVYSNjtgaeXnx7aWL+FXFGuAeIj9FDs=;
        b=fVcYBm0iPtdh/K2W42WVh2PzAhhcvh+KJQuZC8QmTzto6+Xcv2jll/btQh6gRxrdZpa2yh
        sxT5ZdWsZjjJAAkxea1qfVla7n8WSCL4UbC3BhhaJjS5LLd7L/jDRlHbkhG6R6misXWOTI
        ffruXqs3G7c5nECXQkQYvuU8A4bSWAQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-j8PRE6rbNF-IvMU2CgP-DQ-1; Tue, 05 Apr 2022 05:51:36 -0400
X-MC-Unique: j8PRE6rbNF-IvMU2CgP-DQ-1
Received: by mail-ej1-f69.google.com with SMTP id jg2-20020a170907970200b006e7eebce76cso2775419ejc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Apr 2022 02:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=H4qRK26d7ws7MVYSNjtgaeXnx7aWL+FXFGuAeIj9FDs=;
        b=LgbPxTyP4SnTH4gTqF7hudj0JbwIeI7vdorr25Wp3mwGD5eEYudHRCOeBZbR5tbIz/
         mYakQT8uHw6eErnuz/AQ86GcojWXG+RdTNkWwY6Vw8gbh88Jv//VTeFN7SLI8YAAR/uB
         tG3HdpOXGUOd5RTx7f56aL3uNKRSLs5RYAArv4IoRidnOO6OYGCah4wwEA2fZzndW6k9
         4FDw9KbxMZQb7iGoBEWp7fxHk+1wPGZ03V5uvMijvqJrBVSSmoV5hvFa+Ftuo4D7A4S5
         bRiuFNBqxc8lmaV4nFZnKlsu9gcITV+oCl2LtL7TCns3dA/Pot00eW9mhS+MkDKZTSQ6
         HebA==
X-Gm-Message-State: AOAM531enRcyLLVZtuAUBQMfd+tVE13bZMnwYobV7tS9vsOF+nzj0ExF
        46s4NL6cyEbNGXmRBZMZn4ovONB+3sX3cqRNFHQFI8wviAIN79cGB8bdZsYaEVw1yVJwv+UfpF4
        XIAO4Rtpt0U4epgV6i/guzLWnjO6pc3ASLQ==
X-Received: by 2002:a17:907:1c0b:b0:6e7:f58a:9b8e with SMTP id nc11-20020a1709071c0b00b006e7f58a9b8emr2692463ejc.438.1649152295306;
        Tue, 05 Apr 2022 02:51:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2w+DWS7UJ5YW7Phgv2DLntkuFicDQAyUmv/YPkQswdwm9MLE7ll7MZuuGD5v9W1jGKkkC+Q==
X-Received: by 2002:a17:907:1c0b:b0:6e7:f58a:9b8e with SMTP id nc11-20020a1709071c0b00b006e7f58a9b8emr2692442ejc.438.1649152295050;
        Tue, 05 Apr 2022 02:51:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id g2-20020a50bf42000000b0041cc5233252sm3240425edk.57.2022.04.05.02.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 02:51:34 -0700 (PDT)
Message-ID: <0b9b0ede-25ec-5455-95e3-e93a043fec76@redhat.com>
Date:   Tue, 5 Apr 2022 11:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: fix build failure
 when using -Wl,--as-needed
Content-Language: en-US
To:     "Herton R. Krzesinski" <herton@redhat.com>,
        platform-driver-x86@vger.kernel.org
Cc:     srinivas.pandruvada@linux.intel.com, prarit@redhat.com,
        jforbes@redhat.com, darcari@redhat.com, dzickus@redhat.com
References: <20220404210525.725611-1-herton@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220404210525.725611-1-herton@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 4/4/22 23:05, Herton R. Krzesinski wrote:
> Build of intel-speed-select will fail if you run:
> 
> $ LDFLAGS="-Wl,--as-needed" /usr/bin/make V=1
> ...
> gcc -O2 -Wall -g -D_GNU_SOURCE -Iinclude -I/usr/include/libnl3 -Wl,--as-needed -lnl-genl-3 -lnl-3 intel-speed-select-in.o -o intel-speed-select
> /usr/bin/ld: intel-speed-select-in.o: in function `handle_event':
> (...)/linux/tools/power/x86/intel-speed-select/hfi-events.c:189: undefined reference to `nlmsg_hdr'
> ...
> 
> In this case the problem is that order when linking matters when using
> the flag -Wl,--as-needed, symbols not used at that point are discarded.
> So since intel-speed-select-in.o comes after, at that point the
> libraries/symbols are already discarded and then missing/undefined
> references are reported.
> 
> To fix this, make sure we specify LDFLAGS after the object file.
> 
> Signed-off-by: Herton R. Krzesinski <herton@redhat.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I've also added this to my fixes branch and it will be included
when I send the next fixes for 5.18 pull-req to Linus.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  tools/power/x86/intel-speed-select/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
> index 846f785e278d..7221f2f55e8b 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -42,7 +42,7 @@ ISST_IN := $(OUTPUT)intel-speed-select-in.o
>  $(ISST_IN): prepare FORCE
>  	$(Q)$(MAKE) $(build)=intel-speed-select
>  $(OUTPUT)intel-speed-select: $(ISST_IN)
> -	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> +	$(QUIET_LINK)$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@
>  
>  clean:
>  	rm -f $(ALL_PROGRAMS)

