Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4A537F001
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777488998; cv=none; b=j2evjc8FOwXizn53sbs20zeX4snGuteQOrq0wK7oK79tuh4eofPpl1BWoGQnvd7XwlEhljmCwcM/Zm3/K3dodH3PlskR8t2V6jkHpslo6rPaeqCrlqeMJiCLxVVqgvwHaBdJCORSoVfr3VB8LkgyqMEcZHf1x9V7EVy6HxQpqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777488998; c=relaxed/simple;
	bh=fZRosW6/SxD7CgZIE3P3SJU+UIEnbVOgZtKuhXCHDgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2lY8VUapeXGhXtwmY2Ms5DZZ5tdUmnnFzpnH9ehR4Gw0aOrKCmDapmP68/CfnqtqyNXdezZaDU5+naBuCOy2pGCcyOABgIoDAKUGKA/10Lrrd2p9HDUVHdiJCmpNorwMfqRtadwr19qJ02SoTGDGOKipe8xGo9D/uNwe3HHz5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3z8t10T; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3z8t10T"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso238179eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777488995; x=1778093795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xaqdvbzc481SXtaLuwps557JdBjh47b91Yp8hkOzcqY=;
        b=K3z8t10TMuOzi+bYmNnKF1yn4jXBHDHAOt197KkDM2fSruDBNHJKvjkMmbtrkOf1gI
         zXKMT5U1iiIDb48FrS/HamAMTcTysxGFD76gv9B7haE06nVZHAh85/aG52JYrHFfKg91
         M0rEuDyJl3ussraP5RHm0wHJXroU1eMXpv2VD0111Vn20G0W0KztM4ec+Nlcen7b94co
         LVEvBnAXMPi16fClTrNbKjXoWp3RHuIGoQLL2sKY/7sLfh2pI37qFQClFvtO2Q5jMLwy
         8fzWJ80J5KZm7jQKvULntUfaN1FfRzrwnAl+JqsZkf57G9eqP3h1yhoUO+/HsiNgMdHz
         Luhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777488995; x=1778093795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xaqdvbzc481SXtaLuwps557JdBjh47b91Yp8hkOzcqY=;
        b=jtd2towM+Wt1nxufebEnCG8Y+jGR075fQr7KtUN2CptAld1Dp85Y61CrncOEp5S6sn
         yK/1lIbTviv42X8W1aHIlGAgrsICw0x1JVO5enmv2a5jkTxzc3H+cWA93f0miMqNh9k3
         MRKdqtjVYeeF73rcfW396UBGaHGDJqyFLOyPyyrTmgyB9zmME8lavKmPNCA3+mj6otmU
         KRxREmhZg8SS/mWl/OQ1KkTEGU6txoZDhwZsP6A8vC9fXjQkuu1Qdr2Uj51hMvKDTWXT
         HvmjOviFL+WKUysLRmN+WXsy1bSVvFAWQOUWcrKHhtCeK8Q8XHniQ4WdtvcLft/GKU+a
         R4Og==
X-Forwarded-Encrypted: i=1; AFNElJ9wG5aSnxWhyVv/JVETNbK00Q433/ng6RFM7C0su7P2qw5F1PGUhmjwjT94O7eOm0YjARdjLMNkvZbTzXzRZsiD1pAQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxvLHXJgVJfAix49f6GN7aYQPmz84oeW73KSqodYAq4/PJ0xsJg
	aJlfnx261MW43DFcoroa8WXWAD9uiKwn3FplvUsPC4c36mOSEUllkmPg
X-Gm-Gg: AeBDieubFnrryTZQ8cjKHhZktM/1g6WY/m+2g+iMyJ4M3wlcoblKedoGs5vSKeSyqJt
	ykABvzP35VSoYSnF32dzbTjW5Mzp72d/W3X7r+RQ25fNbzSEVEI5lhMhaFrTdpcChzcFV9b3ijC
	HASCwwj5W62yimzjJheD7ExAisPb1FrLlo93RZ2xgsdM0npPfnz3NakFtOfnN/PbLF+vWDySGHb
	MdfSA1acEtoar0oAdj5LNVWcqDWnSBnJ5ZXnZE4U18lHvPHeuYHgsDtsBO6MtYBvFSY0jeXdOrj
	nthAqfo/+5YAwyOGRYHCuDYnRhYAxtkgonGpDr/kS9QmepEODrJY6HzNabwRQsQRObQIFgz/nhC
	hrboZ/kq8eE5jUt4/zcku+M0mjEsWSM8ziev2SpxeZlo5PAlCfbdqUiREbVIhzj+qzZ71Pn6B+7
	8kimE1hcv7lqsuMOhvcstAhrZS7eTaOmAJzp50ij1oFFzlxALUo8AS7tvLEl//wRNEFSexuPGxl
	g==
X-Received: by 2002:a05:7300:f18f:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-2ed09fde4cbmr4106001eec.3.1777488995109;
        Wed, 29 Apr 2026 11:56:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:54e3:5ca2:4f82:c61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c0d218dsm3298533eec.27.2026.04.29.11.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 11:56:34 -0700 (PDT)
Date: Wed, 29 Apr 2026 11:56:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: pcengines-apuv2: reduce indiraction in
 swnode assignment
Message-ID: <afJUTRmqOdaFMC2l@google.com>
References: <20260429-pcengines-apuv2-swnodes-v1-1-cd1a6fad856d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-pcengines-apuv2-swnodes-v1-1-cd1a6fad856d@oss.qualcomm.com>

On Wed, Apr 29, 2026 at 11:46:01AM +0200, Bartosz Golaszewski wrote:
> struct platform_device_info now has the 'swnode' field allowing passing
> software nodes directly to platform_device_register_full() without going
> through software_node_fwnode(). It supports both registered and
> unregistered software nodes. Use it to drop one layer of indirection.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
