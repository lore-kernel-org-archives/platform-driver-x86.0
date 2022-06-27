Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE325C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 08:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbiF0IOi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 04:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbiF0IOh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 04:14:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 11C00626C
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656317675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pajM9hI9fI/87uBaTeYfHZ+TkaK2uNfPmDfKI6EwRtM=;
        b=EyZZHRmoVJ+rehBBd3oEfBipAtm9T5wlssvDIk1u1sv/gm/Rh1wOari7YQyZeRBvCseanR
        Qf1J3k5Lt2xsXd/89FTE13s9BMbu6ji049gm20KXV9n8sq95QA81MFDzSWpjd5snxK0aDV
        CJ6pZMNJ+1VjUNpo4iIpeANxM/bDA3E=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-qjX4pwABMxSv_eq-BkiS9g-1; Mon, 27 Jun 2022 04:14:33 -0400
X-MC-Unique: qjX4pwABMxSv_eq-BkiS9g-1
Received: by mail-lf1-f72.google.com with SMTP id h18-20020a056512055200b004810d1b257aso1773897lfl.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 01:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pajM9hI9fI/87uBaTeYfHZ+TkaK2uNfPmDfKI6EwRtM=;
        b=DbzZFuDv8bFk/dNy1UdHjS0XmDKplxL0HQX7O+OiVcip9S+3D5Km05Y38m++jqWHpM
         g0sgpbAxqjrN/tbS6wuAHoHjJPC6bvfYsPwMMO2V0Qhjrr7pHuRIwHhHcbvQ+FzXmZlo
         KktXH7ZD8csFoOAXKTWXMUvTP3YTdBB1G9k1YAc92Lqxt7kpzaxo8MiqC+449N6pCziQ
         Defp+KmzaLZyOuXLyZc0K4p/P1wZo8pYD5XB6sCIZTKdZQfET6qEjbkD/0nK6GXgSHYp
         smPw+FwRXci4fHsjJ8XNeGHanF86kVoCEjjU2nDp/guR+PnFZXqLHaPsVrzYrgYjphuH
         YLlw==
X-Gm-Message-State: AJIora/G4g8UiMBDEWjLi4j5fu7rpp0jVxcPbIbDwQ3+o3PNCSWXP4pp
        7EXstFPKDXdWo9WvTZP9/dBkbsTROXZ7RciIUhhXUX2kKiD08BejN/EMv2cNDp9AmNfedApPips
        r0sxIXrH+nXAW4LkktCpm0b8XIqhA0mVxN8OdD3p26arm+v0I0w==
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id y15-20020a0565123f0f00b0047f6f890326mr7309032lfa.124.1656317672172;
        Mon, 27 Jun 2022 01:14:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1stSWl4OiPqPtvMuSHVstpPhV2ncpnK2QP/uZDvpStVqiSUc6+7r6HgRqJbkG0p8fApLKYURBWKalbv9dZOpEk=
X-Received: by 2002:a05:6512:3f0f:b0:47f:6f89:326 with SMTP id
 y15-20020a0565123f0f00b0047f6f890326mr7309001lfa.124.1656317671894; Mon, 27
 Jun 2022 01:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220624025621.128843-1-xuanzhuo@linux.alibaba.com>
 <20220624025621.128843-26-xuanzhuo@linux.alibaba.com> <20220624025817-mutt-send-email-mst@kernel.org>
 <CACGkMEseptD=45j3kQr0yciRxR679Jcig=292H07-RYC2vXmFQ@mail.gmail.com>
 <20220627023841-mutt-send-email-mst@kernel.org> <CACGkMEvy8xF2T_vubKeUEPC2aroO_fbB0Xe8nnxK4OBUgAS+Gw@mail.gmail.com>
 <20220627034733-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220627034733-mutt-send-email-mst@kernel.org>
From:   Jason Wang <jasowang@redhat.com>
Date:   Mon, 27 Jun 2022 16:14:20 +0800
Message-ID: <CACGkMEtpjUBaUML=fEs5hR66rzNTBhBXOmfpzyXV1F-6BqvsGg@mail.gmail.com>
Subject: Re: [PATCH v10 25/41] virtio_pci: struct virtio_pci_common_cfg add queue_notify_data
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
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
        linux-um@lists.infradead.org, netdev <netdev@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm <kvm@vger.kernel.org>,
        "open list:XDP (eXpress Data Path)" <bpf@vger.kernel.org>,
        kangjie.xu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 27, 2022 at 3:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jun 27, 2022 at 03:45:30PM +0800, Jason Wang wrote:
> > On Mon, Jun 27, 2022 at 2:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Jun 27, 2022 at 10:30:42AM +0800, Jason Wang wrote:
> > > > On Fri, Jun 24, 2022 at 2:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Fri, Jun 24, 2022 at 10:56:05AM +0800, Xuan Zhuo wrote:
> > > > > > Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
> > > > > > here https://github.com/oasis-tcs/virtio-spec/issues/89
> > > > > >
> > > > > > For not breaks uABI, add a new struct virtio_pci_common_cfg_notify.
> > > > >
> > > > > What exactly is meant by not breaking uABI?
> > > > > Users are supposed to be prepared for struct size to change ... no?
> > > >
> > > > Not sure, any doc for this?
> > > >
> > > > Thanks
> > >
> > >
> > > Well we have this:
> > >
> > >         The drivers SHOULD only map part of configuration structure
> > >         large enough for device operation.  The drivers MUST handle
> > >         an unexpectedly large \field{length}, but MAY check that \field{length}
> > >         is large enough for device operation.
> >
> > Yes, but that's the device/driver interface. What's done here is the
> > userspace/kernel.
> >
> > Userspace may break if it uses e.g sizeof(struct virtio_pci_common_cfg)?
> >
> > Thanks
>
> Hmm I guess there's risk... but then how are we going to maintain this
> going forward?  Add a new struct on any change?

This is the way we have used it for the past 5 or more years. I don't
see why this must be handled in the vq reset feature.

>Can we at least
> prevent this going forward somehow?

Like have some padding?

Thanks

>
>
> > >
> > >
> > >
> > > >
> > > > >
> > > > >
> > > > > > Since I want to add queue_reset after queue_notify_data, I submitted
> > > > > > this patch first.
> > > > > >
> > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > > > ---
> > > > > >  include/uapi/linux/virtio_pci.h | 7 +++++++
> > > > > >  1 file changed, 7 insertions(+)
> > > > > >
> > > > > > diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> > > > > > index 3a86f36d7e3d..22bec9bd0dfc 100644
> > > > > > --- a/include/uapi/linux/virtio_pci.h
> > > > > > +++ b/include/uapi/linux/virtio_pci.h
> > > > > > @@ -166,6 +166,13 @@ struct virtio_pci_common_cfg {
> > > > > >       __le32 queue_used_hi;           /* read-write */
> > > > > >  };
> > > > > >
> > > > > > +struct virtio_pci_common_cfg_notify {
> > > > > > +     struct virtio_pci_common_cfg cfg;
> > > > > > +
> > > > > > +     __le16 queue_notify_data;       /* read-write */
> > > > > > +     __le16 padding;
> > > > > > +};
> > > > > > +
> > > > > >  /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
> > > > > >  struct virtio_pci_cfg_cap {
> > > > > >       struct virtio_pci_cap cap;
> > > > > > --
> > > > > > 2.31.0
> > > > >
> > >
>

