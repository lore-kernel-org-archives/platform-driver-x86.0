Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643151;
	b=dXwKWmVxMaleGiTLUxuksildIl138hnFesfy2Hxt08esuQQipDpCDpZiZqooAE05W1yp
	 fOLWPMmcEaSiy1p4zIYhuEO2IGnuiUdjcislV09/D3lWHhFnlotWXmwQI94fVymAolY/x
	 Is9qmeDbQ3YdJFr48di8V4dbuF3KzI68/YUospiFN2IRLCEvo++9Dxh165KFdbjfNZUNs
	 AmBkneQduTAAYfSZN2Rh5YZC4z2gw0xg9weUbR3e01q0Nrd32oSPm9vHpIksP0rPAHH5X
	 222JQegyufDPkWaC6f7zv3OhSaRCZzpieVbXmBr/NcOfsnDamM98xGsQwcmZt2TMDMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643151;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7+oajNl0F9lMsPdwVpR2/5jEoIJMB/r1VG0BoU0DFQw=;
	b=EFbTjHd+6RxSibpGBX/4KiK3R79g8AnNnxCXJeMHnOdp8k3uZDlniSukGys4DFhg3ClP
	 Fxy+6hewu+kQN/1pCEGuMFwEQI3G8APHDzelZBX6CGIQJpeLp6bwwJ9GpQQietOrohQIx
	 TwHBEjQ/+c6sRFygHwmOJ3aNr1PcBJNnuvxM0/4mVk8mRWSJoetiqLTCGydJ4V5iyDc/l
	 FAGiq1XLG92Ta2DppniOIrS3rvg3QEJAfEYSJv5kJp7TVPh6jUPxBpbEkxgCZrAhyfjJw
	 6tpoZx0q3LAi7UuFQflv6N2jwNfVXh/EpCErY1qoe6CmgbbqQNcS4lh5HkjYjtZJm8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a/7EB7Q+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AAB606A31E;
	Wed, 25 Nov 2026 21:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a/7EB7Q+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D681F000C4;
	Wed, 25 Nov 2026 21:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795643151;
	bh=7+oajNl0F9lMsPdwVpR2/5jEoIJMB/r1VG0BoU0DFQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=a/7EB7Q+uwg+vbOlS7Xv/O3Fkpse4c6rtUYVgd0HSJiBEloJnVE/hnvnXYnDXq4fj
	 psWoWL38WcVFvwWDsistpcPDMLa94URZDqsWPUgO3syGU/YFKkeQk43u4XplJRQvJI
	 FMBKP5l91QEgUWJXglQMFN2f0gcKfMrsBWRScV/+jAzgdU1aVfvNJZHzoV4Ro94I54
	 UOqZJjra5jkpGWVWsUmuPFg5hUdX2oDnnU6K0rb3i/JJI1Kkuvoj9G2louTZNNMwZb
	 QKZH+mkmFijDGWlqG8ADC9rN9t1XbWu2FsLuq8/iee++Q6FDaz4uHN4qDBHz+mj4t8
	 YfhBBYP1K+hEQ==
Message-ID: <edf25f83-2e1d-4f3f-b263-75d8adc978a5@kernel.org>
Date: Wed, 25 Nov 2026 22:45:39 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Sort the TLMM states by pin number
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
 <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261123-t14s-gen7-ec-v2-3-3420a6202366@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Nov-26 10:35, Abel Vesa wrote:
> The TLMM pin states of the T14s Gen 7 are ordered by node name, while
> Qualcomm board files order them by the GPIO they configure. Sort them
> by pin number so that new states have an obvious place to go.
> 
> No functional change.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 102 ++++++++++-----------
>  1 file changed, 51 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 26d6d8285e04..9bda86f82a99 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -987,6 +987,12 @@ &tlmm {
>  			       <44 4>,  /* TPM */
>  			       <139 1>; /* TZ trigger */
>  
> +	tpad_default: tpad-default-state {
> +		pins = "gpio3";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>  	edp_bl_en: edp-bl-en-state {
>  		pins = "gpio18";
>  		function = "gpio";
> @@ -1001,6 +1007,12 @@ edp_bl_reg_en: edp-bl-reg-en-state {
>  		bias-disable;
>  	};
>  
> +	kybd_default: kybd-default-state {
> +		pins = "gpio67";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins = "gpio70";
>  		function = "gpio";
> @@ -1008,24 +1020,32 @@ edp_reg_en: edp-reg-en-state {
>  		bias-disable;
>  	};
>  
> +	hall_int_n_default: hall-int-n-state {
> +		pins = "gpio92";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	wcn_sw_en: wcn-sw-en-state {
> +		pins = "gpio94";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> +		pins = "gpio116", "gpio117";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	edp0_hpd_default: edp0-hpd-default-state {
>  		pins = "gpio119";
>  		function = "edp0_hot";
>  		bias-disable;
>  	};
>  
> -	hall_int_n_default: hall-int-n-state {
> -		pins = "gpio92";
> -		function = "gpio";
> -		bias-disable;
> -	};
> -
> -	kybd_default: kybd-default-state {
> -		pins = "gpio67";
> -		function = "gpio";
> -		bias-disable;
> -	};
> -
>  	pcie4_default: pcie4-default-state {
>  		clkreq-n-pins {
>  			pins = "gpio147";
> @@ -1049,29 +1069,6 @@ wake-n-pins {
>  		};
>  	};
>  
> -	pcie5_default: pcie5-default-state {
> -		clkreq-n-pins {
> -			pins = "gpio153";
> -			function = "pcie5_clk_req_n";
> -			drive-strength = <2>;
> -			bias-pull-up;
> -		};
> -
> -		perst-n-pins {
> -			pins = "gpio152";
> -			function = "gpio";
> -			drive-strength = <2>;
> -			bias-disable;
> -		};
> -
> -		wake-n-pins {
> -			pins = "gpio154";
> -			function = "gpio";
> -			drive-strength = <2>;
> -			bias-pull-up;
> -		};
> -	};
> -
>  	pcie6_default: pcie6-default-state {
>  		clkreq-n-pins {
>  			pins = "gpio150";
> @@ -1095,24 +1092,27 @@ wake-n-pins {
>  		};
>  	};
>  
> -	tpad_default: tpad-default-state {
> -		pins = "gpio3";
> -		function = "gpio";
> -		bias-disable;
> -	};
> +	pcie5_default: pcie5-default-state {
> +		clkreq-n-pins {
> +			pins = "gpio153";
> +			function = "pcie5_clk_req_n";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
>  
> -	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
> -		pins = "gpio116", "gpio117";
> -		function = "gpio";
> -		drive-strength = <2>;
> -		bias-disable;
> -	};
> +		perst-n-pins {
> +			pins = "gpio152";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
>  
> -	wcn_sw_en: wcn-sw-en-state {
> -		pins = "gpio94";
> -		function = "gpio";
> -		drive-strength = <2>;
> -		bias-disable;
> +		wake-n-pins {
> +			pins = "gpio154";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
>  	};
>  
>  	wwan_reg_en: wwan-reg-en-state {
> 

