Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF621AB341
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718881626; cv=none; b=l2mdtoZ9m3SZdQW55ocOYlu2QtwsnwmILeBoLzv4cGVdaKkmTwGPB7T3keY1+8H7OT8DIlS+YA8RuBiWpX7Mhh6NtIPVAisqSp02brlRmL//fJLk/L7747qtph3gjPi+7BNdIlDFYKVACyoNPdxcsgGvdW1px62oNxAXZ5fcpHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718881626; c=relaxed/simple;
	bh=pGP3EXENF/h16YOS7jUUe7kIh4Nxl//v/ksZfj/bzpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hc0Lx8yAyA3dNS2N4akB83ZsIPNkOTYziOfSmvPA0E+/kZHMkotk2GZ3pERnIKwo3bFQIPsAsWfnbQNRSv8+b3lGuP76tAq1A9lLjF7WboJvg0rcT3MRa2UOIkB1xDphf5PzrYPKUT+dyRRQ73HzVdCUl5o5mkjtxcpKaAtnBzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zvm6h9Eo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zvm6h9Eo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718881623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=asOuL0T8Du5hh5YbTvqvuUvFHIqZ4G+a72SoWSKyqQM=;
	b=Zvm6h9EoB/ZeDHJGPrrGNldmYZWP7xgUxZPJgfxStZqHMNiNJ4Z6Aoj0MorZxntfxqic/8
	+dsbIW+Rr7Dg6cvFeTu6PXRiZaICZ4Bki2dY/UvzdI8jkrop1AJ79o+rAjupxVjQ08lOry
	ToLnxaayAq/UGkUHrn5xKAoQmgkbTas=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-MYmO9szxOGeHVA8QhiL_yw-1; Thu, 20 Jun 2024 07:07:02 -0400
X-MC-Unique: MYmO9szxOGeHVA8QhiL_yw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57d172119a6so266871a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 04:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718881621; x=1719486421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asOuL0T8Du5hh5YbTvqvuUvFHIqZ4G+a72SoWSKyqQM=;
        b=a/USYLQ+lHl5N0SEFPwUnN821XFM87h3nRLhbPb3r3RtVqgnEcZwlz8nssR6kILjhL
         mWozIGhFMWJwYURTi1Vgt/PTHiy/BW0CaZMz9kFnVd96LyTim4ofg63a+lQvHJsNVy5v
         qUsbnCDyjHgRa+Fn21NEusP8RA+jy5pS/0dYlOv6eFoMubh7keafbSqB/VQD60uG03uy
         Mc4ZjpIyPWzsyF0X/aGnvHMfutwVCA0q+mESTpT/yG100WMWbsY/BcsOR5wCm5eld7Ze
         2BAG7uMLq8bzOS97eBtBJMXKBcPRsw/I2NLhEAG2qcXVOX3yY3iI2j0tR2s1kKz+BC31
         +cJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeY7xcP6Sn7Mpl+8oZPMVwPQcDu0oqkIyT4NMY2kymIsFkgGxxgUElE4VorL9pkl1pYvhJxquonvbHZCkyjpfi1S5j1DUNVIAIpeM6nK4DobaH0Q==
X-Gm-Message-State: AOJu0Yy8rmnpUAuWlLt0lAOaEEbCGJQ/IPHY82hBGRRzrUMgbcp0UjZB
	rBeKBTGspa3om1ufAdFOjPB2+Yt+kKouIgsFyQvDph8HhoyT5jf4bAlgpEI7tTzTN/CjaTGg1AR
	CrukjL3VXNOgF2WCKuwmd5l7/wZ9NdFm/wSWBfA+bEaiQWAUTWfn65cjqFB8V4IcOhJ3saAc=
X-Received: by 2002:a50:f681:0:b0:572:1589:eb98 with SMTP id 4fb4d7f45d1cf-57d07e7ad48mr2720552a12.12.1718881620760;
        Thu, 20 Jun 2024 04:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+O2pcBIB3xTxXGVaSg2RJcQJnlZbfDTdu2g3BCbKZScECK74GIw+9TE9o8AKC9KjzfkuaJw==
X-Received: by 2002:a50:f681:0:b0:572:1589:eb98 with SMTP id 4fb4d7f45d1cf-57d07e7ad48mr2720537a12.12.1718881620258;
        Thu, 20 Jun 2024 04:07:00 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d26a50cbbsm241731a12.63.2024.06.20.04.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:06:59 -0700 (PDT)
Date: Thu, 20 Jun 2024 07:06:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-um@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org
Subject: Re: [PATCH vhost v9 3/6] virtio: find_vqs: pass struct instead of
 multi parameters
