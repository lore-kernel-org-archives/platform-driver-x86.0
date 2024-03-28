Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908D71DA58
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Mar 2024 04:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711600185; cv=none; b=mmQXj1yYeXWZmpYBoHPtU2obe1RyZWqtMWC8zngwX5+7IfFKd3DWAF8597nPfTnoUrU55fQJj0SYePEl5kJaK+ul3D4GVzBk5nwYfVWvxzRoIjXr9EVZVYNJYPO/6LNxtL/0K5agVOLiNCIKpbGasRMovfokd2tK8npTH0UmSMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711600185; c=relaxed/simple;
	bh=1QzCz1Z3ysjSBtKSuwdaJecZAl0r65qpJTzi3fJyIfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PvgH9u+vchJ2aVsOAIWlI1ZWdeJAWutAtrmrbdoGRGvuCdN/F0w56k3xVQSJ4uI5i6pSQ0U+zQVvEwJP/YcCLG6Afsxvpx5oYoZ20lWBlspYbBDg9e9RwL3tYpzyUHgZRn/chi0HjtMfEqRgwbYxAa3geOxJSY2Cfj0tujJXkP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YXuw9/7s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YXuw9/7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711600182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QzCz1Z3ysjSBtKSuwdaJecZAl0r65qpJTzi3fJyIfg=;
	b=YXuw9/7s/5nyP38GndwGQM6C0NElCQnw6DA1BJNK4pFMW64rL2phHHDYiaRvmkoWqoY1cc
	PTBSbtvEDXrFXmiS49Zst57comM7Ks1KNIyJ34Ymk9rR+6cSutiKDmkhIvh8zzoMKVjwgg
	NbX2Fa9ja0OVkRR9RgCSo3AFJrHGDIY=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-pTFKjC6-NLKDa0EcbC4NoA-1; Thu, 28 Mar 2024 00:29:39 -0400
X-MC-Unique: pTFKjC6-NLKDa0EcbC4NoA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6eaad4ed2e7so577758b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 21:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711600178; x=1712204978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QzCz1Z3ysjSBtKSuwdaJecZAl0r65qpJTzi3fJyIfg=;
        b=mhWEKdQ4geHoGAOwaSiNjz3ez6S8Syfi40s0g58H6kKs5EXcMTpehcol8/M+yolBR+
         YocnKx7/t7NOp0TVhRogNfKaE5a7dmV8HQBBHyxpMiqwvGGcTXFFliUSZKYjPh106Hlg
         eDN8iEvBmij6k8GnD/o37MjStN3zikTEwyVxAIsGrvvJIdbP3f77mxWpq1FjRkeEHfKh
         HIYfoWLXXAjawoLyYgT6PtAXSgkUTBuvrTn+lR8zmqd723Bbdt+vHJ+0T1o3tK6jxn9W
         Ajri4B2OvL3HJiiIE1iBYR9DuZ4OL5GG/P+L0KAPR+v6txOhfwWOgX3AgkTZs3Y2CICU
         /WZg==
X-Forwarded-Encrypted: i=1; AJvYcCWF7uv68NMrEXiwU01r9LJHJl5vupnoClPdf3TEoVhNLR0NcBiXARsv0YTv/daJLe2MCP+gvsj4WPpi4QuQ2b6woc2ARhCJcRX0wECuqdqyASCUvQ==
X-Gm-Message-State: AOJu0Yzj68VTZ75rsguJNceXvKUVDVHolan4Bd1c6ple7K6/A3z8S5v+
	ZiySnLME3MfafLV1MdFJJ5V/mjTP83Wq1aG/7FwyWppZpMzBA5sK8bF4QZKtlfLpOMjb2ktG7m0
	O6F2OID4PaeDCJrXEleZDVuD+CfL3hGhWPGtRBAN1AfOeW6um8gEA5lIU3Hubs0iXk8yucHMt1H
	2jpEwgbFJUG/8kaGwS51LiV7XNHnNqvoCZ0xLMZ6tnmLcWvQ==
X-Received: by 2002:a05:6a20:7f9b:b0:1a3:6ed2:ee27 with SMTP id d27-20020a056a207f9b00b001a36ed2ee27mr2348491pzj.16.1711600178146;
        Wed, 27 Mar 2024 21:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdRSG9G7uJHKVNNXcj0F+YxANq94mAXIs7d49a5PjNlTRz4N2ThVivJdAz+RFXtJHhPLT9mm3BTBAY6vJ4ZyA=
X-Received: by 2002:a05:6a20:7f9b:b0:1a3:6ed2:ee27 with SMTP id
 d27-20020a056a207f9b00b001a36ed2ee27mr2348485pzj.16.1711600177897; Wed, 27
 Mar 2024 21:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327095741.88135-1-xuanzhuo@linux.alibaba.com> <20240327095741.88135-5-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240327095741.88135-5-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Mar 2024 12:29:26 +0800
Message-ID: <CACGkMEvAUNSC2VnTLpbCR4Zq=rTOW-CHvXLvB1PuGadf6J77UQ@mail.gmail.com>
Subject: Re: [PATCH vhost v6 4/6] virtio: vring_create_virtqueue: pass struct
 instead of multi parameters
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

On Wed, Mar 27, 2024 at 5:58=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Now, we pass multi parameters to vring_create_virtqueue. These parameters
> may from transport or from driver.
>
> vring_create_virtqueue is called by many places.
> Every time, we try to add a new parameter, that is difficult.
>
> If parameters from the driver, that should directly be passed to vring.
> Then the vring can access the config from driver directly.
>
> If parameters from the transport, we squish the parameters to a
> structure. That will be helpful to add new parameter.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

