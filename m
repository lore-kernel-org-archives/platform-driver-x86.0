Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22667E81DE9
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Oct 2023 12:54:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjJFMyf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Oct 2023 08:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbjJFMye (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Oct 2023 08:54:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4089183
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 Oct 2023 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696596824;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XaTEH053q8cUtCye7N5f4d4bRSpHU+o411y77RvZJbg=;
        b=e/a9zZ1FnSprj4eWaHeZc5MsqO573uKP3kdXKHNdOPU8eW4ctGoTNehk57jxAyBmPH8Pon
        kJonGDcBx2v/i/+54DRmzkLWQugTY+VSOYaRvnGveLjXKki7pi+smu9yVhQxVg3I7nofWi
        MkXViG8TjOvBaLnAGUt36Rt/fVK/Cvk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-bhqi1HyLP4mYrMed3SwetA-1; Fri, 06 Oct 2023 08:53:42 -0400
X-MC-Unique: bhqi1HyLP4mYrMed3SwetA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-521da4c99d4so1867770a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Oct 2023 05:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696596822; x=1697201622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XaTEH053q8cUtCye7N5f4d4bRSpHU+o411y77RvZJbg=;
        b=qwIO1WJ1NKORMb3VXwRYJYrDB11+TDFdrJ8zdK4LpQWAKOnxl8Wt286mUbALAZPsFB
         4URC1GeJLUXpzym2n6ThsQzK5422gNaCo1qw1301o2fI3mjVRBRtGbfGIancocuuWT4L
         r+G9LPHJrMfDoU95IWX1OXhStTgnVCf8pD+sziBbgsZ4CgY8dAdSZSC8wW0glS32xb/W
         WIyB8ZDdn37ZGS97rNssN7juxULuC/npOCS6wQcGRz6BB1gnpGl4XSSBvYo+zATRCN6b
         JB81ZosLrTAqu7nMrqaro4NXXucxKzYmP5teIVhpeqMkPBmoQ3HxeKBkQjlPsSr3uV6w
         edYQ==
X-Gm-Message-State: AOJu0YxiuJodvokZXKK5KgSqZFzGlkbD8ZqTxP31lOFVsI7DLUvUweZi
        UHNxmMHYqfJw4UkC3yFD/TtzDeEk5hgsnMbpClkIT88IhJSDC8zFo6kvhVwhDksKT/+ydh7ENhc
        fnxxqCvS+AYpsvUjenfSvEwMkB3jKwOziwQ==
X-Received: by 2002:a05:6402:43cf:b0:531:3c4e:98bc with SMTP id p15-20020a05640243cf00b005313c4e98bcmr7730854edc.8.1696596821820;
        Fri, 06 Oct 2023 05:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPXIYKOlxJK58qDW09UXDiZQQeSzU+/6bfXRuDRXaUXGlzvo/Az6gCwlXoR0lUFLQLMfCryA==
X-Received: by 2002:a05:6402:43cf:b0:531:3c4e:98bc with SMTP id p15-20020a05640243cf00b005313c4e98bcmr7730838edc.8.1696596821460;
        Fri, 06 Oct 2023 05:53:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id w24-20020a50fa98000000b00532bec5f768sm2524786edr.95.2023.10.06.05.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 05:53:40 -0700 (PDT)
Message-ID: <35467b21-941f-c829-1ad8-b4e7319dbc04@redhat.com>
Date:   Fri, 6 Oct 2023 14:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 1/1] platform/mellanox: mlxbf-tmfifo: Fix a warning
 message
Content-Language: en-US, nl
To:     Liming Sun <limings@nvidia.com>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Mark Gross <markgross@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <bb8bc77e6ecc2287fc9110cfa08caa48eb2a0385.1696508228.git.limings@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bb8bc77e6ecc2287fc9110cfa08caa48eb2a0385.1696508228.git.limings@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Liming,

On 10/5/23 14:18, Liming Sun wrote:
> This commit fixes the smatch static checker warning in
> mlxbf_tmfifo_rxtx_word() which complains data not initialized at
> line 634 when IS_VRING_DROP() is TRUE. This is not a real bug since
> line 634 is for Tx while IS_VRING_DROP() is only set for Rx. So there
> is no case that line 634 is executed when IS_VRING_DROP() is TRUE.
> 
> This commit initializes the local data variable to avoid unnecessary
> confusion to those static analyzing tools.
> 
> Signed-off-by: Liming Sun <limings@nvidia.com>
> ---
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index f3696a54a2bd..ccc4b51d3379 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -595,8 +595,8 @@ static void mlxbf_tmfifo_rxtx_word(struct mlxbf_tmfifo_vring *vring,
>  {
>  	struct virtio_device *vdev = vring->vq->vdev;
>  	struct mlxbf_tmfifo *fifo = vring->fifo;
> +	u64 data = 0;
>  	void *addr;
> -	u64 data;
>  
>  	/* Get the buffer address of this desc. */
>  	addr = phys_to_virt(virtio64_to_cpu(vdev, desc->addr));


This will fix the warning but not the issue at hand. As Dan pointed
out in his original bug report, the issue is that after:

78034cbece79 ("platform/mellanox: mlxbf-tmfifo: Drop the Rx packet if no descriptors")

We now have this IS_VRING_DROP() check in the path, which despite
the subject writeq(data, fifo->tx.data);is currently being applied to both rx and tx vring-s
and when this returns true the memcpy from the ring to &data
will not happen, but the code will still do:

writeq(data, fifo->tx.data);

So you may have silenced the warning now, but you will still write
data not coming from the vring to transmit. The only difference
is you are now guaranteed to write all zeroes.

Note another older issue is that if you hit the not enough space
path:

       } else {
                /* Leftover bytes. */
                if (!IS_VRING_DROP(vring)) {
                        if (is_rx)
                                memcpy(addr + vring->cur_len, &data,
                                       len - vring->cur_len);
                        else
                                memcpy(&data, addr + vring->cur_len,
                                       len - vring->cur_len);
                }
                vring->cur_len = len;
        }

Then even if IS_VRING_DROP() returns true you are only initializing some bytes of the 8 bytes data variable and the other bytes will stay at whatever random value they had before and you end up writing this random bytes when doing:

writeq(data, fifo->tx.data);

Regards,

Hans




