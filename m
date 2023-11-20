Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216E7C197A0
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 12:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbjKTMDr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 07:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbjKTMDq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 07:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1403BA7
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 04:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700481816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Kk6dPAPQIB5oFc8gPPE+qzlF7eDEXYGQPVOwULjN8Es=;
        b=fW/tVDhDGCNbCiY23s7Fk+EvLR26MVoyJxqS4RhrBJ59LkEaDdgWrT2PQ6GSDLGpkdBfpu
        +40VDsNLccDdMZgVTaGPESD0sMBahvY/Dmr6cdycPSmggmlm64S7717omHrmBJ8GMKr5H4
        aJ+UrZn32RkgH14Ol6GzUBedMDwF7to=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-TBMt8DVUOZGNSWgzqAGjEA-1; Mon, 20 Nov 2023 07:03:35 -0500
X-MC-Unique: TBMt8DVUOZGNSWgzqAGjEA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50aa8d9a1a1so1623371e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 04:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700481813; x=1701086613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kk6dPAPQIB5oFc8gPPE+qzlF7eDEXYGQPVOwULjN8Es=;
        b=WKucVnMQoI3xnTHzEt1RENPfX68UwE+HrrdFD2sfQI7fwymYkLzuL/gMFIBVKtWzTj
         bUWlldmFNK+9EhcQCLn7UPuAe0qQMl7vqvKDSb8SBr6E/llT4WKTQNzqwx17ZTX3P3uk
         hLd1N9AwkeWk9dtz0b6jQgiPV7q6wT0lc5xIUpjwRyReg9c8sb+NEtQIjKPIA8p0eN2b
         7Tdp8rjRiEzLUs6c9o9FuiCc7Q0R9izf3npUrW0ylpd4GEiGw/rJVkpwFn5ljDVci0Ee
         3JBmKqqzE+8NbwQSXNuts3efTp2rBhcjNbbxt+MBymtin8xzF4k2Z0mKO0CVkkOgkBO9
         6s9A==
X-Gm-Message-State: AOJu0YzFB5YTlFvk9Ag6FMc3OhMD7hKte19Z+PTGYKdEGEAyQM1oq9S3
        PHYz/Z8nBuDi5DQAdS4C+J2KkcD32UHZqLnC7lBWZnrzW5PQKXsMipHCtu12fNVKlFqr//JpEhL
        xude+EmLC1brunM53yTOhtwYPKmSS67B8KA==
X-Received: by 2002:a19:ae12:0:b0:500:92f1:c341 with SMTP id f18-20020a19ae12000000b0050092f1c341mr5044231lfc.54.1700481813628;
        Mon, 20 Nov 2023 04:03:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8VM8/NZSfjp5CDDkB3klAEsRnPePTF6k1ZmqKqpuM5u2pcPVBTEw1vjoiH0VMKeT251+V7g==
X-Received: by 2002:a19:ae12:0:b0:500:92f1:c341 with SMTP id f18-20020a19ae12000000b0050092f1c341mr5044216lfc.54.1700481813280;
        Mon, 20 Nov 2023 04:03:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n9-20020a05640204c900b005401a4184ddsm3553326edw.27.2023.11.20.04.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 04:03:31 -0800 (PST)
Message-ID: <aaadb68a-46d7-4184-bb11-abe45ddf2fe7@redhat.com>
Date:   Mon, 20 Nov 2023 13:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform/mellanox: mlxbf-tmfifo: Remove unnecessary
 bool conversion
Content-Language: en-US, nl
To:     Jules Irenge <jbi.octave@gmail.com>
Cc:     lpo.jarvinen@linux.intel.com, markgross@kernel.org,
        vadimp@nvidia.com, platform-driver-x86@vger.kernel.org
References: <ZUWIIKbz4vukl8qb@octinomon>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZUWIIKbz4vukl8qb@octinomon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/4/23 00:54, Jules Irenge wrote:
> This commit fixes coccinelle warning in macro function
> IS_VRING_DROP() which complains conversion to bool not needed here.
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>

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
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index ab7d7a1235b8..88472c024680 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -91,7 +91,7 @@ struct mlxbf_tmfifo_vring {
>  /* Check whether vring is in drop mode. */
>  #define IS_VRING_DROP(_r) ({ \
>  	typeof(_r) (r) = (_r); \
> -	(r->desc_head == &r->drop_desc ? true : false); })
> +	r->desc_head == &r->drop_desc; })
>  
>  /* A stub length to drop maximum length packet. */
>  #define VRING_DROP_DESC_MAX_LEN		GENMASK(15, 0)

