Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A617C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Apr 2022 02:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237917AbiDLCvz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Apr 2022 22:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243664AbiDLCvx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 22:51:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0E9B1222AB
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 19:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649731775;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fJBNte/3e7GfibiQrK4sBywM+oAime7uDuFoDGQDJlo=;
        b=gj+WqOnWhxr4+wex08XSZu5v+xmNjqBBAxlvEziCCljR/4GVmcfkzioM8FvJfO3q/4m9xD
        a6vSvgTIlgLbLVmfBRYa+0Z2d26k3NHlw3xP+/h3ovq6Yxpu6UsuecSiPtxTeGzC6jgnP5
        avfFjkVeD/6wyvl9hwvV9o/Nj05wbfk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-X8ESZpn3PrW7JiDwaa_A4Q-1; Mon, 11 Apr 2022 22:49:33 -0400
X-MC-Unique: X8ESZpn3PrW7JiDwaa_A4Q-1
Received: by mail-lj1-f197.google.com with SMTP id k19-20020a2ea273000000b0024b63166774so1554156ljm.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 19:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fJBNte/3e7GfibiQrK4sBywM+oAime7uDuFoDGQDJlo=;
        b=q9RglhMA/OKtUsnANFrKv7+YW7zBEiZFPMzT/Qp/RgnXrfejUG4MS/MdmkRoVq9ZQp
         jML2W93BIXelYr29++flYJIPzVSt30dFvthXt10t/qNXy7N0hW8VlSaOjKQpjzXqW/ai
         eeBr4PFhucwdcJi6kGF2DQSLjnfcl3BAGIyuSr92LaujIEqLni1R19AceechEXDshha9
         4Z4aIfRHUuVNe1/sxxyaWQqqQCjpS8d9UgiBQklw1GrNmMoVa/N0zeUXEfjzLnfP/f57
         0ZItbO5Q8yj2jK8U38C2kI72G31NqOR1TY+laPMVnjF/2ZGBeoBrR+5VvzFLL3giJ1Rz
         0Smw==
X-Gm-Message-State: AOAM530/EpOPrQE2q9XUUbyxK+Gi+v6ieY7G1xsUlaKAZ+hae/6rFHSu
        bkGctkUHEqODE8DZad0lYpRhbs8iM6gqai5srNevSX9Aw7M3pE9KIWF2lerFYHjSMz/eSVLXoN7
        7MoCgvkvgYQzyNF6C+4hlY/Jr3QKWlMd9b5FaW7cDyQNDSycbxg==
X-Received: by 2002:a2e:b53a:0:b0:24b:12f7:237b with SMTP id z26-20020a2eb53a000000b0024b12f7237bmr22142532ljm.177.1649731772132;
        Mon, 11 Apr 2022 19:49:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5gifaFaCekGQJ1T+aENC3f64ZQLZ890sWCpVm+zpEZs7NBKRTWSl38qWP6QLR7AWdmzIlDvMoCmEZyQhCI0I=
X-Received: by 2002:a2e:b53a:0:b0:24b:12f7:237b with SMTP id
 z26-20020a2eb53a000000b0024b12f7237bmr22142498ljm.177.1649731771824; Mon, 11
 Apr 2022 19:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220406034346.74409-1-xuanzhuo@linux.alibaba.com>
 <20220406034346.74409-3-xuanzhuo@linux.alibaba.com> <9868de23-c171-2492-a43f-78f51df84640@redhat.com>
In-Reply-To: <9868de23-c171-2492-a43f-78f51df84640@redhat.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 12 Apr 2022 10:49:20 +0800
Message-ID: <CACGkMEvgO=QsBjHZLhW72gsnWUp6JWOZkSrVZYHBmPoP+KhTZg@mail.gmail.com>
Subject: Re: [PATCH v9 02/32] virtio: struct virtio_config_ops add callbacks
 for queue_reset
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization <virtualization@lists.linux-foundation.org>
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
        linux-um@lists.infradead.org, netdev <netdev@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm <kvm@vger.kernel.org>,
        "open list:XDP (eXpress Data Path)" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Apr 12, 2022 at 10:47 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/4/6 =E4=B8=8A=E5=8D=8811:43, Xuan Zhuo =E5=86=99=E9=81=93:
> > Performing reset on a queue is divided into four steps:
> >
> >   1. transport: notify the device to reset the queue
> >   2. vring:     recycle the buffer submitted
> >   3. vring:     reset/resize the vring (may re-alloc)
> >   4. transport: mmap vring to device, and enable the queue
>
>
> Nit: it looks to me we'd better say it's an example (since step 3 or
> even 2 is not a must).
>
>
> >
> > In order to support queue reset, add two callbacks(reset_vq,
> > enable_reset_vq) in struct virtio_config_ops to implement steps 1 and 4=
.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >   include/linux/virtio_config.h | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/include/linux/virtio_config.h b/include/linux/virtio_confi=
g.h
> > index 4d107ad31149..d4adcd0e1c57 100644
> > --- a/include/linux/virtio_config.h
> > +++ b/include/linux/virtio_config.h
> > @@ -74,6 +74,16 @@ struct virtio_shm_region {
> >    * @set_vq_affinity: set the affinity for a virtqueue (optional).
> >    * @get_vq_affinity: get the affinity for a virtqueue (optional).
> >    * @get_shm_region: get a shared memory region based on the index.
> > + * @reset_vq: reset a queue individually (optional).
> > + *   vq: the virtqueue
> > + *   Returns 0 on success or error status
> > + *   reset_vq will guarantee that the callbacks are disabled and synch=
ronized.
> > + *   Except for the callback, the caller should guarantee that the vri=
ng is
>
>
> I wonder what's the implications for virtio hardening[1]. In that

For [1] I meant
https://lore.kernel.org/lkml/20220406083538.16274-1-jasowang@redhat.com/

Thanks


> series, we agree to have a synchronize_vqs() config ops to make sure
> callbacks are synchronized.
>
> It uses a global flag and a device wise synchronization mechanism. It
> looks to me we need to switch to
>
> 1) per virtqueue flag
> 2) per virtqueue synchronization
>
> Thanks
>
>
> > + *   not accessed by any functions of virtqueue.
> > + * @enable_reset_vq: enable a reset queue
> > + *   vq: the virtqueue
> > + *   Returns 0 on success or error status
> > + *   If reset_vq is set, then enable_reset_vq must also be set.
> >    */
> >   typedef void vq_callback_t(struct virtqueue *);
> >   struct virtio_config_ops {
> > @@ -100,6 +110,8 @@ struct virtio_config_ops {
> >                       int index);
> >       bool (*get_shm_region)(struct virtio_device *vdev,
> >                              struct virtio_shm_region *region, u8 id);
> > +     int (*reset_vq)(struct virtqueue *vq);
> > +     int (*enable_reset_vq)(struct virtqueue *vq);
> >   };
> >
> >   /* If driver didn't advertise the feature, it will never appear. */

