Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347B5C00140
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Aug 2022 11:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236214AbiHELIj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Aug 2022 07:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232506AbiHELIi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Aug 2022 07:08:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D67BE606B4
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Aug 2022 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659697717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=H7ro23ccNDXIOLFXHbxQ6ADDegHqjdLzYFNTI5m8Umc=;
        b=B59uqzHNaPvFI4+qtiAsrG7nGUiY2WOdLGluQbMTcGwOz01YcQ4OdFGqvxli4jsy4AChU3
        OR/e8/VFiVPpP1Ri1w+kaWMbnf463Ig+8RHEXXC+1sbY2X1O8Xa2e9NNJyFs6WoWqCeix/
        o1IS+Bzgca6CsJ1Aej0VJ3jtNYq4A7I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-twS--15BNbCNk3NL9JLJwQ-1; Fri, 05 Aug 2022 07:08:35 -0400
X-MC-Unique: twS--15BNbCNk3NL9JLJwQ-1
Received: by mail-ed1-f69.google.com with SMTP id g8-20020a056402424800b0043e81c582a4so1402679edb.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Aug 2022 04:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=H7ro23ccNDXIOLFXHbxQ6ADDegHqjdLzYFNTI5m8Umc=;
        b=KwhodgELBHcmvvMEQBxKZXnt9Fl/oK7kByI7xX15CvIHU0IrrbJoVtRWnzC+En1Ql5
         evxfZyxuJ51C+yao4CC1UOebM69TrXcvFs/djaSQGJroUj05p1GOYJ4rg79B0PonJ2c+
         JO5u+RSnunP35HSbgzPSGILBmkkcvayQI0zVgvlAAWtEKVlYSTCqUcD7co59HOeplNUe
         sxqhQwkhIEc4dln2vAPG709aU8TDZqL+Txo3hTX8T4uRD3oCqraRSuAgwV9wrp0+pnUB
         UGVy3i1SmxmKdjaHC3BffUmt5B53s8QlKi096YNgmaH6Cjw3hV2Sjc/m/FtQkj8VTa5b
         brWQ==
X-Gm-Message-State: ACgBeo2ZQzmweJmWD0zbvx4z1cv8q+z5EuJ8to+YPZmsUnFCCdWtz0Z7
        3N1giyspsQ3JgkcGD8HCoVZtc8W8dx1/Iu8Fspr37FQgEATkKTd52ul1MkONh9vsLBOKaqSdgk8
        Tg3Gj3SIrsHa8izM8UVsTBbU04CIg303Nyw==
X-Received: by 2002:a17:907:6930:b0:730:f00f:7ad2 with SMTP id rb48-20020a170907693000b00730f00f7ad2mr2141717ejc.389.1659697714431;
        Fri, 05 Aug 2022 04:08:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6CUXihCkN0D5ZHDZ0TborZk4BcETjNE7Ra0BEus61UdzNgZUF1Bg4Ifi15SIDetE2EzBovvg==
X-Received: by 2002:a17:907:6930:b0:730:f00f:7ad2 with SMTP id rb48-20020a170907693000b00730f00f7ad2mr2141711ejc.389.1659697714281;
        Fri, 05 Aug 2022 04:08:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ek6-20020a056402370600b0043df40e4cfdsm745453edb.35.2022.08.05.04.08.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 04:08:33 -0700 (PDT)
Message-ID: <8f7631c6-fb08-f41d-e370-8ed27468a3e8@redhat.com>
Date:   Fri, 5 Aug 2022 13:08:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 11/11] MAINTAINERS: Add AMD PMF driver entry
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802151149.2123699-1-Shyam-sundar.S-k@amd.com>
 <20220802151149.2123699-12-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802151149.2123699-12-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 17:11, Shyam Sundar S K wrote:
> Update the MAINTAINERS file with AMD PMF driver details.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e01478062c56..d3f6cabcaab2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -998,6 +998,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/amd/pmc.c
>  
> +AMD PMF DRIVER
> +M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-amd-pmf

Since the CnQF support was dropped, this file
does not exist, so I've dropped this line from
the MAINTAINERS file while merging this.

Regards,

Hans


> +F:	drivers/platform/x86/amd/pmf/
> +
>  AMD HSMP DRIVER
>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>  R:	Carlos Bilbao <carlos.bilbao@amd.com>

