Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DCB17CA19
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 08:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718871687; cv=none; b=WSyBBnn2WIi4bHoyfGi8gcpSphWnXHHRM939JPBTl40TvsGVS1VtO27UqDh4a52cTvJSLdjOPRE76o8W7wJ6xH7CQakoColFZPZFIQ3LKigdHmaSIemy/EBn7PZdMAK6cYu8Idp7DknPY182V37c/CcJ/C1mF8T8EI1EnYxlR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718871687; c=relaxed/simple;
	bh=LR/K+J6KzpZJF93eE1SpQIRs80lV/+fTYln8iY77+Ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8vKYmUvDI7pMXHGT4qD08LF2MLbP6EJXNr4NqajpsAGTJOFKIzgF9UezIN16C9+eJyGqD7m7sTGg5Y4UK56CLc7iy6B7yb85wSu81rV6pO1NhpS+Xkb4VlcbG14HP6ZDXQGpI5QihErAIyvS5ekrD4O+aVp4TFqrVw7+YXztmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DrcXlpGv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DrcXlpGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718871683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UycNLq/jPjHQqHMLXV0878YjLaKSICJpDUuvwOlKQOg=;
	b=DrcXlpGvkVH2pX0sQ1oMayEWV7kLEt6qj5t5wur6jUYEH75d62/jQQdER+4qjzTnrRIJ1f
	sklGMV6BKDu4D1w0XRPKQpcQpuSNpy6Imq9/2SXp8Ey7ybH44VeVKMJWr/K2OqraOlLTLC
	PpCe/mhrFZzWdbNS9KStrtnnvGggZI4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-P09DA_QGO1abQ1LDUDDhaw-1; Thu, 20 Jun 2024 04:21:21 -0400
X-MC-Unique: P09DA_QGO1abQ1LDUDDhaw-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2c7e48b9f80so581406a91.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 01:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718871681; x=1719476481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UycNLq/jPjHQqHMLXV0878YjLaKSICJpDUuvwOlKQOg=;
        b=rbx2W3HTIrDtwJTX1lNa4rl1fn5eT2HUuCraYKhsivufZ8ghu7pYMAJMJ/HS344eTh
         vvOzL2yfBU9YO6vS+4yrfR7PhoF93m4mO2gIBYkR2XtCMNKjr+jFr3+M4yJOApwk9WFE
         gQjd0fO0DggtN78F17K5ULdKd8Xrn6CSTLK0e/yiKzWwyitrHgHioJ0YjmnQKvWTKmgj
         3dc8gMJGTGdSPVG6NHSdMXau6tBDSFcJXrhNAAlYfRmulsNLwWp/OjA3exueJsN2+SNU
         D+CMM3Za/3fsNwU1bkmuC2WLcOHd2bkafpwVazjUOKBhPs634g96GxX5Fg9PrOh0lyOE
         UP3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV078YZllsVYiTqaON5z3L7AQWISqvGaSfHzhqdd0bdeqqY3+aFySASR71WH/TdZF1qJAsQpVwxeCYGaWb9K2hZk7xZV1o6nIdmTd0krodAojIPXw==
X-Gm-Message-State: AOJu0Yzw40VjFg3O90bIGbS5807sqGlrkt38wd06fm+jOCHd5+umopMw
	FbnIdgDOCiZoc3d11BNSxSvoYgMDic6S2cjQ71NxXDSec+M3UHpvIJ9LHNbxK88Yrbbuwd9ihGA
	em4WQw+FcT2Of+N+wPY7ki3kTpqtiKVWk1/peTS86x/OcO+EK8X215zf3KOGGta2Fjkvb+6TeXX
	g8OBz8cZB34jzB+CNS7giyyESBHH7/OjLEDwi4qyEtdAXFFA==
X-Received: by 2002:a17:90a:12cf:b0:2c2:deda:8561 with SMTP id 98e67ed59e1d1-2c7b5dc9665mr4142104a91.41.1718871680847;
        Thu, 20 Jun 2024 01:21:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtYn/rf/kl6Qj5/Pavju1IvIHJQmkYLZpAJM3Hav28b/FHSe46aqQwH/hKX1cWbXvGnnxKId86W9xKimIuLO4=
X-Received: by 2002:a17:90a:12cf:b0:2c2:deda:8561 with SMTP id
 98e67ed59e1d1-2c7b5dc9665mr4142074a91.41.1718871680356; Thu, 20 Jun 2024
 01:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240424091533.86949-2-xuanzhuo@linux.alibaba.com> <20240620040415-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240620040415-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Jun 2024 16:21:08 +0800
Message-ID: <CACGkMEuGcP1gqmNUGSXx5QLwqizL=DUYWKm5AUycx96pz0JhsA@mail.gmail.com>
Subject: Re: [PATCH vhost v9 1/6] virtio_balloon: remove the dependence where
 names[] is null
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, David Hildenbrand <david@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 4:08=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Apr 24, 2024 at 05:15:28PM +0800, Xuan Zhuo wrote:
> > Currently, the init_vqs function within the virtio_balloon driver relie=
s
> > on the condition that certain names array entries are null in order to
> > skip the initialization of some virtual queues (vqs). This behavior is
> > unique to this part of the codebase. In an upcoming commit, we plan to
> > eliminate this dependency by removing the function entirely. Therefore,
> > with this change, we are ensuring that the virtio_balloon no longer
> > depends on the aforementioned function.
> >
> > As specification 1.0-1.2, vq indexes should not be contiguous if some
> > vq does not exist. But currently the virtqueue index is contiguous for
> > all existing devices. The Linux kernel does not implement functionality
> > to allow vq indexes to be discontinuous. So the current behavior of the
> > virtio-balloon device is different for the spec. But this commit has no
> > functional changes.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
>
> I can't make heads of tails of this.
>
> David you acked so maybe you can help rewrite the commit log here?
>
> I don't understand what this says.
> What in the balloon driver is out of spec?

