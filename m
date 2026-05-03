Received: from mail-07.mail-europe.com (mail-07.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D53559F5;
	Sun,  3 May 2026 20:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777841552; cv=none; b=jOKxELtJvIev2xVK9db5UCExIsPRmW4+D/XnWXxJFFxyjulKtOoqzuHLNrndZfcKHiogsz8mNkYhF1IByfPCqm0nP9i4JT31UbrNO25EyvVjt/tpNI+uZdcfegucbONNpzb1U0pfRbYUCk14xzKVe8wVdQ1SE3PpPt6ZbWniUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777841552; c=relaxed/simple;
	bh=DL6iXssMye2iStZHF5R+d5ll77LHBL24xwuWkbhRKiQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npjtQjwz/7kPfy/8aJr8q9dayi4LQeGxqDLWuRztQdpEOd98Y5DlRap36lt8xgcT7E1ASa5Kwrdfz+WTaZiR05a8j4Dm14VO7Vd0tefybyF80i6g56Y/pFOJneG2bgjrsdR+CFi0w4qnyNSMotQtBbTo4UPHpoxoQ1DUNJt0dtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=SlN0zT8U; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="SlN0zT8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1777841532; x=1778100732;
	bh=guOoOc13MjwplIgspUQvArsTLRGkdL6MLiDfDOg1uzE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SlN0zT8UPlQeuUWbPqJ+WbjmoojFB6gv7TDr+DJMA8DjgvzpBaEFr7aL6VLDDqZ7i
	 vpd7m7ynf7gHAhE34/H1wMEd5rSHwUCk1agzu05FUOzkfHpmBRNsyFXWkJfc6Sq70O
	 mnljgA8ZyIQBena9+jyk0Fu4MoB7FgO9K6oDB2oNV1wfjnHoiRYzDv23WVwkrXbUgJ
	 HCWjHy5AD14oGTqX9aiCxVZ3sIbUl9PCpqjMVJpCzp7F1wWHKF9EfeBrfkGIAmkX0G
	 26rLW7WAIse2M4xbki31I83SRiEc7HvsRfrakYTqNaWV3g4fftA5ty+hN9zbRBOXci
	 JAj1be+aKyn/Q==
Date: Sun, 03 May 2026 20:52:08 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC
Message-ID: <XS2TSjsgj8nSwvw0hbt_xwMfuWcEyYZvBidHnSY_HeRjxejaryUEs8stsGFDkclozp8h58fyPEqe3w91rmt3h8vxAN6fTSG_-y8dgWUKeqs=@vinarskis.com>
In-Reply-To: <38233a55-d313-4ad1-ad5b-b33011f2d345@oss.qualcomm.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com> <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com> <38233a55-d313-4ad1-ad5b-b33011f2d345@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 7755c9543d3d6321c8573abdd9bae1fe310a6bd2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, April 14th, 2026 at 16:12, Konrad Dybcio <konrad.dybcio@oss.qua=
lcomm.com> wrote:

> On 4/4/26 2:55 PM, Aleksandrs Vinarskis wrote:
> > Describe embedded controller, its interrupt and required thermal zones.
> > Add EC's reset GPIO to reserved range, as triggering it during device
> > operation leads to unrecoverable and unusable state.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
>=20
> [...]
>=20
> > +=09ec_int_n_default: ec-int-n-state {
> > +=09=09pins =3D "gpio66";
> > +=09=09function =3D "gpio";
> > +=09=09bias-disable;
>=20
> Did you check what Windows configures here? bias-pull-up would be
> customary for active-low interrupts (although there may be a
> separate PU resistor connected too)

There is an external pull-up resistor on the board,
Alex

>=20
> Konrad
> 
