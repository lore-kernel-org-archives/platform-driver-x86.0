Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7DCC7EE2D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 12:43:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjCAMnI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 07:43:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbjCAMnH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 07:43:07 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF07F3C7B1
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 04:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677674545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lRruoFijKI0eJ9z+j5eqOPxH2mXmxad09v4W8lYPbHg=;
        b=MpzQSf9ybt/evz39fbK37xiCK1QVutRswpVnqYESUt9Kli5ZK5sM7qlc8hU2MVhDUA0a0G
        tyEPZjrO9FgSS3x9W7/lTVkXCiWxhemVrTPpnKMQNm6A/0TUd1cLyB5snLAtRGTKLsMwVq
        H+AKU1E9uG75kFOpCuybIUF8XjrXOXY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-pJ459H9cPmuL-o508O28Yg-1; Wed, 01 Mar 2023 07:42:21 -0500
X-MC-Unique: pJ459H9cPmuL-o508O28Yg-1
Received: by mail-ed1-f71.google.com with SMTP id r6-20020aa7c146000000b004acd97105ffso18996582edp.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 04:42:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRruoFijKI0eJ9z+j5eqOPxH2mXmxad09v4W8lYPbHg=;
        b=IPqvuW1IJCYdphw1uUZ2Oai/1pLIwkB4O8JyfrcIS2OKMcudQvDfht2i56l4dmNHWU
         gCgyZMXw0Ln6UwgRebJ7yxprIP5Lz9uczK1m1ZS0/C84r8OzUWU5uxUKPrNEdX0i5C7S
         hN1/mMJE0OZpOdDHXOE9Nv/FmJHbF2QTtBCJEji4WR1tCwG/jiVdrAbG/qfmOCo38Rp2
         h1ydaU32783CQINSuzf3+e9VM/pSDavctY5RMYNNOppvh9S1CxSGbxElMOp2PxIKtJ+9
         N5uKe1JnfAw9q9jcsY8XREToptiKCeoUa6aKsYKh+YebvOA+K4CdFJBMp+uRtlcxxdyW
         DOaw==
X-Gm-Message-State: AO0yUKXA1FBjXidPNcigVMJuHXMf/AMdbmmVjDIjV3anOx73hAxWVvI7
        3RPy5S3V9lzjkg0uHAvgbQeeLuu7zeQbSOnlY2zU6xzHrYV7v8Km/8Rzn0KOhWsFks5jOvOLnUE
        CHjwQ8KEZSPyT0pEhODnWcZqPZ2o7nekqfA==
X-Received: by 2002:aa7:c9c6:0:b0:4af:69e2:52cd with SMTP id i6-20020aa7c9c6000000b004af69e252cdmr6310940edt.28.1677674540873;
        Wed, 01 Mar 2023 04:42:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9JMCjYKj4vd0F0V7y8ah9oSy/cKUWa/Bw9oYjoqHXJhv/cfc8loiLq+DIJ4RwXV6xsrLjKDQ==
X-Received: by 2002:aa7:c9c6:0:b0:4af:69e2:52cd with SMTP id i6-20020aa7c9c6000000b004af69e252cdmr6310921edt.28.1677674540586;
        Wed, 01 Mar 2023 04:42:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u26-20020a50d51a000000b004af6a840f21sm5517687edi.15.2023.03.01.04.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 04:42:19 -0800 (PST)
Message-ID: <5ffd8859-af37-5395-d309-ee04dbd5bdb8@redhat.com>
Date:   Wed, 1 Mar 2023 13:42:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: ISST: Increase range of valid mail box
 commands
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230227053504.2734214-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230227053504.2734214-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/27/23 06:35, Srinivas Pandruvada wrote:
> A new command CONFIG_TDP_GET_RATIO_INFO is added, with sub command type
> of 0x0C. The previous range of valid sub commands was from 0x00 to 0x0B.
> Change the valid range from 0x00 to 0x0C.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks, I've applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I'll rebase that branch once 6.3-rc1 is out and then push the rebased
patch to the fixes branch and include it in my next 6.3 fixes pull-req
to Linus.

Regards,

Hans





> ---
>  drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index a7e02b24a87a..0829e793a8fc 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -47,7 +47,7 @@ struct isst_cmd_set_req_type {
>  
>  static const struct isst_valid_cmd_ranges isst_valid_cmds[] = {
>  	{0xD0, 0x00, 0x03},
> -	{0x7F, 0x00, 0x0B},
> +	{0x7F, 0x00, 0x0C},
>  	{0x7F, 0x10, 0x12},
>  	{0x7F, 0x20, 0x23},
>  	{0x94, 0x03, 0x03},

