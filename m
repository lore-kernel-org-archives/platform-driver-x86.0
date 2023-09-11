Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D209CCA0EC8
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236709AbjIKWA6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236704AbjIKLPM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 07:15:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6FF3CDD
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694430859;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pgyi8cPnSlJRXjLXjWR86gYQ+47FyiGTRbxn+qkYf94=;
        b=hjC93WDP4RKQ/hk69JyGSYmnrePEIz13t/6E9r0m03eyo6rDvRAD/ByB3/2L9ReqTxbb5B
        IHDQgKDzmf7CTBmHfp67044+pizOa5pwomZ7qsltJPem6QZBVmGwrsa2iF9INNgIcWWMgh
        S2G+6yA6p/gwxsTIxZ6pb1D5rVOzpH4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-NnwM-KUvPiy61xtp3dMSpQ-1; Mon, 11 Sep 2023 07:14:18 -0400
X-MC-Unique: NnwM-KUvPiy61xtp3dMSpQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2be51691dd5so45501651fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430857; x=1695035657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgyi8cPnSlJRXjLXjWR86gYQ+47FyiGTRbxn+qkYf94=;
        b=Hz1UG0h2JCiUhPS2/D09LT4GM7ha8vjlKbTK9zTDNpWVZsn/I7UTzgtsTYNBdyRfIz
         Sf2LOSCuFwJrfMC/RL7JBH+SEGycrl1efLJYLJNPv8rQNiyqXcVEUKbMxn+3w3c3u4hN
         9w+EU/arcGfit5zdpqA/MRAGIs4kgcH1THy0bohbM/2S2jLgP3i9AuMZfpXs83hUJ4iV
         SIGth1f2Cns4fGy2dq4Ex5pKJpGQGg01SUHa7SgzYvJiOoNqY1kj4T+RyZW53jQ6Lw1v
         GJoIN1l6tLVIDOPJQGkbow9zImV2EsjC0m+nLneML+clqjNqYwCEQrO5s3ybrxoapKdK
         Ow6g==
X-Gm-Message-State: AOJu0YwhHOX2JnCG9OogqQz34kn6dW0DMsc4N9DSzZYP/QODsTVr7LIa
        sokIDCSPw2o9fT0nd4A/dPZ2OPK4UiXRysBX3fWR6VF8LZz0JjtChyLOi+VSbLlOuAwFYmePMae
        Dkhdr8dUXXHBcVn7m7wdpEnsTr3YuyBFqeg==
X-Received: by 2002:a2e:86d9:0:b0:2bc:d8cb:5a13 with SMTP id n25-20020a2e86d9000000b002bcd8cb5a13mr7835147ljj.42.1694430857078;
        Mon, 11 Sep 2023 04:14:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBjNk1Ed8h4wPAAHSnv3OnM7Lf9/xEyYkEWPq1tWRCcklr7WQDnnpkgDureN3fGSCToYl9Ug==
X-Received: by 2002:a2e:86d9:0:b0:2bc:d8cb:5a13 with SMTP id n25-20020a2e86d9000000b002bcd8cb5a13mr7835138ljj.42.1694430856763;
        Mon, 11 Sep 2023 04:14:16 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s22-20020a1709064d9600b00988b8ff849csm5203013eju.108.2023.09.11.04.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:14:16 -0700 (PDT)
Message-ID: <9a833864-24ac-0ff3-826d-7cb0e0dcb89b@redhat.com>
Date:   Mon, 11 Sep 2023 13:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 0/2] mlxbf-tmfifo: Add some robust fixes
Content-Language: en-US
To:     Liming Sun <limings@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1693266447.git.limings@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1693266447.git.limings@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/29/23 19:42, Liming Sun wrote:
> This patch series have two robust fixes for the mlxbf-tmfifo driver
> syncing up to upstream.
> 
> Liming Sun (2):
>   mlxbf-tmfifo: Drop the Rx packet if no more descriptors
>   mlxbf-tmfifo: Drop jumbo frames

Thank you for your patch, I've applied this series to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> 
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 87 +++++++++++++++++-------
>  1 file changed, 63 insertions(+), 24 deletions(-)
> 

