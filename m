Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4AD52E
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 Mar 2024 03:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710474726; cv=none; b=eLqj+V69QlY3sSwr3WK9VTF8dwMb5wjh0QcgIVXGcKWKjw5RqxKc1jS7CWcTHiU3MArrb4ZmevsZ52u+n+u/BfpffGbkE60L6XPKS2kxEOAEmIHhBMvM/Ub/5GLvP2MimrtmWWIyc2jGI4h3L1kkr2GFq1LHL06QTqLTpv93DXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710474726; c=relaxed/simple;
	bh=+P0SN8lR5UMoHiVeJbaZ63DVZv6EUw72aKI5RNx4i7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lw+Zr+9JHrPXI7occiv02P7jkhniq3Pcn6oI9h2XIdKYYDC5fF8bRfKn5ezWvSr0FpxYvQR0U/7D9NpOy2oKZll7j+q3OKSH7P8dPpOCw6jPdBMfDqxSDVthJpZee/HMBb6r5L7ipq6Do5ERWHQlxGujgebELQC5osKG+To8jI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZSVUG+bw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZSVUG+bw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710474723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jRnPjyJeZad1F26bIZOTcaKiZRrwc4cB/pDexLjVGDE=;
	b=ZSVUG+bwPBcYi8lPq2wgby5geeJ267tX5J9P8IR7u6+8Az6A0BZ1mDmlBPupFUCMy51YFm
	yCG6OMrKsbwkHeVy8GFezgkVm5LSU+oTyu4musUB9HLWxFmTfZOL2+mG73eyaI15Vw39Ah
	8vGvdYs+bp56q9HEkhbV07kv6cNp71Y=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-OSWUJ5njPuGbN5UCObJELQ-1; Thu, 14 Mar 2024 23:52:01 -0400
X-MC-Unique: OSWUJ5njPuGbN5UCObJELQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-29df71a709eso161834a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Mar 2024 20:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710474720; x=1711079520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRnPjyJeZad1F26bIZOTcaKiZRrwc4cB/pDexLjVGDE=;
        b=DPEVyMi22u7YjSrFNPxLPoIqBJExVtcHgB7WE1CC74DKdwexDbzAf1AdubzQ8b9bf9
         FBH4i+mpuJaywelOrTBnLFI1Njf79eCacfR9EfQmS4wnWwUKOLwbzh/cBBE4Lh4EhfPm
         cKa+iZo3NQgDp1D0U7jZdZFvNU2lvuUYV8UP0l9ZOoCOegL1A9sqV9ACaqa5VQ4Qo2qP
         bMSM9BxkAJv0xHUv1cPZMyHriMRO3bqYrfs0zI7DH0792PEeJX3A6F3eHzbViUU5h93S
         5WkPL9M7aiMlEISW0dfA2yIYULLMgGqeVh2y7B9eIEP5sEHuliYM5hTdPwdSZnUnqTiE
         LhNw==
X-Forwarded-Encrypted: i=1; AJvYcCWK2EVohEhG3kPeoA3zYMsEeSWVVJta2rkzwuZiOKkcoJtMsocaNjLAtDO71eFZO8peEPe1EyXOXp0zoglb43dpiJGJf1c96eUlIOspWnxqfsa8kA==
X-Gm-Message-State: AOJu0YziGuVKPMeSJDcPVUGa5R14CUqv2b4Qvtoj/JxAADnp+EgmyGYg
	Smy/rBz5SObessO/J6FIX0v5u9U4J+LX/kYtBjr7KQ7bEoec5ZcFZC3keJQyDFcZT3n6k76ycRM
	4/+7O2Aa1fhlNg81oXGE/bv5NRebn40eVB/Z+pl3MAf+r+KbSMZUMZQLA+ke7mTlFNybbjEUaIK
	IRoWlv+xxyXrUO/+yeZ/vOSR0IcTCl086FYehz48D0BLKEJQ==
