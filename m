Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C77219EEBB
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718874082; cv=none; b=CDrSGGHiAhgn8hrVrmaf16UCc0Ft4Y493+7DRkbvLO3k/t4mJzPkGC6g9Nju6Lwjm9WlcF/ALVfreHtsKjRnmk1i11dd0NkYBsSLw24TUd6FrfikSc/UyL8RHMzhnXeW6rUUAcpV8uGOTzNTFB6RrBUgxKBrxkZUm3MT2aUDUxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718874082; c=relaxed/simple;
	bh=2nMCQx2fyhNhl3V6Bsvj0nvtFHLSOUGt0buGaTs+hAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Se1+2FqB78xRskxxY3ByYauR+ple3B1feJygnq4/tCyNEI5aUuNpftgzTc/+wwRSbD4Zy8BqyQ2Xq04+5kypxfjYucP6nPcESDdfxbcVD5B6fDr2zqqgWbOOmAH9a2hpZvKPaq7AY1mmTFmUM488G3o7j64CPkktFmeVeeOWxsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SR6WBTF4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SR6WBTF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718874079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XR61vx35OTZX9XFWt8YdyvsDaIUHY+xQKab0QtNP4Qc=;
	b=SR6WBTF4zh3aZRG1XLePLbTnMStpDw/t1Trbd4eLbGLuWtnSL23ee83scsGtEydvQnQfoG
	iQ7puFwYVAXSJ3Hn6obiNwlhG6VOq6VClgjlzt9l+tRVAwCq5THmxV1aq+Nvtv8cjSDjaM
	Dqm8Yo4MG82MV7P6WUxDQeI+HUWnJFA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-k_KEp1CwPgqFd_Bv7AL7eg-1; Thu, 20 Jun 2024 05:01:17 -0400
X-MC-Unique: k_KEp1CwPgqFd_Bv7AL7eg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6f1db7e425so36165266b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jun 2024 02:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718874076; x=1719478876;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR61vx35OTZX9XFWt8YdyvsDaIUHY+xQKab0QtNP4Qc=;
        b=EWEk0IsoshCMJeqDbCO4RRvZCXEBdvEuI/8FXM4S/Sw1aeF5bUoVp3jkpfQflRzn4G
         ACA2PgAJFc+ohMSq6EIV+ns6qfO54PUVSK2V5My1n1pvq+1KWxevFbgP3JZLHZ3y2NhY
         OwqPiW4lUMS3WZwp6bl47C1D19T1tHAWVY3ck/9QhoDqpKhmdshwIy7SEPSvcbBczytg
         OBswgCTs5NICSWaTsI8VKYON4Sj49BRe8VNY+zkZ/M7NpCtleDbwZ3tWOl8mHeNglCYV
         MF7bhhphisVR6xL/2w3BRZ7jB1sJQf5ia3XicczQIm715YfLQeiOr1hUFwjF3eAp0WqI
         Kmmw==
X-Forwarded-Encrypted: i=1; AJvYcCXS38eQ/czVjLz/SCpDQPz5TM2wiDERMeF5tXakT3EAdH0xyrDqQONFOXxfxlj+aV1S/amrmO95AvFTEJ8LrJij3qwZCHf4QMQlRNmm9kkdcn/eDQ==
X-Gm-Message-State: AOJu0Yzow9Y4qopnU3wYcx9wKf4M9P2p3F6zXSgEiIF3XZ0FGj5sU+pg
	aevfSapL7Toop4jpMxDcrFj3MiFtupXziRJHdjlSQpsDkcXaL+7HS5Up/lHzzeso9HOCYbsEk9+
	84NNyL0in6FtfMTPfJSdWl5GCJwAoAtVA9hfb4VxdIDqOoe2KveHo7BmkXBnXOooKC/swM64=
X-Received: by 2002:a17:907:c805:b0:a68:b73d:30d0 with SMTP id a640c23a62f3a-a6fab609e47mr400228066b.6.1718874076401;
        Thu, 20 Jun 2024 02:01:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5+F4gugdmHhB163V4ULVbHnYMOFq3eTuk1V982iZ6yAjow4HL/6ytgFaWqg7nTSdPpnke9w==
X-Received: by 2002:a17:907:c805:b0:a68:b73d:30d0 with SMTP id a640c23a62f3a-a6fab609e47mr400225566b.6.1718874075875;
        Thu, 20 Jun 2024 02:01:15 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3356sm742953866b.40.2024.06.20.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:01:14 -0700 (PDT)
Date: Thu, 20 Jun 2024 05:01:08 -0400
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
Subject: Re: [PATCH vhost v9 2/6] virtio: remove support for names array
 entries being null.
Message-ID: <20240620044839-mutt-send-email-mst@kernel.org>
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240424091533.86949-3-xuanzhuo@linux.alibaba.com>
 <20240620035749-mutt-send-email-mst@kernel.org>
 <1718872778.4831812-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718872778.4831812-1-xuanzhuo@linux.alibaba.com>

On Thu, Jun 20, 2024 at 04:39:38PM +0800, Xuan Zhuo wrote:
> On Thu, 20 Jun 2024 04:02:45 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Wed, Apr 24, 2024 at 05:15:29PM +0800, Xuan Zhuo wrote:
> > > commit 6457f126c888 ("virtio: support reserved vqs") introduced this
> > > support. Multiqueue virtio-net use 2N as ctrl vq finally, so the logic
> > > doesn't apply. And not one uses this.
> > >
> > > On the other side, that makes some trouble for us to refactor the
> > > find_vqs() params.
> > >
> > > So I remove this support.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > Acked-by: Eric Farman <farman@linux.ibm.com> # s390
> > > Acked-by: Halil Pasic <pasic@linux.ibm.com>
> >
> >
> > I don't mind, but this patchset is too big already.
> > Why do we need to make this part of this patchset?
> 
> 
> If some the pointers of the names is NULL, then in the virtio ring,
> we will have a trouble to index from the arrays(names, callbacks...).
> Becasue that the idx of the vq is not the index of these arrays.
> 
> If the names is [NULL, "rx", "tx"], the first vq is the "rx", but index of the
> vq is zero, but the index of the info of this vq inside the arrays is 1.


Ah. So actually, it used to work.

What this should refer to is

commit ddbeac07a39a81d82331a312d0578fab94fccbf1
Author: Wei Wang <wei.w.wang@intel.com>
Date:   Fri Dec 28 10:26:25 2018 +0800

    virtio_pci: use queue idx instead of array idx to set up the vq
    
    When find_vqs, there will be no vq[i] allocation if its corresponding
    names[i] is NULL. For example, the caller may pass in names[i] (i=4)
    with names[2] being NULL because the related feature bit is turned off,
    so technically there are 3 queues on the device, and name[4] should
    correspond to the 3rd queue on the device.
    
    So we use queue_idx as the queue index, which is increased only when the
    queue exists.
    
    Signed-off-by: Wei Wang <wei.w.wang@intel.com>
    Signed-off-by: Michael S. Tsirkin <mst@redhat.com>


Which made it so setting names NULL actually does not reserve a vq.

But I worry about non pci transports - there's a chance they used
a different index with the balloon. Did you test some of these?

-- 
MST

