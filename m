Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866218;
	b=hum1PSt8O7RhubOn1sHb6eTZ1OgeyXsqkFW5eO2oRw4VhW9fK+M+Ui9MT226uM38707F
	 JYkGpc/Oe3BgaSxfxYr7+UB713NU00qk3z8apc/No23FAYSwmLypsYH7RHP+NV5dxo2Q+
	 ZdQhSSSN9cphlhyCUQxb0yCZjpd7P50YAy5ReATtl9nA1fmdlVq/LPLt3CcDG9gFDkq5U
	 vULeEzTFnOECdutP4dwO73bQPJvvzKkPy8JLy5M1UrnlMqNshK9nX2WtGrVApbNKFtA3D
	 n9P28WQn43a59riH9I3AbRdBkjaWPKP9KVq8A+Kb4oMRrVvge9xx5oo8OG4RSbsbVWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866218;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=O+Af/O1KOS+3yVT+ztxCO4Vlx6y9GiaWxCfrUb0JAjg=;
	b=Ka6WQlrJU/lRwSkPm65tAgAHMIAONQJNT/k833eGrwbPWv6CgnpmtcaCWD5EscIFmnrf
	 IhRbBZZG5j3DKZp3/7VzzTETgkAJdXGyvsbUzCWqD4aod87Oca35uUxWopro+ZbxE6PUD
	 +qunWA85rEZZAZ/AeF5XDJm/KYay9aOc2z4Vt726ZOkdGW+wnQX6jbA1NK+GTJajwVH3h
	 TFb+1ByBhS+r7UUNMlDogeGnyRJNZ08x6p9KQZx+pN/CNFjcI2v6tV11nRjE3V9jLh0lW
	 EunIeYQLCpT2TXIybUhnr6pZG/zdBWN3CVM7YCBwip65i0hNPYlXJtRVM/YeFm5pWhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dds2rHjx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF20F606A31C;
	Mon, 16 Nov 2026 21:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dds2rHjx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EE41F000C4;
	Mon, 16 Nov 2026 21:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866217;
	bh=O+Af/O1KOS+3yVT+ztxCO4Vlx6y9GiaWxCfrUb0JAjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dds2rHjxOJshfzf88zP+wXAMH865aEz0gH9Dv2+/Pm7lD7NjXKocWXlz148tY5D+Q
	 R6lPZona4Kf3mTDMPvr8+lx2zr+NUnViBQLP4MOWUOEzHhsvkqXKXcRbtE8W5w3bTA
	 ktvSZd5WkkpDO/+Hy3Tw9wj+IjDNduKaGkA9jwuvxKxHhOt3r9rJt62kyh7NU4kFq8
	 jnLmiCVh2E4NdLx42CAHiFcYa+S1dHNelphRxgzU2cXaKN7wN1jYzibJY9tdLt8RV1
	 Vp0TRvVenEVPvJfTfK+F8dhCBF/e20cg1t0K5b7jUdHBMPspCiOSpRJzcNkiCozDoG
	 nfdITYqRlskKw==
Date: Mon, 16 Nov 2026 15:56:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
Message-ID: <avt6-driUZyXA_9N@zenbook>
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
 <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
 <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>

On Mon, Nov 02, 2026 at 04:36:16PM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 10/29/2026 2:38 PM, Anvesh Jain P wrote:
> > 
> > 
> > On 10/20/2026 1:33 PM, Konrad Dybcio wrote:
> > > > Add support for back cover, keyboard, and SoC thermal zones through
> > > > temperature sensors hosted on the EC for Glymur and Mahua CRDs.
> > > > 
> > > > Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> > > > ---
> > > >   arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
> > > >   1 file changed, 44 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > > > index e27c697e3170..571c98124a40 100644
> > > > --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> > > > @@ -594,10 +594,12 @@ &i2c9 {
> > > >   	status = "okay";
> > > > -	embedded-controller@76 {
> > > > +	ec: embedded-controller@76 {
> > > "ec" is a super short label, perhaps let's spell out
> > > embedded_controller
> > > 
> > 
> > Thanks for you review, I will rename the label to embedded_controller.
> > > [...]
> > > 
> > > > +&thermal_zones {
> > > > +	ec-back-cover {
> > > > +		polling-delay = <10000>;
> > > > +		thermal-sensors = <&ec 2>;
> > > > +
> > > > +		trips {
> > > > +			trip-point0 {
> > > > +				temperature = <90000>;
> > > This is *really* hot!
> > > 
> > 
> > The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
> > Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
> > lower value if this is too high for the keyboard and back-cover sensors.
> 
> These sensors are intended to be controlled primarily from userspace by the
> thermal governor in thermald, through the powercap sysfs interface [1]. We
> do not plan to add cooling bindings for these thermal zones.
> 

I don't plan to merge settings that will cause physical harm to people
who for some reason doesn't run your userspace tool.

> Based on discussions with the tuning team, we agreed on a hot-trip threshold
> of 90°C for these sensors.
> 

Please make tuning team that the user might/will bring their own
userspace, with or without this configuration.

E.g. on my system there doesn't seem to be anything called "thermald":

$ pacman -Ss thermald |wc -l
0

Thanks,
Bjorn

> [1] https://github.com/intel/thermal_daemon/pull/614/commits/7f3dd62353e039957e52eeb40c67ec388d543ebe
> 
> Thanks,
> Manaf
> 
> > > > +				hysteresis = <5000>;
> > > > +				type = "hot";
> > > > +			};
> > > > +		};
> > > > +	};
> > > > +
> > > > +	ec-keyboard {
> > > > +		polling-delay = <10000>;
> > > > +		thermal-sensors = <&ec 1>;
> > > > +
> > > > +		trips {
> > > > +			trip-point0 {
> > > > +				temperature = <90000>;
> > > Likewise
> > > 
> > > Konrad
> > 
> 
