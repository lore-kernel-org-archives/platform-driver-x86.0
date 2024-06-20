Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B9319AD5E
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718874876; cv=none; b=IYQ2+u5vmFXrQlriWFXRtaQnxyvAr9ZVSc4aVshuUj1vqJeOV5FKgqeHLKuLpGh/Dj9rV8fqi8Hbnbhb1EesHOwBC0m6S1NvEviCh/1dC3KzMcQwpR0VARTvobiEY5qkAcgbpObP+Vd4dNw0GW4iIvDME4BWjWoVorZKGkYKq0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718874876; c=relaxed/simple;
	bh=AblgfDKsQmxG/rhwuU9LnaVafDArI7B9+bO2yRkgtrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuseZwrlqt/yGmup8jerjv7X0GaaspHWt8qg/xoFLF0vXvhMoUQDUXTfI6ow9LLtHko7ipHURI6+qbAPsjd2Fwbtiuqa7Tzw2Q+9Nw1tJaB1bJ2BU2MjvjsiQE1fNEtXWXSH2bhH4zy/NexI9P/aImVcuPl2boPP9Ck04PnC7Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IVnOgZNJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IVnOgZNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718874874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7n/q6GHKkD/zFmXGYbmYPlaDuYuUj7aK/70/tkj3IdI=;
	b=IVnOgZNJjPSKg//Deu0Ps6yV+JdQGfCykic0ySBulqD0VZJoq44QwvaU+d7evZYHJOKKKq
	oMrW9k0A1zAWR1hcNsHm4X5zzeH6IBzEhwMg8vSiLgQvHMKuZYvdo6JjuoXtuSajw7n+ab
	39KnF3YkRDHDqhUF/Zo76nlv550/L9E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-VvxN-RMROBmK01Fh4S3_nw-1; Thu, 20 Jun 2024 05:14:32 -0400
X-MC-Unique: VvxN-RMROBmK01Fh4S3_nw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6f2af30793so26932366b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 02:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718874871; x=1719479671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7n/q6GHKkD/zFmXGYbmYPlaDuYuUj7aK/70/tkj3IdI=;
        b=o83BhVHjtdwItR00L0tjpShuQ8720G5cFOm/SjDmOmItDMmKxRwojhlBaT3VW6nOhG
         BrE+xk/q9MeM4ekcPmDqn+ZuGwBDEHmgY+lqwMKCIkSNbB9gYE81tAUV9vmKLm1Q0s5X
         bGKLNhNLO97VdE7aXvwWlLQTi8ZkULPQegbPLjcuo4eNBzHSqd9b1s0Imi/HcZrxiANR
         COdXI9WBqkj+ka1HU+od+vUIQZnIgnCEgOfVTZqlruvfQzezbMUh2l/0XX0pOqaZJ2Rm
         f9MUlxT9CT7qc6tY74oq9jWFnEK68UNPonDjG9FXeDk372hoc1/DHaaOH3U4c0Nl0sfz
         FcSw==
X-Forwarded-Encrypted: i=1; AJvYcCWPjfHwlDhx6m3/hgcX4+b4Kx9s6CZoRhaCD6LTz5Ajbfnp+xTgd8KVZheuCLY+yEK36smdsCJvag/JL0d7Nlem8D2uI7JwvUJKiX5u7svdgH9TrQ==
X-Gm-Message-State: AOJu0YzgMCPNI/Q5MyKXTRV8weJN6C0SXYNhgIkdazlHdzd0egLIKdEL
	wR4RGF2zsvmAtSuY5BXLWtu7Kq9yPpuholFJQcuJUs0txjftcEm1gJniVvW0SAZ4J6Qe6ekKMAV
	AhJRFcVVW9TsqVa58HcBYqLZcdhzPfO+RFJX75z7NBqPVa7hV3I5lE5yCorhUbn+MkZy3D8o=
X-Received: by 2002:a17:907:a581:b0:a6f:af4f:ff82 with SMTP id a640c23a62f3a-a6faf500049mr334399766b.25.1718874871291;
        Thu, 20 Jun 2024 02:14:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxdf7P1AFITZr2DVkTfIKfl2IcVnjVg8p04jUd8bO23ArK3RuJSM+iwOfOkWQb1H37WeNIsA==
X-Received: by 2002:a17:907:a581:b0:a6f:af4f:ff82 with SMTP id a640c23a62f3a-a6faf500049mr334396566b.25.1718874870708;
        Thu, 20 Jun 2024 02:14:30 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3fe5sm759661166b.18.2024.06.20.02.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:14:30 -0700 (PDT)
Date: Thu, 20 Jun 2024 05:14:24 -0400
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
Message-ID: <20240620050545-mutt-send-email-mst@kernel.org>
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240424091533.86949-4-xuanzhuo@linux.alibaba.com>
 <20240620034823-mutt-send-email-mst@kernel.org>
 <1718874049.457552-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718874049.457552-1-xuanzhuo@linux.alibaba.com>

On Thu, Jun 20, 2024 at 05:00:49PM +0800, Xuan Zhuo wrote:
> > > @@ -226,21 +248,37 @@ struct virtqueue *virtio_find_single_vq(struct virtio_device *vdev,
> > >
> > >  static inline
> > >  int virtio_find_vqs(struct virtio_device *vdev, unsigned nvqs,
> > > -			struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > -			const char * const names[],
> > > -			struct irq_affinity *desc)
> > > +		    struct virtqueue *vqs[], vq_callback_t *callbacks[],
> > > +		    const char * const names[],
> > > +		    struct irq_affinity *desc)
> > >  {
> > > -	return vdev->config->find_vqs(vdev, nvqs, vqs, callbacks, names, NULL, desc);
> > > +	struct virtio_vq_config cfg = {};
> > > +
> > > +	cfg.nvqs = nvqs;
> > > +	cfg.vqs = vqs;
> > > +	cfg.callbacks = callbacks;
> > > +	cfg.names = (const char **)names;
> >
> >
> > Casting const away? Not safe.
> 
> 
> 
> Because the vp_modern_create_avq() use the "const char *names[]",
> and the virtio_uml.c changes the name in the subsequent commit, so
> change the "names" inside the virtio_vq_config from "const char *const
> *names" to "const char **names".

I'm not sure I understand which commit you mean,
and this kind of change needs to be documented, but it does not matter.
Don't cast away const.

-- 
MST

