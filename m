Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333C874E1F
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692362; cv=none; b=pxxZDYRedRkthHIiLhvqJ84TLDN+l9MsNi2KxkCJECAb7Z66omaqHmKIHWcbbBxpOVCYRGKc1bX+k1UAYyiXA1uYdOaicbX7bNc7CN5O+yC0aMVDWicjEOexnuNsd9whNsoXyDH4fPjvgMTvbntA93b919zaCQcmd59ospsCOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692362; c=relaxed/simple;
	bh=gmMgCA8pbsUZS3rqeteeTCbsa5nilPbRUQKyvYs5+t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eq3RdvsIQsbcg27T2QFBfA659SStLBEQ7J1P+9wtCLsUfV3Ydxct0tlsWaf8OOcswt6ydK4+GJdrroe7+ZetmcoXePGj23n/8erBfakIBKbCMtOPL5fDg1I0MtkaF5K21a43xNFpkCXkSgnVMBocP+hLv462za9lqmfxcz7bF3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QwRI7Ih7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QwRI7Ih7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706692360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=peGGQf3sjuZMqqhDGxYZpBNQpOww05kdciLu+8qQbKs=;
	b=QwRI7Ih75ENSzS9FBTw6IVKsBVXNKBpnyBsHhnFrDmQD7UOXTCdWU1xVPNb/Rf/QTqGG7C
	OwEjwqSGEyhlSvY/hYiANk9AuEhw0hNf9S6XzwKpHLHzxeLS34AbQfQWgza/2A9uFlUAyl
	1sQD3sWra76kjb3G9lw2MIBHmiyY10I=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-wOktjzbnOuGFzEgYytVmDQ-1; Wed, 31 Jan 2024 04:12:38 -0500
X-MC-Unique: wOktjzbnOuGFzEgYytVmDQ-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3bd3bdcd87fso7281403b6e.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 01:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692358; x=1707297158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peGGQf3sjuZMqqhDGxYZpBNQpOww05kdciLu+8qQbKs=;
        b=VfcnxNhWgA4zlJjdVgGizFmE2SVMtllDn/gNlTqvxY7qeI3MFtZZMvDviXXHlwHSKL
         37Wd39CYUW9vH1rpz0LhJSN+LMN9w2i0MA5rjK8EeH+BuTa5gGIyzqdwdlGDaH+9hsXD
         O4jBFj74NL4oo4lyyaUQ0RIjlEnlOBqE2wRMgkSWqbjUtRFUJVFiJDGvBBIyEFpObOhC
         eqo3ZiX6vPhoI6kQXsv1Di4k/PP0oDqmpzjRbGs4OLd6iv6MnhI9bBHEAYOWsXtU4Yhx
         /MC4ZltvJQMlRSZJSQuo67dGYxnZ5sAhugQ9bcMO0sE2euZvezKaDsvVx/7qIk/DIlCx
         7nsg==
X-Gm-Message-State: AOJu0YzyZucXsWorqsi1Xoz5rSu1si+w88vW8qtSBf19D7Ww5H5WLi5/
	mA6Cr4iQ9oWOmSy/4D5vxwpaXoaIIAskuJfLehzdDpJUXYp/CdGBxmvdSJj/e6KMpgsMvYu3VrI
	MyEhmcMhICTO1rrWqf8w2tmPxLdiR5x34EcGn6VxFJ3UDqgff9k0bmS4xCykMNIxGyM8VpE8D61
	t2741jRhBZFv4rW9quosFPgMFVKrpOQgCYqKfqo0LKhu94hQ==
X-Received: by 2002:a05:6358:6e8b:b0:176:4aae:515c with SMTP id q11-20020a0563586e8b00b001764aae515cmr994101rwm.17.1706692357787;
        Wed, 31 Jan 2024 01:12:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7fIfH41RbzJ4uMQRVZeD0/FtypkpuMBhNalI0GgIXQr8L0GNwGZEMNsexvxgVEoc2spN+yWaoh5j46pvgQwg=
X-Received: by 2002:a05:6358:6e8b:b0:176:4aae:515c with SMTP id
 q11-20020a0563586e8b00b001764aae515cmr994071rwm.17.1706692357511; Wed, 31 Jan
 2024 01:12:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com> <20240130114224.86536-6-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240130114224.86536-6-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jan 2024 17:12:25 +0800
Message-ID: <CACGkMEst-k1uOUA6diC2yB+=9ZYezuz=n3=kAzDFpXLxGE=etQ@mail.gmail.com>
Subject: Re: [PATCH vhost 05/17] virtio_ring: split: structure the indirect
 desc table
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Benjamin Berg <benjamin.berg@intel.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-um@lists.infradead.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 7:42=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> This commit structure the indirect desc table.
> Then we can get the desc num directly when doing unmap.
>
> And save the dma info to the struct, then the indirect
> will not use the dma fields of the desc_extra. The subsequent
> commits will make the dma fields are optional. But for
> the indirect case, we must record the dma info.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  drivers/virtio/virtio_ring.c | 86 ++++++++++++++++++++++--------------
>  1 file changed, 52 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 2b41fdbce975..831667a57429 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -67,9 +67,16 @@
>  #define LAST_ADD_TIME_INVALID(vq)
>  #endif

[...]

> +               kfree(in_desc);
>                 vq->split.desc_state[head].indir_desc =3D NULL;
> -

Unnecessary changes.

Thanks


>         }
>
>         vq->split.desc_extra[i].next =3D vq->free_head;
> --
> 2.32.0.3.g01195cf9f
>

