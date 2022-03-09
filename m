Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BFD8C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 06:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbiCIGPz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 01:15:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiCIGPv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 01:15:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3BE2C159E8F
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 22:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646806489;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ap6RrdGHmNkYVL8OAqPmtOOXTX9dVLo0fsotyLbFTFg=;
        b=d2TS+Hy3FBoYz64XltSspcIpJWbwAC2ceQBa1WhCut1XhLf2CwlmhE4M++pkDhm0UIFpCP
        I4ZWvLZElMPgv9qWPmjKov/XepoiyawFm8s5YxYqoH05FjHMxnmC3QijkDe6yKg44kkowK
        DBtgdHLM4Hyw8uG+gNgljUQSriL7Lfs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-QiAZ3XfeNFqxQOex9XSx5g-1; Wed, 09 Mar 2022 01:14:48 -0500
X-MC-Unique: QiAZ3XfeNFqxQOex9XSx5g-1
Received: by mail-pj1-f72.google.com with SMTP id lp2-20020a17090b4a8200b001bc449ecbceso3160741pjb.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Mar 2022 22:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ap6RrdGHmNkYVL8OAqPmtOOXTX9dVLo0fsotyLbFTFg=;
        b=EhTO1wCb4XXSKQb2MpXO2dGBA9it10AE9v8fl+bvp03aZH2JBKHFHto5No31SI5B/q
         /WtlrVIKSXbKMcRSU+huYwCRjFJOxAnSPggNdP97x5zDd2VSplTrsAYsKYqTskM4LoBf
         It9kdPZBXXUfb3yqPsDCDhFGAJY/cp6ApNJEKXRcCj6JVvH1tN6ZMdZG0VR8N1nFBxhM
         xMejyH6LcBSpEqo6Tgs8K2XowVuDTUNJP75fEwWw3rBHtW4XjH8tPFsLVtj2m3/5kW2N
         l3JI4cG828z2paiURq2NQETmQBPqlLrEAVlhnfrxDzNkCmapv3fmxzzW9nBB0DoJDYd+
         leGg==
X-Gm-Message-State: AOAM5304k4ZU/LJwCNTft+GnM+fNjcxEsMtr1cr3DK2Il4tyDS5VYpFT
        PdIG1NgND+qPPX0wjF0pVBqBR/SLSkS7BAkOnIiad79Qn4egZw7LfwVS/3Jo89tmTp7DPLmmcqr
        Dj7NJ2IO5Ix3z+qwokz95MG7oLGyK5UuWVA==
X-Received: by 2002:a17:903:22cb:b0:151:9f41:8738 with SMTP id y11-20020a17090322cb00b001519f418738mr21847643plg.46.1646806487028;
        Tue, 08 Mar 2022 22:14:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBCiRie4tAloFgqDg9JGwKT4KtqZzw2Fk+Xq44JLOLrxTAEP8NZVRRnFNWgW3q7UR+lbtsrg==
X-Received: by 2002:a17:903:22cb:b0:151:9f41:8738 with SMTP id y11-20020a17090322cb00b001519f418738mr21847626plg.46.1646806486782;
        Tue, 08 Mar 2022 22:14:46 -0800 (PST)
Received: from [10.72.12.183] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id v14-20020a056a00148e00b004e1cee6f6b4sm1233248pfu.47.2022.03.08.22.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 22:14:46 -0800 (PST)
Message-ID: <4bc140fa-9e72-4bb5-47d9-84d9db384898@redhat.com>
Date:   Wed, 9 Mar 2022 14:14:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 02/26] virtio: queue_reset: add VIRTIO_F_RING_RESET
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
References: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
 <20220308123518.33800-3-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220308123518.33800-3-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/3/8 下午8:34, Xuan Zhuo 写道:
> Added VIRTIO_F_RING_RESET, it came from here
> https://github.com/oasis-tcs/virtio-spec/issues/124


Nit: it's better to explain VIRTIO_F_RING_RESET a little bit here.

Other than this.

Acked-by: Jason Wang <jasowang@redhat.com>


>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   include/uapi/linux/virtio_config.h | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/virtio_config.h b/include/uapi/linux/virtio_config.h
> index b5eda06f0d57..0862be802ff8 100644
> --- a/include/uapi/linux/virtio_config.h
> +++ b/include/uapi/linux/virtio_config.h
> @@ -52,7 +52,7 @@
>    * rest are per-device feature bits.
>    */
>   #define VIRTIO_TRANSPORT_F_START	28
> -#define VIRTIO_TRANSPORT_F_END		38
> +#define VIRTIO_TRANSPORT_F_END		41
>   
>   #ifndef VIRTIO_CONFIG_NO_LEGACY
>   /* Do we get callbacks when the ring is completely used, even if we've
> @@ -92,4 +92,9 @@
>    * Does the device support Single Root I/O Virtualization?
>    */
>   #define VIRTIO_F_SR_IOV			37
> +
> +/*
> + * This feature indicates that the driver can reset a queue individually.
> + */
> +#define VIRTIO_F_RING_RESET		40
>   #endif /* _UAPI_LINUX_VIRTIO_CONFIG_H */

