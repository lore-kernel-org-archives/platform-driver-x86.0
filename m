Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27085C43219
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Apr 2022 08:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351733AbiDLIRT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Apr 2022 04:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357235AbiDLHjx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Apr 2022 03:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C8248C12
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649747647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+KfEewUd/P7rD+GfgzNOJ3/+yQH5JQRsFMgr1fgMrBA=;
        b=A62lYQTDhEBXiTg+SU6TpShWICa63RxWihLUKu4+tcfHEMEQRDaNRGvgrMSzCtAfHcW8ut
        j3hp+xRhQluSlgZS4R1A+BY0hPnWx84I4D0qaFki90viglFLQcG6VAwdZfiQ+0WCR1537J
        FJiryChlXTCwaedRb4VVpcAZvE6qbLQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-A4sH5U19M1WjRPzXpgTitw-1; Tue, 12 Apr 2022 03:14:06 -0400
X-MC-Unique: A4sH5U19M1WjRPzXpgTitw-1
Received: by mail-pj1-f71.google.com with SMTP id oo16-20020a17090b1c9000b001c6d21e8c04so1098632pjb.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 00:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+KfEewUd/P7rD+GfgzNOJ3/+yQH5JQRsFMgr1fgMrBA=;
        b=h5xy9owbECZTI4bfP3yF8QfcjqyQ8Nt2ihZD6xOa8gJUof6l/O2/6MJHw4ZfFVBEY6
         1oLDEO6HT+fpyRU3iS5Ox+sfnnYMy4nG6RtcpxuMSlw2bsA7Gi79h/UOu1h4Ll0hDA5I
         JvXjAWj2rK46HdQStVLDqWpPS9UPCZSQK0CfXxws2taD8xJaSLkzEF0Z5w6OSFK0qu7v
         E+8AGN6ge5xnAOCcYRJeQVfa/CiWq4hjMeRX61GM8jDMPbVpQWTW6rf/Eqp1WHI98hwE
         3mED2VfqYa5DoOrF49G7k1MIMzAtlXFRVDfz2mvvVVTk6tfC7YCw6wLdT0rvXPT7qt/1
         QB6Q==
X-Gm-Message-State: AOAM530PBvPWJEFfNUQaTPjqMHYWIWPIFY0xrxH2tRFjsLeOyYb1K6Fq
        W1/0e4P2v/yCOIQGezp7F+lJQiPqu9hfbDiZjcmJMEgKJeGzwSogNri4MyJI2UMbsVCk/Rhc5Xr
        HhWqA/pIGi9PRFUAJGPUztl8iC2I36J3mHg==
X-Received: by 2002:a63:9203:0:b0:386:3b37:76b5 with SMTP id o3-20020a639203000000b003863b3776b5mr30232818pgd.234.1649747645345;
        Tue, 12 Apr 2022 00:14:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxz8tuQLUzxBTFiELPnVmPwK4HkOQmo42dCUGoCnnoQX1nf1+7XyvUkjmkIVepPIYWlERR4oQ==
X-Received: by 2002:a63:9203:0:b0:386:3b37:76b5 with SMTP id o3-20020a639203000000b003863b3776b5mr30232780pgd.234.1649747645115;
        Tue, 12 Apr 2022 00:14:05 -0700 (PDT)
Received: from [10.72.14.5] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id q10-20020a056a00088a00b004f7ceff389esm39492179pfj.152.2022.04.12.00.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 00:14:04 -0700 (PDT)
Message-ID: <e8298f3d-dd58-8031-606f-f0fb061a7c95@redhat.com>
Date:   Tue, 12 Apr 2022 15:13:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v9 26/32] virtio_mmio: support the arg sizes of find_vqs()
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
 <20220406034346.74409-27-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220406034346.74409-27-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/4/6 上午11:43, Xuan Zhuo 写道:
> Virtio MMIO support the new parameter sizes of find_vqs().
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   drivers/virtio/virtio_mmio.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index 9d5a674bdeec..51cf51764a92 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -347,7 +347,7 @@ static void vm_del_vqs(struct virtio_device *vdev)
>   
>   static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned index,
>   				  void (*callback)(struct virtqueue *vq),
> -				  const char *name, bool ctx)
> +				  const char *name, u32 size, bool ctx)
>   {
>   	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
>   	struct virtio_mmio_vq_info *info;
> @@ -382,8 +382,11 @@ static struct virtqueue *vm_setup_vq(struct virtio_device *vdev, unsigned index,
>   		goto error_new_virtqueue;
>   	}
>   
> +	if (!size || size > num)
> +		size = num;
> +
>   	/* Create the vring */
> -	vq = vring_create_virtqueue(index, num, VIRTIO_MMIO_VRING_ALIGN, vdev,
> +	vq = vring_create_virtqueue(index, size, VIRTIO_MMIO_VRING_ALIGN, vdev,
>   				 true, true, ctx, vm_notify, callback, name);
>   	if (!vq) {
>   		err = -ENOMEM;
> @@ -484,6 +487,7 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned nvqs,
>   		}
>   
>   		vqs[i] = vm_setup_vq(vdev, queue_idx++, callbacks[i], names[i],
> +				     sizes ? sizes[i] : 0,
>   				     ctx ? ctx[i] : false);
>   		if (IS_ERR(vqs[i])) {
>   			vm_del_vqs(vdev);

