Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEAAC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Mar 2023 15:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbjCMPEb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Mar 2023 11:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCMPEa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 11:04:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839DA2310C
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 08:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678719792;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pZ49mGv28iBaz7X24970hd41Ch6EkiVMx/J+Ek7710U=;
        b=dOLyU9j6lVlo78vHHarXE8RjKHbM4HH6R7wgOV58pkwJ/WHsF1vLY69s6JHuaXMy7cAOcE
        3wrkiOJtKi5CQepmfWvYoqV8QFz9T1TSc3lturWpC7JYZKaCAzsVhLFCU+3fVD1M6ZYqKw
        cvPBui7k7L4SiSQdNS81hPgRfDZUYkc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-OzGYisodOdSPhhmPiUpnkQ-1; Mon, 13 Mar 2023 11:03:10 -0400
X-MC-Unique: OzGYisodOdSPhhmPiUpnkQ-1
Received: by mail-ed1-f69.google.com with SMTP id r9-20020a05640251c900b004d4257341c2so17357876edd.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 08:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678719789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ49mGv28iBaz7X24970hd41Ch6EkiVMx/J+Ek7710U=;
        b=UQX9ggfg9Uxo09jvUL1FvgfoL1RVZSsY8oljaA9Y4DFuc6Ktw3cxtZOSgcH1vsAj3w
         F3MAuiFACKHnf9e9ZTA00dtv2lnHefdKvoHcQcX4Lm6BPevbff62xkPm8uN6BieZIWlY
         sEMpBIYq8qoYZ04r87OHLaNRaiJPIU+jX6kg80x3NXvj51z7X6m5/QxvrAJ0S3hhYxaL
         NIdbMkZF8yXd4xHaCz0qx/bKAgrqWXKbzcf1OefMGKrYCxI3I68x44d8NFllRRgWNhGU
         GVy3OtPcNIpUxRO9StOJDWZYpyA3WWZOS5heE+hM6t60rQiQ2u36i+q1xAM9TyTLgfdV
         MUSA==
X-Gm-Message-State: AO0yUKWx1AwNyLrP0DSTSDWr7yxVHlq5LqazYvAMZm+EXffAaZlvWiZp
        fbJsAmRcTRu6FycHCfeEWwE3S9CRTUIohKP6p3i6ZwMzMKEzdLZGVh+SE0Q+BkQ6i/tfJ16UzsZ
        pmEMRsFtFfAF3VmP98i8e7oQ+pP/vWsTGWw==
X-Received: by 2002:a17:907:e8d:b0:8af:5752:691f with SMTP id ho13-20020a1709070e8d00b008af5752691fmr42132568ejc.76.1678719789484;
        Mon, 13 Mar 2023 08:03:09 -0700 (PDT)
X-Google-Smtp-Source: AK7set9DZQ94D+TsWkTFR06KObrdN3jzxn91sJ+YsKqm39NbPokTmU4hc+TAPRkNZv5Irs3O4mIJsg==
X-Received: by 2002:a17:907:e8d:b0:8af:5752:691f with SMTP id ho13-20020a1709070e8d00b008af5752691fmr42132536ejc.76.1678719789224;
        Mon, 13 Mar 2023 08:03:09 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id b21-20020a17090630d500b008cafeec917dsm3524898ejb.101.2023.03.13.08.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 08:03:08 -0700 (PDT)
Message-ID: <3a91a794-b56e-eb21-58da-5abc8edbbc37@redhat.com>
Date:   Mon, 13 Mar 2023 16:03:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/8] x86/include/asm/msr-index.h: Add IFS Array test
 bits
Content-Language: en-US
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, rostedt@goodmis.org,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com,
        sohil.mehta@intel.com
References: <20230214234426.344960-1-jithu.joseph@intel.com>
 <20230301015942.462799-1-jithu.joseph@intel.com>
 <20230301015942.462799-4-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230301015942.462799-4-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 02:59, Jithu Joseph wrote:
> Define MSR bitfields for enumerating support for Array BIST test.
> 
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> ---
>  arch/x86/include/asm/msr-index.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index d3fe82c5d6b6..ad8997773ad3 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -197,6 +197,8 @@
>  
>  /* Abbreviated from Intel SDM name IA32_INTEGRITY_CAPABILITIES */
>  #define MSR_INTEGRITY_CAPS			0x000002d9
> +#define MSR_INTEGRITY_CAPS_ARRAY_BIST_BIT      2
> +#define MSR_INTEGRITY_CAPS_ARRAY_BIST          BIT(MSR_INTEGRITY_CAPS_ARRAY_BIST_BIT)
>  #define MSR_INTEGRITY_CAPS_PERIODIC_BIST_BIT	4
>  #define MSR_INTEGRITY_CAPS_PERIODIC_BIST	BIT(MSR_INTEGRITY_CAPS_PERIODIC_BIST_BIT)
>  


Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

