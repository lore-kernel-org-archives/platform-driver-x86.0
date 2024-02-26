Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810F2562D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 11:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947429; cv=none; b=USwAaUWgQdS6J1BmyhK0voglwxiKvyDe+MaGkeXP9cOnSJriMWeZJ9SC1jjXNwnYg77ovHRBT+hAFHxia5lfXtEoZaTez7zAkUx63Ew/ldYYSob2T1Wiye/NXocQLMQxJfDSqEerejQjYYI+doiwKW2D/HDpzL9+ylnWDgkf/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947429; c=relaxed/simple;
	bh=cdvsXEAAdJFQk8TvtsGZXJF3H+eh0FsJmmxlLLI+i6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=olwSZJOjo517As4+ECKcXM/vKrM1kgR+LY4XswOkdCvyjvTd8Jj1C22Vw+2xB1YM4fBzpxEWgU872sdSFIYLnuZ5N6/do91q4uUUWQiHL6RMHMEV6R0SOc/9FoEH6by0lSMjpxVi0ytzPO8CGSK/IFJj2TxD9JE7y/QfYAYDmOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RoAx/rLR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RoAx/rLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708947426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DAlQVG6KdPaJyAOPbLA/63jFXJlJW1va0BU08U9am/8=;
	b=RoAx/rLRCreDW27L2NDJvmMlAkcrT5eR4hZ668uFv6h5g9U87oNTL9nmgxOn8fjRbjuRT+
	Z1bGiRnxlkQSLep/qiVVtgNyKvy0WUv5M9UJpi0DeqDCjLvwMrtlezN3aIpkNJUnuACGc4
	07O4GAEWWE4DXrjPLEtg6sHiBcwz2Ds=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-mT4pIJ70PDKAmQXK_YakXQ-1; Mon, 26 Feb 2024 06:37:04 -0500
X-MC-Unique: mT4pIJ70PDKAmQXK_YakXQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4129a515b00so8487525e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 03:37:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947424; x=1709552224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAlQVG6KdPaJyAOPbLA/63jFXJlJW1va0BU08U9am/8=;
        b=cswnXomB4RKzl7IUzSwXC7tMbdEy+nKn4LsEjaE5js8o0rHazO2C+Wz9SqXjTOj26S
         FqpGopjhWSWVT31TEebIMO8aN6tERRTSg+/Rp5N+9YKg1RevilRM0oD3wZDrEpB9MDU1
         urHtMILD4ND9yZO+FVcj9RzjBLwh22jed+ezRWt7mYWwYTeMWMaSy7WeEB3osNmL3nt1
         U/z5SpyTFdCFS83LXtZ4Jvu6h+TSmpn99wgu3Cfzl1Qaxl/bgM8TnP5ly/9mLud492ww
         7+AqWl4tbkQWv3a3RlFA8S6ySliI/Y3QAmuUFHbFasOHzoeCHp/G9Bv/kgxr4+yx4UT0
         7l3g==
X-Forwarded-Encrypted: i=1; AJvYcCV2qL+zfV+igfQCSntLiXfILS53PBx4aLcZKNghyD9gHE2qlU2CrqRyMwyexPZh8t2biI/bJJAWnbApYGu/9s/Iv3Zwp90FEH2QRLjE8wWk/wmgFA==
X-Gm-Message-State: AOJu0Yy+iYGdOK0Y0zA9x2Lu4fDvWPiOOlSL9VgwuPvV9KE9Bh7kxOQ+
	10BWjYm5rCPxr0ZUf+nD29Ic3Ma6AGrDDjhhrAQ8CxL+yXJqlKxkh/Wd6L6siQ5uAJ+6/Ccl6xK
	muvocOBCjKJZJV/6YuSpdu0S1jTGK4mLTIwFIURLoPdsMKPSqlzQVbriMurVhtrebsO+Ya+g=
X-Received: by 2002:a05:600c:1d82:b0:412:a8d1:d3b6 with SMTP id p2-20020a05600c1d8200b00412a8d1d3b6mr379113wms.8.1708947423797;
        Mon, 26 Feb 2024 03:37:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvXe87LdVjv57x0ixL/iOJ9+IQcZQwZBW2BhhDacRcGH/iDCk0HMP0COfYaRJOaDiHQGYMqw==
X-Received: by 2002:a05:600c:1d82:b0:412:a8d1:d3b6 with SMTP id p2-20020a05600c1d8200b00412a8d1d3b6mr379072wms.8.1708947423449;
        Mon, 26 Feb 2024 03:37:03 -0800 (PST)
Received: from redhat.com ([109.253.193.52])
        by smtp.gmail.com with ESMTPSA id t20-20020adfa2d4000000b0033de1e1bddcsm1319266wra.26.2024.02.26.03.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:37:02 -0800 (PST)
Date: Mon, 26 Feb 2024 06:36:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jason Wang <jasowang@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-um@lists.infradead.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, bpf@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH vhost v2 19/19] virtio_net: sq support premapped mode
Message-ID: <20240226063532-mutt-send-email-mst@kernel.org>
References: <20240223082726.52915-1-xuanzhuo@linux.alibaba.com>
 <20240223082726.52915-20-xuanzhuo@linux.alibaba.com>
 <20240225032330-mutt-send-email-mst@kernel.org>
 <1708946440.799724-1-xuanzhuo@linux.alibaba.com>
 <20240226063120-mutt-send-email-mst@kernel.org>
 <1708947209.1148863-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1708947209.1148863-1-xuanzhuo@linux.alibaba.com>

On Mon, Feb 26, 2024 at 07:33:29PM +0800, Xuan Zhuo wrote:
> > what is dma_map_direct? can't find it in the tree.
> 
> YES.
> 
> 
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 58db8fd70471..5a8f7a927aa1 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -144,6 +144,18 @@ static inline bool dma_map_direct(struct device *dev,
>         return dma_go_direct(dev, *dev->dma_mask, ops);
>  }
> 
> +bool dma_is_direct(struct device *dev)
> +{
> +       if (!dma_map_direct(dev, ops))
> +               return false;
> +
> +       if (is_swiotlb_force_bounce(dev))
> +               return false;
> +
> +       return true;
> +}
> +EXPORT_SYMBOL(dma_unmap_page_attrs);
> +
> 
> Thanks.


where is it? linux-next?

-- 
MST

