Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1D5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Apr 2022 23:16:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242463AbiDDXSf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Apr 2022 19:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242705AbiDDXSV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Apr 2022 19:18:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DC89C13F64
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Apr 2022 16:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649113778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GoDFClALfZx3hYzEufyttNdszQqX3iNCN/yV7oFxPtg=;
        b=CdR/hYFur6WGOwxJZ6TtElV7iNsROne1VrveLZt8IXGF6lD4UkowoCD/k24m4NEwgy84/s
        RwJ+WneroUgN4N5UsOYUSiFDG7kFGa4sxxSFLXgliCkrlr6/R7wHCRLBZY2NiXbmUZ7IsK
        XCvXuLNdhwk+Iz/814eZqviKIOSM03w=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-J1YQlwCPOu6bUUB55Mu0fw-1; Mon, 04 Apr 2022 19:09:36 -0400
X-MC-Unique: J1YQlwCPOu6bUUB55Mu0fw-1
Received: by mail-qk1-f198.google.com with SMTP id y140-20020a376492000000b0067b14129a63so7227572qkb.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Apr 2022 16:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GoDFClALfZx3hYzEufyttNdszQqX3iNCN/yV7oFxPtg=;
        b=UiNBgMfOnfFyd71a3hlAMd8IfhmqWuxqWsIrROR0U2Z6REiJkNynuax30m2E3qg1RQ
         ciJX2sELiyTFl4dcQ73WekRdDlIPMAtqSkmuVrHyDXeHNwe11zlLjhYVXjfpDQjo0enO
         pyHuC5QVcud0++tfqW47Xt7oNHehyc2trlKyEex0FHGDKkYFFZKJXY+qIBudtPxh8hq+
         Ss1Q7b1DNzwBuEZ32mdyK1m0uL581YjlsFxWP7+J6vbIMlG3vHpSsgHDqc2oYWxR2kLk
         HnNJ5Tk02+Sq4i39fbGvrTZ+jW4EMUeL88f2QrVpbX+4cNTWVgLtOWQbFjzDFGGICUYO
         BPPQ==
X-Gm-Message-State: AOAM530yoVCW+0lUsLWe0tG/Y3SfnJ4KX4o7mYXtB5w1hjOtAMR6CgCX
        UPJAXoajrTO6d+32xHPd1ChDNYGV5h0fHAHHEIke/mvoM4s5yUBkfkGKIOFt+oI/joS9+PyZOiq
        v29m7z/KHNjWaHPeZKCCkVUyAqVQWfehiBw==
X-Received: by 2002:a05:622a:130a:b0:2e0:70b4:d9b6 with SMTP id v10-20020a05622a130a00b002e070b4d9b6mr678996qtk.260.1649113776252;
        Mon, 04 Apr 2022 16:09:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWj540dmhJ9MxizmCF4rbxArBSnx9PlOEtw8EZY7GT31DlpR5ChPPrQgKEk7opAd84MKg4nQ==
X-Received: by 2002:a05:622a:130a:b0:2e0:70b4:d9b6 with SMTP id v10-20020a05622a130a00b002e070b4d9b6mr678980qtk.260.1649113775983;
        Mon, 04 Apr 2022 16:09:35 -0700 (PDT)
Received: from [10.16.222.26] (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id d126-20020a37b484000000b0067e60283d08sm7390996qkf.40.2022.04.04.16.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 16:09:35 -0700 (PDT)
Message-ID: <70fd2675-3026-4d59-cf9c-e14458021b94@redhat.com>
Date:   Mon, 4 Apr 2022 19:09:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: fix build failure
 when using -Wl,--as-needed
Content-Language: en-US
To:     "Herton R. Krzesinski" <herton@redhat.com>,
        platform-driver-x86@vger.kernel.org
Cc:     srinivas.pandruvada@linux.intel.com, jforbes@redhat.com,
        darcari@redhat.com, dzickus@redhat.com
References: <20220404210525.725611-1-herton@redhat.com>
From:   Prarit Bhargava <prarit@redhat.com>
In-Reply-To: <20220404210525.725611-1-herton@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 4/4/22 17:05, Herton R. Krzesinski wrote:
> Build of intel-speed-select will fail if you run:
> 
> $ LDFLAGS="-Wl,--as-needed" /usr/bin/make V=1
> ...
> gcc -O2 -Wall -g -D_GNU_SOURCE -Iinclude -I/usr/include/libnl3 -Wl,--as-needed -lnl-genl-3 -lnl-3 intel-speed-select-in.o -o intel-speed-select
> /usr/bin/ld: intel-speed-select-in.o: in function `handle_event':
> (...)/linux/tools/power/x86/intel-speed-select/hfi-events.c:189: undefined reference to `nlmsg_hdr'
> ...
> 

Srinivas, This is important as it blocks ARK (ie think of RHEL-next) 
kernel builds and blocks us from bringing this code into current 
versions of RHEL.

Just an FYI,

P.

> In this case the problem is that order when linking matters when using
> the flag -Wl,--as-needed, symbols not used at that point are discarded.
> So since intel-speed-select-in.o comes after, at that point the
> libraries/symbols are already discarded and then missing/undefined
> references are reported.
> 
> To fix this, make sure we specify LDFLAGS after the object file.
> 
> Signed-off-by: Herton R. Krzesinski <herton@redhat.com>
> ---
>   tools/power/x86/intel-speed-select/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/Makefile b/tools/power/x86/intel-speed-select/Makefile
> index 846f785e278d..7221f2f55e8b 100644
> --- a/tools/power/x86/intel-speed-select/Makefile
> +++ b/tools/power/x86/intel-speed-select/Makefile
> @@ -42,7 +42,7 @@ ISST_IN := $(OUTPUT)intel-speed-select-in.o
>   $(ISST_IN): prepare FORCE
>   	$(Q)$(MAKE) $(build)=intel-speed-select
>   $(OUTPUT)intel-speed-select: $(ISST_IN)
> -	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
> +	$(QUIET_LINK)$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@
>   
>   clean:
>   	rm -f $(ALL_PROGRAMS)

