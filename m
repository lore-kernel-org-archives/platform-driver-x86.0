Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AEDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Apr 2022 06:54:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351017AbiDLG5D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Apr 2022 02:57:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351635AbiDLGyG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Apr 2022 02:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C14937A95
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 23:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649745802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YEDFVaHE5LgovQ1qymAwTeM82i08IwmDwRWKJJtG8Gs=;
        b=hZtiyu1RibxHMuY7h+T4iWDINHudDPgb2ZR5a0uRVLmAinztpt7szMhwG8Cb5AaCvZzKpB
        i31bM0L42tyfgAD1T8xK5ECALmcmht7WI1Ozuzk/zYU++zkak025sicxl7OzTw9bVbVnCl
        fejkKsptPps9EH+XNuvKPMdQvP/e+ao=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-4AzDotY7ObK_jR4dErpO4Q-1; Tue, 12 Apr 2022 02:43:21 -0400
X-MC-Unique: 4AzDotY7ObK_jR4dErpO4Q-1
Received: by mail-pj1-f72.google.com with SMTP id d11-20020a17090a628b00b001ca8fc92b9eso9411649pjj.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 23:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YEDFVaHE5LgovQ1qymAwTeM82i08IwmDwRWKJJtG8Gs=;
        b=C4FrdHhYn38BPzAAdpIWYcNEpKNevirTvo7skdwzyF9/DgxtQJ20cZUfPMaMED5Dr8
         5AacSlwkH7FmLflnAJSagRC39wEkzmYCxyty+QrPHqYgjdPfI6VEHwMFjtdkk813etCI
         25Sqvyq+c4c1FYtKREekIT2lui55FgpRx5DYiXSV+x72/cXfgx+el6ZX9qr6QItdvavl
         hLbz/Goh3IDzceRMgk3ss1jsPhHhveZ/arYZSPUBYGPIiKbrg4JgSh3To6mA/+HNNEGe
         JSc0nerp6GtJXCT+6foWhhJT1pqhAPAbwciZ1wwLvo+cj7W4Mj4t460/2wXiKG+Qm5x/
         laXw==
X-Gm-Message-State: AOAM533v/aM5G7SZVmUeonr9BycX8WzJDXMUYiDRcVDyDgEsh4aj0Cr6
        hLbirXzAT5g8X8okNYgDI/KznIas4uEOj0A+uStOPO9lpsEeY1lVF4ih2rOmfqkn4pSayOfz7OQ
        ESt/O1TFROEREgE2ad9aVU9IhC2/7Phsw5Q==
X-Received: by 2002:a65:494b:0:b0:399:28c:614f with SMTP id q11-20020a65494b000000b00399028c614fmr28693533pgs.182.1649745800184;
        Mon, 11 Apr 2022 23:43:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVisGJkqk8SxAqgvhvNH2N8TL+p8/HvB8CALOp5QP1jzqML5w0mYx0kcrqACK75c6WV3bObw==
X-Received: by 2002:a65:494b:0:b0:399:28c:614f with SMTP id q11-20020a65494b000000b00399028c614fmr28693502pgs.182.1649745799938;
        Mon, 11 Apr 2022 23:43:19 -0700 (PDT)
Received: from [10.72.14.5] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id mn18-20020a17090b189200b001cac1781bb4sm1544598pjb.35.2022.04.11.23.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 23:43:19 -0700 (PDT)
Message-ID: <5a4d48e1-aab9-9416-adc7-a07ebb39c84d@redhat.com>
Date:   Tue, 12 Apr 2022 14:43:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v9 21/32] virtio_pci: queue_reset: update struct
 virtio_pci_common_cfg and option functions
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org
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
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
References: <20220406034346.74409-1-xuanzhuo@linux.alibaba.com>
 <20220406034346.74409-22-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220406034346.74409-22-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/4/6 上午11:43, Xuan Zhuo 写道:
