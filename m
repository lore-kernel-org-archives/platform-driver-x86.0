Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECF1C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 14:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238530AbiD0Otp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238520AbiD0Oto (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 10:49:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EA8CD3914F
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651070792;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YdEl5gFbNnh3pr0/DmoxHJ2wZUi5cPzRQ6e5jHf14Hs=;
        b=CoDocGMPw+czgBX8fuuL/fHwpGTVjcmFBCb9bxpkeKUQ4HhKRE+b5wxfEtkmX4jEdYUW5D
        71ghVS0WYQdZh9iQhJbYjFvz1lJTuyAhivnX69wWwUsIl1vvm/yKoJHUtV5EvQdAxqrSpE
        v8Q2rN1crwSaZ0CVwWy6oDY9xEBvqMM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-Ncjf9BbTMtqbsXRfFAYcFA-1; Wed, 27 Apr 2022 10:46:29 -0400
X-MC-Unique: Ncjf9BbTMtqbsXRfFAYcFA-1
Received: by mail-ej1-f69.google.com with SMTP id sh14-20020a1709076e8e00b006f3b7adb9ffso1285634ejc.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YdEl5gFbNnh3pr0/DmoxHJ2wZUi5cPzRQ6e5jHf14Hs=;
        b=JQ62vxhb2xcdOAqx1XzAr0DfkMjRNqXNkKq/joUUN8314hHyI3mlVAvDdud9gN7mIe
         8qBnX+2yBzOGgjJKARSCNQsdgX5U8p9gj2AU6zqnLkUgZKTmu6YbUqZVigfza2C7yDBI
         jI0ZoXv4oGgaO1GpI3VA41lweCXmelETVlS+znogCOkXG3SB2ceQky9leBRrKOgXbBrA
         Qkocoox0hgfjpln4Ko/EP7ietjZTJYxUZlszgxYBHG1e0r13R2jh9iHs7KBdRhUTj3fS
         6jaUlQpsgkKk2flQlgMaK7MnBoZe/oJfiNMuEfyDT4Mqfb35ezMJADo9hMUwMRDSmSVM
         mRgw==
X-Gm-Message-State: AOAM530/wptLX3C+f9HoQb+EnqhEoZjb4Yq/pw4HqxrxpfWEjtiJCF0f
        M410+aVuWNsNI5tx0NeuKaXe8jc+gJQzJyAC7Q/4eI5bqMtKU+nlhYcHh7DYyaf76Cz11M9/zPj
        qDc0PVljR0+UcT0qfcVq7vzoFjvYKjFqZfg==
X-Received: by 2002:a17:907:94c9:b0:6e8:ab67:829e with SMTP id dn9-20020a17090794c900b006e8ab67829emr26309671ejc.313.1651070787942;
        Wed, 27 Apr 2022 07:46:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjASHi6OBZZvgVZRJZu1gcVmJ/GgM/O5qUp6TeB4OjWCUhJ1CUpRZy/z4MHGkXZfLGS8B2tw==
X-Received: by 2002:a17:907:94c9:b0:6e8:ab67:829e with SMTP id dn9-20020a17090794c900b006e8ab67829emr26309647ejc.313.1651070787722;
        Wed, 27 Apr 2022 07:46:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709066a8500b006f3bdf3a2f4sm2142221ejr.105.2022.04.27.07.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:46:27 -0700 (PDT)
Message-ID: <9df369cb-db52-d8be-c244-1f3ec04b063b@redhat.com>
Date:   Wed, 27 Apr 2022 16:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86: intel-uncore-freq: Prevent driver loading
 in guests
Content-Language: en-US
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Borislav Petkov <bp@suse.de>
References: <20220421184154.747721-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220421184154.747721-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/21/22 20:41, Srinivas Pandruvada wrote:
> Loading this driver in guests results in unchecked MSR access error for
> MSR 0x620.
> 
> There is no use of reading and modifying package/die scoped uncore MSRs
> in guests. So check for CPU feature X86_FEATURE_HYPERVISOR to prevent
> loading of this driver in guests.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215870
> Suggested-by: Borislav Petkov <bp@suse.de>
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

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



> ---
>  drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> index c61f804dd44e..8f9c571d7257 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> @@ -212,6 +212,9 @@ static int __init intel_uncore_init(void)
>  	const struct x86_cpu_id *id;
>  	int ret;
>  
> +	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
> +		return -ENODEV;
> +
>  	id = x86_match_cpu(intel_uncore_cpu_ids);
>  	if (!id)
>  		return -ENODEV;

