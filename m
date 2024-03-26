Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9479612A176
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Mar 2024 04:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711427331; cv=none; b=P2STEe53Zcq9XB6Tqaq/IFJfmIODYFv8EQ9u5fImmXU09K4TfTMhfNAlkM8jggxgnYW8iiqlj5hjSbQ/SY9BaTmEfY28Qk36yW9dj+d7GxNa4ZkiUEKWeK1LqSXLXrg5iLobtSjmOtqIGA7HQ1yXo0z/T1CeaLria79W8G+KhKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711427331; c=relaxed/simple;
	bh=9ltv4DwYwWj7kB/fZ2mzOIYt06/xNjINGiA4oBElaQk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3CGmCq3ceGOTKf7y9kftyyKJE6Rq19N0hcfDylJG5jAl72bg+MQRoQM6tyfrFz80leFG0g/x/5wiXJxUh3Gl2Taxd7hkapgHmYPnXHqVUnujF2/SF3GGfxjK73Xc8KMGkl4O8YUp9oTo8e1mFoQfd4gnXZmwx7suweu9aBMrXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bWnTGxt5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bWnTGxt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711427328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VYJdaPfqxCLnNgCpNcotB2CUqnM+IpEVFvBowNr66ZI=;
	b=bWnTGxt57Jw68JSHBQApJ5MZD0yIG34J8ok39h5eny3Hk35cuG7Fg3fZmwO1ZVZS41aqsM
	Hw5Je5YaDvtn6sX1ru5TEiO7a+isbA4JqrG3Q/dSKSqfTfDnUjlQfRWg2NHTNG+YvpwGqG
	XKCWKXw//OSGFShdetQZ3T7QGqC6/EQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-pbqdunkgPZy-3zZHNFzj4Q-1; Tue, 26 Mar 2024 00:28:46 -0400
X-MC-Unique: pbqdunkgPZy-3zZHNFzj4Q-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-5c66a69ec8eso3607548a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 21:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711427325; x=1712032125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYJdaPfqxCLnNgCpNcotB2CUqnM+IpEVFvBowNr66ZI=;
        b=XRG2Ypg1RImNt/Hwd0bpcu0GZ2HaQc5Wz3ZFxdBgzAJ8yseG5+OkC2u0Gd+P065dmy
         eKLQPaok5jSKrMF0HGcxUb5wk6oeMgGJ5AzRL3a99GOgUxZ0BMiFcMhUbFK/tMCjpIKb
         1DOfFA+YCZP0QxQJFCprChSnWBZWM26SJSSxsuIh/ae1vPqyBLkTIiFs16BHd/As0Ys+
         Cajr0z55XQo5B81jD3TiYppajWZQsooA3/vtCKFGxUKSncgSZ3Ysq3LK7zSbwdbD9h62
         b4PM5+TK7tePPzmpwCFAfVV0yM7qSdCnwWhflWRF/55+Nt5UG9Qz55zkdmRG2ev5wbA1
         ShUg==
X-Forwarded-Encrypted: i=1; AJvYcCXapvMxVRO6StZnvLsxg/5WnXfTGO6pJkVzOlVXhnLCu9slVsu6cJ1XRzlF/2z7BdKg4Vv6Z1greHnhSNAyliTFyiIFsuVYD3tqml8OEapc7MXyxA==
X-Gm-Message-State: AOJu0YyKkCPik2EXi3WVHaXolVJXyQ4v1BM+oL+Np235GEEZKf7g0Tl3
	qw7XS8VmdjBaBQ6W+pdKPXCJTRY32q/sg8Ii/lA3gtsuxnrqLYIq0Qng47y6j8ejP3OklpCmSuI
	Bd/reGgjIjj9KxcNdBNHlqntP7TYpSAgEZHLgcxdPqcaEisKkrk2Ev5/nqBK6lhqJy/QQzEl1ZR
	0EARn8m5nRB+qc/Y5cFz52UL1jUX/R4dLgbZWfcqH2TpK1sg==
X-Received: by 2002:a17:902:e541:b0:1e0:f550:82e2 with SMTP id n1-20020a170902e54100b001e0f55082e2mr154432plf.22.1711427325201;
        Mon, 25 Mar 2024 21:28:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYwbHtFo5NnweY6aiIQsz8qOqVwbBb5nB1OBSL78XFdIi+hU5TswumUMNoFDqt6TH1kJ3Y6QgJCf7jKybputQ=
X-Received: by 2002:a17:902:e541:b0:1e0:f550:82e2 with SMTP id
 n1-20020a170902e54100b001e0f55082e2mr154413plf.22.1711427324953; Mon, 25 Mar
 2024 21:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325090419.33677-1-xuanzhuo@linux.alibaba.com> <20240325090419.33677-3-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240325090419.33677-3-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Mar 2024 12:28:34 +0800
Message-ID: <CACGkMEuuNrDkEUnnES-APDVag2=4wjyZi3aEg0+8vY+Bho=BRg@mail.gmail.com>
Subject: Re: [PATCH vhost v5 2/6] virtio: remove support for names array
 entries being null.
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	David Hildenbrand <david@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 5:04=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> commit 6457f126c888 ("virtio: support reserved vqs") introduced this
> support. Multiqueue virtio-net use 2N as ctrl vq finally, so the logic
> doesn't apply. And not one uses this.
>
> On the other side, that makes some trouble for us to refactor the
> find_vqs() params.
>
> So I remove this support.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  arch/um/drivers/virtio_uml.c             | 5 -----
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 4 ----
>  drivers/remoteproc/remoteproc_virtio.c   | 5 -----
>  drivers/s390/virtio/virtio_ccw.c         | 5 -----
>  drivers/virtio/virtio_mmio.c             | 5 -----
>  drivers/virtio/virtio_pci_common.c       | 9 ---------
>  drivers/virtio/virtio_vdpa.c             | 5 -----
>  include/linux/virtio_config.h            | 1 -
>  8 files changed, 39 deletions(-)
>
> diff --git a/arch/um/drivers/virtio_uml.c b/arch/um/drivers/virtio_uml.c
> index 8adca2000e51..1d1e8654b7fc 100644
> --- a/arch/um/drivers/virtio_uml.c
> +++ b/arch/um/drivers/virtio_uml.c
> @@ -1031,11 +1031,6 @@ static int vu_find_vqs(struct virtio_device *vdev,=
 unsigned nvqs,
>                 return rc;
>
>         for (i =3D 0; i < nvqs; ++i) {
> -               if (!names[i]) {
> -                       vqs[i] =3D NULL;
> -                       continue;
> -               }

Does this mean names[i] must not be NULL? If yes, should we fail or
not? If not, do we need to change the doc?

[...]

> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -56,7 +56,6 @@ typedef void vq_callback_t(struct virtqueue *);
>   *     callbacks: array of callbacks, for each virtqueue
>   *             include a NULL entry for vqs that do not need a callback
>   *     names: array of virtqueue names (mainly for debugging)
> - *             include a NULL entry for vqs unused by driver
>   *     Returns 0 on success or error status
>   * @del_vqs: free virtqueues found by find_vqs().
>   * @synchronize_cbs: synchronize with the virtqueue callbacks (optional)


Since we had other check for names[i] like:

        if (per_vq_vectors) {
                /* Best option: one for change interrupt, one per vq. */
                nvectors =3D 1;
                for (i =3D 0; i < nvqs; ++i)
                        if (names[i] && callbacks[i])
                                ++nvectors;

in vp_find_vqs_msix() and maybe other places.

> --
> 2.32.0.3.g01195cf9f
>