> Add queue_reset in virtio_pci_common_cfg, and add related operation
> functions.
>
> For not breaks uABI, add a new struct virtio_pci_common_cfg_reset.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   drivers/virtio/virtio_pci_modern_dev.c | 36 ++++++++++++++++++++++++++
>   include/linux/virtio_pci_modern.h      |  2 ++
>   include/uapi/linux/virtio_pci.h        |  7 +++++
>   3 files changed, 45 insertions(+)
>
> diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
> index e8b3ff2b9fbc..8c74b00bc511 100644
> --- a/drivers/virtio/virtio_pci_modern_dev.c
> +++ b/drivers/virtio/virtio_pci_modern_dev.c
> @@ -3,6 +3,7 @@
>   #include <linux/virtio_pci_modern.h>
>   #include <linux/module.h>
>   #include <linux/pci.h>
> +#include <linux/delay.h>
>   
>   /*
>    * vp_modern_map_capability - map a part of virtio pci capability
> @@ -463,6 +464,41 @@ void vp_modern_set_status(struct virtio_pci_modern_device *mdev,
>   }
>   EXPORT_SYMBOL_GPL(vp_modern_set_status);
>   
> +/*
> + * vp_modern_get_queue_reset - get the queue reset status
> + * @mdev: the modern virtio-pci device
> + * @index: queue index
> + */
> +int vp_modern_get_queue_reset(struct virtio_pci_modern_device *mdev, u16 index)
> +{
> +	struct virtio_pci_common_cfg_reset __iomem *cfg;
> +
> +	cfg = (struct virtio_pci_common_cfg_reset __iomem *)mdev->common;
> +
> +	vp_iowrite16(index, &cfg->cfg.queue_select);
> +	return vp_ioread16(&cfg->queue_reset);
> +}
> +EXPORT_SYMBOL_GPL(vp_modern_get_queue_reset);
> +
> +/*
> + * vp_modern_set_queue_reset - reset the queue
> + * @mdev: the modern virtio-pci device
> + * @index: queue index
> + */
> +void vp_modern_set_queue_reset(struct virtio_pci_modern_device *mdev, u16 index)
> +{
> +	struct virtio_pci_common_cfg_reset __iomem *cfg;
> +
> +	cfg = (struct virtio_pci_common_cfg_reset __iomem *)mdev->common;
> +
> +	vp_iowrite16(index, &cfg->cfg.queue_select);
> +	vp_iowrite16(1, &cfg->queue_reset);
> +
> +	while (vp_ioread16(&cfg->queue_reset) != 1)
> +		msleep(1);
> +}
> +EXPORT_SYMBOL_GPL(vp_modern_set_queue_reset);
> +
>   /*
>    * vp_modern_queue_vector - set the MSIX vector for a specific virtqueue
>    * @mdev: the modern virtio-pci device
> diff --git a/include/linux/virtio_pci_modern.h b/include/linux/virtio_pci_modern.h
> index eb2bd9b4077d..cc4154dd7b28 100644
> --- a/include/linux/virtio_pci_modern.h
> +++ b/include/linux/virtio_pci_modern.h
> @@ -106,4 +106,6 @@ void __iomem * vp_modern_map_vq_notify(struct virtio_pci_modern_device *mdev,
>   				       u16 index, resource_size_t *pa);
>   int vp_modern_probe(struct virtio_pci_modern_device *mdev);
>   void vp_modern_remove(struct virtio_pci_modern_device *mdev);
> +int vp_modern_get_queue_reset(struct virtio_pci_modern_device *mdev, u16 index);
> +void vp_modern_set_queue_reset(struct virtio_pci_modern_device *mdev, u16 index);
>   #endif
> diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> index 22bec9bd0dfc..d9462efd6ce8 100644
> --- a/include/uapi/linux/virtio_pci.h
> +++ b/include/uapi/linux/virtio_pci.h
> @@ -173,6 +173,13 @@ struct virtio_pci_common_cfg_notify {
>   	__le16 padding;
>   };
>   
> +struct virtio_pci_common_cfg_reset {
> +	struct virtio_pci_common_cfg cfg;
> +
> +	__le16 queue_notify_data;	/* read-write */
> +	__le16 queue_reset;		/* read-write */
> +};


I prefer to use a separate patch for the uAPI change.

Other looks good.

Thanks


> +
>   /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
>   struct virtio_pci_cfg_cap {
>   	struct virtio_pci_cap cap;

