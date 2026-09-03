Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B55F4AF14E;
	Thu,  3 Sep 2026 13:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442630; cv=none; b=hy4pFEKmV6Y008xWzLzmR043CoBwY9ezpAN//Fvbw2F71E58Pa2+/ZmfwTwc+b2lv3vLAHom9eudmMAa1HyIp/0i65sXpbU7ftPp4XP9xWnt4Dzb14epY0vwfkIw2Qx3PmrfBe4pOOjfOpFP/1nzakg+bEY/VYFgyZ5/n47pJsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442630; c=relaxed/simple;
	bh=ABe0OLnGrLB1RcsRogbIhCFd8uh9IpJ1hYy2SyQmLU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeJ8450s6k8F+hnE3HIwWcs7WG7gCR0Nf6+uW/H/qqj2BiZDoQvbDyz2xTtnry5X7H72MYDCutNdzjusJynaeKxPbAH1J2qWYrComm+4MCRTtDnPAQC3Yu87s90x4i4FEvhLa0W6gAH9sOtIBB5C/wfqwJ5NbGD7L4U+iNNXTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxKGy4sy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxKGy4sy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5331F00A3E;
	Thu,  3 Sep 2026 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788442613;
	bh=R5CI4W1JywYqmijLZTc5xC9pbAwbK2SCH+dVC18NKCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hxKGy4sy/c9XzSYL+58KAx1928QZDkoJusUCX6UfVz9wwEpLkjFt4LBIs7dQc9ZKt
	 OOUGqjV8/wUT+XUKHFHFlZuvzTN/5PQ8rEafLzYR1/S3P1DTTlA4gznUaa4p0SIuVC
	 Gak4kuh31zQ0YNz2OD0BEwipkpaNEqxPFX/YbbG4ZIAyhe+1wEDM8btCIytSBIVnNx
	 DDO51lxM6Xczh4FC8/yEp+KEfpxLl8Sd1+gRqiOgfEAgYSFJp59MmcTQvGHXc8/+EM
	 B3jsAOvjqBwEfnjSnJpewRZqamaye6ZDdYRGYsTr1gq/F3ypkYXK4AC5e+uGFeLdy2
	 ZbwSffr6dJnOQ==
Date: Thu, 3 Sep 2026 15:36:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Marshall <pm@petermarshall.ca>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: media: i2c: st,vd55g: rename and add
 VD55G0 variant
Message-ID: <20260903-utopian-vagabond-mamba-44caea@quoll>
References: <20260902204549.657228-1-pm@petermarshall.ca>
 <20260902204549.657228-3-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902204549.657228-3-pm@petermarshall.ca>

On Wed, Sep 02, 2026 at 04:45:41PM -0400, Peter Marshall wrote:
> Document the STMicroelectronics VD55G0 camera sensor. Rename the device
> tree bindings to represent a generic VD55G family sensor.

Renaming is not really needed. The binding should be named after
fallback or one of compatibles, usually.

> 
> Signed-off-by: Peter Marshall <pm@petermarshall.ca>
> ---
>  .../i2c/{st,vd55g1.yaml => st,vd55g.yaml}     | 30 +++++++++++++++----
>  1 file changed, 24 insertions(+), 6 deletions(-)
>  rename Documentation/devicetree/bindings/media/i2c/{st,vd55g1.yaml => st,vd55g.yaml} (76%)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml b/Documentation/devicetree/bindings/media/i2c/st,vd55g.yaml
> similarity index 76%
> rename from Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> rename to Documentation/devicetree/bindings/media/i2c/st,vd55g.yaml
> index 060ac6829..bd6feeb6c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/st,vd55g1.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/st,vd55g.yaml
> @@ -2,19 +2,21 @@
>  # Copyright (c) 2025 STMicroelectronics SA.
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/media/i2c/st,vd55g1.yaml#
> +$id: http://devicetree.org/schemas/media/i2c/st,vd55g.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: STMicroelectronics VD55G1 Global Shutter Image Sensor
> +title: STMicroelectronics VD55G Family Global Shutter Image Sensors
>  
>  maintainers:
>    - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>    - Sylvain Petinot <sylvain.petinot@foss.st.com>
> +  - Peter Marshall <pm@petermarshall.ca>
>  
>  description: |-
> - The STMicroelectronics VD55G1 is a global shutter image sensor with an active
> - array size of 804H x 704V. It is programmable through I2C interface. The I2C
> - address is fixed to 0x10.
> + The STMicroelectronics VD55G family (VD55G0, VD55G1, and VD65G4) consists of
> + global shutter image sensors. The VD55G0 has an array size of 644H x 604V.
> + The VD55G1 and VD65G4 have an array size of 804H x 704V. They are programmable
> + through I2C interface. The I2C address is fixed to 0x10.
>  
>   Image data is sent through MIPI CSI-2, which is configured as only 1 data
>   lane. The sensor provides 4 GPIOS that can be used for external LED signal
> @@ -23,13 +25,29 @@ description: |-
>  allOf:
>    - $ref: /schemas/media/video-interface-devices.yaml#
>  

Please move entire allOf to the bottom, before
additional/unevaluatedProperties, like in example-schema.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,vd55g0
> +    then:
> +      properties:
> +        port:
> +          properties:
> +            endpoint:
> +              properties:
> +                link-frequencies:
> +                  items:
> +                    minimum: 375000000

Best regards,
Krzysztof

