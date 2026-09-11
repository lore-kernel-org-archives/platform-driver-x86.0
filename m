Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72788476CFB
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130379; cv=none; b=W06DulLYq9lqflPoAZb18DpVCog17vGAiQtAU40KrJWcwrNmY2yFHA0WuO0QELA159ymMRa1TD2Z4e0sTw3FsyDeVk2qs58op4JMXIEV5DFwVAYviXZQN8+GMp8wIfae0RnnkKVvadXdD6FYxaKy7navMLS3VTLn6sTsb+MnvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130379; c=relaxed/simple;
	bh=GDdmUOvL5qIET19hhzGDg8z0c0RlAlMuQVYPy1uq+Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ruN8VG+q1Koum351YKi7eS+hdF0QiOIcWPMit4XiPEBKnpTLuXKzHbReXZc7EjU8rgEt7haBuqYIDlGRB21YdZtLKxQ5bstZqeYd1U6oFHOXI0PhRp7/nVHRI53NPYiAITLuG+vE8++dLdSy/9gHW03ENFMRYvfNM/5JDixZMuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MxtqT1iy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMfz6rRw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MxtqT1iy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMfz6rRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789130373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3o3AUP2GR4e8bKS56CF9rGMsnzBPpsvQ/7QSZVFmj6g=;
	b=MxtqT1iyLvIMbsg69wDC3iwbEuaPPQqn6okc4ie5s65UB2TMd0dGT0SNfMh/mc8yjMv/oO
	oV0s5uv70q2OK4rCuRoCbJjY2ApLy5PhJz7lY3//drmcc4pOhT6PPHN+oeRqDE/jyzh3R7
	qFgUd9GVVjsxC7KYy6vczjR15DkHHoI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-htplFUi1OWilBdpnYbBIwQ-1; Fri, 11 Sep 2026 08:39:32 -0400
X-MC-Unique: htplFUi1OWilBdpnYbBIwQ-1
X-Mimecast-MFC-AGG-ID: htplFUi1OWilBdpnYbBIwQ_1789130371
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49b0e6638e3so6539865e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 05:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789130371; x=1789735171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3o3AUP2GR4e8bKS56CF9rGMsnzBPpsvQ/7QSZVFmj6g=;
        b=gMfz6rRw+DBxRU4YO78zqKqIWImeitBaqF31uPDXFMaByCH8yHoXRrAj3JroA9oN84
         SLx+bbW9/UPf4/8Hd9ch+NgwmlgzwlcxXVUw6FOYQ8Cz4Ru7oqR9jnshWW8zpa/zlTpn
         SjAP20UUp/cTbbIjE699Dh41l07Q/isXezQ5xIMAZmYuO2bVsJza6EL/xDTwujd8V2/q
         /onCMmHbVdYho0u2448KfoszrDucZJbicPUzxY5bteJne9p4mjgmwyd7ptzmjm/aadSS
         Od+VUBAbWX+Wcu5ZcsSk4YjdPMD0QKIJ5m0K4+S7Dpem5KZ+NgTRmkW2LL1a0+gzrUZ7
         GUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130371; x=1789735171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3o3AUP2GR4e8bKS56CF9rGMsnzBPpsvQ/7QSZVFmj6g=;
        b=eARoslJVLBLiL4e4u0UNCkGC8sAetIZazdbtIPmLdZK3/mAuDcph4aduKMo001Mqeg
         nFAKi6gDWc5u2qDhyjRD/fkyxlPvF/F5MaA1uy4bv3MoJP5ogN0KbWf45vMIrsA5l/bU
         OOOJSkJNdSErXrzWUURH8trFtaYbQeA+ET3OwDIXzKf2qODsaHAUrPP9VQg3k5F173FU
         bOZMlW4sCeC35aw8SmOBNHaLiPPO4ipW8MZzP8CnIC3ilQsnsFtbwDYbJxCoVuL5n3ju
         T5ZwGQXJK2jfoFh7mzlvGNVm+ytCIZWZi2UNDfaVeYHDY1wfEjF+x7BWJ3bF9t03K0aY
         oQSw==
X-Forwarded-Encrypted: i=1; AKwUvBzFjY2NKXNoR1r2xqjYQvr4nOgp80CaLLbjFLWNIhBS2aUaemZTGZulHbeU1OVvOmPsDIJ8FeqoWntHZDE3MCXpsJDN@vger.kernel.org
X-Gm-Message-State: AFuF++lwv8aXpE00HsEww4QeYYfbwIKGJHfmOHILb1uQcRD7RUPFRv15
	5TLW02qW7FIgpYLl0PMgLLZ2ZdWPK4XFTkoat9dqCOdXEYg88ZoIWEth1KFgV2+s800m9Xksty9
	UHty868/B1DndMkzjwHDWOqkWhlGbGVIQDTE1d1M4BDJ1TDEE4tSiBjDy2cxeliB60w0qJJQde1
	U=
