Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCE72C0270;
	Wed, 25 Mar 2026 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474636; cv=none; b=TU2SDCbXvcP5iCkIq4f7Tp3c2hiSVHlELG4BwyFCTAGGr4VHY19OORdSX4CiRCixOyt+Yp+TSVS5K81rGsvGHtJr0ndaUcINKSNbeIJxZgAZzw4ehwk6T3rVlu97jP30nEFHnf2TFcvxd4+LMsLwiG9RdTFCMZYmUixBzB5imLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474636; c=relaxed/simple;
	bh=QYq6hDCQE07/eY7zkfeMf3T6tS4Ol5kK/UBOk7Mtg6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7XuzQ7koWzLE2eYOkFyPYL3FdcjHe91oW77n9iMEAlCcd7OrR7/6MekYhuVzEW9fUpcR6NwySjA4dlgDWkdGXoc7cj2TgvLBL94+y7c4+Bs3m8GZmpmKY5XZ6/hULY5GNevNrkdAnQGQU9c2wLRcMQkF2BIjpQSI1UwKpPBTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OcaUFfH1; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OcaUFfH1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=A38lUMps9DF5y3xNfXoOWbS7ysXAXmQCcp5dIehhsdE=; b=OcaUFfH186W55SS9YxoOzhT6nO
	vDSLadi4/9jyzzjUOGduh1e4yqbjjlJyERJcrIRHFJOZuPbm+mDPtB/kegovUeMg8+qGtCijTm2C8
	u6XhuMP6O57RPiAjzsGYpqFNsUhonttvgD41d5qQmI8w0ViuVlOxHhP/bctwe+9ubYKRk+4fUOe5c
	HAXONjrO2J4Xq2SEF1Pc/LjiCYtXZ0nwnpGo5746TrDl0uYy7A1YplWL8THEuNzebIrQI8BBmEXYS
	LPdXNzgZ5I3wZosI/I18z3wZ2kGfmkAdK5FzA8XVFBl2oT4AtpWytwqOrmTxRhpSsHCgP+k9FoBDO
	xDKIkjMA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5VuX-00000004HxL-1AC3;
	Wed, 25 Mar 2026 21:37:09 +0000
Message-ID: <3077792d-8ca2-4096-b198-68bad573d31f@infradead.org>
Date: Wed, 25 Mar 2026 14:37:07 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com>
 <20260325-add-driver-for-ec-v6-2-a8e888d09f0f@oss.qualcomm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260325-add-driver-for-ec-v6-2-a8e888d09f0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/25/26 4:39 AM, Anvesh Jain P wrote:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30ca84404976..bcd7b0729ab7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22001,6 +22001,14 @@ S:	Supported
>  W:	https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
>  F:	drivers/net/wireless/ath/wcn36xx/
>  
> +QUALCOMM HAMOA EMBEDDED CONTROLLER DRIVER
> +M:	Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> +M:	Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> +L:	linux-arm-msm@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
> +F:	drivers/platform/arm64/qcom-hamoa-ec.c
> +

Please keep the entries in the MAINTAINERS file in alphabetical order.

>  QUANTENNA QTNFMAC WIRELESS DRIVER
>  M:	Igor Mitsyanko <imitsyanko@quantenna.com>
>  R:	Sergey Matyukevich <geomatsi@gmail.com>

-- 
~Randy

