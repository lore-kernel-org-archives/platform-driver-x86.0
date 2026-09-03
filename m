Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784274AE11C;
	Thu,  3 Sep 2026 13:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443026; cv=none; b=JftKUoYhX2TEeSCtCgvy4Kg8ChWM9+dRx4MW9xwxvpOLQf9qeF2zrytahZVSIvy3Heh/w1WmDhRyJ8AwSU/QFkQA5gMcFxHX53p01S1tCp868rEYjq+F+TJCZaAUfG1TJI/uKV8GY6Di0uD+e/1ayWgfN2CvMMNoEJysdQ1Bvlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443026; c=relaxed/simple;
	bh=OJgQG4aoN2v6u3KrwJtFEjjQWD570MEDeq1YgIwyOyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U03zh9YdlCUonLNlX/cDgRWuVrENK3G9tlv4noWa7MM3iniu89aLt9aXTxtzqmaBbLopVjFKKJ3LekMn7tlccbOxV0bFC3IvHH3k/FHO/Twm9NhSCa0C2YPCQMWAcOSDoHI5P6t9PDjyIV4eO/4vy2dhMsS++mP6ERJIAoo6v0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGOJUMVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGOJUMVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D0FA1F00ACF;
	Thu,  3 Sep 2026 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788442988;
	bh=GqqeU21WTvVVG9cJbweTYHFWXJ8iuVAYNNT93dVhAwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nGOJUMVeKq8v1x9zbifauFMgoZ4dSuUqcuC47AnaB4eaj6E9g/2SR6j/rbX0q5LAY
	 v+CsTDIqv5lUIECZc2gZU+adRglEqp+wcIKuabNSvk/C8g1nDsStLi7FNCl5Qk88B0
	 ZoT/M/Y5hSU0ZvCpwd7cEOhiebZBf2MdqEKd7atPjYYKtHEZK4R6zRUWCb1XE2Czjs
	 q9x2VnGMwfCrJYmLsTsPKb3xX5Ns2nPVKHjarq6rPDWzuoXHAmzUGemIMmzA9Ihs7M
	 1IhtMGpwWLTl6g7ZrtGKpXrgjlyVTgmvvTg+li9MCIk0A143azT86zB1napedWnVh1
	 V5uOdJcHXY6uA==
Date: Thu, 3 Sep 2026 15:43:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Marshall <pm@petermarshall.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 7/7] MAINTAINERS: Update ST VD55G camera driver entry
Message-ID: <20260903-effective-jellyfish-of-reverence-7a72a1@quoll>
References: <20260902204549.657228-1-pm@petermarshall.ca>
 <20260902204549.657228-8-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902204549.657228-8-pm@petermarshall.ca>

On Wed, Sep 02, 2026 at 04:45:46PM -0400, Peter Marshall wrote:
> Point to the updated vd55g sources and documentation, and add myself as
> a maintainer.
> 
> Signed-off-by: Peter Marshall <pm@petermarshall.ca>
> ---
>  MAINTAINERS | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5114e6db7..b090e6318 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25649,13 +25649,14 @@ F:	Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
>  F:	Documentation/hwmon/tsc1641.rst
>  F:	drivers/hwmon/tsc1641.c
>  
> -ST VD55G1 DRIVER
> +ST VD55G DRIVER
>  M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>  M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
> +M:	Peter Marshall <pm@petermarshall.ca>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> -F:	drivers/media/i2c/vd55g1.c

Your patches are completely unbisectable... you already removed these
files so previous commits leave stale/wrong paths.

Removal of a file is only complete if you update all the paths. It is
not a separate logical action from updating paths.

Best regards,
Krzysztof

