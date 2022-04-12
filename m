Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DD8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Apr 2022 02:41:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243748AbiDLCnk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 22:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235995AbiDLCni (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 22:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D7C1E1A04C
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 19:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649731280;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=n9AHGuoWN5DEsfFR6+n4EfGTHU/AybM73SzeXCbd8ow=;
        b=ACe0R2OUN9l7uNXS6WRuGFkqkpm7wlwczAh0Fi5kskZ8Q2EH/LFVP9vZD5TE2Q3RwUFy6s
        TA0G3BxVlfNpeWByzC1iXB5lxrK8yttmQUd6XehuAehnDAE/tNBCdF6btQNpZN1h7/rF9T
        66tG0U+G/ljM+DtgANnJQwwDSqpfevg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-ZXubm2GyPjqBhWYDNGyMsA-1; Mon, 11 Apr 2022 22:41:19 -0400
X-MC-Unique: ZXubm2GyPjqBhWYDNGyMsA-1
Received: by mail-pf1-f197.google.com with SMTP id z20-20020a62d114000000b0050567b73da5so6266469pfg.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 19:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n9AHGuoWN5DEsfFR6+n4EfGTHU/AybM73SzeXCbd8ow=;
        b=iQk2YmhRaLU/YolYEZLbxCSWub6KXxhX/bCPwvQo68TbRNzsrWE1Q2oLjyYo1ROJqC
         uMFm7+sEoJuZP+WmaBzFHe5DEtk4PhMuvnycD1cVpH6kS8hSaIfExAf3zNVpVSZws7YW
         ZkcSG9CdegBr7mUDR2dLs00Rpy33fpSfbjtdObZp1z1rLo1g1iYNhZQ/30PJnK5+lP68
         lVvYhZC9RTFgIYAtDhRBnFAqiNY3eS/lS/zmKrDvMWe+6lNUf1miE8rBBh2loF7zbRfi
         uoXSfyuiFO+3GpYwS35tzfABZsEs7+Oq3cm7TtHghjje8Jda81ce83pVuAPgaWaibs6F
         bT5Q==
X-Gm-Message-State: AOAM532YOiIJaozSDHWaqMRMA+iaKkk8Fk7KdA7G7Hg5YrFGO7qm3/85
        uHi2Gmi6CQVr+m4l2VT/o5r2BeUbOx8PDhtVq0IphyafvvZNkLYW/SUGMcry7X9VoevMOVxYhnb
        KLjtzGg5H91VPa59XnuwW83SmNXciuGSzJQ==
X-Received: by 2002:a62:6c6:0:b0:505:6713:d584 with SMTP id 189-20020a6206c6000000b005056713d584mr24781219pfg.24.1649731278352;
        Mon, 11 Apr 2022 19:41:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu8dJKKRcfWvkZcrPOwXnT9oC6pEqkxORnHFmtqyXX3kWAnTX/n0o1+l48eCQVygLz/+MBtA==
X-Received: by 2002:a62:6c6:0:b0:505:6713:d584 with SMTP id 189-20020a6206c6000000b005056713d584mr24781195pfg.24.1649731278023;
        Mon, 11 Apr 2022 19:41:18 -0700 (PDT)
Received: from [10.72.14.5] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id oa16-20020a17090b1bd000b001c72b632222sm795721pjb.32.2022.04.11.19.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 19:41:17 -0700 (PDT)
Message-ID: <71fbd7fc-20db-024b-ec66-b875216be4bd@redhat.com>
Date:   Tue, 12 Apr 2022 10:41:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v9 01/32] virtio: add helper
 virtqueue_get_vring_max_size()
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
 <20220406034346.74409-2-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220406034346.74409-2-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/4/6 上午11:43, Xuan Zhuo 写道:
> Record the maximum queue num supported by the device.
>
> virtio-net can display the maximum (supported by hardware) ring size in
> ethtool -g eth0.
>
> When the subsequent patch implements vring reset, it can judge whether
> the ring size passed by the driver is legal based on this.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   arch/um/drivers/virtio_uml.c             |  1 +
>   drivers/platform/mellanox/mlxbf-tmfifo.c |  2 ++
>   drivers/remoteproc/remoteproc_virtio.c   |  2 ++
>   drivers/s390/virtio/virtio_ccw.c         |  3 +++
>   drivers/virtio/virtio_mmio.c             |  2 ++
>   drivers/virtio/virtio_pci_legacy.c       |  2 ++
>   drivers/virtio/virtio_pci_modern.c       |  2 ++
>   drivers/virtio/virtio_ring.c             | 14 ++++++++++++++
>   drivers/virtio/virtio_vdpa.c             |  2 ++
>   include/linux/virtio.h                   |  2 ++
>   10 files changed, 32 insertions(+)
>
> diff --git a/arch/um/drivers/virtio_uml.c b/arch/um/drivers/virtio_uml.c
> index ba562d68dc04..904993d15a85 100644
> --- a/arch/um/drivers/virtio_uml.c
> +++ b/arch/um/drivers/virtio_uml.c
> @@ -945,6 +945,7 @@ static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
>   		goto error_create;
>   	}
>   	vq->priv = info;
> +	vq->num_max = num;
>   	num = virtqueue_get_vring_size(vq);
>   
>   	if (vu_dev->protocol_features &
> diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
> index 38800e86ed8a..1ae3c56b66b0 100644
> --- a/drivers/platform/mellanox/mlxbf-tmfifo.c
> +++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
> @@ -959,6 +959,8 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
>   			goto error;
>   		}
>   
> +		vq->num_max = vring->num;
> +
>   		vqs[i] = vq;
>   		vring->vq = vq;
>   		vq->priv = vring;
> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> index 70ab496d0431..7611755d0ae2 100644
> --- a/drivers/remoteproc/remoteproc_virtio.c
> +++ b/drivers/remoteproc/remoteproc_virtio.c
> @@ -125,6 +125,8 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
>   		return ERR_PTR(-ENOMEM);
>   	}
>   
> +	vq->num_max = len;


