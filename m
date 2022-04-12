Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17982C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Apr 2022 02:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243563AbiDLCuN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 22:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiDLCuM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 22:50:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 169E820F7E
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 19:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649731676;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hJ8D0MpKmhUU0VrC5/OdFFUt9V6ywO7AHposB393jHM=;
        b=i+XExlhK6QRR4fobSoDbapPFON7ATojJoTRgUK3ZuMrkxM7nrXxpWWI8eCZBIuQnNbD/hh
        1sZZG2Zna7ZjadNPkcplt/Q4afSDaoYtynhYcoykujcLWHkBFDYR+Nnfk/uGmbRmPmx6jp
        oZziu8/DruWzlUARYMSiBlrbctE1TG0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-nhvBbJSCMwqiP59tOoZL8Q-1; Mon, 11 Apr 2022 22:47:53 -0400
X-MC-Unique: nhvBbJSCMwqiP59tOoZL8Q-1
Received: by mail-pj1-f71.google.com with SMTP id u1-20020a17090a2b8100b001cba1905e25so705929pjd.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 19:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hJ8D0MpKmhUU0VrC5/OdFFUt9V6ywO7AHposB393jHM=;
        b=AqgFNYQSX65eh9rCV/+X9TRsjnMrYw+4G3O9PCkxpCXOl0OIppQuOEbEf1sspzdTRS
         esEQwK3iWTAvgo7BVYKawU/u15lbzLwxVhavcKCf1kCsUABv3ca3isdkWO9xPOKGtIKc
         4bxYU68Zk86e04EQQjscOvvtAOsWL/Rf4rdIm93i6yNo9k7lzHnnR6Fwe8OsXUsH/dj0
         YniQ6rBWL0zkYkRxjDSCBrm08P51u5rSAWdflhIQyeHjR50JzTPjAkp72nD/AANnL8mw
         aNEsfDcRQWUOBzOBQbliUs6/4rhKQp/rExO44bO3f1TTmw1e7a2JFmPicxT8LWZLx9+F
         JUyw==
X-Gm-Message-State: AOAM531PftuuCfTj4EP1ECTa+hVDZWVhCetLv2GqJPiPz8SjuXTMBeg5
        hW4wlDFYxEDlYq+hsOdp4QpAr0byswNDnxDI3JHy73XIYi//W39yf0GzousB1y7mp5FTz7S2gus
        ldww2R5IGidP5VMoC7lTD7oyOeaeUTHCI6g==
X-Received: by 2002:a17:902:aa88:b0:156:914b:dc79 with SMTP id d8-20020a170902aa8800b00156914bdc79mr35261824plr.138.1649731672244;
        Mon, 11 Apr 2022 19:47:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0iNy2ww2vpQRiLgmCUeLissGsbocjPE44RHGsIyPREMT6U8PtkHOixn6nv9QmiJuaqKxs0Q==
X-Received: by 2002:a17:902:aa88:b0:156:914b:dc79 with SMTP id d8-20020a170902aa8800b00156914bdc79mr35261806plr.138.1649731671976;
        Mon, 11 Apr 2022 19:47:51 -0700 (PDT)
Received: from [10.72.14.5] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id z16-20020a637e10000000b00382b21c6b0bsm975709pgc.51.2022.04.11.19.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 19:47:51 -0700 (PDT)
Message-ID: <9868de23-c171-2492-a43f-78f51df84640@redhat.com>
Date:   Tue, 12 Apr 2022 10:47:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v9 02/32] virtio: struct virtio_config_ops add callbacks
 for queue_reset
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
 <20220406034346.74409-3-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220406034346.74409-3-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/4/6 上午11:43, Xuan Zhuo 写道:
> Performing reset on a queue is divided into four steps:
>
>   1. transport: notify the device to reset the queue
>   2. vring:     recycle the buffer submitted
>   3. vring:     reset/resize the vring (may re-alloc)
>   4. transport: mmap vring to device, and enable the queue


Nit: it looks to me we'd better say it's an example (since step 3 or 
even 2 is not a must).


>
> In order to support queue reset, add two callbacks(reset_vq,
> enable_reset_vq) in struct virtio_config_ops to implement steps 1 and 4.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   include/linux/virtio_config.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index 4d107ad31149..d4adcd0e1c57 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -74,6 +74,16 @@ struct virtio_shm_region {
>    * @set_vq_affinity: set the affinity for a virtqueue (optional).
>    * @get_vq_affinity: get the affinity for a virtqueue (optional).
>    * @get_shm_region: get a shared memory region based on the index.
> + * @reset_vq: reset a queue individually (optional).
> + *	vq: the virtqueue
> + *	Returns 0 on success or error status
> + *	reset_vq will guarantee that the callbacks are disabled and synchronized.
> + *	Except for the callback, the caller should guarantee that the vring is


I wonder what's the implications for virtio hardening[1]. In that 
series, we agree to have a synchronize_vqs() config ops to make sure 
callbacks are synchronized.

It uses a global flag and a device wise synchronization mechanism. It 
looks to me we need to switch to

1) per virtqueue flag
2) per virtqueue synchronization

Thanks


> + *	not accessed by any functions of virtqueue.
> + * @enable_reset_vq: enable a reset queue
> + *	vq: the virtqueue
> + *	Returns 0 on success or error status
> + *	If reset_vq is set, then enable_reset_vq must also be set.
>    */
>   typedef void vq_callback_t(struct virtqueue *);
>   struct virtio_config_ops {
> @@ -100,6 +110,8 @@ struct virtio_config_ops {
>   			int index);
>   	bool (*get_shm_region)(struct virtio_device *vdev,
>   			       struct virtio_shm_region *region, u8 id);
> +	int (*reset_vq)(struct virtqueue *vq);
> +	int (*enable_reset_vq)(struct virtqueue *vq);
>   };
>   
>   /* If driver didn't advertise the feature, it will never appear. */

