Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4211A9B55;
	Mon, 30 Dec 2024 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735570763; cv=none; b=Nl9urc5VX12buqld6IhJaz2LOeHIPcTjhly6L/OjL5mBT1La3YfPkOlRQjlmK5TNY5jj6U5NueGZDGz404ywU82Xh7JQ7FUIkqPkvtJVERMmDueeogkT6YW+u0lSdBKvPFEp675PpDtfuEueL2jJcKLYgPlcQ6S1KcWjW4Qjtz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735570763; c=relaxed/simple;
	bh=0rmeFCdUKlH2DGR7wQhZGM1UycqQU7iOWBzX34VGAq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JEgT3ZQ6o4MbggWXE6YYsT8tUiJo0pJz+g+/GT8rJhWrxrzL89qfN9lT3xnTBHFyjY+CZRPToU7eLbFUxOyGfWMOeNnT5FMKwRJWjRg4svffc9bHas8RN/Mzm7o0IeS8WRcREy2pzBGWxb1Y34hem/WOv20TxvHadwMNT757nOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=msRXbcfY; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="msRXbcfY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735570744; x=1736175544; i=w_armin@gmx.de;
	bh=y2al9FmKROvQSpmixcvJt5Q6rz5s+jcnVbtLHiWyQcc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=msRXbcfY7MZPrRSJGomyL7diX+XEve44NtkySATASHuik8k7tb6HTwezALINwmW1
	 BLevJH+r4Lbj/4wH9BpUgVkyLKUqYxHOf4qmzpyKv4QczjokdIQC6+kfk3t+Z5Qs4
	 rsxCuJtSdd2+FqDhAF8h4Os765f1Q3GYIsHJqDQUB2WJ6jO9XEr1jmL7DRp4AkXhL
	 0qpzDIzkBvQxsNfsu/6jF1vU0sj3TNjEQSwhXCpsH4zXijq/PyFO8CI021s3qjGDQ
	 OSXDr3KpQMxWI/3vRchSyudFZY6x95f3y1TosMzu1M1laOD1is3728z2dbjVEmWw8
	 dqhU0XvrVaK5eEQzdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmUHj-1tsmHR01An-00eezw; Mon, 30
 Dec 2024 15:59:04 +0100
Message-ID: <d8f3bb68-8c08-45d6-9e34-760e869e05de@gmx.de>
Date: Mon, 30 Dec 2024 15:59:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: lenovo-wmi-camera: Use
 SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
