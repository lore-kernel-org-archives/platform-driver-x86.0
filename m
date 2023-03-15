Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED29C61DA4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Mar 2023 12:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232965AbjCOMsZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Mar 2023 08:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232814AbjCOMsX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2023 08:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7E1158B8
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678884401;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4dxDu1EH9xzCVL/y99BM1/A0FCm7l89PRdNnkV8wtss=;
        b=HUorWWhgH9yNfmy3CrtOAzfcDF5Vl0fb6gHnwyGdHwYbN062+KnOWK0BOybcxFk0mEcv+V
        oTq74+evdaXOYTKYp+buO0/sQDU9j9kR0g9f3UsUgXxl/HUoS7PO59l9MbE4WBfCDMC1kg
        o7MdweSc0I2AaWA7GuORjgmic/rEqtI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-wZ24PtBfNY-sbA_vHuusSw-1; Wed, 15 Mar 2023 08:46:36 -0400
X-MC-Unique: wZ24PtBfNY-sbA_vHuusSw-1
Received: by mail-ed1-f72.google.com with SMTP id r9-20020a05640251c900b004d4257341c2so26684678edd.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 05:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678884395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dxDu1EH9xzCVL/y99BM1/A0FCm7l89PRdNnkV8wtss=;
        b=kJ4z7O0Nm4iRXahVqAVh/SlDdZ2b6qVCVOagMQYCMsMMJBeO2rNXAJ/dvCRrLM21lp
         W5awWLaHkIT4FCIyNeHT3ImdcqFWPtmPgZUx8u4q3n3ChW+gu59yVSKamj553oU+F04B
         lEA7y5JMl4AUUbHyNQveHGQsq+NoT4ihkdYwoa3c8DXhsXl+dl88duHyKC19oeLOC9r3
         CNbmNfrdro/y2CCBz0GB3Iv+bzvrWbg2U+Ge4d1ByWf3ML/SazCvaByOYe3vMSn0caev
         J+niDC/noWPhNT3bdIacqPaepl4jMwUzKAwLVx46I2xmO7QoUMge3Wb0xBTPkilgkVYK
         gBxA==
X-Gm-Message-State: AO0yUKXVgRvYUN2LPKGoVpDVslGwVI2Ja4oHWf+0H4i6Mdzyha4pQ7Bx
        k1rJcogfZ1asbFxCdiurDGAFMcjH+P1C0g00LRmFSXbqwpDqj/GHEIIhIN9uWdPraezv/SUM3oq
        W08mkzsEKCkz2PvTj3P6Brx4xa/IgXy36yQ==
X-Received: by 2002:a17:906:1553:b0:92b:e330:a79e with SMTP id c19-20020a170906155300b0092be330a79emr6121006ejd.29.1678884395608;
        Wed, 15 Mar 2023 05:46:35 -0700 (PDT)
X-Google-Smtp-Source: AK7set8IK7xy9Gyad0ICG5LXH/Wy/T1yn1gap9RxlbxLzdAkT7NnvZGJDrCG4PQyJJggyRytobddmg==
X-Received: by 2002:a17:906:1553:b0:92b:e330:a79e with SMTP id c19-20020a170906155300b0092be330a79emr6120995ejd.29.1678884395332;
        Wed, 15 Mar 2023 05:46:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f5-20020a170906c08500b0092babe82cfesm2438183ejz.215.2023.03.15.05.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 05:46:34 -0700 (PDT)
Message-ID: <a0cab8a8-dbbf-9335-134c-c5b2751a81b4@redhat.com>
Date:   Wed, 15 Mar 2023 13:46:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 05/36] platform/x86: intel-uncore-freq: move to use
 bus_get_dev_root()
Content-Language: en-US, nl
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20230313182918.1312597-1-gregkh@linuxfoundation.org>
 <20230313182918.1312597-5-gregkh@linuxfoundation.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230313182918.1312597-5-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/13/23 19:28, Greg Kroah-Hartman wrote:
> Direct access to the struct bus_type dev_root pointer is going away soon
> so replace that with a call to bus_get_dev_root() instead, which is what
> it is there for.
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: platform-driver-x86@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Note, this is a patch that is a prepatory cleanup as part of a larger
> series of patches that is working on resolving some old driver core
> design mistakes.  It will build and apply cleanly on top of 6.3-rc2 on
> its own, but I'd prefer if I could take it through my driver-core tree
> so that the driver core changes can be taken through there for 6.4-rc1.

Taking this upstream through the driver-core tree is fine by me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> index cb24de9e97dc..1a300e14f350 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
> @@ -224,9 +224,15 @@ int uncore_freq_common_init(int (*read_control_freq)(struct uncore_data *data, u
>  	uncore_write = write_control_freq;
>  	uncore_read_freq = read_freq;
>  
> -	if (!uncore_root_kobj)
> -		uncore_root_kobj = kobject_create_and_add("intel_uncore_frequency",
> -							    &cpu_subsys.dev_root->kobj);
> +	if (!uncore_root_kobj) {
> +		struct device *dev_root = bus_get_dev_root(&cpu_subsys);
> +
> +		if (dev_root) {
> +			uncore_root_kobj = kobject_create_and_add("intel_uncore_frequency",
> +								  &dev_root->kobj);
> +			put_device(dev_root);
> +		}
> +	}
>  	if (uncore_root_kobj)
>  		++uncore_instance_count;
>  	mutex_unlock(&uncore_lock);

