Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E734E289811
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 06:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771138595; cv=none; b=icKaGZNAa7sxq+TQ+VuPe6UQHQMkrtoykrffJ7/Su8dzTLb50Ka/Kt2Z5jC3FatekMuRe9cavhv+UnqpkXuH5fwPJe8Nq7nSo8Dzg/bSPdXECC5ITEBaLKWvRTBcjinwVraT1ku8oHSZWd1JH6X7+izwdKcBJ4Ss7whgb9LVpWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771138595; c=relaxed/simple;
	bh=RCwdMDWKsWmDBh5lYLAfhMaKMsBEbDwp+umfX8AA8OU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=coPZkLKvCfI5WHRk7NIfFh2YvrCk5kZCkHT5Vu5QyG9eakXfBUO+x/YBS0VNWwg15tqXwsM+wK7CRk6nfk/nGCW76fgEkJtFVK+w+Bg4PM0XiLyPSQulGtaXzdmxHXO2DRfb65gj8yDhpJnBg7AarbsA1xOWascAGYMrR2DEnVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGZhNhUq; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGZhNhUq"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-567543b8989so922629e0c.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 22:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771138592; x=1771743392; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnTBxeIkRWeU69R2ymoPSN9dMAANs8Aq39FC2JAq+ho=;
        b=JGZhNhUqXREUVjO+jScT2UsKMl+W4UR/nfrLUfT+bcjNm3M1PGk66wdDdPldhX/PII
         TCl07Yu66ac7e9eH9YTl/q5H9JZXiunH8KzgkdK6RT9IvDC+J1t4O+1m2Uk+R64GOsdI
         gDGz9+13yyt/lLPvctBT0W3EL8npL2yBzUyuL6H9o5fUOt8ei8WTkYao/u9ptst1u6yS
         18YyDvlfsuYsZPxqVr4yaZA0+jgXi5jW2PXDQREAvuXF3/R9jFOH1KTyXLCpNna5dZIY
         7taVAGUHhPte3GmX6RVtg+vub5do4STFGitoWDwVl0MdgAVxJp7YyT6mwpOWSfcp12CM
         33rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771138592; x=1771743392;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KnTBxeIkRWeU69R2ymoPSN9dMAANs8Aq39FC2JAq+ho=;
        b=V5zQigJgNq+X35Q4pQIzM9agyhXdVS0nNnmNgaSTvD8TWjBiaF0Rgv1LKzsYpwKarL
         a632elKNWax1cqPLK3QfCosWliBlGQpm/WhsAP3aBnrBLuuFzYNf7/NBuMV/WO4M5CpQ
         g/ySlgcx2KFMwqAOcWRdYggZmaZ33LXN8vPfujB6uZ4ujq1abfUnWOsJpuDSGAIGUp/6
         IJEjMiFpJcLMQleUCBQMz/mcxneK4yV5iLEO3XksIcNaT52WvoQ14wqecoh7Xy5GhTlA
         x09ltxBxyk1AbkxfBS79vtT+mY4Oc9J8TZVn+0aNc6ku23/T3T7xIbcekICRjLHBxM6h
         gi4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQMHAyXqxzE4tFGNkC1gqwmgbi6/G5rez6ElYWrqwGNQUQOj5KE2R+ONkO9JKxlp6Lzfozyt4ihlkj0kRuolT3SwEy@vger.kernel.org
X-Gm-Message-State: AOJu0YxFVxU3UiluinAPhxxJ2KiUg3hFM+/fHigARo67y2bMSIQEgRl0
	DoZ6yiJtDogA0t5qVCsCjUSXSphI4Jk6tPK/fSrgI+QMbv15cQvBzLUN
X-Gm-Gg: AZuq6aJsGz64wC4j1H5HOjWdkCCSBr/0eZqtL2+ck+38Kdik2Qe2xde7RLPppwCOlex
	qDJOu3JD3vko9PH1rdM5ZbGiLmCHtlahCWfUxqTjSZQQmg3SFLxDjbFwCOoCcolK6s1jVeselkr
	TYqNhbA7d8iOy5d137W9Im9f7rF1uYsFb/vwzpx5HrT0jlSpmf4WfO+DA/7qZlbs54ZlVvMB1UH
	GneAEFDbi2zcm1nPq7uPQDJTny49vTGK/6MxP/YIYvjLlC/GDcCtlJbRYB8XiLh1hllPuRynKXc
	lQ/BIAEOzPcTwV137Ahae6B/Xpc6CggDcVOlZc/gQkiwjltmYPHLB+jRJXrhR4XLsEqpX2Ox0F5
	3Dt+qkQW9M4EidaMjUjqMgym6QGpGKWOFo0Pg/UzZ8cCUhh5oqBOAdy5oM8n2PrMtm+at82HxlM
	CpDkJQ6gUmxXcD8w==
X-Received: by 2002:a05:6122:1b03:b0:559:6960:bdf9 with SMTP id 71dfb90a1353d-567682bee63mr2306064e0c.16.1771138591931;
        Sat, 14 Feb 2026 22:56:31 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd343306sm5696858241.9.2026.02.14.22.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 22:56:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 01:56:24 -0500
Message-Id: <DGFC895HL78M.16RQMINS8UI7O@gmail.com>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf"
 <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>, "Rong Zhang"
 <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] platform-x86: lenovo-wmi-other: Consolidate name
 into single const
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Hans de
 Goede" <hansg@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
 <20260215061339.2842486-6-derekjohn.clark@gmail.com>
In-Reply-To: <20260215061339.2842486-6-derekjohn.clark@gmail.com>

On Sun Feb 15, 2026 at 1:12 AM -05, Derek J. Clark wrote:
> In the next patch a power supply extension is added which requires
> a name attribute. Instead of creating a third const macro with the
> same information, replace LWMI_OM_FW_ATTR_BASE_PATH and
> LWMI_OM_HWMON_NAME with LWMI_OM_NAME and use that everywhere.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 876834af838e0..8e52f692f8605 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -92,14 +92,13 @@ enum lwmi_feature_id_gpu {
>  #define LWMI_FAN_NR 4
>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
> =20
> +#define LWMI_FAN_DIV 100
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>  	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> =20
> -#define LWMI_FAN_DIV 100
> -
> -#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> -#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> +#define LWMI_OM_NAME "lenovo-wmi-other"

Hi Derek,

This name doesn't work for HWMON because the core forbids dashes '-'
(see [1]).

> =20
>  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
>  static DEFINE_IDA(lwmi_om_ida);
> @@ -454,7 +453,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *pr=
iv)
>  	}
> =20
>  	priv->hwmon_dev =3D hwmon_device_register_with_info(&priv->wdev->dev,
> -							  LWMI_OM_HWMON_NAME, priv,
> +							  LWMI_OM_NAME, priv,
>  							  &lwmi_om_hwmon_chip_info,
>  							  NULL);
>  	if (IS_ERR(priv->hwmon_dev)) {
> @@ -1253,8 +1252,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv =
*priv)
> =20
>  	priv->fw_attr_dev =3D device_create(&firmware_attributes_class, NULL,
>  					  MKDEV(0, 0), NULL, "%s-%u",
> -					  LWMI_OM_FW_ATTR_BASE_PATH,
> -					  priv->ida_id);
> +					  LWMI_OM_NAME, priv->ida_id);
>  	if (IS_ERR(priv->fw_attr_dev)) {
>  		err =3D PTR_ERR(priv->fw_attr_dev);
>  		goto err_free_ida;

[1] https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/hwmon/hwmon.c=
#L910

--=20
Thanks,
 ~ Kurt