X-Received: by 2002:a17:90b:882:b0:29b:4755:23fc with SMTP id bj2-20020a17090b088200b0029b475523fcmr3558891pjb.33.1710474720020;
        Thu, 14 Mar 2024 20:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXDOuKDvuP/EqiFyBnUcJaSQVamH9YfVITPXeJDT8/OaXE+8nukfAwdydXN+5KUnq8MlXvmaNj0CipGi0ChDY=
X-Received: by 2002:a17:90b:882:b0:29b:4755:23fc with SMTP id
 bj2-20020a17090b088200b0029b475523fcmr3558876pjb.33.1710474719748; Thu, 14
 Mar 2024 20:51:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312021013.88656-1-xuanzhuo@linux.alibaba.com>
 <20240312021013.88656-2-xuanzhuo@linux.alibaba.com> <CACGkMEvVgfgAxLoKeFTgy-1GR0W07ciPYFuqs6PiWtKCnXuWTw@mail.gmail.com>
 <1710395908.7915084-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1710395908.7915084-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 15 Mar 2024 11:51:48 +0800
Message-ID: <CACGkMEsT2JqJ1r_kStUzW0+-f+qT0C05n2A+Yrjpc-mHMZD_mQ@mail.gmail.com>
Subject: Re: [PATCH vhost v3 1/4] virtio: find_vqs: pass struct instead of
 multi parameters
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 14, 2024 at 2:00=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> On Thu, 14 Mar 2024 11:12:24 +0800, Jason Wang <jasowang@redhat.com> wrot=
e:
> > On Tue, Mar 12, 2024 at 10:10=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alib=
aba.com> wrote:
> > >
> > > Now, we pass multi parameters to find_vqs. These parameters
> > > may work for transport or work for vring.
> > >
> > > And find_vqs has multi implements in many places:
> > >
> > >  arch/um/drivers/virtio_uml.c
> > >  drivers/platform/mellanox/mlxbf-tmfifo.c
> > >  drivers/remoteproc/remoteproc_virtio.c
> > >  drivers/s390/virtio/virtio_ccw.c
> > >  drivers/virtio/virtio_mmio.c
> > >  drivers/virtio/virtio_pci_legacy.c
> > >  drivers/virtio/virtio_pci_modern.c
> > >  drivers/virtio/virtio_vdpa.c
> > >
> > > Every time, we try to add a new parameter, that is difficult.
> > > We must change every find_vqs implement.
> > >
> > > One the other side, if we want to pass a parameter to vring,
> > > we must change the call path from transport to vring.
> > > Too many functions need to be changed.
> > >
> > > So it is time to refactor the find_vqs. We pass a structure
> > > cfg to find_vqs(), that will be passed to vring by transport.
> > >
> > > Because the vp_modern_create_avq() use the "const char *names[]",
> > > and the virtio_uml.c changes the name in the subsequent commit, so
> > > change the "names" inside the virtio_vq_config from "const char *cons=
t
> > > *names" to "const char **names".
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Acked-by: Johannes Berg <johannes@sipsolutions.net>
> > > Reviewed-by: Ilpo J=3DE4rvinen <ilpo.jarvinen@linux.intel.com>
> >
> > The name seems broken here.
>
> Email APP bug.
>
> I will fix.
>
>
> >
> > [...]
> >
> > >
> > >  typedef void vq_callback_t(struct virtqueue *);
> > >
> > > +/**
> > > + * struct virtio_vq_config - configure for find_vqs()
> > > + * @cfg_idx: Used by virtio core. The drivers should set this to 0.
> > > + *     During the initialization of each vq(vring setup), we need to=
 know which
> > > + *     item in the array should be used at that time. But since the =
item in
> > > + *     names can be null, which causes some item of array to be skip=
ped, we
> > > + *     cannot use vq.index as the current id. So add a cfg_idx to le=
t vring
> > > + *     know how to get the current configuration from the array when
> > > + *     initializing vq.
> >
> > So this design is not good. If it is not something that the driver
> > needs to care about, the core needs to hide it from the API.
>
> The driver just ignore it. That will be beneficial to the virtio core.
> Otherwise, we must pass one more parameter everywhere.

I don't get here, it's an internal logic and we've already done that.

Thanks

>
> Thanks.
>
> >
> > Thanks
> >
>

