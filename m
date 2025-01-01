Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903AF4ED;
	Wed,  1 Jan 2025 12:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735735531; cv=none; b=HgFaLMH4IC0ZgZeIHXBwdtXRIXAp2y+TbgB+XWRDwp0F+6QFmwYmdoMAAU5jQ+qemI7AU96F3tssKwQfwgdND4ARid38vAHha/zMwq30ciQcsNSa0WgC3fvBL6baKmtdOQl9iRfcaWcMh/EpDzu4cz8k+GhC/pXck5RmeVsSIM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735735531; c=relaxed/simple;
	bh=fBIWp48wyTwviZXDbG18ADPkTXf8DbmLE4DO3DFXpdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qt8SjoMDoog0ApHhlL4Q3mfVZSkiX0ccv5mXdFYCZ+X7beQ+cGhiZ7cEzH9lsHeiKcbVQaVHnlP3GvTi6WPEqoKT1FkK4CWnFL+O4P2iD50lqUGq3M/XFuYGcJlv/e5fObgsGczBY8vdcR3zEG5Tmt2+Kmxgfa19roEwQqal+CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CJyyRcMO; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CJyyRcMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735735516; x=1736340316; i=w_armin@gmx.de;
	bh=eZYp+Fk79imMg2+FWEK8U8smSupYuhCeenNMQvjwq10=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CJyyRcMOi9kuQZchxD4t/Y+7b8Ramihz0NbgEpceCAAvQrYDA+Y6/FitFGjqeZvG
	 csbPjnuxtey6hv49TmbyZlh+xX8FX5WZZwG9LBcSKcNClE87Cgi+F+IUcMxWTJ2S2
	 9STuFGMannWQFeoemT9Zp/mWH3+wgVDiV6LSNuk5rB3w295NzyKYB43/ZUxEqgsE9
	 KsQyZdPszAqdURlbRuu74nZjZBJG2aA/zsjcEmG/f+174Z49LJ9zHtXT2Ex/1dvgL
	 Uejs5NPYTTP84qCKekQdC0E0aY4cPOSkk2YdVThi2/0VYWnZMyVQK159DbmEzTqJZ
	 WvJsPDdnc3afFxHmkA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N8GMq-1tXWQN3O6q-018IkM; Wed, 01
 Jan 2025 13:45:16 +0100
Message-ID: <63006764-1aae-4be0-a372-8a095bc93a41@gmx.de>
Date: Wed, 1 Jan 2025 13:45:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] platform/x86: lenovo-wmi-camera: Use
 SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
To: Ai Chao <aichao@kylinos.cn>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250101102922.1784551-1-aichao@kylinos.cn>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250101102922.1784551-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UsLrB5HVTRGLBErehYVqCYPGoWElHrmPNV+pKSVuTulVJtAUo2M
 CLh/ajkUz2smZtoieEmv7HJqBYYLkDc/CV14ZCOtBdg2K708IdSh2gUdEOkKmHiliWME+2a
 sIexzsTxGR6yApmUfNloZC88VQRH5UfQQA2RzgU3BHMW/Pa0rbKRN6uW+iqMQXgsaVLcDAd
 VjhL/ucC36ESTXqVEgo8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zLrtqy1DIzQ=;q2iCMvMD4YLs6Fq8GssJQbGqLjC
 TYEv22WCfZwcOsV2QJqfj8S+Fl/2ggIAwA7xWy/XKgF+1xfsw/7Q6zCppLO0jXsRFV5X/yaFU
 Fv7OMBuY4NUS90tBraIxVyT2c+npSDSvFxt4s0uFqS2jlWqLXGuz9Dr3HO/ZoM+EHtsumqoNA
 ggVdZdR4GcxwAZLDh6paMmrOIceG/JrxjLXWqbAiGdaQAnLUiHfZ3Flv4PgWr6xnixFgJrMxA
 CM8JCbgGJ/Z+RZXUEjuLFVWb+s2kDXnD1SN1S0JRX/+JT0p0pM8S1RZO8AG7BHdm1vllKiqWd
 Hovht9iZTKrk8/0YVqkO6nvWt/HhGUUkvmH+1l7k1l35X1XxrNT74vsV6ucXgDpAP6pGzmKxv
 QwMb6aU19P/myOasttLLaLZluJwqO3nNielIA8tEFXMRitrBY7D7FPyidD9Dx/B9tlmrTAfnA
 HBROhV2H9431hgpZ3IaWg4/e43ePKkebjG3ms+M2WRTJmBalCXCkv8cdrIqLzlDXBW1ns7TTY
 ltoCRupUXWKD3zf8bJavq3kapU8rnI2Aba2gKlrYY3riuNIiBjawbDfIekjh1ZrqDmd/tQmTl
 jmF3UC3dl7ESTkjjRdum/lN8iTgYzQA/uXyKlH+I9nE/howga7WcYwDIGtqlBEb8yfWaedpsj
 ZzwfKXFmBfnh7lLIi3aLj9tLQiikI4KWr8rHor+OX5tm/vdWiLkc/I+DmdZnZQ119k+lNU4qb
 +dE5lmDPNlx17J8rAdyboNU+ZhW3RdldBEcSU+1kF491lo5yK95kNrm7hHxlFZ+J3utqrWXax
 Ss1wVNXM+NuVNehgESWeBRubu6bveKHPQzGNS+tSAld9A8JyEYcxjl9kYgSP4i8y30Ryc6sVZ
 e5nBruCVicTVEmb0glbrJFd6Y2eQph9xwSDtNPNcH8Zpr5J4cu+DSIZVSPZfYJmzVML/D4Rma
 A8D9MNCNtrHgDaLf6WX6deppsBuUAykJobKTjbFCC5szWWgAn/qIPEq9EL5bOAQJek43ZjT8L
 +rIjAoSED1bao5WHe+usK/pPlzpZ0nnXO2Hb66JYq6BXvagEHGS6DRXXuzNztro0oajEPWDjt
 dgCg5CTYQ=

