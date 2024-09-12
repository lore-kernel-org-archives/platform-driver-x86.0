Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048831A42B7
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Sep 2024 15:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726153572; cv=none; b=V2G0dPmMpPtSwFIObk+QdJVtYhJvCuMvvsBSBw0NrP6Wig5rgyJ/i4didFYFefT6reooJmBBKtgYXc8MVvosrM7KMOEeh/oAt68jUds7QrzmmsobbHQEPwgeQ6IMsawVRfpvlZgXeocGqhgeO/1tzdVL6Vq+wy2G8fr+0sGUcOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726153572; c=relaxed/simple;
	bh=Xeu1D4BRsiQbRZsJ2sVciIIVio/OZrLDy29Tthg+Yi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tb5GbjIpcNIsyDnFG0PCxApEHhWrYo6QnkFtT6szd1xBQLfdT5h6LnSLDK1W/tcegM5HKrzOMUuOUUpIm8oa6aTytdkRDJ/YT8XIBCLdt4N9pu+UM1lwd5pCmhJo5DKaFx76uHnVzO0H2+zZChan/cr+/7f+I/1yhfzJL1HkpiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JwvPeCEn; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JwvPeCEn"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4582face04dso9090371cf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Sep 2024 08:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1726153570; x=1726758370; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CfegXMNukWSQFaI2F0mkDsnuhmbgmMHLYZZ41KpmG1M=;
        b=JwvPeCEnPJ6CuYZI35iKrEXPNj59TGr9Xl7ovynhjvhwe9nnEiX4/n0ZmFT45pl6Rp
         7WP3xZe/f1ftPecTXC+s/Wojxl4dNXUFu0GpeFTqh8THvBFgN9e+Fu8tuG6mkNQU6WV5
         mnh8hMfmSddwxQzaWbd8tLjZe86NqnSptCKcn/AcY2/jw519SONYZaakxzohzN2xmQy5
         YXop8TmqSHlyoz9MLf1fuF4DkJnBepeoEjMG7/jZUkof1AvWvAhQiwfr54rNEjHrDyQH
         TVHHC4IbzBSg9ziGO5tow9K2k46ixq3ZmgM3YYyLYLzK8r7eU4qzk+viUPDUKgzURg6+
         bC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726153570; x=1726758370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CfegXMNukWSQFaI2F0mkDsnuhmbgmMHLYZZ41KpmG1M=;
        b=vMhkdAJaQkipseCrtrSYrrjD3g7Y8Ni7UNcAaUo32MyCjaG+6+dkOaFNCqmYGup2gl
         yv58U7Hhm6WCkJegyzgSCm1ixAUbAkXthV9JBQBpihfWIRChKZmtGUgnsIBCJC4Aeigl
         2Pbad+VGhJwSf0sMutn7CH5gyh5q9NjjBOxVU6Ry8UJ4IBapgpBQ6ZMZsJ5jJr4+zaKX
         8mJQ3YYLtn7IV1Mio9W4OZZ0soJCsUNyQ/uB5ibqhVnJ51gdb/EjjysxHsA3BKCifgj2
         Z1DcsvaxRdOlGZYwxSD4M6vkLaVOlqCEArIav/W/lRpQgwY9YCbgrlFzH7bghU+58/1T
         tF9g==
X-Forwarded-Encrypted: i=1; AJvYcCV8+3G8u7wwAb98tKD5jEan8o36UIWacqxQucQBi7y9I/UOW0GVeAd66qMapR9wbOCLZKJuBg+c9hLZtQUJspdcPUz4@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ17r4fQxPNgf7uc8K/8fqS7NPwFj8WpEl/YFkIjya7nwk0h3R
	j2yA+9tssl4ZiPFxdSpD7inxcNmEBKmgh1gwA73HtFBzkTE1se5/VVAZfiV5CA==
X-Google-Smtp-Source: AGHT+IHASY8POUZzq4SzWd4eRvpU7ACy0FdfD9ZYvB30CHcbuAKLRH7kkORNebQSHw6WSRrL9rIngA==
X-Received: by 2002:a05:622a:1ba1:b0:458:3b66:ace9 with SMTP id d75a77b69052e-4583c7c4259mr177032941cf.25.1726153569798;
        Thu, 12 Sep 2024 08:06:09 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::ff03])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822eb001bsm54183181cf.54.2024.09.12.08.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 08:06:09 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:06:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org,
	jorge.lopez2@hp.com, acelan.kao@canonical.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, kaihengfeng@gmail.com
Subject: Re: [PATCH v3] platform/x86/hp: Avoid spurious wakeup on HP ProOne
 440
Message-ID: <c1f1ab87-eda2-4570-ab00-1114d0bdade0@rowland.harvard.edu>
References: <20240906053047.459036-1-kai.heng.feng@canonical.com>
 <d8600868-6e4b-45ab-b328-852b6ac8ecb5@rowland.harvard.edu>
 <CAAd53p4i1zzW2DsVfirjXVsQX0AgXy1XbzWaM-ziWmAmp8J1=A@mail.gmail.com>
 <7be0c87a-c00f-4346-8482-f41ef0249b57@rowland.harvard.edu>
 <CAAd53p7c4-jpZ6OsW+H9qw2mvvr8kSfX2UEf8YrsWJt5koYbAA@mail.gmail.com>
 <fe0d3259-c60b-4ef8-aa42-edb5ca2e2d90@rowland.harvard.edu>
 <CAAd53p67c0qQijUreu0AShsKucgPY03OQP+RGw=P7-vCV3Y6eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd53p67c0qQijUreu0AShsKucgPY03OQP+RGw=P7-vCV3Y6eg@mail.gmail.com>

On Thu, Sep 12, 2024 at 02:28:15PM +0800, Kai-Heng Feng wrote:
> On Tue, Sep 10, 2024 at 9:13 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > It should be possible for this to work.  Just make the interrupt
> > handler skip calling usb_hcd_resume_root_hub() if wakeup is not enabled
> > for the root hub getting the port-status change.  When the root hub
> > resumes as part of the system resume later on, the hub driver will check
> > and see that a connect change occurred.
> 
> This can work. But should the change be made in
> usb_hcd_resume_root_hub() or by the caller?
> The issue can potentially happen to all USB controllers, not just xHCI.

True.  However, we need to make sure that remote wakeup continues to 
work properly.  This means that the handler should skip calling 
usb_hcd_resume_root_hub() (when the root hub is suspended with wakeup = 
0) for port connect/disconnect changes or for port overcurrent changes.  
But it should _not_ skip calling usb_hcd_resume_root_hub() for port 
resume events (i.e., wakeup requests received from downstream).

usb_hcd_resume_root_hub() does not have enough information to know the 
reason for the resume; only the interrupt handler does.

Have you been following the discussion in this other email thread?

https://lore.kernel.org/linux-usb/20240906030548.845115-1-duanchenghao@kylinos.cn/

It seems very similar to the problem you are trying to fix.

Alan Stern
