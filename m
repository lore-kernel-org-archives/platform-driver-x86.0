Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D97343D8A
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 21:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787691740; cv=pass; b=lMG6kOJRiylidOXNy22VoAbkxiybLvdYhWryyT2BpEjbw05I0DrupM+X8nHCAyva2ejwOe4/viZAXZnch+UN52hJPtFKJSHfJvPVvqghB1IqAaPf0acncmHaTrmfV0BX5GW/wPU5rJ0mnT2sMHJHWkXN+8PBt16OUNkGgjEsc5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787691740; c=relaxed/simple;
	bh=8Z55nOfNecibBt1FEq+yGBsNqq8Hmyzrvp9hgj4mrb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAtnNxhG6elTTkCOhyR5GJNIxqW5wATJ6gv/aSRDcQX/oJpF1F8fFIrLjOE2ShUv8SDQ1m9O7mo8+0jfPP93xMi+z5Cbf2rENVSAAz0q2E7eDr3kPtmLRns65CzMoxb3SDgqIHbrlXzrEGlxhXNd7280+O/fDftGDDOtNnJwJFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjJHZerG; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjJHZerG"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7eb5bdb50fcso245326a34.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Aug 2026 14:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787691737; cv=none;
        d=google.com; s=arc-20260327;
        b=djc/nitHYB1Q6KLUf3zEwQs1paElgXa9iA+3eG5Cp+SQDG6l1kRdbvB9oW46BdfCZo
         eMrx9frLb7pTEc2f47jtYkdcssMR+FIMUob/pItqMvDse7Bi1xVP+DJosMEe2+RJHozv
         1VLNCTGY643+Lvvm5UkdXTfv4rr6dy6Bv6Q9JabAP/omZaXT8OeyyByP0R6D52zgeP6S
         LMKtmSLSnzA69aE4a0mqZbOdQaXHwzZHbV9eIXApwSUeoUe724Uj6NX8ER0/OFib8MFm
         6/fozdLbzuHDctgbcM1kclISn1ObA2blCGiMeKLypewvXGluUgLrlQvki5ktcIQWu+XW
         sDWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5e1R7iDOVBGqKm4i7gvnb2yeuebWqXJlNe86yECIkaQ=;
        fh=qGVGCw0GoWGiYjh5rRQE4AWvzI//JH00VKSNM32P2dg=;
        b=ggKN7MQ1DXb5iC3AFm32dv+feEoSOTtsB9dMSxYNHA9eB3NNV+LItTX0CRI+Mi5HFk
         PVHTGKDj4I75maq51zUei0f7n2y3Yd1YbkwTCupuu/MNMvJX9QKjg4DUu9OKDbw9oJt2
         SRtU4/9Ri1fsEgdm9XDp8o3bVu3V+OPMHN3GiokEwWA1Br7bADrd3RJ8jOtiwY1SrsRt
         +2Tmkr9zf9j8Ffs65Y3vC39obgpOezEemipertQXNP4nwBD5HDwlleF8v0QLg2Lt4h1C
         Tdb7s7BQZMnCIuLgVHmsKpEoyXDVvGL0U43VtusHe2uwhrXxNwBLqodU91TaA8yt8+tF
         V2xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787691737; x=1788296537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5e1R7iDOVBGqKm4i7gvnb2yeuebWqXJlNe86yECIkaQ=;
        b=FjJHZerGwdz1KbdMN1v7UFWRNLc09OOaK62LEnHhDLBlhPA/3w0L0B8R8zPCHluvoO
         XSCIVOQfcozsCPlO26pjylh630XvmB67uasVxTqoU8AVPwWBbp6MnRyQeCFADzpDArtC
         V0WPyz1LfWY1msGfChcFK9jRTzz6o3Xv4A/X75EEjAMmrju5d0QPF1QponqLrlmbqR0w
         jNmLkNkq5I5aVGrGeoOgmGjzbsTR0oxxR5OfntVXwUnPpycthGUQfBdQpvDZahvXqFKR
         A9OAHfPdK7ilBzRIswyDgHMVwV8QQogR4xIR8qG7/KCXu/ENLMX6hz1Q8vhxdBHUMjnX
         HQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787691737; x=1788296537;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5e1R7iDOVBGqKm4i7gvnb2yeuebWqXJlNe86yECIkaQ=;
        b=tNCOh0bPprtaam62m7jTMt/Z79sCBwu1DO/KGcEoboDGN5UVeiAcVbHbXUeQLyNyl2
         xGqkC2d9x7/hugpW5HMAOBjyuJSsBhgwrHPWD23aYhKHgGXs7CllV96j1nv1WLhzn2bK
         idyBG5ub6rzAUYT9UrDZhnCiKwQwLiojNSVcmoaiAi5jHh6idqQa93YG6BlJuvDhfK9r
         tdbxK1iv9Le0/yO9ADI1ASHoI5DeDNemidnpksjT466/JbVf13FyGzTPLmoJcTAaWY8W
         VUQG3bq9yI+Oool0tS2UOrMdfKsqYtBRPyayZ0ylW83n1N70oQKf3MrXKieGx9Z1Eq2Z
         V1Yg==
