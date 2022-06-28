Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5002CCA481
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Jun 2022 05:46:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245156AbiF1FqQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Jun 2022 01:46:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245153AbiF1FqO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Jun 2022 01:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC80E24F07
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 22:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656395162;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=7XDCFUsIiO1RHnxPVoHQ+XTC5yX5gOLEJx5jlzpdwhw=;
        b=LuMOWX2gve8h2sMcSzOxq5rpMBPbw1OFVkfqDQ7XitohFybillNf3RtVmg3G6f4avDtn3Q
        n8v5Gy//OpnG0n8Ecsl/bHaxHrJOlxISu8cXXICfhnqzVR1WO3/edIFxwzGy1ArPTAxecM
        Rz2+mOcjAqshgUh6YAwYE7+oxsBzuhU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-6jJGRBpmMjSI3_6bCfdTZA-1; Tue, 28 Jun 2022 01:46:00 -0400
X-MC-Unique: 6jJGRBpmMjSI3_6bCfdTZA-1
Received: by mail-wm1-f71.google.com with SMTP id n18-20020a05600c501200b003a050cc39a0so764800wmr.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 22:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7XDCFUsIiO1RHnxPVoHQ+XTC5yX5gOLEJx5jlzpdwhw=;
        b=oDVWLg+FqgUrhRT0TiJXSyC1V7kjGpmzQrRVY+hSqTE5mMCOC3kZC5urBFGO7rY8ba
         o+YgOqNlsVEbjO6AvlyPWBtXMttNie+2MvhWG8Ba7SBwUo/gE6FECQUPCgKSs3/ZKb/u
         0rpecHEsXmMuZISUjY+9jd0AY/B7OI4s5TEoWF3JMPcDjJ+m7xtBnZo1z0dbHCxKmuM9
         3//QRiAogmdml26EnSMU9NBdvDSrL0WtAavuYOfVmAwM3Rb/+avg3Aq9tF0uWNbLEdQE
         cuQ2RPjRh87O/DL9Oimn8bQvOa6eNALjxCQpcNIyNH58CKY+UZ6p17RKlTmplg2TK59z
         kwtw==
X-Gm-Message-State: AJIora8sjoZE1L9OuY6kjycDQ9GNj1a1UJd9nt/aVHOSPbiOSOTt40v+
        K1KrQF3yw6YtCKKy26XcV8s9yRHxobvCu3OqW7O3exWei49qcIB92u1U14lBJzVCV1y+JqceCcj
        d/9EwQZl0l6lbcSqX6kwBsKC2+Hncx76aTw==
X-Received: by 2002:a05:600c:21ca:b0:3a0:48e6:60cb with SMTP id x10-20020a05600c21ca00b003a048e660cbmr12064714wmj.195.1656395159388;
        Mon, 27 Jun 2022 22:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1kNy6ksKWTPEZ6IXDwV0UKlQdlBRLnRI/epxlGzaTFb6xBerM5hZUzFha89n6poU/6PoMPw==
X-Received: by 2002:a05:600c:21ca:b0:3a0:48e6:60cb with SMTP id x10-20020a05600c21ca00b003a048e660cbmr12064664wmj.195.1656395159084;
        Mon, 27 Jun 2022 22:45:59 -0700 (PDT)
Received: from redhat.com ([2.52.23.204])
        by smtp.gmail.com with ESMTPSA id 7-20020a05600c024700b003a03e63e428sm15257206wmj.36.2022.06.27.22.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 22:45:58 -0700 (PDT)
Date:   Tue, 28 Jun 2022 01:45:51 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
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
Subject: Re: [PATCH v10 25/41] virtio_pci: struct virtio_pci_common_cfg add
 queue_notify_data
Message-ID: <20220628014309-mutt-send-email-mst@kernel.org>
References: <20220624025621.128843-1-xuanzhuo@linux.alibaba.com>
 <20220624025621.128843-26-xuanzhuo@linux.alibaba.com>
 <20220624025817-mutt-send-email-mst@kernel.org>
 <CACGkMEseptD=45j3kQr0yciRxR679Jcig=292H07-RYC2vXmFQ@mail.gmail.com>
 <20220627023841-mutt-send-email-mst@kernel.org>
 <CACGkMEvy8xF2T_vubKeUEPC2aroO_fbB0Xe8nnxK4OBUgAS+Gw@mail.gmail.com>
 <20220627034733-mutt-send-email-mst@kernel.org>
 <CACGkMEtpjUBaUML=fEs5hR66rzNTBhBXOmfpzyXV1F-6BqvsGg@mail.gmail.com>
 <20220627074723-mutt-send-email-mst@kernel.org>
 <CACGkMEv0zdgG6SAaxRwkpObEFX_KRB1ovezNiHX+QXsYhE=qaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEv0zdgG6SAaxRwkpObEFX_KRB1ovezNiHX+QXsYhE=qaQ@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 28, 2022 at 11:50:37AM +0800, Jason Wang wrote:
