Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1548C43219
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 09:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiCIJFd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 04:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbiCIJFc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 04:05:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE26D16AA6C
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 01:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646816673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8eOwlkZcGQDXJozobV2VKRCePhnXpJDnIKdIuSxdQwY=;
        b=DJdxwQi1J2c9dRDmsnS39cdJafN5qr1aTjSlsSzwM9BND+eT2OsXjN2cBwKgKPP1KcQDKy
        v0rGS3k/FrlcWHZJLUeYcSsLytuTwf0gOlT6iYQY3mL6e0qFB4a5HDCAJcLcRIZC8HC+NW
        XryrYE2yEEZ4nnB3ArGQpPCmImkDnjQ=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-GgLz5J6VPhK-SPKUPirXZw-1; Wed, 09 Mar 2022 04:04:29 -0500
X-MC-Unique: GgLz5J6VPhK-SPKUPirXZw-1
Received: by mail-pj1-f70.google.com with SMTP id mm2-20020a17090b358200b001bf529127dfso1200248pjb.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Mar 2022 01:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8eOwlkZcGQDXJozobV2VKRCePhnXpJDnIKdIuSxdQwY=;
        b=jTaRiOgtlo4GAAmG25QjBj3yL+j09O3e9vHzPmoPmMpVy+j6ffkB9bryRjiIX28rly
         YVs0uDusxN1IKuGV2s+j80Lr3cFe730G1jsWjWmuNpkowxm8MYx67HhBE+eFsFJpucpI
         xY/ReU4TKNQbwjUt9mE/1spWuxTD97ikfZ6gRZqmTuQjzoTpxTZZaPd13t+h+zFyE09i
         HTPomWzaEMd+nb15wY4xQrz54Ws0KuBPwWxi5/U7Pzs+6NvDNLIiSU+mHBhbvqnxBYRE
         8rrq2P8+03CtbtW95DsGKV7Kr9v36wleaYpa4JDu+/flAVL18GIPByc1YI7cvMr3WtNC
         /sSg==
X-Gm-Message-State: AOAM531v8RJlngP3TGL1WeLqq6PoAeNNLuKsrQndqKKH5IDBkqQ7c1/j
        E7vS9n0v1xvitd6abQeBUdbIhbllrDHfY6oesQ/pNP+7V1DXzN6hEWMDIR9Gh8aU58NdXCZftqP
        0kUPlv++j7/4/P5AzUgnxui4KBINIBaI6kw==
X-Received: by 2002:a62:1881:0:b0:4e0:1b4c:36f8 with SMTP id 123-20020a621881000000b004e01b4c36f8mr22643984pfy.26.1646816668197;
        Wed, 09 Mar 2022 01:04:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUnje7NyiCBB5gGNjdXAqLUtIZXfE6NBoxWfMgYiTY4JFlOMy5UMt3jQvXKvTlc37/MUAVcA==
X-Received: by 2002:a62:1881:0:b0:4e0:1b4c:36f8 with SMTP id 123-20020a621881000000b004e01b4c36f8mr22643942pfy.26.1646816667945;
        Wed, 09 Mar 2022 01:04:27 -0800 (PST)
Received: from [10.72.12.183] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id d25-20020a639919000000b00364f999aed5sm1614910pge.20.2022.03.09.01.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 01:04:27 -0800 (PST)
Message-ID: <f1fb522d-74ce-a642-7768-deaad76aeddc@redhat.com>
Date:   Wed, 9 Mar 2022 17:04:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 21/26] virtio: add helper virtio_find_vqs_ctx_size()
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
 <20220308123518.33800-22-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220308123518.33800-22-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/3/8 下午8:35, Xuan Zhuo 写道:
> Introduce helper virtio_find_vqs_ctx_size() to call find_vqs and specify
> the maximum size of each vq ring.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   include/linux/virtio_config.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index 5157524d8036..921d8610db0c 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -233,6 +233,18 @@ int virtio_find_vqs_ctx(struct virtio_device *vdev, unsigned nvqs,
>   				      desc, NULL);
>   }
>   
> +static inline
> +int virtio_find_vqs_ctx_size(struct virtio_device *vdev, u32 nvqs,
> +				 struct virtqueue *vqs[],
> +				 vq_callback_t *callbacks[],
> +				 const char * const names[],
> +				 const bool *ctx, struct irq_affinity *desc,
> +				 u32 sizes[])
> +{
> +	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, ctx,
> +				      desc, sizes);
> +}


Do we need to convert all the open coded direct call to find_vqs() other 
than net?

Thanks


> +
>   /**
>    * virtio_reset_vq - reset a queue individually
>    * @vq: the virtqueue