I wonder if this is correct.

It looks to me len is counted in bytes:

/**
  * struct rproc_vring - remoteproc vring state
  * @va: virtual address
  * @len: length, in bytes
  * @da: device address
  * @align: vring alignment
  * @notifyid: rproc-specific unique vring index
  * @rvdev: remote vdev
  * @vq: the virtqueue of this vring
  */
struct rproc_vring {
         void *va;
         int len;
         u32 da;
         u32 align;
         int notifyid;
         struct rproc_vdev *rvdev;
         struct virtqueue *vq;
};


Other looks good.

Thanks


> +
>   	rvring->vq = vq;
>   	vq->priv = rvring;
>   
> diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
> index d35e7a3f7067..468da60b56c5 100644
> --- a/drivers/s390/virtio/virtio_ccw.c
> +++ b/drivers/s390/virtio/virtio_ccw.c
> @@ -529,6 +529,9 @@ static struct virtqueue *virtio_ccw_setup_vq(struct virtio_device *vdev,
>   		err = -ENOMEM;
>   		goto out_err;
>   	}
> +
> +	vq->num_max = info->num;
> +
>   	/* it may have been reduced */
>   	info->num = virtqueue_get_vring_size(vq);
>   
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index 56128b9c46eb..a41abc8051b9 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -390,6 +390,8 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned index,
>   		goto error_new_virtqueue;
>   	}
>   
> +	vq->num_max = num;
> +
>   	/* Activate the queue */
>   	writel(virtqueue_get_vring_size(vq), vm_dev->base + VIRTIO_MMIO_QUEUE_NUM);
>   	if (vm_dev->version == 1) {
> diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> index 34141b9abe27..b68934fe6b5d 100644
> --- a/drivers/virtio/virtio_pci_legacy.c
> +++ b/drivers/virtio/virtio_pci_legacy.c
> @@ -135,6 +135,8 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
>   	if (!vq)
>   		return ERR_PTR(-ENOMEM);
>   
> +	vq->num_max = num;
> +
>   	q_pfn = virtqueue_get_desc_addr(vq) >> VIRTIO_PCI_QUEUE_ADDR_SHIFT;
>   	if (q_pfn >> 32) {
>   		dev_err(&vp_dev->pci_dev->dev,
> diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
> index 5455bc041fb6..86d301f272b8 100644
> --- a/drivers/virtio/virtio_pci_modern.c
> +++ b/drivers/virtio/virtio_pci_modern.c
> @@ -218,6 +218,8 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
>   	if (!vq)
>   		return ERR_PTR(-ENOMEM);
>   
> +	vq->num_max = num;
> +
>   	/* activate the queue */
>   	vp_modern_set_queue_size(mdev, index, virtqueue_get_vring_size(vq));
>   	vp_modern_queue_address(mdev, index, virtqueue_get_desc_addr(vq),
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 962f1477b1fa..b87130c8f312 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2371,6 +2371,20 @@ void vring_transport_features(struct virtio_device *vdev)
>   }
>   EXPORT_SYMBOL_GPL(vring_transport_features);
>   
> +/**
> + * virtqueue_get_vring_max_size - return the max size of the virtqueue's vring
> + * @_vq: the struct virtqueue containing the vring of interest.
> + *
> + * Returns the max size of the vring.
> + *
> + * Unlike other operations, this need not be serialized.
> + */
> +unsigned int virtqueue_get_vring_max_size(struct virtqueue *_vq)
> +{
> +	return _vq->num_max;
> +}
> +EXPORT_SYMBOL_GPL(virtqueue_get_vring_max_size);
> +
>   /**
>    * virtqueue_get_vring_size - return the size of the virtqueue's vring
>    * @_vq: the struct virtqueue containing the vring of interest.
> diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
> index 7767a7f0119b..39e4c08eb0f2 100644
> --- a/drivers/virtio/virtio_vdpa.c
> +++ b/drivers/virtio/virtio_vdpa.c
> @@ -183,6 +183,8 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
>   		goto error_new_virtqueue;
>   	}
>   
> +	vq->num_max = max_num;
> +
>   	/* Setup virtqueue callback */
>   	cb.callback = virtio_vdpa_virtqueue_cb;
>   	cb.private = info;
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index 72292a62cd90..d59adc4be068 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -31,6 +31,7 @@ struct virtqueue {
>   	struct virtio_device *vdev;
>   	unsigned int index;
>   	unsigned int num_free;
> +	unsigned int num_max;
>   	void *priv;
>   };
>   
> @@ -80,6 +81,7 @@ bool virtqueue_enable_cb_delayed(struct virtqueue *vq);
>   
>   void *virtqueue_detach_unused_buf(struct virtqueue *vq);
>   
> +unsigned int virtqueue_get_vring_max_size(struct virtqueue *vq);
>   unsigned int virtqueue_get_vring_size(struct virtqueue *vq);
>   
>   bool virtqueue_is_broken(struct virtqueue *vq);