To: Ai Chao <aichao@kylinos.cn>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241230055721.3843339-1-aichao@kylinos.cn>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241230055721.3843339-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:626sgcO9twPZaQjNDUY8R+m2CKjjjBZ1w7w7w8hf5uNFQ90ljPl
 PcH1ehpZ8C7t24v8Apos7pguexw6esDP8bUqbc02rGBCBykT6tofQEFHikclM9bkv23dDKm
 QdFi9hJbCA67iCkZvL+PlvRJagjFV5O4ax4zMJ3Rzg/9WAFe9ZX2JMZhz+uOKRz5g5iCvTy
 DGMnYMCNWWhxw0pf8hz3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b3TGIEU2W4I=;ZufHpRd9WHFCltcmyl8/F3pinDx
 rj1zpGIN7DVPdnCAmiExihfvErhsmvokCXzL8fT9h0CL1rXzAvp0s6FWjGKnb+FHMoxuPJjGH
 KXkZDXNd0YVi3L+GhjIKroe4Jd1mhCb/k6o3yNltWkjclOnEV8IP56G+8eznv6J01QmdEGD1a
 BxxMGgRWQXP9RZKdkdwD3XE8hjeCssbcwgYTtc+tU3WwBXr2KVvKSi/OAE8TVu/wIBpVxaYHZ
 LTqtEr3oFo7WXEhfNU+g8q1qxEtdBa4iSTyF1r06QDbn3HTxRTQtHO8EfgFcUC70kpvtG5TlH
 L5qwdflhqsT1XKNgeqCmt4QSAu1r7Ao+rttUZ6T9W9tm3Y7eIlmHYdw3sY/Cuz1VIjQhgDcJ9
 R+ojRWOYaemPktn52TS+f4TyU7FyK424c+IpwLW8ODphKEa9QHRPvkXaLHphI1uZr4YsGpz3r
 AIx+WPBu4Y3A5pMwNt2u2+RI5u9OBUgpR/eNKDIOmyHHPsgzEoobsaM9jN5/EntJKK6QP1Zuc
 eqvv0n3vNKJS8h9GNi5naay4ym2sHcoCaFPdtDQXsxJQpStt5uO3N7kpuL3PN3ZN/UrytncT9
 dMrR66l3eWo9Tg7L7RKVtFcBc4rPTfqADPmuZtUpIjzp9/tSi32h1EAFYgPHioMS1/nOAspSy
 RokuTOXYA5C+NVWhJL1MZ8NmZlBvPPjhmDFTUDjbhPY5xqljG6tmjQ075C6o2xmEtiu9odGDf
 4r+/9XWonyfswkifrTobQX9St9bBLtvq5YVTRZTNefOLYBtlE6FxIA4N0J9Sktno4ocHyUF1G
 cVeo332iAo3s9BN2epuVAAy7bu8EGwrY22S3Vk0GO06lzeJHN9XrWON/aNYWqBefe3Z2aFm39
 Lc0l7iV8StptSGD3lGy9ydIweLRsDPNZGznlONak5Pue1/+aPjnmr5LC55lrf7XrbvEDPZXmd
 xgdeFY9W7XnwJ2cNImSlFsQOoxsRmUogaogpcwcghwUN39tLkcZfmCDZy3+eBhRP+yOfrRdbU
 M+axpN1K0hX9PSi/PHJ0Cx24ypBMEfAI4xkSdc9++kg0TdtkT2X/JHzky7IFHF9wXNeSKNNCY
 eG07aQE7e9/0OJCeq7fuVcHskNFUoN

Am 30.12.24 um 06:57 schrieb Ai Chao:

> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> change for v3
> -Used input_register_device and input_allocate_device.
> change for v2
> -Only delays the input-device registration and switches to reporting SW_=
CAMERA_LENS_COVER.
>
>   drivers/platform/x86/lenovo-wmi-camera.c | 59 +++++++++++++++---------
>   1 file changed, 36 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform=
/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..e08960fabf9e 100644
> --- a/drivers/platform/x86/lenovo-wmi-camera.c
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -26,10 +26,34 @@ enum {
>   	SW_CAMERA_ON	=3D 1,
>   };
>
> +static int camera_shutter_input_setup(struct wmi_device *wdev)
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
> @@ -55,11 +79,14 @@ static void lenovo_wmi_notify(struct wmi_device *wde=
v, union acpi_object *obj)
>
>   	mutex_lock(&priv->notify_lock);
>
> -	keycode =3D camera_mode =3D=3D SW_CAMERA_ON ?
> -		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
> -	input_report_key(priv->idev, keycode, 1);
> -	input_sync(priv->idev);
> -	input_report_key(priv->idev, keycode, 0);
> +	if (!priv->idev)
> +		if (camera_shutter_input_setup(wdev))
> +			return;

You need to call mutex_unlock() here before returning.

> +
> +	if (camera_mode =3D=3D SW_CAMERA_ON)
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
> +	else
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
>   	input_sync(priv->idev);

The documentation for SW_CAMERA_LENS_COVER says:

	"set =3D lens covered" Since i assume SW_CAMMERA_ON means that the camera
is enabled i suggest that you report a switch state of 0 if camera_mode
is equal to SW_CAMERA_ON. Thanks, Armin Wolf

>
>   	mutex_unlock(&priv->notify_lock);
> @@ -68,29 +95,12 @@ static void lenovo_wmi_notify(struct wmi_device *wde=
v, union acpi_object *obj)
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
> @@ -100,6 +110,9 @@ static void lenovo_wmi_remove(struct wmi_device *wde=
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