X-Gm-Gg: AYBFou0YUsq3/D/Knccqz/QGSKcG51WBNyfIQI+sdQt6uCHPKTxCI3XxxDMrKufAw7n
	5/+u5jg6IjXrVhSsHXa8goULuh0yYPaMNTafzlx+Ep2HvAk2fV7DxFoD+4SIj/ctNU1D6eJFplx
	FKiz8I+LR2Ndtm+XuVVuvWnCwcaa/TswycJaJlN+Ll/64IFIyy6qsKdmDGnQdd6gdXoiyRBRihg
	Vs8fUjAmKy2/sovInBRh0WNP3EvGmvGRkHkYEF11AeIPZl8EGwlhf4jupDupf6+YMEp40teAt8O
	t/h0cabVfPN21se8nNqe7kGiSo0r1BmQO3P+cl83Ptng4+RM/X+7wwbcKPZ1uNvmgn93TC4J8J4
	smeL2LustxzF/ypxymyQ+xWA=
X-Received: by 2002:a05:600d:4452:20b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49e6198c2aemr35358125e9.11.1789130370706;
        Fri, 11 Sep 2026 05:39:30 -0700 (PDT)
X-Received: by 2002:a05:600d:4452:20b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49e6198c2aemr35357705e9.11.1789130370161;
        Fri, 11 Sep 2026 05:39:30 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6420de77sm22739175e9.3.2026.09.11.05.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:39:29 -0700 (PDT)
Date: Fri, 11 Sep 2026 08:39:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev, linux-input@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] virtio: synchronize callbacks during device reset
Message-ID: <20260911083848-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905152059.89560-1-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 05:20:56PM +0200, Karl Mehltretter wrote:
> A virtqueue callback can outlive virtio_reset_device() and race with a
> driver freeing the state it uses. The reset helper documents that no
> callbacks remain in progress, but that depends on the transport:
> virtio-pci waits in vp_reset(), while virtio-mmio does not.
> 
> virtio_input has a related ordering problem: it unregisters the input
> device before resetting the virtio device, while an event callback may
> still be using the input device.
> 
> Patch 1 moves the callback wait into the core, using the existing
> virtio_synchronize_cbs() operation. Patch 2 fixes the virtio_input teardown
> order. Patch 3 adds the missing synchronize_cbs hooks for UML, TmFIFO,
> remoteproc and virtio-vdpa. Remoteproc uses one SRCU domain per processor.
> 
> The new hooks wait for callbacks already running. UML, TmFIFO and
> remoteproc still allow new callbacks after reset; fixing that is separate
> work. The event-virtqueue DMA mapping issue is also separate.
> 
> Changes in v2:
> - Patch 1: move the wait into the core instead of fixing only MMIO, as
>   Michael suggested. Remove the duplicate PCI wait, preserve its shutdown
>   wait, and fix CCW callback locking. Drop the MMIO polling: reset polling
>   for v3 and newer is already in fa8833c085b6 ("virtio-mmio: add support
>   for transport version 3").
> - Patch 2: keep draining completed events when ready becomes false,
>   instead of breaking out, so teardown does not truncate an input packet.
> - Patch 3 is new, at Michael's request.
> 
> I reran the 120-cycle unbind/rebind test in an arm64 KASAN guest with four
> vCPUs and a 5 ms busy delay per event. With patch 2 alone over virtio-mmio,
> reset returned with the callback still running in all 84 overlapping
> cycles. With the series, it waited in all 103. Over PCI with per-queue
> MSI-X, it waited in all 66, including runs with threadirqs. No KASAN or
> lockdep reports. These runs predate the per-rproc change, which leaves
> the tested MMIO and PCI paths unchanged. They confirmed the missing wait,
> but did not reproduce a use-after-free: with evdev attached,
> input_unregister_device() waits for an RCU grace period that the IRQ
> callback blocks.
> 
> That version also passed QEMU input, rebind and shutdown checks on arm64
> MMIO and x86-64 PCI, including arm64 RT, KASAN and KCSAN builds, and x86
> UP/Tiny SRCU. A legacy INTx NIC was present for an additional x86
> shutdown check. The changed objects built with W=1 without warnings on
> arm64, x86-64, s390 and SMP UML. The per-rproc version built with W=1
> on arm64 KASAN and x86 Tiny SRCU, and passed six remoteproc callback and
> lifetime KUnit tests on each, using mock remoteproc devices.
> 
> Link: https://lore.kernel.org/r/20260818040433.66986-1-kmehltretter@gmail.com

I posted a version of patch 1, split up, just to give direction.
Feel free to take over it, or test and ack. Thanks a lot for your work!

