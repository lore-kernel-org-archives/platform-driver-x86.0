Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0BD30D411
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Sep 2026 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788819740; cv=none; b=HjuB+ubxCF+qf+Q262uOKyR8F7pL7glnQwb6nEEUQY7aGMtdre/lXPJXJ91kOa37FJlp09ZAzXEaoPecXxDbV56k0wiM+JQ3gNp4pN+tyN4QG7GeOb/25417lwXBinQKmgaBj6dWkJSu28Y9TybBg8DWwcpCg2ai1XA1kK0BDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788819740; c=relaxed/simple;
	bh=DkPnN0LBKMtrFx+X0M2ExaQxqAiphMY+jUqO2hdebNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNPbhyqCxjy2cqanAf1Ht0hdSDtumM5PwNmfz1ShGn1D0tfGV5sFQe3YD55on+q6LpTHn6aiQb8sWZxeVl3CzVql/bqw2kIof7RR3Jqejy9A2rfPYudXAjDGYRoloAbOHD4ANOaRcf0Vbr1eER21gA9VlzeyDaZlLvbiy5sMuzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lp0IK5LP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBhRtjWF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lp0IK5LP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBhRtjWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788819737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=doPvstU0jM+pOnprTuHLt3cRtMawGYtbfNsIMqB0F1s=;
	b=Lp0IK5LPF0SAXWljyYIgJETY4Zj29VXFLbXzoc0/K7ZKtqe3OGpktWNTyNu7zNmr/D+QoQ
	SA7BgGgaasjbVHayg6kWRfPkwUfHOUF/bMPOOBRLblqLk5lmWGEFirTGUjJsljTzD3i8yU
	8WWZTjUKG0iBNtKWw/1O5bT7WN1aKFI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-YbVaNcffPE-IH_orLX8yyQ-1; Mon, 07 Sep 2026 18:22:16 -0400
X-MC-Unique: YbVaNcffPE-IH_orLX8yyQ-1
X-Mimecast-MFC-AGG-ID: YbVaNcffPE-IH_orLX8yyQ_1788819735
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49554715277so38813055e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 15:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788819735; x=1789424535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=doPvstU0jM+pOnprTuHLt3cRtMawGYtbfNsIMqB0F1s=;
        b=CBhRtjWFcz2nRsO5CDk7DDviVJ2vuW0jXF4TLOk6KsuQPNgMrgAZbkX5LLsvFiXLYh
         RV1IR5LZYGvafe5DW8dKhL+kYMvdCx9eqD7kw2RbXfitMSYvYmonZPiUBptR/Z6a47d9
         3pNyn8XM3Z1Yw9dfoWjKyd2JpeqtrgRFRBf9mtvVJn8Fx1aUfHKLvDLlPYzgYTVQYiS4
         GZp9e6ctzr36DKJQ9DdlJc9Q9vlHJPRQWHcwOuKJ0AMXOu8wNbWPSmvX9zxwMwLaFzmo
         Vm+xTuiriASQHR/uCMfPJcshmstfLXs3X9jzvHZvdAKzllG3PGeHE03sEDUzx43SGNof
         /wKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788819735; x=1789424535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doPvstU0jM+pOnprTuHLt3cRtMawGYtbfNsIMqB0F1s=;
        b=n6C0SCXaGZg/yXvntmk3P5zgNGETTzULkqfpoZ47dO2IXgKYon7B7NqdfMgmqCeDH8
         qIydSXkKkV8UICnPR8rJcPWERLiBRztWbGVbly7aa4p1vuBAnnS372FU/HCxlo+9VaVa
         6dVz2rO0LcmKuP8p+x792hlcpt2VG72JbHjFo+AdNzi3/dsmqQHAu5FsxF8hIrRXpsTZ
         HgsAy5YVXkktPHwdW1dYBsS5TGh7vNP2XT8EVm+/4gL37ySAqbi6v6OGbEyARczGp7UX
         PoQepWuCM0RPvwU2KXXgOu/7Y6JBHLyNfBNVAT3yCzylRApjbLNLp/FyseNRzIw+BU9P
         oAjA==
X-Forwarded-Encrypted: i=1; AKwUvBxrUmfoMDhyJI1PYjWL8mxqjb0fCIX0fAEbAbPTX0NTMmsgHzXunTh8s430bO7v6mjTiPCfhC5PXAYeh8Gx1SJbJ8Lf@vger.kernel.org
X-Gm-Message-State: AFuF++nuK2IgniyaRkwYFD9ytTxtO58+VqdRTKS3iFVyPycLeFml5AI8
	kdUKX6dLOou0B/ZrPtxmrczUI/nt229y4ehF9cxbra7Jot3Yf1YETL/jMzqheZpmIKzmT8xJhsQ
	LVdv5Jgaz0NT0XgtQxzW0kTlNSYeXdOI4IWSmE+a3ipmFTGgb3HCPvKZYZRHO3XWGcuxbNJOoe3
	E=
X-Gm-Gg: AYBFou1I/ez4nFWc0geG7K3PgkZq7JJqUddWZkJND3OtO2gtFpUeA2iBRtz6Di9JW3U
	e8l++UI/axK6/5mzLX6R6gjjrKKvggqbSZHYn0HgtlBH6+8S1ThUSgRjb9UgGlvZoq9WoeEHhtH
	wStXHrThKlux5Pz0nB214vo3aAoq3Kqmq7o49ObvcAXgGIY80as+zuiHHpa3ZK/8mlLrH/OgbBn
	oKWzON0YXZ9Opf5jpOIlCEfWQ4xpfVAkEJdvl5O1MYYyM2Vu8bdKeux7AL7FeFUFcDRmHqDsGzk
	WT2NAhOk/8QpPvVlQJYK9TPcUNu2ZYjq2O2JCoBLknG3UBil9q+o69Iyqo6A2LitVuM=
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr47087025e9.1.1788819734855;
        Mon, 07 Sep 2026 15:22:14 -0700 (PDT)
X-Received: by 2002:a05:600c:8715:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49d17d4b01dmr47086385e9.1.1788819734435;
        Mon, 07 Sep 2026 15:22:14 -0700 (PDT)
Received: from redhat.com ([187.15.128.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm24030241f8f.20.2026.09.07.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:22:13 -0700 (PDT)
Date: Mon, 7 Sep 2026 18:22:09 -0400
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
Message-ID: <20260907182153-mutt-send-email-mst@kernel.org>
References: <20260905152059.89560-1-kmehltretter@gmail.com>
 <20260905152059.89560-3-kmehltretter@gmail.com>
 <20260907174559-mutt-send-email-mst@kernel.org>
 <ap82pFlX8enNG0gZ@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap82pFlX8enNG0gZ@gmail.com>

On Tue, Sep 08, 2026 at 12:15:14AM +0200, Karl Mehltretter wrote:
> On Mon, Sep 07, 2026 at 05:46:07PM +0100, Michael S. Tsirkin wrote:
> > > Assisted-by: LLM
> > 
> > which llm and which agent?
> > 
> 
> Claude Code and OpenAI Codex, each with their current models.
> 
> I switch between them and let one do review, the other
> helps with implementation.
> 
> "Assisted-by: LLM" is the form Documentation/process/coding-assistants.rst
> gives now.
> 
> Thanks,
> Karl

really? not what i see. in which version?

