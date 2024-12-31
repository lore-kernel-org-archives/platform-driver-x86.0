Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132C19BBA;
	Tue, 31 Dec 2024 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735658370; cv=none; b=uekW86pPT60mnc7d60cMJqul4CUCRM+7jnBYB6EjgeQCgGSyzEuiZqn1AkOZeKDwkU3lcLFPsE6ltUTt3qFPkQH94iH0PN1EzObp9gdMqaIx0p7xIX7iKIbVdMKocNRULcMW4oLYNF+pxM2FeOg1j7Z3examL0YhuwzuNOi1YI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735658370; c=relaxed/simple;
	bh=YDXolLQBS0bB1pMRwE7z4MUoovP049J6iDA5Yn83EVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=edZNMiDqg0S1XAYK/7g5K/aCcbUilnQi9DQsYsog0KJhg+lnJw7WE8dVy1fh9bdZgBZySBri50PGOq7UDqa+lX9RP2laAM936fa+7RhSZAURQEDliXrAsr94pWGKnFMYAtnnyOvUfNOutISZjZxfm3BJQZPA4Vhm/70pNp8t0pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XbKxV/2N; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XbKxV/2N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735658354; x=1736263154; i=w_armin@gmx.de;
	bh=smD4lFhsniCkmYA9C5PbtHxc6YfPCjxMZb12G1+C7cs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XbKxV/2NkJ+L79KEss/NHb0p34y6utDE99JPs6p86NylzYQDg0tIFiF1jSKeCkUb
	 xgnQ0Qk9AErECajpxTbwiCbXTpldSk9CSGXrD0wS+diYoMmYyvGbOV3eB5S5VPJjI
	 z8kzHxkLNSx1yfD6F5QlP3lDBB+GUrzVLeSJ/Kv5WWYblQp73tTzcYr6BUC86hc/U
	 t7f+tWh+03/KujhUyJEmJvnA88dbmZK8IkDb6jUU7MvtWdv4WX/pWwZpQ1BWNt7He
	 n4xWPLKSbXRoceRzYZrC8kgTnFdLBALgU/coefbgxROSEGU51c7Zl72l9qkJA3WrU
	 KQ+iAFohJ6ucXYy5Lw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKZ3-1tD21G3bFn-00L0bl; Tue, 31
 Dec 2024 16:19:13 +0100
Message-ID: <3733c3a7-63ae-4708-8a40-f5e0f1158ab4@gmx.de>
Date: Tue, 31 Dec 2024 16:19:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: lenovo-wmi-camera: Use
 SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
