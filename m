Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410993C1973
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Sep 2026 06:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788677530; cv=none; b=QgcLnSmz9QBj6lx84HZia1CsFAA4nSlbcS2yWFRMblb/NjEpQiGbqOgSwbFWSuSbuW7T22kZ1nBNSIITuKuVsNAQVpTdmfa+Do3wptCpqr59inILYiEHO2f1AnVBuiFeZkmm53ixHpdyuMP7B9IexDaOP1po++SGZDaaTbDV+1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788677530; c=relaxed/simple;
	bh=azD26yiQNPU/p1yFpKDui4//CMQZvxbCQYRnod40ADo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkhjpICRksFN5EXS9JpzrqXsqHk3A3ZHck3BT3v4njYTS6eoOe5k43/kAP8V2TxhB3N4Ig6+IhSLQXPbvqmN+XOU8YdwYHQn5ViYvE8VvvcBXoiUWI0dBS9U3SHRwGWd++CSvHa8KGtQJj57BIOptSxzvMswHDTn0G1ihJHZOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lqq4TRHF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iRYqGxf5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lqq4TRHF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iRYqGxf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788677527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RFAyqu/vjWVl9+ogYvQ74BpZIagkpPa2HIVHVUx9n8A=;
	b=Lqq4TRHFg+Kaaj4M5tdHOlG6lkqX3c7wabdiEH3zAlu2GZfieMJifh3Godk7ehHY/obsk6
	8RZucsWnk9Mo3fdNjm+NrcYxcBVGdFKkA3Plu6gMLt+Y1Y46W5yYnrM5sI9edVJ/8sMxK3
	Gy5HeTcy4wl9yhgRopJ/3vVAES7Cmgg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-_49F_ez-Oe2KuCFBGWYwNQ-1; Sun, 06 Sep 2026 02:52:05 -0400
X-MC-Unique: _49F_ez-Oe2KuCFBGWYwNQ-1
X-Mimecast-MFC-AGG-ID: _49F_ez-Oe2KuCFBGWYwNQ_1788677524
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4957287363bso19071475e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Sep 2026 23:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788677524; x=1789282324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RFAyqu/vjWVl9+ogYvQ74BpZIagkpPa2HIVHVUx9n8A=;
        b=iRYqGxf5fa55vS2oLqVWYDIfoa05K+wOsXfFu4QeEHKcMXgxdaP3432tVk79/e3QYX
         OKeYapsYeFbZ9a/8l61H+H39unKRiOiQ56r2q3+SCKqM30+HfTwh5yYBdy9L+fhEKDTO
         +T/8gK5ToREWB3lwjBfYj/Pz1iaoEd3OdlhGIM2UIxmomvxPYn58qw/okRXTvlHHHwjl
         RSf/Z5F7NR3P/Dv8pwYG1C/Ys1I1Laze33VM8UMFevSGuHoaz7kW7/2zBuSjQ2cGamF6
         LexhDwmVYp2Sdtc81M50ggU54Xgu7Ff860QiLMOUbjtZczJTtN/OvfglGg/yXb3Pr+gH
         wYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788677524; x=1789282324;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RFAyqu/vjWVl9+ogYvQ74BpZIagkpPa2HIVHVUx9n8A=;
        b=G9aSVeXe+VfVsYauV7CklEtOLjz9fJFvCepBF6JATt/C6clxpHXh981nnUbD70pVdP
         acsHJ+RS/tX77e2iyURJvSgXj+b4rk1xzbAWWiykQR46zvarsRoTKgc8jl5+WWQ5B8vx
         3GiIU6Fiz/PArL9Nlfe4FYSGsTVkiGuJJgs6xtKxqlW/zUpqC5s59zGJ1rmHUbNlAkmk
         lDBqfwZsfsvUTrKkAwWGnaJ8jT/zvYXyHchJdCZnfF9pjm0+nBFLRzc8s51v7bymyYNR
         QG7dHwRMmxSQw3XtoGG9YPmLAX2XB4H2/QM7UgUKEwcquYmqgp7S7S1lSsxVQftr8wN1
         rmuQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8LsMYPxD6rgrXGV0GV2xhSSs26crdXC0ajbXvcctCg/xHlu/6TI4RfxAVAbTNy/6moiWG7obbgVHb37vS3Tx+urkA@vger.kernel.org
