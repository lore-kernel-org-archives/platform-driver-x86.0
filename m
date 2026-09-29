Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790F8377553;
	Tue, 29 Sep 2026 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673017; cv=none; b=B3YaNVCyxgcXlsBfGkfHerdPZlIFT8TiWxPUe0xxxq6HLQN3IfcuJSBJl2Sse3OaPt8BTuBgQojtW67tGNIzXarpYNVyLHXB8fT9NtkGSZ/XTWBQOhxlYHUl5dbjANtSQFfqVOvDbXGEqf90ul7mOo3WateWibvFHE4ZLeme7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673017; c=relaxed/simple;
	bh=XqsGxJWFeM2JKpsbti1igrEjp/0X/lcfxuoU6FF2O5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/clJaBZP3U3EZ7csXlYLtcVgQYStvGyRy2huRfpxvVCNYQon/faElsrgo7wksmUS50gKqHWMJNFYT71CZaJvpMw/e7W+Yfy+pbPi5/n6iiD5tmh/+D/pUHPVNesuljTwCHO1MSbpGSf3KfOTqxBT8m8YBbWIppiE+pMqQPB4b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaLB89uN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaLB89uN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5927E1F000FF;
	Tue, 29 Sep 2026 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790673007;
	bh=7hobKu0Z07N6or8zXwQQWgMpUzmaUE0G3nAWF4QvHBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AaLB89uNrO6S9EsS/BukOAdcy2WqzqY3404fnFjlbrldBsG56vFTgHLooke1oL9X0
	 x1B5UPUXl6C6tivcGq51fXhUKuc16AkILFo2ZlDWxDVbcscbgOy3akSM3v0iIrrVFb
	 K6hXuUZWhFgLYEfdZdaVf58UA+tHby2tta4E2jNLFHZUTnfmjUJ70NvuEzccx7LJeA
	 koESqZ++BZhQAEYRamUsjUO4j1TQ2sXVMsVK43PVKDI7qXLVh5sFOxdXGVDEN9hUR4
	 VCl8WZmAwnqmPKJKW2enqYceTWVKlEh7mOt2qFDD5m0tvL49lRew8hmrOOgvU9O4ST
	 9t528JNFqve+w==
Date: Tue, 29 Sep 2026 11:10:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alex Robinson <alex@ironrobin.net>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: embedded-controller: Add Lenovo
 ThinkPad X13s EC
Message-ID: <20260929-discreet-rose-coua-c0fec9@quoll>
References: <20260928222056.10044-1-alex@ironrobin.net>
 <20260928222056.10044-2-alex@ironrobin.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928222056.10044-2-alex@ironrobin.net>

On Mon, Sep 28, 2026 at 10:21:29PM +0000, Alex Robinson wrote:
> Add a standalone binding for the embedded controller in the Lenovo
> ThinkPad X13s. Although its I2C command transport resembles that of the
> T14s EC, its keyboard-backlight, event and power-management interfaces
> differ.
> 
> Describe the event interrupt and the separate host-controlled power-state
> signal, which is high during normal operation and low in the low-power
> state. Require this GPIO and allow wakeup-source to describe wake
> capability.
> 
> Assisted-by: LLM
> Signed-off-by: Alex Robinson <alex@ironrobin.net>
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