To: Ai Chao <aichao@kylinos.cn>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241231061303.1142106-1-aichao@kylinos.cn>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241231061303.1142106-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kee3AUCrhhbAWxaogRniHmYNxeb+/GmFmX5hGR4HEcuxwsH5tcO
 7nTHeWSu/A2LEh6evCjJsvyXSKyzwq43JcdTo8kDKLaOXsa1GTtbQOVRIXLmVVVX55YrWOi
 M2IWILsKGBHs52s759gzx4I5p+ZKuQgQr0oPV1FKvfCFoIPVAPBvh+s7f4gx4UgKKrYHXD4
 LD/iVue97MW4nNWaXGiJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a7B+spNc+0Y=;AdT+jB7xlvmrabRBhIM77PlZfMk
 dSpU8Tb3uMNfCEniypDU/zavryThlIJB6sWa23cnT7R53YmZ1G8enXxxYeQzQ18HpQiJh4zy2
 DzF6WeIDy3x0tBFuUMYGCuB1r+rxf3AyxVAf/lh0Hkhc4DVB9aW9Zrgw9ePrnrUP1fSY2xs2q
 5kVzOJcO9WQ/DPRESrSHqx33NBTLEvC3lk5yQuD6eAJ1dhTq2Kd/6VxIFRJHRCDZiUD8TwL0w
 TPu+zCaDx+ZOM6DezeBaF5B5bqZVHnWmuESwMmckC1qGflduOKA0lKqycCzGlR/bZTpJ8jgHc
 +24exe16xlGA3aD9nz/f5eJGGEsLxek0Y1bMb65kiV5ZdyInKaWMDwlNX/viT4ji0Utl6oXKO
 9NUVI2FcliRR676wOqshPhUqUtABtV4tivaT9Sbc9vI5aa3yRnNheYPrhgMyV8/zm0SIx17EV
 Sc81o+ZTxv7rLob/2yvhlAnThiQfMY52uaK4m4jousImFnNWEfqdVrBDOEs4hRDELxP2Ct8gV
 +0P3k457Rs932SWt8uvt2+7v/qDkEtDXfZy5j/joVdyOjApLFXU2eWGXfDF9YdVCJN2BVquiG
 fX4nWbRyWJFGOjyKlcBgqaLgAqwZk5zvRUlcRJNGBk+ozLu7ec/azwjdxMgoxTGhrBZ8A1cmV
 aCJ4eb3jMYuDBw58ySUPVIo7iM6beDhDj4gtbhQrp95apR/JMKgWfgwCSa8jsi2uyS0Fn8PJZ
 2U7zou/tL0IRp/Joxm0XYkpt64DaXQ2dSy8TYoPmffrPFYjZfW9efqAWsnGN5B1xiWIZsj+yt
 tOejGp/EdZ7XMdHNxDkeau1VZ1VpXYp5XvwhoZrWknF/+rh6m3bGB7Svku/AiSTVJ+Agq18AK
 HGqrmSolEvpLfPRjxoyTM96VI1L7g4mDr/puXNmEuAa7g2QkZYDT62DkFoG5V3x1JGHuu80e0
 lEHsYyv6VL1+uELvGpW8fdRTK/d8qI4elRfCOWEdNb4qz4GRGHalhYCkWaHr8Pffdo3hNvqcr
 U9hcd3L6umPFEwwOTice2z60I+esW/bS/vEjtoUtRnme33oFEdvEoaTu8ly394Vho8/8CBK8H
 hulDev4omZheuW2My2TRgfClNbT4qk

Am 31.12.24 um 07:13 schrieb Ai Chao:

> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> change for v4
> -Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
> change for v3
> -Used input_register_device and input_allocate_device.
> change for v2
> -Only delays the input-device registration and switches to reporting SW_=
CAMERA_LENS_COVER.
>
>   drivers/platform/x86/lenovo-wmi-camera.c | 61 +++++++++++++++---------
>   1 file changed, 38 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform=
/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..2a662b3c78f2 100644
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

Looks good to me, however i just stumbled upon an interesting comment rega=
rding input_event():

	NOTE: input_event() may be safely used right after input device was
allocated with input_allocate_device(), even before it is registered
with input_register_device(), but the event will not reach any of the
input handlers. Such early invocation of input_event() may be used to
'seed' initial state of a switch or initial position of absolute axis,
etc. So maybe it would sense to call input_report_switch() on the input de=
vice right before calling
input_device_register(). This would make sure that the initial switch posi=
tion is correct.

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
> @@ -55,11 +79,16 @@ static void lenovo_wmi_notify(struct wmi_device *wde=
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
> +		if (camera_shutter_input_setup(wdev)) {
> +			mutex_unlock(&priv->notify_lock);
> +			return;
> +		}

Please add braces to the outer if-statement.

Also if you implement the seeding of the switch position inside camera_shu=
tter_input_setup() when
you can return early if the input device was registered since it would alr=
eady contain the correct
slider position.

I imagine something like this:

if (!priv->idev) {
	if (camera_shutter_input_setup(wdev, camera_mode))
		dev_warn(&wdev->dev, "Failed to register input device\n");

	mutex_unlock(&priv->notify_lock);
	return;
}

Other than that the patch seems good to me.

Thanks,
Armin Wolf

> +
> +	if (camera_mode =3D=3D SW_CAMERA_ON)
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
> +	else
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
>   	input_sync(priv->idev);
>
>   	mutex_unlock(&priv->notify_lock);
> @@ -68,29 +97,12 @@ static void lenovo_wmi_notify(struct wmi_device *wde=
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
> @@ -100,6 +112,9 @@ static void lenovo_wmi_remove(struct wmi_device *wde=
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