X-Gm-Message-State: AFuF++kUliUH+jqfRZ9Sx9NSA35VC6x+2Xpi9KPLUAN0bOHDeFtRAgmU
	3VmUEpg+T+/GHFq/NqBuOsByTIQuvlh4A6aadsJd4aSvaBUnqYeVjch1W26nsZugibkOfeOLmhP
	KMfwv3SoW7QGYU/jO7Bc7fPVucyxCEM0MErs21b21791SkbxIlfMMMvgsUssY6Ycz0W63YDl0nV
	4=
X-Gm-Gg: AYBFou3O+nElsz6EXLoKO6qAVTFXdCRjGsdB8ucVkrTz9t3jdhsL+v9QRmE7BEvqn9d
	1AXM1Limvn2rRt2NrA+eujqhczQZ3ThHbvbkQtasEujFN7DiO5YISO9g+TudsRbaeI5OHMTkFJ/
	K0cF0s0yqfVP42wLWMUmwyJsamIhYqZDT05GFmZkl2uCt8cpDpWV2jZF1kaRW33uBeuTmah44jb
	U3YG2nHpeLpAW0MfB9nppcENUtDZK8WmITSCcuYrCTw6JgbSL1Y1NsiQ3998l5nzsIPajtuTKra
	onOV4iiLil3LS4/HRDf+DkeqbS4Zb+6/Yevol3qp8jY4KfdEP6Ex1pJenhMIx2Yb0OtAAfxUG+M
	cB8y/4YWMWIy3OimmARDXRx4=
X-Received: by 2002:a05:600c:8b32:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49cf8244878mr177241145e9.11.1788677523938;
        Sat, 05 Sep 2026 23:52:03 -0700 (PDT)
X-Received: by 2002:a05:600c:8b32:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49cf8244878mr177240555e9.11.1788677523479;
        Sat, 05 Sep 2026 23:52:03 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm16190990f8f.2.2026.09.05.23.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:52:02 -0700 (PDT)
Date: Sun, 6 Sep 2026 02:51:58 -0400
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
Subject: Re: [PATCH v2 2/3] virtio_input: stop callbacks before unregistering
 input device
Message-ID: <20260906025002-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260905152059.89560-3-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905152059.89560-3-kmehltretter@gmail.com>

On Sat, Sep 05, 2026 at 05:20:58PM +0200, Karl Mehltretter wrote:
> virtinput_remove() unregisters the input device before resetting the
> virtio device. virtinput_recv_events() drops vi->lock around input_event(),
> so clearing vi->ready does not stop a callback that passed the entry check.
> It can still use vi->idev, requeue buffers and kick the queue.
> 
> Reset first, as virtinput_freeze() already does. With the preceding core
> change, reset waits for callbacks before input_unregister_device() can
> free vi->idev. Recheck vi->ready after taking the lock again: keep draining
> completed events so an input packet is not truncated, but stop requeueing
> buffers and kicking the queue.
> 
> With evdev attached, input_unregister_handle() currently waits for an RCU
> grace period, which also waits out IRQ callbacks. This masks the lifetime
> bug on PCI and MMIO, but does not protect sleepable callbacks on other
> transports.


And now I am completely confused. So it is other transports you are
worried about? Which ones did you test? And why don't you worry about
fixing other transports in 1/3?


> Fixes: 271c865161c5 ("Add virtio-input driver.")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>



> ---
>  drivers/virtio/virtio_input.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
> index deec24e8e682..7b654af0a42c 100644
> --- a/drivers/virtio/virtio_input.c
> +++ b/drivers/virtio/virtio_input.c
> @@ -49,9 +49,12 @@ static void virtinput_recv_events(struct virtqueue *vq)
>  				    le16_to_cpu(event->code),
>  				    le32_to_cpu(event->value));
>  			spin_lock_irqsave(&vi->lock, flags);
> +			if (!vi->ready)
> +				continue;
>  			virtinput_queue_evtbuf(vi, event);
>  		}
> -		virtqueue_kick(vq);
> +		if (vi->ready)
> +			virtqueue_kick(vq);
>  	}
>  	spin_unlock_irqrestore(&vi->lock, flags);
>  }
> @@ -350,8 +353,9 @@ static void virtinput_remove(struct virtio_device *vdev)
>  	vi->ready = false;
>  	spin_unlock_irqrestore(&vi->lock, flags);
>  
> -	input_unregister_device(vi->idev);
> +	/* Callbacks use vi->idev. */
>  	virtio_reset_device(vdev);
> +	input_unregister_device(vi->idev);
>  	while ((buf = virtqueue_detach_unused_buf(vi->sts)) != NULL)
>  		kfree(buf);
>  	vdev->config->del_vqs(vdev);
> -- 
> 2.39.5 (Apple Git-154)