The problem is the spec has bug, see this:

https://www.mail-archive.com/linux-um@lists.infradead.org/msg04359.html

Thanks


> NULL in names *exactly* allows skipping init for some vqs.
> How is that "does not implement"?
>
> And so on.
>
>
> > ---
> >  drivers/virtio/virtio_balloon.c | 48 ++++++++++++++-------------------
> >  1 file changed, 20 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_ba=
lloon.c
> > index c0a63638f95e..ccda6d08493f 100644
> > --- a/drivers/virtio/virtio_balloon.c
> > +++ b/drivers/virtio/virtio_balloon.c
> > @@ -548,49 +548,41 @@ static int init_vqs(struct virtio_balloon *vb)
> >       struct virtqueue *vqs[VIRTIO_BALLOON_VQ_MAX];
> >       vq_callback_t *callbacks[VIRTIO_BALLOON_VQ_MAX];
> >       const char *names[VIRTIO_BALLOON_VQ_MAX];
> > -     int err;
> > +     int err, idx =3D 0;
> >
> > -     /*
> > -      * Inflateq and deflateq are used unconditionally. The names[]
> > -      * will be NULL if the related feature is not enabled, which will
> > -      * cause no allocation for the corresponding virtqueue in find_vq=
s.
> > -      */
> > -     callbacks[VIRTIO_BALLOON_VQ_INFLATE] =3D balloon_ack;
> > -     names[VIRTIO_BALLOON_VQ_INFLATE] =3D "inflate";
> > -     callbacks[VIRTIO_BALLOON_VQ_DEFLATE] =3D balloon_ack;
> > -     names[VIRTIO_BALLOON_VQ_DEFLATE] =3D "deflate";
> > -     callbacks[VIRTIO_BALLOON_VQ_STATS] =3D NULL;
> > -     names[VIRTIO_BALLOON_VQ_STATS] =3D NULL;
> > -     callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] =3D NULL;
> > -     names[VIRTIO_BALLOON_VQ_FREE_PAGE] =3D NULL;
> > -     names[VIRTIO_BALLOON_VQ_REPORTING] =3D NULL;
> > +     callbacks[idx] =3D balloon_ack;
> > +     names[idx++] =3D "inflate";
> > +     callbacks[idx] =3D balloon_ack;
> > +     names[idx++] =3D "deflate";
> >
> >       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
> > -             names[VIRTIO_BALLOON_VQ_STATS] =3D "stats";
> > -             callbacks[VIRTIO_BALLOON_VQ_STATS] =3D stats_request;
> > +             names[idx] =3D "stats";
> > +             callbacks[idx++] =3D stats_request;
> >       }
> >
> >       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT)=
) {
> > -             names[VIRTIO_BALLOON_VQ_FREE_PAGE] =3D "free_page_vq";
> > -             callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] =3D NULL;
> > +             names[idx] =3D "free_page_vq";
> > +             callbacks[idx++] =3D NULL;
> >       }
> >
> >       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING)) {
> > -             names[VIRTIO_BALLOON_VQ_REPORTING] =3D "reporting_vq";
> > -             callbacks[VIRTIO_BALLOON_VQ_REPORTING] =3D balloon_ack;
> > +             names[idx] =3D "reporting_vq";
> > +             callbacks[idx++] =3D balloon_ack;
> >       }
> >
> > -     err =3D virtio_find_vqs(vb->vdev, VIRTIO_BALLOON_VQ_MAX, vqs,
> > -                           callbacks, names, NULL);
> > +     err =3D virtio_find_vqs(vb->vdev, idx, vqs, callbacks, names, NUL=
L);
> >       if (err)
> >               return err;
> >
> > -     vb->inflate_vq =3D vqs[VIRTIO_BALLOON_VQ_INFLATE];
> > -     vb->deflate_vq =3D vqs[VIRTIO_BALLOON_VQ_DEFLATE];
> > +     idx =3D 0;
> > +
> > +     vb->inflate_vq =3D vqs[idx++];
> > +     vb->deflate_vq =3D vqs[idx++];
> > +
> >       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
> >               struct scatterlist sg;
> >               unsigned int num_stats;
> > -             vb->stats_vq =3D vqs[VIRTIO_BALLOON_VQ_STATS];
> > +             vb->stats_vq =3D vqs[idx++];
> >
> >               /*
> >                * Prime this virtqueue with one buffer so the hypervisor=
 can
> > @@ -610,10 +602,10 @@ static int init_vqs(struct virtio_balloon *vb)
> >       }
> >
> >       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT)=
)
> > -             vb->free_page_vq =3D vqs[VIRTIO_BALLOON_VQ_FREE_PAGE];
> > +             vb->free_page_vq =3D vqs[idx++];
> >
> >       if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_REPORTING))
> > -             vb->reporting_vq =3D vqs[VIRTIO_BALLOON_VQ_REPORTING];
> > +             vb->reporting_vq =3D vqs[idx++];
> >
> >       return 0;
> >  }
> > --
> > 2.32.0.3.g01195cf9f
>

