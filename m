Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550AA4CEE7D;
	Tue, 29 Sep 2026 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672168; cv=none; b=o+Npyxmf/+5fMq4Bch+i1DWSGERdNKeuJaq8hy7DDJzJA/lXd5kTYb9FTlCvf/39Dcx11GqwEBEjH2ZCkPdG6J5Kc1OC9QDZfYobzWW4ah84blh1PPDnmggDBVVKchMgHLvq649Pq7RjtoXTUTa70SAFMt5oTYsVzH4YMUfpDa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672168; c=relaxed/simple;
	bh=Wlr6Ck5qkAXtsNSbnxM4Ie4bBba+SvgH5A67csbm1rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTd3KM5OWfDe81BJCGG4WQNAePpQITTbw6IiUctg7DVUoPyU3pGW/CZ/Tr2EAucXNz42YuvKg0FnFQGFhRXcy3JyFsas2Oy8dXtsLSw3BBTbI0dO2s5fUJ38u52HyLtR9/DgxzdpderH0897nw+N5LPedzooXIsajo6spNAB/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpishqdH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpishqdH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D426D1F000FF;
	Tue, 29 Sep 2026 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790672166;
	bh=7QHmZFu5AjcefqG2JmVDN7pKC0y+L+QE+qbkqBsW44s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PpishqdHfiXkM/arBIoQF7tm9UuMc96dFC3aP451S143Df8WyW9GZCIW7kbEdDN+F
	 /iTB+Md7GaG2ea2ZZT51Vc3fx+lYkVa+WXqsFjC7hGdr99WyzH8qo2DvPWTTNtmhDS
	 4O1KbkuxP0tC7NyrwuauQPHg0x8ZCzG7fp+BZQ1GlNEwMKTRTDyFF3eK1GE5YTape5
	 Nd14sv0VolkenjKIrzD13QQxmoNQb8x9krjUCXCnxx/8p5Qt4WL85uuONFXs6L/FV5
	 pUEsdT/EcvAuFsX1eEKk9wGo8NhaoLNS96cNHmYdJr/oqmHBHMeo/7mUKiMzPayNsb
	 /Z9WWP8Jct8Jg==
Date: Tue, 29 Sep 2026 10:56:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
Message-ID: <20260929-cherry-seal-of-current-bc1b5c@quoll>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>

On Mon, Sep 28, 2026 at 12:06:39PM +0530, Anvesh Jain P wrote:
> Add support for back cover, keyboard, and SoC thermal zones through
> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>

It does not look like you tested the DTS against bindings. Please run
'make dtbs_check W=1' (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Best regards,
Krzysztof

