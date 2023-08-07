Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B256C001B0
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Aug 2023 11:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232981AbjHGLoR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Aug 2023 07:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbjHGLoD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Aug 2023 07:44:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599774C1C
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Aug 2023 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691408316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oMQdzYvM+Pe5aw7tEIhxWj87hwS9adLKe0i6Mj8H6Ns=;
        b=N0bZYKIFqs4JI7Yxp10r/ZmnESnFeL1hcvPX28fCqw0ln/f+dt5XXtDuAJLCQkqgylB01W
        F9opbJ4VCQbu1sFUiKP9kEayo0WlqTWFRg8q0/l5aczbQtHICGnnKHrh+xheQUqP9Mv7Eo
        3wxGaj4hww4vx0Zh+5XOWaZFbhVBHRw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-Hbb9BESfPjKnLXCUx4AcwQ-1; Mon, 07 Aug 2023 07:38:35 -0400
X-MC-Unique: Hbb9BESfPjKnLXCUx4AcwQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99cc32f2ec5so117374566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Aug 2023 04:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691408314; x=1692013114;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMQdzYvM+Pe5aw7tEIhxWj87hwS9adLKe0i6Mj8H6Ns=;
        b=mGrksbbHrYdz2rBvobp9vPAKIKGC+kXUx0ZFf/o27H/gH9xXeqNQgb46YYHLhx21H4
         x5VEu46RXN5QfBr2MRqwFGBblESGL/JUyOkPrG1BvzjOVvj+H2WPax58TGsyOFlW186G
         yDsQp0xIU6kvCi3STL2SmLrDRRgwH+DxKfVvaDq9IPaRuAztnbHiU7QKPyRAn52Ybdbw
         uQpWufm4MjLxuPPmt41fcTS8Bi17/6UUD2q98LN7GkfpfDv0Kf+SFW5J8OkWXpCMkJUc
         hhwgUGMpvMNGSdDy+ys/ndjcG9N/pAifyqeoJqorCq1UwMAi9eK7GfdSuY2X3b4DvVeW
         PcuQ==
X-Gm-Message-State: AOJu0Yybsmesq8AJtrypHvcsfTF9TdgckbPQZlACdJ4OX1D/3030iBJQ
        BA0TB5zr15Od1yV8G7zuASv2z9W30nQ/EOMRa4DoetwDDeYXyaFBrcHbZUSZXcNUhAuKQf9x/9w
        8XSLQMWRZ2wv93nAYK+t4C64KVYxoOGzuJg==
X-Received: by 2002:a17:906:5a48:b0:98c:e72c:6b83 with SMTP id my8-20020a1709065a4800b0098ce72c6b83mr6759514ejc.45.1691408314630;
        Mon, 07 Aug 2023 04:38:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEednnRIFSijaQW/ULGrqvXgaSTiwrn9ONCcNWwL9t4vr8DBCCz8S3u7jBD/hirMYouKTl9Pw==
X-Received: by 2002:a17:906:5a48:b0:98c:e72c:6b83 with SMTP id my8-20020a1709065a4800b0098ce72c6b83mr6759504ejc.45.1691408314388;
        Mon, 07 Aug 2023 04:38:34 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906058400b00992c92af6f4sm5134795ejn.144.2023.08.07.04.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 04:38:33 -0700 (PDT)
Message-ID: <92096817-0183-566a-cdd3-74e6fa3a09c8@redhat.com>
Date:   Mon, 7 Aug 2023 13:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/8] hp-bioscfg: Overall fixes and code cleanup
Content-Language: en-US
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas@t-8ch.de, ilpo.jarvinen@linux.intel.com,
        dan.carpenter@linaro.org
References: <20230731203141.30044-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230731203141.30044-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/31/23 22:31, Jorge Lopez wrote:
> Submit individual patches to address memory leaks and uninitialized 
> variable errors. 
> Addressed several review comments making the source code more readable.
> Removed duplicate use of variable in inner loop.
> 
> Changes were tested with a HP EliteBook x360 1030 G3
> 
> Jorge Lopez (8):
>   hp-bioscfg: Fix memory leaks in attribute packages
>   hp-bioscfg: Fix uninitialized variable errors
>   hp-bioscfg: Replace the word HACK from source code
>   hp-bioscfg: Change how prerequisites size is evaluated
>   hp-bioscfg: Change how order list size is evaluated
>   hp-bioscfg: Change how enum possible values size is evaluated
>   hp-bioscfg: Change how password encoding size is evaluated
>   hp-bioscfg: Remove duplicate use of variable in inner loop
> 
>  .../x86/hp/hp-bioscfg/enum-attributes.c       | 24 ++++++++----
>  .../x86/hp/hp-bioscfg/int-attributes.c        | 15 +++++--
>  .../x86/hp/hp-bioscfg/order-list-attributes.c | 39 ++++++++++++-------
>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 27 +++++++++----
>  .../x86/hp/hp-bioscfg/string-attributes.c     | 13 +++++--
>  5 files changed, 82 insertions(+), 36 deletions(-)

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

