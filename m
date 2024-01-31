Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC09069969
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706694199; cv=none; b=nu4sL4S6aO75nRwQtXUlf8POeTYRsqWGe/thwhAWbgUU17kWzj0HEJNfkVtxyk9mFlIg1borPhkEUPqdY3Gwo2OpS1/knyOomF81+T/R7/LEWn7LD3SgqQkHSWw0R+1UbJ8oPBvtYbUzCit1tcClPRxhPGWjfmpBs72I7vTVGzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706694199; c=relaxed/simple;
	bh=gkIae8l+H2+F/jXvpvISUQcIXBcbsucEp1aonIBdbjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpLh22HD7xIAivPt27LbkHOLCcU0UnqYmEnlcDr/iDpQXORTtI60+9w5DEomYvs8tZrqtk2IIcWOVO6judgWTiqbMBORykGm/PYGE4fqG70Dbx09iWxiY4jS/AMQSnrb1Ya7mZ2qNfxKL7GA/ERc1eBeJosqC+TvFAbsowG9A5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLnIxU0c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLnIxU0c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706694196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oza1LRHp/M5RIj8Nm47urKrF572FUv22z3v7KOgdQu8=;
	b=cLnIxU0cbeHtPMXhbPMhNdSTxan7Ox4fuZSF5+1ncnLt/f2+yZUEiMcHQE4I39Upkb03zV
	mpkfF+THSvN4I2vwF1YmpAV/XA2lokqqw9RuVogk97RjLp2iTo7poWtFEfipsGWZqh3HCY
	FQavxRZAaj7KfsVmTTwRug3Q7z27Sp4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-GOiRFZu7MeC5_QDjtAxOeQ-1; Wed, 31 Jan 2024 04:43:14 -0500
X-MC-Unique: GOiRFZu7MeC5_QDjtAxOeQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-33ae7046cd0so1630570f8f.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 01:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706694193; x=1707298993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oza1LRHp/M5RIj8Nm47urKrF572FUv22z3v7KOgdQu8=;
        b=n5db6DKoRQt2B+7HyqE9dynnUNfRS7At+DbItDGvP0SXbrPMMyYekgqmLQ5d8yKgdu
         mf2Vg3sthBclOX52sa1s1qAr8KVpsrJ7MAWiUFadXdp/nFBYwB9UhMKil4WSHMl06kRy
         CqcvToAin4Xz6CgvAUK0jR2ikUcOOo9Y6Xx9GIHTOcHWsl2hcvIMYAN1EucLIBXOz/no
         8F5PzRLC/SLuOnOviJeAi5ipmtQJTQKmzXpIulkfQcbcbsfiAtbyxbiL3oY9pDOkESuS
         vXyuiQld1Q4dE3krtpIcQz/GYsxGHAewv6qNxV4j9FzNGKVWISQ6xooZs4zpuFvgzXiu
         2N4Q==
X-Gm-Message-State: AOJu0YwECh2NJm1yuyI1xYEd5vtAI/z6vkGntABz8flVaGFig4/FHgVm
	E+32ALy78Gk0ZCcC67ZH3g12R2ccTKcByzf0qLC9hCP6x2IPcFxJtqOJQ1EBiyUXFqUpVYgCaW6
	9jFIjTD4/UtiKOvWoGJK2kPdZfGesct0NTfwA0OW6DGiH1f6PaalARtbTYBUeOk4GSktwkWQ=
X-Received: by 2002:adf:fa05:0:b0:33a:e919:f406 with SMTP id m5-20020adffa05000000b0033ae919f406mr679890wrr.52.1706694193230;
        Wed, 31 Jan 2024 01:43:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3NLeG1aMawKGEQVu/0aqBjSNNGqzZmjOJyBzgiQ4QC6+fT4S4tC5TcuNgzowV5ynPiQEAwQ==
X-Received: by 2002:adf:fa05:0:b0:33a:e919:f406 with SMTP id m5-20020adffa05000000b0033ae919f406mr679860wrr.52.1706694192871;
        Wed, 31 Jan 2024 01:43:12 -0800 (PST)
Received: from redhat.com ([2a02:14f:1fb:b2de:3c63:2a5e:5605:4150])
        by smtp.gmail.com with ESMTPSA id cx18-20020a056000093200b0033935779a23sm12937651wrb.89.2024.01.31.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 01:43:12 -0800 (PST)
Date: Wed, 31 Jan 2024 04:43:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
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
	Benjamin Berg <benjamin.berg@intel.com>,
	Yang Li <yang.lee@linux.alibaba.com>, linux-um@lists.infradead.org,
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH vhost 04/17] virtio_ring: split: remove double check of
 the unmap ops
Message-ID: <20240131044244-mutt-send-email-mst@kernel.org>
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com>
 <20240130114224.86536-5-xuanzhuo@linux.alibaba.com>
 <CACGkMEs-wUa_z_tGYEwBf7EVJAtuJdkX4HAdjqMXHEM1ys-gKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEs-wUa_z_tGYEwBf7EVJAtuJdkX4HAdjqMXHEM1ys-gKQ@mail.gmail.com>

On Wed, Jan 31, 2024 at 05:12:22PM +0800, Jason Wang wrote:
> I post a patch to store flags unconditionally at:
> 
> https://lore.kernel.org/all/20220224122655-mutt-send-email-mst@kernel.org/

what happened to it btw?

-- 
MST

