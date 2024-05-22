Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC713D61A
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716381888; cv=none; b=XaYPyfyZyF2QbB2uUUyEUvRH2LFEsDw+2JnGCLFOV91sHt5sBHa2hd88f2IbludX0FG1ihN7WdZW4jSKLM9tw+1+OgFmvOJD6Kdl3Cmqw16uZUJ3lII2kpTnl/e6QUvjAxOqHdVkxbSd4vdLRA797/CR13y1K+FtxaUlsC5UgCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716381888; c=relaxed/simple;
	bh=1nFEcu6st2QgL5NH2QgtvjLQX7ReUNQlH4wtoNRei+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHtYJpzUQWH7U+aucwHFLbcyIi3+RN5KpJMcTk8iQ9krcw05dzBr5B0Pp0LGA8T1HvDtCMWC+t4+ENIkXYfWFvMr3IvB7TmbrHY/YDc84DDvEKKl9PxduOURR2GDLisigf7pD8sVZkY4fOIUJ0N2AwzXz4sNq7RY4MUYk2yscu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ICquGIy0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ICquGIy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716381885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G79858Qy7qxctyO6ZwaifbkX+0kin5gbL3RzdPs5HwU=;
	b=ICquGIy0ZIV7TlYainWhIqIw166/BH/B9eM8XCVcG296py5dJbzGkvE+YQVR31PheWZpqW
	MxeBMftoh2gNcbA5fn1vDbLSiQfYRYn5yP/v38RBznKIZvG7sKnxJZ5bINT4ZHUhsyWA4t
	g0Vo9zx/Ck1eeodtw2xlomeixz4Snpk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-suSo724XMeu2ly_SDsbN1A-1; Wed, 22 May 2024 08:44:43 -0400
X-MC-Unique: suSo724XMeu2ly_SDsbN1A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-351d13dd8aeso4006129f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2024 05:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716381882; x=1716986682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G79858Qy7qxctyO6ZwaifbkX+0kin5gbL3RzdPs5HwU=;
        b=bCy1QnqYupPpJD/SLf8eW1PkccLRs32nPjBmiyu8xccKlpO397LXDNUGfkadcuUypA
         0cTcAI3+/iPABTTnLvJ5fhiib9Rr/nxZ5xsRILQp8TtZSR50sEjrgBPL7hvy9/9BULqC
         lL6iBjI8Xc+M2YjDKP/xpRaZKFjBr9IjEqIxm854NKFPXLIBjRfjwYrnG+TyiwYH8Aps
         LUzEHErLL2CyYpamJbAXJCx+bMTB1hVfa12fpfQ62U1cT3Qci7sObEu6ddrV9AbAk3jK
         6IcyVs8jcdB1g9OvgPRiBZPe3OKsl+dPtRvwdTNUoM8Zaez4K9Qw0QqAwQx1ybKGZHnd
         Ty/g==
X-Forwarded-Encrypted: i=1; AJvYcCUvtYrOMaHd4PuAdCtgqr8xUM2EC3YmNGFzI79QQoYo9dHSiBYNaysxjopJOPm64O0MrLn654S0Q0u1Vfw42LPQFQrhY6/xJXBGp/C6jyi2ue09Sw==
X-Gm-Message-State: AOJu0Yw9n6jgTcNymhOQWCnPDrMiDBaTfU4Lkwtlkszmk+c58B0VEFkA
	AC1b4p97kB6Q5VddLdAoY3qC4B0WbTOR+Gt4ngaA6cPssuOQegSAZ+Rl9ix/LMGYAM9bFkLe3j0
	rd2cO0H4kQJ5op/W5b6L5IgH0A9tzjtzxnCBsRcFNWlB9CPWDimaZF+ywH2X6Rttur/aMcQY=
X-Received: by 2002:adf:ce01:0:b0:34b:dc21:68f2 with SMTP id ffacd0b85a97d-354d8cc5a13mr1742154f8f.28.1716381882132;
        Wed, 22 May 2024 05:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT7L+lqndiUNsnDetmvAcccavCLRG44XuusS6ulhxqEwo9Z7Kj+36SZ9+3rI8JW2CWKc4zpA==
X-Received: by 2002:adf:ce01:0:b0:34b:dc21:68f2 with SMTP id ffacd0b85a97d-354d8cc5a13mr1742112f8f.28.1716381881565;
        Wed, 22 May 2024 05:44:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:55d:e862:558a:a573:a176:1825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacf47sm34302937f8f.78.2024.05.22.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 05:44:41 -0700 (PDT)
Date: Wed, 22 May 2024 08:44:33 -0400
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
Subject: Re: [PATCH vhost v9 0/6] refactor the params of find_vqs()
Message-ID: <20240522084405-mutt-send-email-mst@kernel.org>
References: <20240424091533.86949-1-xuanzhuo@linux.alibaba.com>
 <20240522082732-mutt-send-email-mst@kernel.org>
 <1716381321.6426032-1-xuanzhuo@linux.alibaba.com>
 <20240522084221-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522084221-mutt-send-email-mst@kernel.org>

