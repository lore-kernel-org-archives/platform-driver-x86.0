Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9772D78672
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Mar 2024 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711135012; cv=none; b=Uy+Kiivf1yTnVSj+P9AqEClJyeLHbufPwUdb+hpG3eSbIXjR66SIDsZuXq/lkj9GAVJcyySK/Xpv0vicYtwsXJyeXLSx0zbHypg7ZuNrSo0gKO5wc5WEQEbWiE76HDQYvcKQjHYCGMObag2aA/9i6mlyV5HViBwsCFBWZ/PND+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711135012; c=relaxed/simple;
	bh=75iHcA9RFOUt3YMY5SehfwsBmnLNCyI0S4Wb9m834B8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tKzCi/NAv/LDXxaZkgG41HWNW9AUelJ6liA5fTwWvI77QaSyCjnRfhxyBzWUqh2WO5NO5G3yhkSHpgPwvqeA6cXiWwoQDAhworfYfyL7zP4IUePRsTVRe5YrWrZG4+FukD2USU0tRw9l0bmqV9Of8/uvts6CvBEKqLxMKRmzh5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fbp40RoV; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fbp40RoV"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a4715d4c2cbso294642466b.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Mar 2024 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711135009; x=1711739809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75iHcA9RFOUt3YMY5SehfwsBmnLNCyI0S4Wb9m834B8=;
        b=Fbp40RoVAsq2zk1ka1gJaBVxa6uz99wpoMLenh/9yBLVvpceTB4KQRr06SkTJpUJGi
         24TQjFD2aHPnfYS7i8pZJT6nAQebyCJgkrlbzxuOpz+KCS479Y16t4nuQ2BC7onZOU8N
         qvKmaD5PZST5LydVDOLyyckCC2Jmf/vf25y6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135009; x=1711739809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75iHcA9RFOUt3YMY5SehfwsBmnLNCyI0S4Wb9m834B8=;
        b=Voxr7aO0a7W2mSvByVuwb5CrrwTxU810BS330hy5sWy8NeoheHBJYG8jRtHW2neRn7
         fYRdffSRjkU+qVYMAhJfC0n+9kwZJWL8x5PF3/2MVbbrlPNM+90T8GJiuRDJTrN/MDLo
         vaQ8iOwjxFuRAktVZ5aPH4Np8YM+AeBZgjiG4JNORrNvcDY9C7KIBR7+QN9IFOlOU2X4
         WWyX71LyZRKLQvzqF6oooAco+OLm1VVIu3y4TfnximtpzS9vzaHhWXAJ/B3tbeEBilU8
         Knx7n+tI9w349R02fz64K58d7PUYh/u5g/OvkuYPgl2PrXifq6GNi5siFX5DADLemA5O
         kmPA==
X-Forwarded-Encrypted: i=1; AJvYcCVtvUzG1MpV5Vgi6WmqEPXGCvreoGIm5LSNgspoumdVYFbgCkToEVoLPqJb1Ljszyl8onws1fvvkl7SrPRjiAFFshJ9U8qBFuWO5VnD6GBlAwLhbg==
X-Gm-Message-State: AOJu0YzKkOPh0FThpY4ibA2XJratYJHjZ5Hpa0NN0+QnK7dCfjyBNOIR
	uPfnqkUhvSTpJ/wxkOPNMdgFh8XjV1Paz2njG9T1JnLsB20UBaCg3e13vxW7B9Y1fJySCA287C7
	qIw==
X-Google-Smtp-Source: AGHT+IFLKMF+LHus9RclJ8zLFwhcxTmhAYj4BFQL6xvc1gTKdD1LjdBvevZ6F99jehBuiTIlNmVYfw==
X-Received: by 2002:a17:906:178a:b0:a47:2163:56c1 with SMTP id t10-20020a170906178a00b00a47216356c1mr398741eje.36.1711135008778;
        Fri, 22 Mar 2024 12:16:48 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id m3-20020a1709061ec300b00a449026672esm127663ejj.81.2024.03.22.12.16.48
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 12:16:48 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4147f545bacso2270095e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Mar 2024 12:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwWnDTKOvRTzu3zicUIeIEVpJNhHa6E5yy/H0sTQhGWfkuvT8F7q8TYVeE2X7L0KDhzpzUJpecMbQkE3u+qUOBnCp/oCAS3eFrmeL9JFnvf4e0JQ==
X-Received: by 2002:a05:6512:32b2:b0:513:4b90:ae9a with SMTP id
 q18-20020a05651232b200b005134b90ae9amr255604lfe.67.1711134987739; Fri, 22 Mar
 2024 12:16:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240321101532.59272-1-xuanzhuo@linux.alibaba.com> <20240321101532.59272-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240321101532.59272-2-xuanzhuo@linux.alibaba.com>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Fri, 22 Mar 2024 12:16:00 -0700
X-Gmail-Original-Message-ID: <CABVzXAkwcKMb7pC21aUDLEM=RoyOtGA2Vim+LF0oWQ7mjUx68g@mail.gmail.com>
Message-ID: <CABVzXAkwcKMb7pC21aUDLEM=RoyOtGA2Vim+LF0oWQ7mjUx68g@mail.gmail.com>
Subject: Re: [PATCH vhost v4 1/6] virtio_balloon: remove the dependence where
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
	David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 21, 2024 at 3:16=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Currently, the init_vqs function within the virtio_balloon driver relies
> on the condition that certain names array entries are null in order to
> skip the initialization of some virtual queues (vqs). This behavior is
> unique to this part of the codebase. In an upcoming commit, we plan to
> eliminate this dependency by removing the function entirely. Therefore,
> with this change, we are ensuring that the virtio_balloon no longer
> depends on the aforementioned function.

This is a behavior change, and I believe means that the driver no
longer follows the spec [1].

For example, the spec says that virtqueue 4 is reporting_vq, and
reporting_vq only exists if VIRTIO_BALLOON_F_PAGE_REPORTING is set,
but there is no mention of its virtqueue number changing if other
features are not set. If a device/driver combination negotiates
VIRTIO_BALLOON_F_PAGE_REPORTING but not VIRTIO_BALLOON_F_STATS_VQ or
VIRTIO_BALLOON_F_FREE_PAGE_HINT, my reading of the specification is
that reporting_vq should still be vq number 4, and vq 2 and 3 should
be unused. This patch would make the reporting_vq use vq 2 instead in
this case.

If the new behavior is truly intended, then the spec does not match
reality, and it would need to be changed first (IMO); however,
changing the spec would mean that any devices implemented correctly
per the previous spec would now be wrong, so some kind of mechanism
for detecting the new behavior would be warranted, e.g. a new
non-device-specific virtio feature flag.

I have brought this up previously on the virtio-comment list [2], but
it did not receive any satisfying answers at that time.

Thanks,
-- Daniel

[1]: https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01=
.html#x1-3140005
[2]: https://lists.oasis-open.org/archives/virtio-comment/202308/msg00280.h=
tml
