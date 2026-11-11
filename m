Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401295;
	b=LcRgWXqx8dKHxdGW0wT7yr40QZVeTzcYSGRawsLneuuikbxOZ+1VkhTL1oFu9grqv6md
	 C6iSuv6bSdmMRbK38k+Gfn6qlAfpgNABMUdecZsKxVcWFhvP1amFY+oyqCBWZsmN9y6oH
	 DlPiXQEXf9LyXvtwqDnlGdLEXBiNtc2RBl/twmJMef0rg9+YP7VO3hAmJ0SA5OI0Z3Xyz
	 6BTQ08ghNgwvDBSr6lGlza4byEjJAEPz2qEq0n1i1/Ycc5oognR1dgODWs7/wWe/FCiE3
	 M8NRtNV5ExacpowVIEXYQsibtHe8YOqmKxcIDpnkjJzuC7YtvWJC9J8hlVB7MWnvqiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401295;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=47cP6sCHM+8MK6KsXLe7ISSxj0cMocCxnyu79OonuIY=;
	b=uqyxBUHhhOoFUTSuJPl8n9fnicNRcsbdvMdy/j5wMUbTRnqHSV49enEQNKfcmDF76h+t
	 sKvxqFoPsA/8YavriyYLMt99IH3lR4j0EslTzQYYGzy5R9tok54xf7ixp8EI8N+IzxRA7
	 YsW6Xd+DlvE2sKv2aoWwp/kzc9ya/zVEwNw7m2koZIxuW8d3JkYH4xB4h4XZk4D2RWgW2
	 V60brkzCnHJIeyKLlfopK9CvsBoUo0zUUhVxlrxAnAtJ2joU6Ewl3/Cp6YWeU3DG3IhvQ
	 sSj0YHRfvtfyiduP1T5G+Y40RXHlB9gduH1WXBjoNbL6Lj1SdJXIqPctpZKZxlI1QhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOX8JCzm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E17606A31C;
	Wed, 11 Nov 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FOX8JCzm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606BD1F00A05;
	Wed, 11 Nov 2026 12:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794401295;
	bh=47cP6sCHM+8MK6KsXLe7ISSxj0cMocCxnyu79OonuIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FOX8JCzm+rNCf/MV3s7IzCmW9YnpXGiQF5zzAUddAXvZKJ7HdB1A0w7kVkCjYx7yQ
	 yLrb8tcisMwf4quLlOOHaCB+bJM5x981rywR3C68rrStbn41rutC7IWvy4y8YPJmV1
	 e32LHYnfjhEo1RlpYwlS2xuOpLUJGUjsX+V/9542kVybBUfzusBQfb+6+CIbsFBPwt
	 tPEf7IWTmD/uu5xuE4XY4QFTEAAfHBdTlXpo+hBhUMLfRXDA4sBb6w3c5F24xz2xFp
	 5MSX9KRv/8VcHSZtU4HtH0Efn7tX+Sm+ATz6/1NHCrvtaxK8CXx8iaIi5gRDAc9lCV
	 DIRu8aN2SMXpA==
Date: Wed, 11 Nov 2026 13:48:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller:
 lenovo,thinkpad-t14s-ec: Add Gen 7 support
Message-ID: <20261111-amorphous-koel-of-thunder-69a08c@quoll>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-1-f4a8edaac447@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107-t14s-gen7-ec-v1-1-f4a8edaac447@oss.qualcomm.com>

On Sat, Nov 07, 2026 at 12:01:52AM +0200, Abel Vesa wrote:
> The ThinkPad T14s Gen 7 (Snapdragon X2) has an embedded controller at
> the same I2C address as the Gen 6 one and reports the same kind of
> events, but it talks a different command protocol.
> 
> Add a compatible for it.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

