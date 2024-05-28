Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA35A171085
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 15:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716909193; cv=none; b=I6qyONIIm8WkxBAmQdCXfv2UUYgLPcvpvoUhFtUyL8XADuFkXj7B2yT/TpCSKHVCi9FxnIFlsOblOhQ0jNIiraEX0bfrfgd5YFj4gHl0vx47nsPptwFb3Jl627tKPNSDAtHqQ+7mmwvBOVwt3acf6rgTIFi1v0XK8p+hZhOmLQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716909193; c=relaxed/simple;
	bh=bc1gaU0jimcHP4nmj8y1nOebfgtpG/F80UBv3S6uv88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pb9acW1i84BsDPLuzrZZPvHdgTNSUtYqlGJypmGCOuyVIyAim+AdD5ElbPwc8ae4H6p6ibd+be038PJnacaONDFDBrxgqm+MVfyAQSlGP7/SJzUBbJQSxmERZUcoBv5StsX/1dVZNh2Y/e/UkgqAXoG25apWVK4fSVWtn5oRaps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guyhY8ja; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guyhY8ja"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-df4d9b16348so978683276.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 08:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716909190; x=1717513990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wEXZwKJdgLQqBqHcP2FuvqESxVIGZJvO/O2KfZWi54M=;
        b=guyhY8jaDbhwKdFQWHj2SQ6J6OO1fdzKdJ8RwyFisqHbbSxAkSxxAqyeJQumLy9rVv
         PKop0kO+XfU0l6ZHxeSBBBQKaBwzZwFJDJWMyucb/7aPWJYrhA54f6WxMBiJLjAgY0W8
         7/kAyXLYBZgIsm47KELOW3HWHaRBUwWnM77sHZx9FmLArqeqWwMlrf39Wn3kRR6ys7/R
         UWzvyV46nD78wqregA2qdAu3WNKODYeBtL9KiS+51DRWU9X2HHrIsUlXDfvUwRMRsMQF
         iOZVyYshBAuD+EuxlDdBOkdGz5KcVfVA4WtzuaQ9XdeciYiGADoOtUNb9ZDrCy18hjZC
         yFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716909190; x=1717513990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wEXZwKJdgLQqBqHcP2FuvqESxVIGZJvO/O2KfZWi54M=;
        b=q69Cu1iwY0IqTbNWw98GFXaQzT09P6eeDxnSUMXsIL/VP2yf+d+MImNjQh0PzzN9tP
         bIBAFRnvzAKD+6ovb5JAm6/e8NesFRFlKGJdaOxLSZfuy4vC+aUKRf4t5G4Lc4oeqc8D
         BPyBQYo0MAjYQIhU+a0ipljd6bl4xI4q7OjA+sgMrCxXXYrEWtfKf0IePWSj9EKuG1TR
         /VqRJptrk8tEJBsLgHmyFXDaP19FE59Ac3xQXGNf1iL7s7ZrzJXnui+HjgZbZQP4yKeE
         fRFZhHGTFvb7YYZ4TrJ1wlLJtrJtYNFiwpPAGOyrp1YnsSzfzQUiseEntq5wOferZ8kJ
         YDIA==
X-Forwarded-Encrypted: i=1; AJvYcCVej5JTBX5yvke8ECjO0JrcjqXptPXbIpAeL/w2w+DIiARUtMGEX9lukPVa8B1/Q04uEO0DD0gaCHuQLpUbsnJ4aUGfydBHyh5B7NoM7kH5g598mA==
X-Gm-Message-State: AOJu0Yy74ofXX9nWFx7/0poys25ypDgnGdR3tFVBzfbTU9tshvJidwTG
	N7Zo+OOtLgOLpLDtKY+NMsRw4sRO0onfAVx2ww+zAZLE0rsrKXOg0yCDWI3nnMMbeqKQW9V4Z3L
	T3KGBEU7ui2kIblkQQy+4drnM9FkM6AFOLdBGyQ==
X-Google-Smtp-Source: AGHT+IELm1omO1wuTcw0Q2vGtaouTh8qJh+L8tegQHzARNG0l5mU2Cg7HCqEbHJH9QdriZCLJhqdzvjc38hiHJMqFkw=
X-Received: by 2002:a25:800e:0:b0:df7:9242:281f with SMTP id
 3f1490d57ef6-df79242931emr8456060276.49.1716909189568; Tue, 28 May 2024
 08:13:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
 <20240527-yoga-ec-driver-v3-6-327a9851dad5@linaro.org> <bbsdvqjo2ikljnuvupolpdfstsaegfqyg2ct7bt24evcorcfjt@3fw5eicxxuik>
In-Reply-To: <bbsdvqjo2ikljnuvupolpdfstsaegfqyg2ct7bt24evcorcfjt@3fw5eicxxuik>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 18:12:58 +0300
Message-ID: <CAA8EJpr9i=+uJGqxeeVYKwJeMqzQFg6FvqnChKNQqXLLVcB66w@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: c630: Add Embedded Controller node
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Nikita Travkin <nikita@trvn.ru>
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 May 2024 at 18:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Mon, May 27, 2024 at 01:03:51PM GMT, Dmitry Baryshkov wrote:
> > From: Bjorn Andersson <andersson@kernel.org>
>
> Please align this with the S-o-b - feel free to use either form.

Ack. I'll check what went wrong.

>
> >
> > The Embedded Controller in the Lenovo Yoga C630 is accessible on &i2c1
> > and provides battery and adapter status, as well as altmode
> > notifications for the second USB Type-C port.
> >
> > Add a definition for the EC.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 76 ++++++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > index 47dc42f6e936..d975f78eb3ab 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > @@ -370,6 +370,66 @@ zap-shader {
> >  &i2c1 {
> >       status = "okay";
> >       clock-frequency = <400000>;
> > +
> > +     embedded-controller@70 {
> > +             compatible = "lenovo,yoga-c630-ec";
> > +             reg = <0x70>;
> > +
> > +             interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&ec_int_state>;
> > +
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             connector@0 {
> > +                     compatible = "usb-c-connector";
> > +                     reg = <0>;
> > +                     power-role = "dual";
> > +                     data-role = "host";
>
> I was under the impression that this port is wired directly to the SoC
> and as such this would support data role switching as well.
>
> No concern with that, but just out of curiosity, is this not the case?

It is wired through the external Type-C port controller RTS5437, which
also controls the vbus pins, etc. The UCSI firmware reports both ports
as host-only and doesn't implement data role switching. So, having it
as "host" is a safe bet.

I must admit, I also hoped to be able to use this port in gadget mode,
but it seems to be nearly impossible.


-- 
With best wishes
Dmitry