Message-ID: <20240620070354-mutt-send-email-mst@kernel.org>
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240424091533.86949-4-xuanzhuo@linux.alibaba.com>
 <20240620034823-mutt-send-email-mst@kernel.org>
 <1718874049.457552-1-xuanzhuo@linux.alibaba.com>
 <20240620050545-mutt-send-email-mst@kernel.org>
 <1718875249.1787696-3-xuanzhuo@linux.alibaba.com>
 <20240620061202-mutt-send-email-mst@kernel.org>
 <1718880210.0475078-2-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718880210.0475078-2-xuanzhuo@linux.alibaba.com>

On Thu, Jun 20, 2024 at 06:43:30PM +0800, Xuan Zhuo wrote:
> On Thu, 20 Jun 2024 06:15:08 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Thu, Jun 20, 2024 at 05:20:49PM +0800, Xuan Zhuo wrote:
> > > On Thu, 20 Jun 2024 05:14:24 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > On Thu, Jun 20, 2024 at 05:00:49PM +0800, Xuan Zhuo wrote:
> > > > > > > @@ -226,21 +248,37 @@ struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
> > > > > > >
> > > > > > >  static inline
> > > > > > >  int virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> > > > > > > -			struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > > > > > -			const char * const names[],
> > > > > > > -			struct irq_affinity *desc)
> > > > > > > +		    struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > > > > > +		    const char * const names[],
> > > > > > > +		    struct irq_affinity *desc)
> > > > > > >  {
> > > > > > > -	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL, desc);
> > > > > > > +	struct virtio_vq_config cfg = {};
> > > > > > > +
> > > > > > > +	cfg.nvqs = nvqs;
> > > > > > > +	cfg.vqs = vqs;
> > > > > > > +	cfg.callbacks = callbacks;
> > > > > > > +	cfg.names = (const char **)names;
> > > > > >
> > > > > >
> > > > > > Casting const away? Not safe.
> > > > >
> > > > >
> > > > >
> > > > > Because the vp_modern_create_avq() use the "const char *names[]",
> > > > > and the virtio_uml.c changes the name in the subsequent commit, so
> > > > > change the "names" inside the virtio_vq_config from "const char *const
> > > > > *names" to "const char **names".
> > > >
> > > > I'm not sure I understand which commit you mean,
> > > > and this kind of change needs to be documented, but it does not matter.
> > > > Don't cast away const.
> > >
> > >
> > > Do you mean change the virtio_find_vqs(), from
> > > const char * const names[] to const char *names[].
> > >
> > > And update the caller?
> > >
> > > If we do not cast the const, we need to update all the caller to remove the
> > > const.
> > >
> > > Right?
> > >
> > > Thanks.
> >
> >
> > Just do not split the patchset at a boundary that makes you do that.
> > If you are passing in an array from a const section then it
> > has to be const and attempts to change it are a bad idea.
> 
> Without this patch set:
> 
> static struct virtqueue *vu_setup_vq(struct virtio_device *vdev,
> 				     unsigned index, vq_callback_t *callback,
> 				     const char *name, bool ctx)
> {
> 	struct virtio_uml_device *vu_dev = to_virtio_uml_device(vdev);
> 	struct platform_device *pdev = vu_dev->pdev;
> 	struct virtio_uml_vq_info *info;
> 	struct virtqueue *vq;
> 	int num = MAX_SUPPORTED_QUEUE_SIZE;
> 	int rc;
> 
> 	info = kzalloc(sizeof(*info), GFP_KERNEL);
> 	if (!info) {
> 		rc = -ENOMEM;
> 		goto error_kzalloc;
> 	}
> ->	snprintf(info->name, sizeof(info->name), "%s.%d-%s", pdev->name,
> 		 pdev->id, name);
> 
> 	vq = vring_create_virtqueue(index, num, PAGE_SIZE, vdev, true, true,
> 				    ctx, vu_notify, callback, info->name);
> 
> 
> The name is changed by vu_setup_vq().
> If we want to pass names to
> virtio ring, the names must not be  "const char * const"
> 
> And the admin queue of pci do the same thing.
> 
> And I think you are right, we should not cast the const.
> So we have to remove the "const" from the source.
> And I checked the source code, if we remove the "const", I think
> that makes sense.
> 
> Thanks.

/facepalm

This is a different const.


There should be no need to drop the annotation, core
does not change these things and using const helps make
sure that is the case.



> 
> 
> >
> >
> > > >
> > > > --
> > > > MST
> > > >
> >

