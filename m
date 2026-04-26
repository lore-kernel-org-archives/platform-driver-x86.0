Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B93171AF;
	Sun, 26 Apr 2026 16:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777219750; cv=pass; b=S0CoY/orOpsWcRd/SZ/78jzdl5vOWZhdv+ynY8sBD+b8U78agSHrQkXp9oqXW9H7XcYrprlkKztt9BXmCbY0cGOvqqxQIrovaH4hSugPKmc0Uh3HIrqdeOL0rHI+jT37wX5LY3LynsjmgEpLpulUeLUWUJQhY9alTgz7XtTB3cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777219750; c=relaxed/simple;
	bh=w2ZxqN2MfDhaG3H89vpPxaicrBqUY8S6/NJDaBnshDc=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=s5T+sZK3l45cQNRwgikvjPJXmAEJYg//RV4O7Y71FiFqVwkiXVY3GLLimPt0k1hXgak6Jf73cwUUrFSNDxZqpU3bYMBX0hVLRXQzZemR5PCMXsoWOzd9Uehhn2ONjHierFZ0M+RUo+eiGyVrslW1Fmjc4E/pGNsP8K5IJ/lDXiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=eIJc562J; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="eIJc562J"
ARC-Seal: i=1; a=rsa-sha256; t=1777219738; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y6EO+1HTdGJpbWN9pDZCrnjDhZimPeWlGe6pQCI43YO+It2I1DXCsPNBFQ4lk4ceWaEnVNfNXNm5LN8+e6CjPupv/ceW5Czhn6OTdn8fWux+z9+m8i4SvYKVxROXw1YBkuQJ22UWpvOyFpHpwogjDUfTX0UIUDrvwIWxuJZSo9w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1777219738; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+HazFKomqqP8qZX7eAln7VpP1YXb6DfKJV8ARiHDeLg=; 
	b=Uu5Uy95zeb9ZjkjU4SXHD66BwXtkRbZiYuzDNSV+WeHvD0A2IaAOQKyLx53FmBVExcttxLatpB2Yl2U30E7Wxy7BPQBko+KDdU2kAs4iKg07IoSjJzA/LnwWfzYsE7LuK/+Lu2q/bdhKc2+KOjzYTZtBPC6MR23S11XKl5E2F0c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1777219738;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=+HazFKomqqP8qZX7eAln7VpP1YXb6DfKJV8ARiHDeLg=;
	b=eIJc562JgNor3BrFbXjKr9y6/vDTJ1T7n3trr1dhm3KAIqQaKK/Pkad4bgY1jL5u
	YFOxWNrDPDMnSSaFntfUagRbMMsrn8vbgxC9Y9nsySaEEeFEssIMHd8f18V/Vta0rlB
	kDVvVPuTEMFhDxgKsFkG9rNGyonX2GKTddUiq6zWklCFLAXGPyrP1niluK51V/UNdyh
	2QhsNWnF4DB44unSWB5b4Auap47NOuecVI98BDNjPvvzvlP6JRqd2FolRsFCoM9vn5B
	GqXyce/DKpEygRxchqkrH54PG/hol5L/ICWlOSBlfi3j+nEUBMf1y7BqLQkxy9e0Dru
	yL4n3YMocg==
Received: by mx.zohomail.com with SMTPS id 1777219735994646.0901957365562;
	Sun, 26 Apr 2026 09:08:55 -0700 (PDT)
Message-ID: <673b66893c16ca31b403e7e7cba32e9b71a7515a.camel@rong.moe>
Subject: Re: [PATCH v2] platform/x86: lenovo: wmi-other: Fix uninitialized
 variable in lwmi_om_hwmon_write()
From: Rong Zhang <i@rong.moe>
To: Yufei CHENG <cd345al@gmail.com>, mpearson-lenovo@squebb.ca, 
	derekjohn.clark@gmail.com
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260426145907.7295-1-cd345al@gmail.com>
References: <20260426145907.7295-1-cd345al@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Apr 2026 00:07:16 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Yufei,

On Sun, 2026-04-26 at 22:59 +0800, Yufei CHENG wrote:
> When the flag relax_fan_constraint is set, local variable 'raw'
> is never assigned, and lwmi_om_hwmon_write() will pass uninitialized
> value to lwmi_om_fan_get_set() resulting in undefined behavior.
>=20
> This flag allows user to bypass minimum fan RPM divisor rounding,
> but assignment to 'raw' only happens in the non-relaxed path.
> Fix by defaulting 'raw' to user provided 'val' in the else branch.
>=20
> Fixes: 51ed34282f63fab5b3996477cc56135eb4de5284

You didn't run scripts/checkpatch.pl before submitting patches, as I've
reminded in the previous reply to v1.

Had you run it, you would see:

   WARNING: Please use correct Fixes: style 'Fixes: <12+ chars of sha1>
   ("<title line>")' - ie: 'Fixes: 51ed34282f63 ("platform/x86: lenovo-wmi-
   other: Add HWMON for fan reporting/tuning")'

> Signed-off-by: Yufei CHENG <cd345al@gmail.com>

My Reviewed-by was dropped. You should've included it in v2.

Please read https://docs.kernel.org/process/submitting-patches.html

Thanks,
Rong

> ---
> v2: rewrite the commit title to be more specific
>=20
>  drivers/platform/x86/lenovo/wmi-other.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 6040f45aa..6c2febe1a 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -349,6 +349,8 @@ static int lwmi_om_hwmon_write(struct device *dev, en=
um hwmon_sensor_types type,
>  			 */
>  			if (!relax_fan_constraint)
>  				raw =3D val / LWMI_FAN_DIV * LWMI_FAN_DIV;
> +			else
> +				raw =3D val;
> =20
>  			err =3D lwmi_om_fan_get_set(priv, channel, &raw, true);
>  			if (err)
