Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A7C3CF69E
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Sep 2026 06:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677598; cv=none; b=LqsdNBQ2aymEpA5/Un+R3NMAjGKyFyjBV9dA5VLqLFyL4N5t/4O8E6/RiMiz3DkvsbR0/53+gTjg8L0iZV32sTUGWcjh8mjAHDV2vPtIGOVIOg2argPV6122+anaibx7Sw/KlEV7vu7cjDXlok5zuL120TC2vLujweA0irqdlbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677598; c=relaxed/simple;
	bh=0PsOoZ9E0BwunGG9ae2zYdRQMe8ZwVOWFfFaILVsAVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6PjJbtaRzZxyymWCytGeXvpBBw+ZuyPrndq2iuwH/oy1HXbn2TDZyF5mRVAIFC1tvsBj9sBWaNR86JuZclzXk4Ijx58Y3zHRulNsdjmm+yPvB4j7RjJIJKb0hheH8zhyGmYrjqoH0APYHoiR1OXJo6T3qfxCzZ8mNzIUI+AnK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WiHn0+wE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+jlvGOO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WiHn0+wE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+jlvGOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788677595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uDjy72BsvDFpaL9e5tQovRjuStP4IqOhC4YA9r9skOM=;
	b=WiHn0+wErH+py3PwaJbQG9hM62zUF9FSFs8cHFZqItPDtE3gyrJIEanLEOoTOQmOTfLYX9
	Qlm+8QYQhBFrUFB3YstHZvCPIJK5PmSdgWeWnZ7UjuD44hsb4Bx/XMiJ0h2M/JMoj/dNPM
	LlSwGV4uI1TKM1oByqk2ms9Jv48zLu8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-cs0ygbqvOrmD_ZUjQlAW8Q-1; Sun, 06 Sep 2026 02:53:12 -0400
X-MC-Unique: cs0ygbqvOrmD_ZUjQlAW8Q-1
X-Mimecast-MFC-AGG-ID: cs0ygbqvOrmD_ZUjQlAW8Q_1788677591
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4843313047eso1495661f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Sep 2026 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788677591; x=1789282391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uDjy72BsvDFpaL9e5tQovRjuStP4IqOhC4YA9r9skOM=;
        b=R+jlvGOOQM1E7JQGdYB09oujEHTC+pEnrOHgus376Xi/ytx86Wh/msEbKrR7P+O5kS
         or0w+c048/iYWSGYzzTpWPS5ag+/v6T/tB6fLnoJ0Ub98yC3i70jl5OWxAwc3ysxe9s4
         HdSYi5HONjNK0i9slOplEKKhMUURMQ72JFFKRSuqlR+n5xXZBbQ8ZYvW0qGI+skLdriW
         1MRHM/XKXlclzgNJvdOna99n6zHEXtTlC2cfBsJMWALS6UV4gNzSl9OUoV14WIqekfey
         DiN7Cd9n3tH/7llwizV0Ta3/GsmTUZ85VVlE9dAvpJViTfBvGaiaWqXxXilzKHHkXCaA
         K5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788677591; x=1789282391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDjy72BsvDFpaL9e5tQovRjuStP4IqOhC4YA9r9skOM=;
        b=dG4y8P3ez/b6BCvM1SpeRJ2lntR6yUEt44eiKy0MT7za/MRnrduR3P+DYm/yK7X57d
         M1gKBnZVQeHoFgWU7STjgFeAyVlNVjRjUuP5WsCkk/Y45bqKdooDO/hTDAQLqN+tKJCL
         bcOoNJqb6DQ5Xuz5TtLPZbj/czVPp4fY2V4GpB/lMLm0+SgP96SoRjfXtkT4cdF7uZPD
         hf+7KsTkRR34ISjNknkTemH0vwHRFfBV1SICTvA5HdDEPu6BDZFDFCeCw4JDUK0mWjrK
         URbXBNip87P7i8b8VGu1Te2VPkYCbruQXXElEKHeCa+IGDNiOMC5SDbFoN33HaDylWJN
         Ue/A==
