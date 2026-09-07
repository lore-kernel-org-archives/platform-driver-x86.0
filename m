Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941039EF0C
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788816204; cv=none; b=ACzZXp2NMvdxiP+It6rDYPTVvKxvrMcrH0sfgwuVmqkfL3J21+48GjqO57gamc+Aw874zfWqxnCmM0pXn4KqjCDRMEYzp16CbpA7V/7vbYIzu1gJUOCXKGH2YZXyqMSyiw9ycQLFU00enQmRflSqVuA1PtBTUQGmN7SmV9LJeus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788816204; c=relaxed/simple;
	bh=Gzcz3Zkq6mIgF9nN+/RZpdn2G6QVcg2SErOL9iM3Lwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/cTtrO03d/LeH8Hx1Ums9GxXjKlsQDKvuhQHFLUm17YH8Z7nOuKUE9UGcc+wjjZCVSKqofKje1NjuSNn63yTTGZLonleZrMPHHjtYjcjC+p+IuuIfBAdzGkSVKtNCGUAF8RY1Q00ct1bswdmW1CJopSyowHsQ7MfEldc+1PLQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB90dpFH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB90dpFH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so2752875f8f.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 14:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788816201; x=1789421001; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zj4alWZ0+Z5ViHZ+ZCYKHStoDMFk30/0JNVi4/sJSpo=;
        b=dB90dpFHKckqTrmJjkDD5EUcDaUVt1xE4+JqKWmDR3ffIvrgUgRi0TAZJOpGZIijr3
         r/gJhz7hTnDw0qeQtUWHPCJyMvEL5GJYheAVws5eMPQ+/xr0LhAuuMOsXifE3Ev3aN7p
         yr25BWL5Y0XVgpuO5hLdUZU7udToKuVTxl0DxeCYuTOPpeqADHaqXa4AOQLR1GKxqPPE
         mIaJEwlUqTmTEvBkpxsc/uOL8JUdoFiMsBzIKmjG2zLo2S04A396WnRs+D19swYmLDHr
         s9E/nQut36rJRvxtRVcaoXwRTSnjMNWeIQYjAE5zGTXq2mGfq/awfBiz04y+azvUSlL3
         Siag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788816201; x=1789421001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zj4alWZ0+Z5ViHZ+ZCYKHStoDMFk30/0JNVi4/sJSpo=;
        b=U+Z1hjdRGCkpUpV9wOq/9SOaDIQTg+gyJxEhTrWdWRK7ALHJzmHkUbAW0zHBLxGyDp
         7dRddHwUW/EHVBOlnvy6YYjYKBn0S0kfH8Cp1YQq2qEZooLgGEJ7jbYgs8Y3e6uX9Snd
         Z8oKV3T23n6oL57+6diSMUCSWNNVNQ3zYqIBnXLey1RFB+MkHDikL0NyBOi+G9uCXRVy
         DxDjxgX7sP5EJZKwinn61mDuhRwskv+jGVCOpMVd6H2UI0wDGZGsH1JzieKCS1KmZpo3
         X1RMQ8lbnlqCZAikeW2gDuUeNpv72t1OVD1p0k96Ez1nimoMVVv9VH1ek7wl1kaDhezE
         kZrg==
X-Forwarded-Encrypted: i=1; AKwUvBwD1lww7ERHNpnBBk0UZYMQIObAIyOMTRH8l9dpniayDVC0qp5cnQM77Xxk3Hz7Ad4YpYaK7+ALzYq9Bmok8YqYb7Mb@vger.kernel.org
X-Gm-Message-State: AFuF++lLOYgFr6JOM4SSaJ88fvGoZRAxqFcmeuhuj6tC13vqQtxi9hYF
	hkuH74S1krjlfd+iWkPeda42ojeHf811HqKo22S6rI0FJyyH3SJeSfQc
X-Gm-Gg: AYBFou2IjrDd0yqQq2lWDd7x7rl9LDsauC8NfmALDZrn8uk1pXHd81BhSjppIDBL4we
	qCq3V3QubG0YZzKFjN24tF4TWHcO02XWGfkjuEmRTKL6Zchyb9VORVW1e0RPUnEFOynmrs/w5/s
	v5mflcTHzOByWWdkbnFNfdvPqxupyTido7Y0ZsAPecJTjknhK8Ry1D6HKqxSMf4DDCQ4/1lYGSk
	9Nxv9i+fcvF8om4De7EEjU1mWoXUNgm92/kebDtvDJqG98zd7Xf+fjr2J2cl6Cg8360LUcVrmFn
	2/niYJxMg0Wbq6xEjF+39yqIvswsdKgyzWlxOs/n7kx6LBTALcWxxPO5dXyL4p2XL3dh1/U2owA
	tWdOd2ihvvucT1g0jPYHYOlkT8MrDe22WCi+TE6Y61dZJDm459qvU5ZyEtjuhb9cOhTqY/3T7xw
	aiQ8TpfdfDZPFXbg5x8BOrLYeHEcExuhyRWPZG6jenermkHbWgOXc4E+ShtuxS6NUDMYq519RnC
	UrdUl9u7/q36KIKZcor4FTCAndeK3w6kNJyJbrBKiI7kq1fwjVINKx3Oz0e1ysQqQs5Qb9AocKh
	SvE7PlnTVo9AngiATVwnp1PdLuyyeCCr9LWrgGY/4w0PCvK4cXqvwiEPfxpzT1R+9/YNhpB/7V+
	gxixTpiVapS8=
X-Received: by 2002:a05:6000:4a0a:b0:484:3310:f39b with SMTP id ffacd0b85a97d-485872e05f9mr26354952f8f.28.1788816201067;
        Mon, 07 Sep 2026 14:23:21 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b0c9-3601-cdce-ba4b-d0e3-dede.310.pool.telefonica.de. [2a02:3100:b0c9:3601:cdce:ba4b:d0e3:dede])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm29964718f8f.16.2026.09.07.14.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:23:20 -0700 (PDT)
Date: Mon, 7 Sep 2026 23:23:19 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, 
	Pawel Moll <pawel.moll@arm.com>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vadim Pasternak <vadimp@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	virtualization@lists.linux.dev, linux-input@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] virtio: synchronize callbacks during device reset
Message-ID: <ap8rCQII9fASEosZ@gmail.com>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260907091033-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907091033-mutt-send-email-mst@kernel.org>

On Mon, Sep 07, 2026 at 09:13:28AM +0100, Michael S. Tsirkin wrote:
> got all 3 patches now. it's a good start, thanks, but they need
> a bit more work, in particular addressing sashiko comments.
> I'd also prefer patch 1 to be split: moving code from pci to core
> is separate from ccw fixes.
> 
> Pls write or at least edit commit log messages yourself,
> after reviewing Documentation/process/coding-assistants.rst
> 

Thank you for the review and feedback. I'll work on a v2 now.

Karl
