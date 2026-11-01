Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793552859;
	b=HvICUOIfAQr5tbsU0ZV1jrh+EyVlHmlfMk13PuaHry4X+69ohdytr2/CttPf+5wZMnmr
	 5n+ElONbo/7VcDyJp+NecaPUqbfoHKdUKrEad5ei+6jJJwzZc+Pwvl516t00vIInykq3I
	 U49Swkjl7lQOo62VM6wl9DEy2/hKEK6iqBNTW2nkizDVQQywJdCnJcBdYGRdeLCypFvq6
	 9VZxUVv8s1hekE30Vkg/qHiadoM5t+iJT3MOwztxgDFbWcBlVPhUkmuRzVdni6eQRRVEO
	 mfOsqYRzgMchFsa/IaxmL4t76xcW6M0aWcndpMBZesqXCEMtH/saW8csnSTlYiuN2vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793552859;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=B8W4VyzG2JrpdCWWsQPNu8MRYmTxyedCjLer/wjTIa4=;
	b=MVRJGpoxZ2VKfRRMaBASsQtY6LsU4PidDXsCY9HKVmvmL72XsHvXpd1n0jW0UWZ+3Fnd
	 tP03xPZEZwPqjzxramx5vl7fnmD8X6gm+FxSRBC7o6lFl6yMYmXgLTQLFWycM6xVBD3WM
	 sW3ZgdQPYPJY25jsgYy1F5tB67yKFaFZtpiCETo/X9tIGScYXh561dBxbEYoAqtDDlIoy
	 udUM1lMQkCBvG55/Rmi+kOuy710jObI2UJkjZjGVGKQVshx6pH9YFbEshuXB2mR6SeDz7
	 nGLXq4NkgWW/FFIXuc2ARwdLKHqMZSO0oiI0ieOf77aWXiKFB3kN3ZBqFAtQY/jrrZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=luRmR5OJ;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0B2606A324;
	Sun,  1 Nov 2026 17:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0B2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=luRmR5OJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793552852; x=1794157652; i=w_armin@gmx.de;
	bh=B8W4VyzG2JrpdCWWsQPNu8MRYmTxyedCjLer/wjTIa4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=luRmR5OJZ9nrbfSev1fp5EHc6/WMb1GJhzyL28tje1UbnhSrTFPj3FKVav0zUNBq
	 w0JBeRxh5dPBTjMxTbsg7woLXBJOtBriiT787pIcBdxgjm1ZnPYAPbBOB11+zqfjc
	 QD6SlzA+FfxWEi37Xmf+WUkxeV/YzprpANuYPmY4TSlvNRoZsgTLWFigHx68PEPuh
	 XfDnbSPhTkAGBhr1aq3i5I/V+lQLWjb3ndhVPz3cvA8rJO+itGV1xtfdlykTdq0Br
	 JApMkJCbecrFXnUftrYQN+SfW4DSm+Q4cW0R4EuckeP2UB7ympx4hZ62G8mV1wXRS
	 uBx57FOuapezLbQ4Ug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My32F-1wbVTn1FZn-0169I6; Sun, 01
 Nov 2026 18:07:32 +0100
Message-ID: <e3d30656-0040-4993-a3cc-fac474909cf7@gmx.de>
Date: Sun, 1 Nov 2026 18:07:29 +0100
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
Subject: Re: [PATCH] platform/x86: dell-wmi-ddv: switch sensor mutex to
 devm_mutex_init()
To: chitranshmandhaniya@gmail.com, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chitransh_Mandhaniya@dell.com
References: <20261027044819.75761-1-chitranshmandhaniya@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261027044819.75761-1-chitranshmandhaniya@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MlVZUc3G9XCOrF/YVdfDXSFrwtuBvS0+FBFsvvMJrMYrszzlFgP
 Hj+8GbDXYBCus27VVLcIesV+ldeUuBVU1iQeug0rpwySUCEsp9QXLCcGww6YmjpYYtblU+/
 fJv1PVMxC0JaDUo9wQ0J6CWo8sb/xctdMz1WtACDWLrUYCoMFoh/cVyq9Tuici8B6oCFDJR
 AyO5EyuYv2UIK4FzSRY2A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BaFtbN982/8=;PZpqtVPr8+jZrcsWkwW073kxzgR
 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

Am 27.10.26 um 05:48 schrieb chitranshmandhaniya@gmail.com:

> From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
>
> Replace mutex_init() with devm_mutex_init() for the sensor caching
> mutex so the mutex lifecycle is managed by devres. This allows
> removing the manual mutex_destroy() call from the
> dell_wmi_ddv_hwmon_cache_destroy() cleanup callback.
>
> The translation_cache_lock in the same driver already uses
> devm_mutex_init(); this brings the sensor lock in line.

Hi,

thanks for the patch, but now sensors->lock will remain initialized
even when dell_wmi_ddv_channel_create() fails. To be honest i do not
think that using devm_mutex_init() makes much sense here, because the
lifetime of the sensor cache can end before the device lifetime (if
dell_wmi_ddv_channel_create() returns an error).

Thanks,
Armin Wolf

> Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
> ---
>   drivers/platform/x86/dell/dell-wmi-ddv.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform=
/x86/dell/dell-wmi-ddv.c
> index f8903ced461b..c7f3d07abbc7 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -548,7 +548,6 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *d=
ata)
>   	struct dell_wmi_ddv_sensors *sensors =3D data;
>  =20
>   	sensors->active =3D false;
> -	mutex_destroy(&sensors->lock);
>   	kfree(sensors->buffer);
>   }
>  =20
> @@ -566,7 +565,9 @@ static struct hwmon_channel_info *dell_wmi_ddv_chann=
el_init(struct wmi_device *w
>   	if (ret < 0)
>   		return ERR_PTR(ret);
>  =20
> -	mutex_init(&sensors->lock);
> +	ret =3D devm_mutex_init(&wdev->dev, &sensors->lock);
> +	if (ret < 0)
> +		return ERR_PTR(ret);
>   	sensors->active =3D true;
>  =20
>   	ret =3D devm_add_action_or_reset(&wdev->dev, dell_wmi_ddv_hwmon_cache=
_destroy, sensors);
