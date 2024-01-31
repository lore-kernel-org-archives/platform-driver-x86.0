Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD03F64CC8
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692402; cv=none; b=Akj7MMPH8hCG8nSgs304hnBkyLKUb+93RtmHymx1NKxqipFHu7SG6l1NSneKJuWMtOjl0ik7nGMFNr0bGPACsjeoCdrT0LZSGCWYHJnOLpksfsqERZVQsN4hZjyZmDhzinnnUiBWwVqxj1Btlo59U8kBbMgji3Vcvb36sZEYe5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692402; c=relaxed/simple;
	bh=ONLOpdhFVTK1PKOUo0h7113+HYlDSSoXMBK7/7cDZ1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PFEP3S879SDL/rb8hpZytKtjgKe25OSqjvbZW7qGxwqeVGezq4p96fNVN84hNgTNzwag3xZh3pADUZHvsu3JkkZyeXZcHKzVr14HWa4fFERP3OaoZMHNl/h6dEivu/mkbLAHak2V2XXak8vZ3e1xB2keMsCMKnbzORPGlXzGxkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A9jOtsmk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A9jOtsmk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706692400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONLOpdhFVTK1PKOUo0h7113+HYlDSSoXMBK7/7cDZ1Q=;
	b=A9jOtsmk41JIe72Br2gw/rcSBWcQAjfHWihaiQJ+GtiYwqVyJU0R3WxpyCT3+PWmOrsip6
	B0Vlp+g+LbL27J0ihAvMmSP02QWi+407TuiZzUPZc+VcJvjD+Dp98Ysh3j9d+l8DysCVmu
	erzvXxi8KIBpAdxTU6q7MsThuSAjfbg=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-nnxom_6wM8a-AW3UIUohmg-1; Wed, 31 Jan 2024 04:13:16 -0500
X-MC-Unique: nnxom_6wM8a-AW3UIUohmg-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-46b11c43fc9so1166126137.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 01:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692395; x=1707297195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONLOpdhFVTK1PKOUo0h7113+HYlDSSoXMBK7/7cDZ1Q=;
        b=G/0zIlH3qJOroeJtrIvJCTZaFBTUqNWV7H/1qR+aO9C/sdTSFs/0p5Ucybkn21oQZ8
         nn1iUhhMPvIGZM23oqdJ+VtTDbderLiAOXDoirftL/d9zsEhNnymu8lcEoxKONgnWJDn
         hyrHawzNVj3bqyCF/TIChmVbKKA7+uz2ExkIkFcnUsItQMoRxJi/K2gc95w9uegGstjg
         QaShFUVri5gZGmuMKQNTuoHhcGhXSBfUT91n1HG1iTgw2nbkPd8kdr801E38+ZfHlCEL
         LY5weBFpLQLD403DVpvoXmiviEYoT+GKtu8hhg5mAFblWHlheaTuV9SUl19yo2t6kTmu
         wCZg==
X-Gm-Message-State: AOJu0Yy+IIXPs4iL66q527u3N7iTeqKzQ3PmYx7pRuH+UWr1rXZau4HL
	yAvLBOGURBfRRO+GAMhVStT3tkxyKw9/NQH79GR/qb8s6tZEzakQ7007ymzple2Jz3fBUrLNOG6
	K+FG3Rcm/wzQX7WdSH0RoHQD4eiz6yzc3aJa/XflmH/aHPr4zUlzWcG3zChLuLNOibVev6fGubH
	4X8pyPlKjOd7iP8ZqFEkG/5cEar8l+gyBN3pWKzOaMJIhriw==
X-Received: by 2002:a05:6102:2753:b0:468:90e:2c88 with SMTP id p19-20020a056102275300b00468090e2c88mr691983vsu.35.1706692395775;
        Wed, 31 Jan 2024 01:13:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlqIGzGC6WJa2cNQxkOvPsG3lWuLc6yY/NsL+Ul0eahHSt+TTWHH5K0CdWrrzXTYNRodEQ2LjsVmuQ6Q+WlRc=
X-Received: by 2002:a05:6102:2753:b0:468:90e:2c88 with SMTP id
 p19-20020a056102275300b00468090e2c88mr691962vsu.35.1706692395533; Wed, 31 Jan
 2024 01:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com> <20240130114224.86536-12-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240130114224.86536-12-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jan 2024 17:12:43 +0800
Message-ID: <CACGkMEtWt1ROwJCeEa5FbQfxV2eqo0xRqHQZMsq-Q2TcQBur9g@mail.gmail.com>
Subject: Re: [PATCH vhost 11/17] virtio_ring: export premapped to driver by
 struct virtqueue
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

On Tue, Jan 30, 2024 at 7:43=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> Export the premapped to drivers, then drivers can check
> the vq premapped mode after the find_vqs().

This looks odd, it's the charge of the driver to set premapped, so it
should know it?

Thanks

