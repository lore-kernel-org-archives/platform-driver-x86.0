Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBBB256C84;
	Mon,  9 Mar 2026 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773041132; cv=none; b=f5XaH0zh2cidAKWz8AfBZDZqwGZlKzmt3ZKqOjftqLfrc1Zx/eRkH1XbcHPztL13a50kCI19IYnfog4DKuZ0wjVg37dkOp5eivf2y8iP8A4f2RdDjW9sWk+v9PrRhziRs/rsqTCqXYrj0sJMqGXLdTxcSbiXiqqlvJWXsco4yAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773041132; c=relaxed/simple;
	bh=9zs25IhZpepu3VUEV1a+l5fgscrDq6pocZGKag5QFiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o17w+Gmf71CZNQjrI3XlVxuTjzTDG260Qfcj9x09tel8sM6fwVsc9e9ncsOsbEw8ZbqoTjGzDyCHEUaT03Z1KBxv/k9bEyeN5q20mMbuZi5B9fQzS4CzHG234Yq/aXp/itDaFb0GLKFp43j4L2caq7viFHghx1mHdvfxgcJ8mMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBgw1o1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBgw1o1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044B2C4CEF7;
	Mon,  9 Mar 2026 07:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773041131;
	bh=9zs25IhZpepu3VUEV1a+l5fgscrDq6pocZGKag5QFiY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cBgw1o1C0i6hKrJMBqsvho0qSv3LUswN83HYXxvSL7tJGftESZ3Rz7T2zki7y35Ps
	 cJqiyhyNJvrxJfM+zkz6/8pZVTBvx68RLei0+UndqhROX/tJ9VHXbNWEJ/AOv1seV9
	 gpKVdpL6+t00HDKYn1U5yM1t6paYbYElbwbDsMTP6m2xAaFdLVABdCa0kxtPo3IHYw
	 DtbdP4ntw7NH4LkZ/DfvUlj9ebyMuOX3Wlw9YG5nm0pJGVS6whyVmJGHkF2QibB5cv
	 2PsI1UPSpaPfCXtvxVkj5CxNzAkYnJksdhcnrSHp5Quq8qV/Nx/4X3F7/0/tYIaLnD
	 ROjXa7iy4I8/g==
Date: Mon, 9 Mar 2026 08:25:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com, 
	hansg@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Message-ID: <20260309-festive-prudent-ibex-f8b601@quoll>
References: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
 <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260308233646.2318676-5-sibi.sankar@oss.qualcomm.com>

On Mon, Mar 09, 2026 at 05:06:45AM +0530, Sibi Sankar wrote:
> Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
> temperature sensors, access to EC internal state changes and suspend
> entry/exit notifications to the EC.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index ded96fb43489..29a1aeb98353 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
>  
>  		#phy-cells = <0>;
>  	};
> +
> +	embedded-controller@76 {
> +		compatible = "qcom,hamoa-it8987-ec", "qcom,hamoa-ec";

I don't see updates to other x1e boards, thus my arguments from v2 stay
valid. It's wrong to call it "hamoa-ec" since only one Hamoa board has
it. All of other Hamoa boards apparently do not have it.

Best regards,
Krzysztof

