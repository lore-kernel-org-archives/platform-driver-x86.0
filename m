Received: from server.atrad.com.au (server.atrad.com.au [150.101.241.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C47E9
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.101.241.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466199; cv=none; b=VmjFPc3AjxdIJZVa/EDGxpk3WDvpe8GN9Fp6CAop2xiT/SylC6r2a2KNd4G9wvgGXvbwQnhiRsH1rOlkhilXbm3x2UwAtzhL8vLc7ZFcousggVR0Ex5P8JaBr3KdQZf8UzEN6Se3agMcJsqlgAG6EiPrl5NoWlD5820Z4vxEDJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466199; c=relaxed/simple;
	bh=J3EPXKnHyDH+Pc0r7Zo+wwIHccNGGzoBvWasUg05Hwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8VL2seiMR52sAn8ArXs67hjLDo1l44CWgqEZyB/v742E7bVbJMDg6EMQNoo2LQ2DIXLUiXK5zcta6rv1+kdXfcZ382b0L7dxRcgKbBZVGwyJ0Blef3E7VwJX/UJEGekFrPwOdnpynXIg+5gMxW4RGFYKZVlYhmG88jpNIXaCTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=just42.net; spf=pass smtp.mailfrom=just42.net; arc=none smtp.client-ip=150.101.241.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=just42.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=just42.net
Received: from marvin.atrad.com.au (marvin.atrad.com.au [192.168.0.2])
	by server.atrad.com.au (8.18.1/8.18.1) with ESMTPS id 559Alrra016748
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 9 Jun 2025 20:17:56 +0930
Date: Mon, 9 Jun 2025 20:17:53 +0930
From: Jonathan Woithe <jwoithe@just42.net>
To: Jelle van der Waa <jvanderwaa@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
        Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] platform/x86: clamp charge thresholds on fujitsu
Message-ID: <aEa72cwW5ENuQX6Z@marvin.atrad.com.au>
References: <20250609102115.36936-1-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609102115.36936-1-jvanderwaa@redhat.com>
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.86 on 192.168.0.1

On Mon, Jun 09, 2025 at 12:21:12PM +0200, Jelle van der Waa wrote:
> For userspace programs it is not know what the valid charge control
> threshold values are, clamping them to the nearest supported threshold
> makes the API easier to use for power management daemons such as UPower.
> 
> Jelle van der Waa (2):
>   platform/x86: fujitsu: use unsigned int for kstrtounit
>   platform/x86: fujitsu: clamp charge_control_end_threshold values to 50
> 
>  drivers/platform/x86/fujitsu-laptop.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> -- 
> 2.49.0

This patch series looks good to me.

Acked-by: Jonathan Woithe <jwoithe@just42.net>