> On Mon, Jun 27, 2022 at 7:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jun 27, 2022 at 04:14:20PM +0800, Jason Wang wrote:
> > > On Mon, Jun 27, 2022 at 3:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Mon, Jun 27, 2022 at 03:45:30PM +0800, Jason Wang wrote:
> > > > > On Mon, Jun 27, 2022 at 2:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Mon, Jun 27, 2022 at 10:30:42AM +0800, Jason Wang wrote:
> > > > > > > On Fri, Jun 24, 2022 at 2:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Jun 24, 2022 at 10:56:05AM +0800, Xuan Zhuo wrote:
> > > > > > > > > Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
> > > > > > > > > here https://github.com/oasis-tcs/virtio-spec/issues/89
> > > > > > > > >
> > > > > > > > > For not breaks uABI, add a new struct virtio_pci_common_cfg_notify.
> > > > > > > >
> > > > > > > > What exactly is meant by not breaking uABI?
> > > > > > > > Users are supposed to be prepared for struct size to change ... no?
> > > > > > >
> > > > > > > Not sure, any doc for this?
> > > > > > >
> > > > > > > Thanks
> > > > > >
> > > > > >
> > > > > > Well we have this:
> > > > > >
> > > > > >         The drivers SHOULD only map part of configuration structure
> > > > > >         large enough for device operation.  The drivers MUST handle
> > > > > >         an unexpectedly large \field{length}, but MAY check that \field{length}
> > > > > >         is large enough for device operation.
> > > > >
> > > > > Yes, but that's the device/driver interface. What's done here is the
> > > > > userspace/kernel.
> > > > >
> > > > > Userspace may break if it uses e.g sizeof(struct virtio_pci_common_cfg)?
> > > > >
> > > > > Thanks
> > > >
> > > > Hmm I guess there's risk... but then how are we going to maintain this
> > > > going forward?  Add a new struct on any change?
> > >
> > > This is the way we have used it for the past 5 or more years. I don't
> > > see why this must be handled in the vq reset feature.
> > >
> > > >Can we at least
> > > > prevent this going forward somehow?
> > >
> > > Like have some padding?
> > >
> > > Thanks
> >
> > Maybe - this is what QEMU does ...
> 
> Do you want this to be addressed in this series (it's already very huge anyhow)?
> 
> Thanks

Let's come up with a solution at least. QEMU does not seem to need the struct. Let's just put
it in virtio_pci_modern.h for now then?

> >
> > > >
> > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > > Since I want to add queue_reset after queue_notify_data, I submitted
> > > > > > > > > this patch first.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > ---
> > > > > > > > >  include/uapi/linux/virtio_pci.h | 7 +++++++
> > > > > > > > >  1 file changed, 7 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> > > > > > > > > index 3a86f36d7e3d..22bec9bd0dfc 100644
> > > > > > > > > --- a/include/uapi/linux/virtio_pci.h
> > > > > > > > > +++ b/include/uapi/linux/virtio_pci.h
> > > > > > > > > @@ -166,6 +166,13 @@ struct virtio_pci_common_cfg {
> > > > > > > > >       __le32 queue_used_hi;           /* read-write */
> > > > > > > > >  };
> > > > > > > > >
> > > > > > > > > +struct virtio_pci_common_cfg_notify {
> > > > > > > > > +     struct virtio_pci_common_cfg cfg;
> > > > > > > > > +
> > > > > > > > > +     __le16 queue_notify_data;       /* read-write */
> > > > > > > > > +     __le16 padding;
> > > > > > > > > +};
> > > > > > > > > +
> > > > > > > > >  /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
> > > > > > > > >  struct virtio_pci_cfg_cap {
> > > > > > > > >       struct virtio_pci_cap cap;
> > > > > > > > > --
> > > > > > > > > 2.31.0
> > > > > > > >
> > > > > >
> > > >
> >