X-Forwarded-Encrypted: i=1; AKwUvByA6ta62uQzZxInVzON7WoBXEZ/QtdSoahiKgeh1cp0GOQmIUFgG2GMP5p9+nmpB40jMN/fvXp2WeTo6KCF+DOHLUGE@vger.kernel.org
X-Gm-Message-State: AFuF++k/X1XiJg/HbTsOhuk8zoqeIYNe7hVH/Uzwb411n5kOBcZP8szJ
	DzJOvuMpiVQvvJlJrMXh/IGY8TvZm3kbADLL96+JwHP0o/eznbHTvAETGpqNYO/jviFn0t42gXX
	Ev748ZR++mgyMLaFdXx5yttrCK/AKkqDEhgt9o+sld/zf9qEj/ga3DsetPbZDSsvoryCmqn/64Y
	0=
X-Gm-Gg: AYBFou2JKYzVIwvaBf5gWDxV93ulW2T8FSoe61tjpl05xEjIc+iIX4578cYnCTujVaX
	esE024TYWmtSrTofJSgBxpWaXzWJ1hGLGusNSchbbf18c2oPbnwNOxlwT3BgDGswsK8idZvDAf3
	kKr4frvxVf9VDePcpA4imFChijqT2hTLVjRb8FLEZdqhCHvqaZQxcBrbjRKurnyD4sQvg0kSTwk
	uSTHQNqOwfUTQFYhOnE5oBP9Ohlr2sm5nqYhD0uz6jhAgxkbD+4UhdLt6a1Tjqk5MROlNMKC2L0
	0/z0RnovhsZKb7KsWTWgvgsYIxG3ihFpwr2ajOXhMeNbMHJoBnGCL3ZdGS9QqEvhVPSyePbUsE+
	M9FRMIOibXeG5epWq+7FnzQk=
X-Received: by 2002:a5d:64eb:0:b0:482:e4bc:51a8 with SMTP id ffacd0b85a97d-485870899cfmr18773130f8f.7.1788677590884;
        Sat, 05 Sep 2026 23:53:10 -0700 (PDT)
X-Received: by 2002:a5d:64eb:0:b0:482:e4bc:51a8 with SMTP id ffacd0b85a97d-485870899cfmr18773081f8f.7.1788677590394;
        Sat, 05 Sep 2026 23:53:10 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm18455464f8f.18.2026.09.05.23.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:53:09 -0700 (PDT)
Date: Sun, 6 Sep 2026 02:53:05 -0400
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
Message-ID: <20260906025249-mutt-send-email-mst@kernel.org>
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


You didn't send patch 3.

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
> 
> Karl Mehltretter (3):
>   virtio: synchronize callbacks during device reset
>   virtio_input: stop callbacks before unregistering input device
>   virtio: implement synchronize_cbs for remaining transports
> 
>  arch/um/drivers/virtio_uml.c             | 10 ++++++++++
>  drivers/platform/mellanox/mlxbf-tmfifo.c | 14 ++++++++++++++
>  drivers/remoteproc/remoteproc_core.c     | 10 ++++++++++
>  drivers/remoteproc/remoteproc_virtio.c   | 20 +++++++++++++++++---
>  drivers/s390/virtio/virtio_ccw.c         |  6 +-----
>  drivers/virtio/virtio.c                  |  2 ++
>  drivers/virtio/virtio_input.c            |  8 ++++++--
>  drivers/virtio/virtio_pci_legacy.c       |  2 --
>  drivers/virtio/virtio_pci_modern.c       |  3 ---
>  drivers/virtio/virtio_vdpa.c             | 21 ++++++++++++++++++++-
>  include/linux/remoteproc.h               |  3 +++
>  include/linux/virtio_config.h            |  6 +++---
>  12 files changed, 86 insertions(+), 19 deletions(-)
> 
> base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
> -- 
> 2.39.5 (Apple Git-154)

