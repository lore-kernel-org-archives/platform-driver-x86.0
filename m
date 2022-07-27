Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A09C3F6B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 03:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240199AbiG0DMi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Jul 2022 23:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240157AbiG0DMg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jul 2022 23:12:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 10F341C126
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jul 2022 20:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658891554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9WiQGdroVpMu2sEzrZ478PJ3v7YHoeLWedG+fQPiT4w=;
        b=fqwa/KHlh9APD2kt5Yakp5jxPN4kePm3V1tLLBRcfF/JrAi2S6DCHU85fUmDDx7SmJLyxQ
        639jbdOoz8SRGLP1hC1TqgVhEeWKga8OBIOeq6VthUHR+QMgomqFAj1ryZvi82zDBTxwsh
        WUktVkeLHAjNl8EWsO7tVHN6Qt5LOLE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-QVHw9ojgNkO5I7IAs1HCbQ-1; Tue, 26 Jul 2022 23:12:32 -0400
X-MC-Unique: QVHw9ojgNkO5I7IAs1HCbQ-1
Received: by mail-pf1-f200.google.com with SMTP id e21-20020aa78c55000000b00528c6cca624so5355819pfd.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jul 2022 20:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9WiQGdroVpMu2sEzrZ478PJ3v7YHoeLWedG+fQPiT4w=;
        b=aQAg127QMaGl291T6fIf9GqkRXI3xqj4ATF9uSdzsuBBJvSPRsYacQYWwdkQfpwmmO
         j1ZrScZcvxgtwCjuBi9GeFYlXG/bdfWEArg7eXdEkb2+MoOUyTJftOFKhHrFAzHQ0B0/
         q+3cVOHn8VGRoCY4s86M5Fm+E3tO4D6ov5LHh9s0eHTHL/btMNszhRhXB+a5YzehuUSa
         e1YojUqG+luaGFpDPKTlEJUUzMzYg6/i9S+OEXMW4SerZaXgqB+R7NT35Je+gzqGJsTD
         1224g0zX3YdG9Fl72ntFh/2wxW6BaaENbAWog/+Ny5CMPskpu1hFvTpFC+/byENuIqrj
         O/6g==
X-Gm-Message-State: AJIora+yBawaxZAQLp3RFfRWW9a7pn7TobEmjffe1WbIrIa5Vg09La2R
        YK6MF0Mf+ps5exWdAsML6jCPNXn3SwrP1khik9JsMfTGjxOx2/Zy+g1NMHQWxFFiu/xqS7KGD0U
        QegiqQM2WKYyNcLSgYEc0ddsm2dZQY2dLMw==
X-Received: by 2002:a17:902:e845:b0:16d:9e9f:457 with SMTP id t5-20020a170902e84500b0016d9e9f0457mr5383580plg.40.1658891551769;
        Tue, 26 Jul 2022 20:12:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBLZXzS1O8m+ePPhAyCt6oGj/JXZrm3fBlWjHZx5umFDpHDdxeZHjj9QjfQ98Mbt6FR/NsZA==
X-Received: by 2002:a17:902:e845:b0:16d:9e9f:457 with SMTP id t5-20020a170902e84500b0016d9e9f0457mr5383560plg.40.1658891551489;
        Tue, 26 Jul 2022 20:12:31 -0700 (PDT)
Received: from [10.72.13.38] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id p22-20020a1709028a9600b0016d27cead72sm12189306plo.196.2022.07.26.20.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 20:12:30 -0700 (PDT)
Message-ID: <15aa26f2-f8af-5dbd-f2b2-9270ad873412@redhat.com>
Date:   Wed, 27 Jul 2022 11:12:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v13 16/42] virtio_ring: split: introduce
 virtqueue_resize_split()
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org
Cc:     Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org,
        kangjie.xu@linux.alibaba.com
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
 <20220726072225.19884-17-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726072225.19884-17-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/7/26 15:21, Xuan Zhuo 写道:
> virtio ring split supports resize.
>
> Only after the new vring is successfully allocated based on the new num,
> we will release the old vring. In any case, an error is returned,
> indicating that the vring still points to the old vring.
>
> In the case of an error, re-initialize(virtqueue_reinit_split()) the
> virtqueue to ensure that the vring can be used.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> ---
>   drivers/virtio/virtio_ring.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index b6fda91c8059..58355e1ac7d7 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -220,6 +220,7 @@ static struct virtqueue *__vring_new_virtqueue(unsigned int index,
>   					       void (*callback)(struct virtqueue *),
>   					       const char *name);
>   static struct vring_desc_extra *vring_alloc_desc_extra(unsigned int num);
> +static void vring_free(struct virtqueue *_vq);
>   
>   /*
>    * Helpers.
> @@ -1117,6 +1118,39 @@ static struct virtqueue *vring_create_virtqueue_split(
>   	return vq;
>   }
>   
> +static int virtqueue_resize_split(struct virtqueue *_vq, u32 num)
> +{
> +	struct vring_virtqueue_split vring_split = {};
> +	struct vring_virtqueue *vq = to_vvq(_vq);
> +	struct virtio_device *vdev = _vq->vdev;
> +	int err;
> +
> +	err = vring_alloc_queue_split(&vring_split, vdev, num,
> +				      vq->split.vring_align,
> +				      vq->split.may_reduce_num);
> +	if (err)
> +		goto err;


I think we don't need to do anything here?


> +
> +	err = vring_alloc_state_extra_split(&vring_split);
> +	if (err) {
> +		vring_free_split(&vring_split, vdev);
> +		goto err;


I suggest to move vring_free_split() into a dedicated error label.

Thanks


> +	}
> +
> +	vring_free(&vq->vq);
> +
> +	virtqueue_vring_init_split(&vring_split, vq);
> +
> +	virtqueue_init(vq, vring_split.vring.num);
> +	virtqueue_vring_attach_split(vq, &vring_split);
> +
> +	return 0;
> +
> +err:
> +	virtqueue_reinit_split(vq);
> +	return -ENOMEM;
> +}
> +
>   
>   /*
>    * Packed ring specific functions - *_packed().