Am 01.01.25 um 11:29 schrieb Ai Chao:

> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> change for v5
> -Add input_report_switch before input_register_device.
> change for v4
> -Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
> change for v3
> -Used input_register_device and input_allocate_device.
> change for v2
> -Only delays the input-device registration and switches to reporting SW_=
CAMERA_LENS_COVER.
>
>   drivers/platform/x86/lenovo-wmi-camera.c | 67 ++++++++++++++++--------
>   1 file changed, 44 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform=
/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..ceed441a0161 100644
> --- a/drivers/platform/x86/lenovo-wmi-camera.c
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -26,10 +26,38 @@ enum {
>   	SW_CAMERA_ON	=3D 1,
>   };
>
> +static int camera_shutter_input_setup(struct wmi_device *wdev, u8 camer=
a_mode)
> +{
> +	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +	int err;
> +
> +	priv->idev =3D input_allocate_device();
> +	if (!priv->idev)
> +		return -ENOMEM;
> +
> +	priv->idev->name =3D "Lenovo WMI Camera Button";
> +	priv->idev->phys =3D "wmi/input0";
> +	priv->idev->id.bustype =3D BUS_HOST;
> +	priv->idev->dev.parent =3D &wdev->dev;
> +
> +	input_set_capability(priv->idev, EV_SW, SW_CAMERA_LENS_COVER);
> +
> +	input_report_switch(priv->idev, SW_CAMERA_LENS_COVER,
> +			    camera_mode =3D=3D SW_CAMERA_ON ? 0 : 1);
> +	input_sync(priv->idev);
> +
> +	err =3D input_register_device(priv->idev);
> +	if (err) {
> +		input_free_device(priv->idev);
> +		priv->idev =3D NULL;
> +	}
> +
> +	return err;
> +}
> +
>   static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_obje=
ct *obj)
>   {
>   	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
> -	unsigned int keycode;
>   	u8 camera_mode;
>
>   	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> @@ -55,11 +83,18 @@ static void lenovo_wmi_notify(struct wmi_device *wde=
v, union acpi_object *obj)
>
>   	mutex_lock(&priv->notify_lock);
>
> -	keycode =3D camera_mode =3D=3D SW_CAMERA_ON ?
> -		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
> -	input_report_key(priv->idev, keycode, 1);
> -	input_sync(priv->idev);
> -	input_report_key(priv->idev, keycode, 0);
> +	if (!priv->idev) {
> +		if (camera_shutter_input_setup(wdev, camera_mode))
> +			dev_warn(&wdev->dev, "Failed to register input device\n");
> +
> +		mutex_unlock(&priv->notify_lock);
> +		return;
> +	}
> +
> +	if (camera_mode =3D=3D SW_CAMERA_ON)
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
> +	else
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
>   	input_sync(priv->idev);
>
>   	mutex_unlock(&priv->notify_lock);
> @@ -68,29 +103,12 @@ static void lenovo_wmi_notify(struct wmi_device *wd=
ev, union acpi_object *obj)
>   static int lenovo_wmi_probe(struct wmi_device *wdev, const void *conte=
xt)
>   {
>   	struct lenovo_wmi_priv *priv;
> -	int ret;
>
>   	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		return -ENOMEM;
>
>   	dev_set_drvdata(&wdev->dev, priv);
> -
> -	priv->idev =3D devm_input_allocate_device(&wdev->dev);
> -	if (!priv->idev)
> -		return -ENOMEM;
> -
> -	priv->idev->name =3D "Lenovo WMI Camera Button";
> -	priv->idev->phys =3D "wmi/input0";
> -	priv->idev->id.bustype =3D BUS_HOST;
> -	priv->idev->dev.parent =3D &wdev->dev;
> -	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_ENABLE);
> -	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_DISABLE);
> -
> -	ret =3D input_register_device(priv->idev);
> -	if (ret)
> -		return ret;
> -
>   	mutex_init(&priv->notify_lock);
>
>   	return 0;
> @@ -100,6 +118,9 @@ static void lenovo_wmi_remove(struct wmi_device *wde=
v)
>   {
>   	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
>
> +	if (priv->idev)
> +		input_unregister_device(priv->idev);
> +
>   	mutex_destroy(&priv->notify_lock);
>   }
>
