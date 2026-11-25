Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643187;
	b=MzMBf1VpzzEzfAaEMapQuPHXD1sJVqoj+LDLVouBCJcmxq9SX4Fo90aCVBnG8h47YSny
	 fPc8q1l0sZwrc8yD9ohVPGW6oarh+mr/xRMZ1xfWCnuucuxD1WzWnqfTrIguLM4a2zDZO
	 c931/fuHUuqkPsECbTFYR/mzb/m8kH+54WRiaxOM1Z/LuyMEUQYOL/MxIigxdJQMt6B7X
	 dx75fz8NHXVkLIxZJqktEa/KEB8aLPSie8wXUPW6ol+K47aTSHJRntUr9kSjtFg2fxMv9
	 h68LcY8wmI0/iAiKaHsgY1hY9+DvK2jZs2nAMBaTpt3tMSe4WlxYEIr6ed6TPyKlOoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643187;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sKGIq+btLwQ1Z2Nr5Fhq2wgssMh/R3J6vidIxhGeHDA=;
	b=sSwBksuRyJBSMCMDS6RbRnTEkKTepH4lH3UlJksfr54e4LGibxEPPkw6NGA3OOSjgVX7
	 nrtK7rI/wG9geboDafEwY8HvHe5r2dNZdZz8HizJ9q7QzSqqKyJ5+ZvMr+n2Ic4cytNB3
	 8h3/1oUt5tup6eyb2yWWI4hb64efihb8s7N0oP1p4oVD7hhN4Bx8ShOLFFO5gyTNgnJP1
	 CDSAYlnVqHLoMe42BVX9R/yPjcpU2ZVDVDHUPH4dxOXBlKFGUFfcvn0yjwTdaCmjBBnTB
	 me3VhHkvPrATA2DAzUXN3AxWpjavHMwzDgNsaL8zsYOJjazgcHZGE34U2KTCcojjHcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPDZu7hl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EA0606A31E;
	Wed, 25 Nov 2026 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gPDZu7hl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9308A1F000C6;
	Wed, 25 Nov 2026 21:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795643187;
	bh=sKGIq+btLwQ1Z2Nr5Fhq2wgssMh/R3J6vidIxhGeHDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gPDZu7hlMCcYvLcY7ml5FrSK6dQiOgJwMpHETbh5/v2jJjapoY6+mdfOSOWIUYW+y
	 xXBALBF7gp+5wNhFItKfxJBkW7Uisnt5zIyCEPURZXH+DyfOEFAdIbQ/4QhPbahw9P
	 Fl6PGUc0fhdjtzPpR7aFzaVJJDlOZPRr5uFhnXAOdPdVmNn+gyIguy0qiTrm5xqCQk
	 1FhED0CKA7y1rt5WMGPSo6n0VhfsPg7Gw8OAfYhgbgZ043UkPftfrTn/inap0V5IS0
	 TYY0o41CEDihxaTN/b9tfBRpcJqZxsCO4tiQI29TnoXoOpoWvd1NMlAwm4g9OPhzs+
	 axVrEVf9F8u+g==
Message-ID: <67c6c65f-0958-44fc-b258-f33857f1cc17@kernel.org>
Date: Wed, 25 Nov 2026 22:46:23 +0100
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Sebastian Reichel
 <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
 <20261123-t14s-gen7-ec-v2-4-3420a6202366@oss.qualcomm.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20261123-t14s-gen7-ec-v2-4-3420a6202366@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Nov-26 10:35, Abel Vesa wrote:
> The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
> i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
> Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
> GPIO 66, as on the Gen 6, but the firmware describes it as edge
> triggered, active low. Using a level trigger makes the handler fire
> continuously while the EC holds the line low, with no event pending.
> 
> This provides the EC hotkeys, LEDs and keyboard backlight.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans



> ---
>  .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> index 9bda86f82a99..7e7e9b861899 100644
> --- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> +++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
> @@ -735,6 +735,24 @@ ptn3222_fpr: redriver@4f {
>  	};
>  };
>  
> +&i2c9 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	embedded-controller@28 {
> +		compatible = "lenovo,thinkpad-t14s-gen7-ec";
> +		reg = <0x28>;
> +
> +		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&ec_int_n_default>;
> +		pinctrl-names = "default";
> +
> +		wakeup-source;
> +	};
> +};
> +
>  &lpass_vamacro {
>  	pinctrl-0 = <&dmic01_default>;
>  	pinctrl-names = "default";
> @@ -1007,6 +1025,12 @@ edp_bl_reg_en: edp-bl-reg-en-state {
>  		bias-disable;
>  	};
>  
> +	ec_int_n_default: ec-int-n-state {
> +		pins = "gpio66";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
>  	kybd_default: kybd-default-state {
>  		pins = "gpio67";
>  		function = "gpio";
> 

