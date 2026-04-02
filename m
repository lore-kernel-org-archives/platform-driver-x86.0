Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA63DFC8B
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134369; cv=none; b=RjLlm4D+nU9hMV4TWD/q3DsaK/dMCir7RenAdpb5ekAq6HZO9LJ/s7iPZe/r+C+cNzNDm5/x70n/+uKpkbcWRbOdV2dj8tDkGbu+8KdjpDjsR3KFUEodf9tZyqeCZ9qtAY2w0z5NdXADCB482OeTh+z9wfefbcAvxtILnobOVYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134369; c=relaxed/simple;
	bh=YaYkHV68ueuCuVnlneM4pYTtYtlVoSbxAbJZANjLJ+8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NuTl9S1BQujjys3t62kYO9ipcDPOogCNKcWXfLyiG+JvN41rH46gcATfuvh0w01F7IDo+sxr8jJYnVG+aRFEsy1fxBw+z23mbPro/bKvSKd4MeFK+LFiUxhu8yivzNsdA1JjQOzZoDRnm0PyoF9hBJEgwDouPIiArj1QwMBCtT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=P0Wc0tR/; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="P0Wc0tR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775134347; x=1775393547;
	bh=RlaTN/KkUD6yChDb6Sv3mvP3VzxU5+g5V+ry08YJuw0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=P0Wc0tR/8ajzIrgrb9l2iy0QFyAF1hHCQ0V6csPhkHugoFfSyTn/2FbwKQySmD2+F
	 E+8SSPfNgn3hFa0lkRCBpJpVeGUspE7JsRk28WcT4rN2HFRMA1YURHBBEa0PPDGCtr
	 s+mDV/sJqIAg3XCfonJnpHU2v3pGyePctrek2IPnGzCZ89qM78aPUyxCgXVGSqZ3rT
	 1kQQR3FC6fXW3hlSqovRvrYF1Lu3lVJfXSUi0wppXQe+aQ2XwZdDM9eS01NiefcKZa
	 EHdbK3WQ3pv6xNy0bSPzEt05957Pt8ThjyFgglsLMD/kOiIxb+Z9KSTq8R5ksoL1MU
	 3/s3VLzODYZjw==
Date: Thu, 02 Apr 2026 12:52:23 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC
Message-ID: <oZ3ETRlKitLSlV93KwI5jlHnDIykdpHxhzThD4pT8FVvY48Y0jrPqDuwI81Zrwy8nwXe7DR0ZUKBTEN9SO8bsPa5xBNWlaNS8u_DG6Kcntc=@vinarskis.com>
In-Reply-To: <e9826e27-da9e-4cd5-b368-be3e56f62072@oss.qualcomm.com>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com> <20260401-dell-xps-9345-ec-v1-4-afa5cacd49be@vinarskis.com> <e9826e27-da9e-4cd5-b368-be3e56f62072@oss.qualcomm.com>
Feedback-ID: 158356072:user:proton
X-Pm-Message-ID: 65fa30d0570072eda59ab799a400fd797eda2907
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Wednesday, April 1st, 2026 at 11:21, Konrad Dybcio <konrad.dybcio@oss.qu=
alcomm.com> wrote:

> On 4/1/26 9:33 AM, Aleksandrs Vinarskis wrote:
> > Describe embedded controller, its interrupt and required thermal zones.
> > Add EC's reset GPIO to reserved range, as triggering it during device
> > operation leads to unrecoverable and unusable state.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> > ---
>
> [...]
>
> > +=09=09io-channels =3D <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
> > +=09=09=09      <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
> > +=09=09=09      <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
> > +=09=09=09      <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
> > +=09=09=09      <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
> > +=09=09=09      <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
> > +=09=09=09      <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
> > +
> > +=09=09io-channel-names =3D "sys_therm0", "sys_therm1", "sys_therm2",
> > +=09=09=09=09   "sys_therm3", "sys_therm4", "sys_therm5",
> > +=09=09=09=09   "sys_therm6";
>
> nit: one a line please, without a separating \n between x and x-names

Will drop \n. One a line as in:
io-channel-names =3D "sys_therm0",
                   "sys_therm1",
                   "sys_therm2",
                    ...
?

>
> [...]
>
> > +&pmk8550_vadc {
> > +=09/* sys_therm0, around DRAM */
>
> another nit: I think repeating the name set in the label in each comment
> is a little excessive

Will drop,

>
> [...]
>
> >  &tlmm {
> >  =09gpio-reserved-ranges =3D <44 4>,  /* SPI11 (TPM) */
> > +=09=09=09       <65 1>,  /* EC Reset */
>
> Is that a "this may not be accessed" or rather "you can, but it has dire
> consequences"?

The latter. Triggering EC reset appears to leave it in un-initialized state=
.
When analyzing i2c dumps I noticed UEFI sends some data to EC prior to
Windows driver loading, I am assuming its required for EC configuration.
When resetting EC from userpsace:
- Keyboard, Trackpad, touch-row power is out. WiFi connection drops. Dell's
  UEFI allows disabling many peripherals, EC can 'veto' their resets and/or
  power supplies. It appears in default reset state it kill some/all output=
s
- Holding power button does not reboot laptop, it looks as if it asserts an=
d
  holds EC in reset until released. During this time fans spin to max speed=
.
- Device can be recovered only by disassembly and battery removal.

>
> Would the EC driver/binding benefit from having a reference to that pin?

It will not be used by the driver, and it would greatly inconvenience user
if triggered manually. I would make the reset pin as inaccessible as
possible, but if you say its cleaner to reference it to EC driver and just
not use it, I could do that as well.

Thanks for fast review,
Alex =20

>
> Konrad
>