On Wed, May 22, 2024 at 08:43:52AM -0400, Michael S. Tsirkin wrote:
> On Wed, May 22, 2024 at 08:35:21PM +0800, Xuan Zhuo wrote:
> > On Wed, 22 May 2024 08:28:43 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Wed, Apr 24, 2024 at 05:15:27PM +0800, Xuan Zhuo wrote:
> > > > This pathset is splited from the
> > > >
> > > >      http://lore.kernel.org/all/20240229072044.77388-1-xuanzhuo@linux.alibaba.com
> > > >
> > > > That may needs some cycles to discuss. But that notifies too many people.
> > > >
> > > > But just the four commits need to notify so many people.
> > > > And four commits are independent. So I split that patch set,
> > > > let us review these first.
> > > >
> > > > The patch set try to  refactor the params of find_vqs().
> > > > Then we can just change the structure, when introducing new
> > > > features.
> > > >
> > > > Thanks.
> > >
> > > It's nice but I'd like to see something that uses this before I bother
> > > merging. IIUC premapped is dropped - are we going to use this in practice?
> > 
> > 
> > 1. You know this modification makes sense.
> > 2. This modification is difficult. Unlike modifying virtio ring or virtio-net,
> >    this patch set requires modifying many modules and being reviewed by
> >    many people.
> > 3. If you do not merge it now, then this patch set will most likely be
> >    abandoned. And I worked a lot on that.
> > 4. premapped has not been abandoned, I have been advancing this work. What was
> >    abandoned was just virtio-net big mode's support for premapped.
> > 5. My plan is to complete virtio-net support for af-xdp in 6.10. This must
> >    depend on premapped.
> > 
> > So, I hope you merge this patch set.
> > 
> > Thanks.
> 
> If this makes thing easier for you, I can put it in my tree post
> release.

I meant post -rc1.

> This way you do not need to keep reposting it.
> I'll then merge it with premapped.
> 
> 
> > 
> > >
> > > > v8:
> > > >   1. rebase the vhost branch
> > > >
> > > > v7:
> > > >   1. fix two bugs. @Jason
> > > >
> > > > v6:
> > > >   1. virtio_balloon: a single variable for both purposes.
> > > >   2. if names[i] is null, return error
> > > >
> > > > v5:
> > > >   1. virtio_balloon: follow David Hildenbrand's suggest
> > > >     http://lore.kernel.org/all/3620be9c-e288-4ff2-a7be-1fcf806e6e6e@redhat.com
> > > >   2. fix bug of the reference of "cfg_idx"
> > > >     http://lore.kernel.org/all/202403222227.Sdp23Lcb-lkp@intel.com
> > > >
> > > > v4:
> > > >   1. remove support for names array entries being null
> > > >   2. remove cfg_idx from virtio_vq_config
> > > >
> > > > v3:
> > > >   1. fix the bug: "assignment of read-only location '*cfg.names'"
> > > >
> > > > v2:
> > > >   1. add kerneldoc for "struct vq_transport_config" @ilpo.jarvinen
> > > >
> > > > v1:
> > > >   1. fix some comments from ilpo.jarvinen@linux.intel.com
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > Xuan Zhuo (6):
> > > >   virtio_balloon: remove the dependence where names[] is null
> > > >   virtio: remove support for names array entries being null.
> > > >   virtio: find_vqs: pass struct instead of multi parameters
> > > >   virtio: vring_create_virtqueue: pass struct instead of multi
> > > >     parameters
> > > >   virtio: vring_new_virtqueue(): pass struct instead of multi parameters
> > > >   virtio_ring: simplify the parameters of the funcs related to
> > > >     vring_create/new_virtqueue()
> > > >
> > > >  arch/um/drivers/virtio_uml.c             |  36 +++--
> > > >  drivers/platform/mellanox/mlxbf-tmfifo.c |  23 +--
> > > >  drivers/remoteproc/remoteproc_virtio.c   |  37 +++--
> > > >  drivers/s390/virtio/virtio_ccw.c         |  38 ++---
> > > >  drivers/virtio/virtio_balloon.c          |  48 +++---
> > > >  drivers/virtio/virtio_mmio.c             |  36 +++--
> > > >  drivers/virtio/virtio_pci_common.c       |  69 ++++-----
> > > >  drivers/virtio/virtio_pci_common.h       |   9 +-
> > > >  drivers/virtio/virtio_pci_legacy.c       |  16 +-
> > > >  drivers/virtio/virtio_pci_modern.c       |  37 +++--
> > > >  drivers/virtio/virtio_ring.c             | 177 ++++++++---------------
> > > >  drivers/virtio/virtio_vdpa.c             |  51 +++----
> > > >  include/linux/virtio_config.h            |  76 +++++++---
> > > >  include/linux/virtio_ring.h              |  93 +++++++-----
> > > >  tools/virtio/virtio_test.c               |   4 +-
> > > >  tools/virtio/vringh_test.c               |  28 ++--
> > > >  16 files changed, 384 insertions(+), 394 deletions(-)
> > > >
> > > > --
> > > > 2.32.0.3.g01195cf9f
> > >

