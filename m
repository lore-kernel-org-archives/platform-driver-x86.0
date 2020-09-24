Return-Path: <SRS0=VZIW=DB=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3643AC4346E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:33:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDB23206FC
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Sep 2020 08:33:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0KUjsRk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgIXIdf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:33:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59383 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727229AbgIXIdf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Sep 2020 04:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600936414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oqKbRIjNEjPRUSfu2Q0g2a+chSYmgaNVGZ2ZdS94UeA=;
        b=g0KUjsRk0+ct2Lb1Ed5taptHFBolod7MLN5UjbR7kWfYSD0EqoZE8DGYiSBNqeWiA7cpTh
        cqIMgw9pFe/lTn5xOGFhoO3+yLrQPf/iU0frEp+ANg7xDV91hjS9eGjjqfcV4bXhbcu3IN
        Lc/sqkRER1pPAOHFGyBpP7xP1P7PJyc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-l9CXpgm1PCeo4vs10qT0KQ-1; Thu, 24 Sep 2020 04:33:32 -0400
X-MC-Unique: l9CXpgm1PCeo4vs10qT0KQ-1
Received: by mail-ej1-f72.google.com with SMTP id lx11so1006365ejb.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2020 01:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oqKbRIjNEjPRUSfu2Q0g2a+chSYmgaNVGZ2ZdS94UeA=;
        b=Xv4w3x42zMdd/9eXdZqFzYTBN6z3YAqSKZ4agqmesKtG0o1AVFmZysRKa29pnANGeO
         /HLnSO1IadwuW4UvFEPgZVKa417irvuIIg3DjG4TR8ptcP/OE0biWXQOUg24KWvNakrq
         +DNrFupjI3SJUE47NaTiniw4+16phBK64eALO5Yjtma/satVvUqANwpdMnzhcLgX/kAm
         9oQdneEacqAiBhTbY60TwrHD9wqDUZSTI4K3yiaL0Rnbuh7d20W5kjnsU35dlxY1jtGf
         VZ28OB1zBcP2p+fM+UBvOKIJj4oTP9TfaBxFeYvtHeIijuSnWuGSpvHs9AH8h9mlU1Jw
         13qw==
X-Gm-Message-State: AOAM530LU+GLgLUTu9aVX+Y9H2Yw1jQzPXdsrMZaeP6AxIsErI3g+2Oj
        YUMtC/Xp1IPaZiXOZr4DUopPdAIG3cjn1ILDyXVkJj3n+ZcPzCJMZUUwCJZW9t/hmPjl+jhfa1j
        UWiseBq1DDSCbi+jVlJCE06AMsE/NWyD1GA==
X-Received: by 2002:a17:906:4088:: with SMTP id u8mr3572582ejj.184.1600936410608;
        Thu, 24 Sep 2020 01:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1NyUh5kOix0ApAoJR7FD23ve4z3KSQfP9/rvWWgTfyQ88HKzY8dt6ChNA4MHjr2GHQmpLyw==
X-Received: by 2002:a17:906:4088:: with SMTP id u8mr3572559ejj.184.1600936410324;
        Thu, 24 Sep 2020 01:33:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id j8sm1939690edp.58.2020.09.24.01.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 01:33:29 -0700 (PDT)
Subject: Re: [PATCH platform-next 3/5] platform_data/mlxreg: Update module
 license
To:     Vadim Pasternak <vadimp@nvidia.com>, andy.shevchenko@gmail.com,
        dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20200923172053.26296-1-vadimp@nvidia.com>
 <20200923172053.26296-4-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <24c96660-d7dd-71e5-9e2e-6f1279dbb3d7@redhat.com>
Date:   Thu, 24 Sep 2020 10:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923172053.26296-4-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/20 7:20 PM, Vadim Pasternak wrote:
> Update license to SPDX-License.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>   include/linux/platform_data/mlxreg.h | 32 ++------------------------------
>   1 file changed, 2 insertions(+), 30 deletions(-)
> 
> diff --git a/include/linux/platform_data/mlxreg.h b/include/linux/platform_data/mlxreg.h
> index 1af9c01563f9..0a727d405a7a 100644
> --- a/include/linux/platform_data/mlxreg.h
> +++ b/include/linux/platform_data/mlxreg.h
> @@ -1,34 +1,6 @@
> +/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0 */
>   /*
> - * Copyright (c) 2017 Mellanox Technologies. All rights reserved.
> - * Copyright (c) 2017 Vadim Pasternak <vadimp@mellanox.com>
> - *
> - * Redistribution and use in source and binary forms, with or without
> - * modification, are permitted provided that the following conditions are met:
> - *
> - * 1. Redistributions of source code must retain the above copyright
> - *    notice, this list of conditions and the following disclaimer.
> - * 2. Redistributions in binary form must reproduce the above copyright
> - *    notice, this list of conditions and the following disclaimer in the
> - *    documentation and/or other materials provided with the distribution.
> - * 3. Neither the names of the copyright holders nor the names of its
> - *    contributors may be used to endorse or promote products derived from
> - *    this software without specific prior written permission.
> - *
> - * Alternatively, this software may be distributed under the terms of the
> - * GNU General Public License ("GPL") version 2 as published by the Free
> - * Software Foundation.
> - *
> - * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
> - * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
> - * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
> - * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
> - * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
> - * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
> - * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
> - * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
> - * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
> - * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> - * POSSIBILITY OF SUCH DAMAGE.
> + * Copyright (C) 2017-2020 Mellanox Technologies Ltd.
>    */
>   
>   #ifndef __LINUX_PLATFORM_DATA_MLXREG_H
> 