X-Forwarded-Encrypted: i=1; AHgh+RpKqFWB13D0/xxBa8H+WQ1GfEJJpfdHGAZjdYeJR0/fXBTVWumY8GjAlXMltW+DUtX1+WfldYZE+LlphjeDEIqMqFNJ@vger.kernel.org
X-Gm-Message-State: AFuF++kLcddBMMejfXaEYngdkgbiKt8QYOVzTi9UI4PXabZ+xbGx+NPi
	CohD1Rn0BdSSOWffuJMeFOHLmD/+8DPZKKzW7UrPKqM1Wv7HXuAid8No6ECnRnGS6q8pelq+i6r
	kMJJldMiWtUjTlqf758FTxT8+XUCeY6g=
X-Gm-Gg: AR+sD13IPdiAfLqftuGT14Rujq+Ou/EoMpWxwlUaxT2UnwNQjG8Uqs1HhMYGlJPoucq
	58XB7Z8McFicwnaMpPXQEuRRGzzaSijsvXXPXv9/0YTI+54+QnWmyczvnSvdIQMo5saSTFcH7ua
	46cpuV7VJfSrbm6Eaysb3q6A5EyPDXDtBAuRoB0V0lZe5yhrrE83DI/zrmPLgNTzYiuT4IBrN7m
	5Y4sXwrZ+9vzWi+SFxM1bn8ftOw9c0IBaBcr7NBUU8ZUja/yoTz2GN5awy1GPlxakg2e8zCJe1c
	7N2Yhn6b+OwQtOVcdSvlbHVfD2q91ZIPzmXFoLXxF5QvxuTmgm/ypKYSHBNUNHxQ2vG+IasizR4
	=
X-Received: by 2002:a05:6830:6017:b0:7ee:38af:b195 with SMTP id
 46e09a7af769-7f4c4dc57e0mr1972094a34.2.1787691737171; Tue, 25 Aug 2026
 14:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825203553.3725132-1-sakari.ailus@linux.intel.com> <20260825203553.3725132-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20260825203553.3725132-2-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 25 Aug 2026 23:01:59 +0200
X-Gm-Features: AcwNN1VtAJclNRsrkPgeHaIrL9qzOn516dlDtkbrCWTLTGf5OgwIn6sak7oDRMw
Message-ID: <CAPybu_3JSL5qAUTpL27GotvQfSzMtcJGGC68eRsCiZ0YwNBNaA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] platform/x86: int3472: Address Coccinelle warning
 on an error print
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 10:36=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Fix the following Coccinelle warning:
>
> ./tps68470.c:164:58-65: WARNING: Consider using %pe to print PTR_ERR()
>
> by using %pe specifier for printing an error code.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/platform/x86/intel/int3472/tps68470.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel/int3472/tps68470.c b/drivers/plat=
form/x86/intel/int3472/tps68470.c
> index a77ed32abe55..dc777dbac61f 100644
> --- a/drivers/platform/x86/intel/int3472/tps68470.c
> +++ b/drivers/platform/x86/intel/int3472/tps68470.c
> @@ -161,7 +161,7 @@ static int skl_int3472_tps68470_probe(struct i2c_clie=
nt *client)
>
>         regmap =3D devm_regmap_init_i2c(client, &tps68470_regmap_config);
>         if (IS_ERR(regmap)) {
> -               dev_err(&client->dev, "Failed to create regmap: %ld\n", P=
TR_ERR(regmap));
> +               dev_err(&client->dev, "Failed to create regmap: %pe\n", r=
egmap);
>                 return PTR_ERR(regmap);
>         }
>
> --
> 2.47.3
>
>


--=20
Ricardo Ribalda
