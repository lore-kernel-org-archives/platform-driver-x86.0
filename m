Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1685B524D8
	for <platform-driver-x86@vger.kernel.org>; Tue, 26 Mar 2024 04:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711426473; cv=none; b=nd0JIPuDOeosQRTcQNSQyULdAnF41LTjtt9EYbScxec28pmQPK2maQ73JAC1v3YkV7X/dNyzt0Xki6Nqe/KiZcgoLNxhdsidPFe+gRSyL0CaI2UDF15jdK0Kh+qYU6h8V1gL9XH/Zfy982mRpDlpJF7Zk/I0Tl3Vn8yZ7QfrwpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711426473; c=relaxed/simple;
	bh=z5seLBV3yQLKEzxkNLkKpqsB4myVj0SW/ABTJB8Ficg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3BUrjcmR32aa9b9DtJsLFcMctEH9q0OYtrVZObIz4GOQDVW/3j4rKuvw/G4NHUKsUEGookgPoxaUCJ8G/iWOHyd2i0knTEdTjgti54GWuPXZNfB2urJSPxWpuxEQmo+sKETHPzdtDs6w24ULjg86NCVf41F0BY38vsoD4PUJPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fi8IZcfG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fi8IZcfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711426471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z5seLBV3yQLKEzxkNLkKpqsB4myVj0SW/ABTJB8Ficg=;
	b=Fi8IZcfGjhHYSvXYRArVcDcRO1b/pElNjbtkX0fVz+ONCFd5mMYYbkl8veoCfawSR/hYRi
	wMVD3Pomdb1q6/v2jugtu+7O2WvWA6/qJqhDgncX31G6AYk41tc5YJND4UGVRynA6njcHY
	Gx5koftloiErhSYZBY+eyxevBgSFWxY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-iAleQxMxNyWQH5K2uaTPNg-1; Tue, 26 Mar 2024 00:14:29 -0400
X-MC-Unique: iAleQxMxNyWQH5K2uaTPNg-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5e5022b34faso4624331a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Mar 2024 21:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711426468; x=1712031268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5seLBV3yQLKEzxkNLkKpqsB4myVj0SW/ABTJB8Ficg=;
        b=r7j060vRA80pW0khrS5UVLpJBZiRl+sSoAQN+BtXhEgS9LzfOYbKtZeReY1zNjjY9D
         pTDNBTqgWJoTCzaogtroE3CraXdjs9NPH1Egn83pr1wSas9Ot5OAkDSVfo/KirZcOmkC
         +OWabMm+NXW51kTWcHbbsBRq6d85P8PZ1JlMJTV23lWkPPQmq2NPLlNOzoJizVnbP4Ja
         zX+4vaFMRYBL1onXrDM3HpGWBhm2INOO4u+crhb/2Z1IxgyHAjC5z95Ym2wGw4xSCv3z
         +FmAtQVnKq9CVO/z8EAeOnXarsxdMeBab88aHQ2i1PyaFAODg7sSSTf9GAIkKlobrM48
         HIMw==
X-Forwarded-Encrypted: i=1; AJvYcCVUA2ovLS38srYKP2FCTKcyWkLGs614FtSum+XysergFQJhS5Fj9mRKQeLvX7t3wRkEQwm+n9N2c/jMgetmsEAY4pWhGahsO4TvcBAwv87EVfcNfA==
X-Gm-Message-State: AOJu0YzS6KDvxO/nOMt5k8SV2KRYW4uGRhSn9ugrve2b11EFmImCfM8W
	Tz+CQbVibtuLW3xcOReiuw6cmRfPpjzFcLP9Z4El3e+yG5a0swfpx6zLz6wjwEo9qQuTQblhK+K
	KRW2SjzrBCy5jN4aiciWHttnVRhM68olOu7Y0nHw6BcmiVQtzUL6KMzhf0tg3RrC90lK0JVRwFC
	WQQZ+bSgAxb9Nx+Z9QK6J6v2hduqnJGh+XXqu5Bl520TLndw==
X-Received: by 2002:a17:902:bb8b:b0:1e0:3447:8dc5 with SMTP id m11-20020a170902bb8b00b001e034478dc5mr7853375pls.63.1711426468465;
        Mon, 25 Mar 2024 21:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwt4O9JFYe1EZZmEzO6Sbv2fxkM9fzp0kVx8cNiJULf0bko9Urf0e0rh9UwekdZlbEud76q0+6xDYSjR16I7Q=
X-Received: by 2002:a17:902:bb8b:b0:1e0:3447:8dc5 with SMTP id
 m11-20020a170902bb8b00b001e034478dc5mr7853360pls.63.1711426468211; Mon, 25
 Mar 2024 21:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325090419.33677-1-xuanzhuo@linux.alibaba.com> <20240325090419.33677-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240325090419.33677-2-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Mar 2024 12:14:17 +0800
Message-ID: <CACGkMEtBw86fXjFrk6Rt4ytOYOn2q7r5a4WuvsgqPGT8O7tr0g@mail.gmail.com>
Subject: Re: [PATCH vhost v5 1/6] virtio_balloon: remove the dependence where
 names[] is null
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
> Currently, the init_vqs function within the virtio_balloon driver relies
> on the condition that certain names array entries are null in order to
> skip the initialization of some virtual queues (vqs).

If there's a respin I would add something like:

1) the virtqueue index is contiguous for all the existing devices.
2) the current behaviour of virtio-balloon device is different from
what is described in the spec 1.0-1.2
3) there's no functional changes and explain why

> This behavior is
> unique to this part of the codebase. In an upcoming commit, we plan to
> eliminate this dependency by removing the function entirely. Therefore,
> with this change, we are ensuring that the virtio_balloon no longer
> depends on the aforementioned function.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

With the above tweak.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

