Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0D369232;
	Wed, 18 Mar 2026 07:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817464; cv=none; b=BSm9HUiVrAAzOnTJnD52FWKYJkMBnxdBqBPwfVhTP1irQmQX0mxNYAe6tHxT87Qvq1JBm0ijDkarECo8pe1dfH4gw72xQY5/e+3GwPh473dCw4ViJY0vbxpd5dRy1z55iOStoWqHlC6vTQ+MoYuGNwm1Pyt8C8uDGuWheOpjtzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817464; c=relaxed/simple;
	bh=eJdl+k6esjSOWQxe12z14rjQmQ2Mwfh6d4hegllZjKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaQ8lYb97zEPwJn8jOOmHKOudkSANOj2sWHLzO6Ka7XOVl4ysrUHrCuzV+yy0ZFIhovw3OWxqAwb3u9ibkZRVI4lZDSqaZrv94S0/l8rDAcAPajqxErlUQUzMAoblLGiENlK8YJuCygKSvx8GNLWBIP4Aq42xP4YTrYuo8FIMEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WA5qjhse; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WA5qjhse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E94C2BC87;
	Wed, 18 Mar 2026 07:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773817463;
	bh=eJdl+k6esjSOWQxe12z14rjQmQ2Mwfh6d4hegllZjKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WA5qjhseJkUif+tKw9mCDv54Nczy9wER0dH6gT0Prm2bXj4bI8xzaQFKPp8Pl8MDa
	 XzD0+E9wYGzSu5xfQBQ4ichVdHvByuDuQZb65QCFYvLGaM5yeRj9wA3NZvT+NywE+B
	 jwJvbjg/NwZtFD8q0n6B3so1VLpHsG8Q17ifXCslMaYsz/Doxqz14AjPgJkdbJn6ej
	 1uL92Yj7N9ptukepL6fnQEuSWmgxJAPCcU/4voPOgqTf0wi1S6GnjJd9YV/R2fJF8Q
	 42qpGTloYF5+3LaT4SqJEpNdL/F+HOTOOE+I9qFnzbKu6IFnnK2mX44EeEE+XD4qp8
	 URXh8EJxSteiA==
Date: Wed, 18 Mar 2026 08:04:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v5 1/5] dt-bindings: embedded-controller: Add Qualcomm
 reference device EC description
Message-ID: <20260318-offbeat-quick-yak-6ebb31@quoll>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
 <20260317-add-driver-for-ec-v5-1-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317-add-driver-for-ec-v5-1-38d11f524856@oss.qualcomm.com>

On Tue, Mar 17, 2026 at 05:57:55PM +0530, Anvesh Jain P wrote:
> From: Maya Matuszczyk <maccraft123mc@gmail.com>
> 
> Add description for the EC firmware running on Hamoa/Purwa and Glymur
> reference devices.
> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

