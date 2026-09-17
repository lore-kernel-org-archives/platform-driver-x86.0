Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE7F3DAAC8;
	Thu, 17 Sep 2026 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789641752; cv=none; b=lHh72eX0HBGR5lfGFOhpschBfMpdE+wI4UThWKAnG7WH3GeIPjAstNw13FBqPh48Kt5d4LYWnMb58WbkAWwUX25YiGb5suG6qrBAOoLQ5pYW+w+5dxSd1ouR05qeCney3rLMjY1ukfS0Oh7VeNFLYCZdeEwhA9IJeNEPJEP8Ky4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789641752; c=relaxed/simple;
	bh=Sdu1QdJXLl5fKN2H1Zmr8q1Q9k4eyWvsiHunJN2BLbE=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y/MywNT1NhlfQDV+PapdW8o7MMTJxEzShUvsIW3DRGFKXfHFTB6w2+hmxSSN7SQhOEgsdkL5fayXJWQrZBtc1OHZU15x2vwZghhHDtZNb4dKd+Qm1ctESlSxaF9uj491N72dgG3b989cg9BZWb3NQx/WQusELPm3wTlkRcIxMZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=e100mr5D; arc=none smtp.client-ip=79.135.106.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="e100mr5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1789641745; x=1789900945;
	bh=hilsoWfRYvib+HqLqQ7I1by3R5QMFgv9V6/EFQHPy9k=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=e100mr5DSYey8COjJpcMsoaJK7nWKDs2yXQdviODXSmMNHY8KFwCegmzYd1EOA5iQ
	 7m/FREGVroLRVAJwKZeKm07Rf9h2ChvCyOnAauoTW329/XnUOOU8Ka+/cxZWKebBTr
	 S6qIU7/5b+4ZKLhGErRDkJAAPBSJdfWv0jV1qDHpBr/k7Uay7GGaa4Wf6M0ltlXTDs
	 /ju/44Vcwrt+JcNY7nY2ir3/gbwDN5wQHX0s6m5ESq62ri+B4IDGe+dua3x3vxiKE8
	 wNcctoT+HcWDDsEpoDGfaIb4OCj1ftnDDX5i8qU33xZ4SIpKU0+GPftwUlIYu3hs7n
	 B/pkpYCVSsFkA==
Date: Thu, 17 Sep 2026 10:42:18 +0000
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Nir Yehoshua <nir@ciphersecuritylabs.com>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: validate custom fan curves on enable
Message-ID: <475a75e6-6656-4f4b-a472-588c52ae3839@ghoul.dev>
In-Reply-To: <20260831-fan-curve-validation-v2-1-36f4223aedf6@ghoul.dev>
References: <20260831-fan-curve-validation-v2-1-36f4223aedf6@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: bb4774e8e428a2b35ddfbe745889f913b3b7e5e0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, I have come to realize that this was delivered to all of you. This=20
has no business being here. Apologies.

Cause: b4 reflect misfire

On 8/31/26 23:45, Ahmed Yaseen wrote:
> Custom fan curves reach firmware unchecked, so a curve whose temperature
> or PWM decreases from one point to the next is accepted. The firmware
> does not respect such a curve: a first point of 100% followed by 50%
> leaves every point running at 100%. The kernel keeps reporting the
> points that were written, so sysfs stops describing what the fans are
> actually doing.
>
> Check the curve when enabling and reject it if it is invalid. Validation
> is done on enable rather than on write because fan curves are written
> one point at a time and are inconsistent mid-write.
>
> Fixes: 0f0ac158d28f ("platform/x86: asus-wmi: Add support for custom fan =
curves")
> Reported-by: Nir Yehoshua <nir@ciphersecuritylabs.com>
> Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
> ---
> Changes in v2:
> - Rephrased second paragraph of commit message (Ilpo)
> - Link to v1: https://patch.msgid.link/20260828160743.31957-1-yaseen@ghou=
l.dev
> ---
>   drivers/platform/x86/asus-wmi.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index a65090429ca7..3b743fec5c64 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3714,6 +3714,33 @@ static int fan_curve_write(struct asus_wmi *asus,
>   =09=09=09=09=09 arg1, arg2, arg3, arg4, &ret);
>   }
>  =20
> +/*
> + * A fan curve is a set of points the firmware interpolates between, so =
it
> + * only makes sense if neither temperature nor PWM ever decreases along =
it.
> + */
> +static int fan_curve_validate(struct device *dev, struct fan_curve_data =
*data)
> +{
> +=09u8 *percents =3D data->percents;
> +=09u8 *temps =3D data->temps;
> +=09int i;
> +
> +=09for (i =3D 1; i < FAN_CURVE_POINTS; i++) {
> +=09=09if (temps[i] < temps[i - 1]) {
> +=09=09=09dev_warn(dev, "fan curve: temperature decreases at point %d (%u=
 < %u)\n",
> +=09=09=09=09 i, temps[i], temps[i - 1]);
> +=09=09=09return -EINVAL;
> +=09=09}
> +
> +=09=09if (percents[i] < percents[i - 1]) {
> +=09=09=09dev_warn(dev, "fan curve: pwm decreases at point %d (%u < %u)\n=
",
> +=09=09=09=09 i, percents[i], percents[i - 1]);
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09}
> +
> +=09return 0;
> +}
> +
>   static ssize_t fan_curve_store(struct device *dev,
>   =09=09=09       struct device_attribute *attr, const char *buf,
>   =09=09=09       size_t count)
> @@ -3798,6 +3825,11 @@ static ssize_t fan_curve_enable_store(struct devic=
e *dev,
>   =09}
>  =20
>   =09if (data->enabled) {
> +=09=09err =3D fan_curve_validate(dev, data);
> +=09=09if (err) {
> +=09=09=09data->enabled =3D false;
> +=09=09=09return err;
> +=09=09}
>   =09=09err =3D fan_curve_write(asus, data);
>   =09=09if (err)
>   =09=09=09return err;
>
> ---
> base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
> change-id: 20260831-fan-curve-validation-991770300ff3
>
> Best regards,
> --
> Ahmed Yaseen <yaseen@ghoul.dev>

