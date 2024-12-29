Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED9FA50;
	Sun, 29 Dec 2024 00:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735433335; cv=none; b=am/xhtR/cftjW+G/VnVMFvwwX109DXfCjIUfJ7uYIKZU0OrwNiNC4wfq8nJT1YgG2pxZiVzitpsrOxGGzUX05MKgmvq5HyU7A/N8EqqFDwvKvDBPw7wWRIRqAs8ig8hNtt9a19Oy4UubEOyAH7MWGUf7jsuwGf/F9wDtAU0Xbe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735433335; c=relaxed/simple;
	bh=DuENfGOZlyymLYDwal5n1/SquMxxnFK3XGrhfuLTYvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JTybhwKqBlICrmvo8CiSAJkSwme0VmSoJ8tOxd8ti6jzjnFcZUfz4gtGgylTApSFIyekBFqVsxo26ak4CBB3R/opegWIUzP4Jx8bRW43a4Fop+G5uCDzyGVmBzRZpIPzLFbdO95HH9wloxaDne//yv2/B9//N858BSmTfyb9b0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=REW+p9C1; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="REW+p9C1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735433318; x=1736038118; i=w_armin@gmx.de;
	bh=jdDIFEGM90olagaL/UfnU5X6w7rTSvcvV20Ma7xz6HM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=REW+p9C14sDynGTc3w0J1bRG5NfaN5zDIFJQb0BSyqiIrjbpxKb+2xqDcSsrORKH
	 HxzWLbwHINOtCeC8tQ+kG/gYmaAJ8sO+B5+XHB53/3vyRsp1hazAtCEjk89Tl2lxf
	 CZA15IzPGXA1t5pSY2q809MOh887CmZUzlZdXQGUvfXUdY+xY/hNdIefDFTfVxPMT
	 /dBRpZCWKLCHI0zd8Pqi7CBa84+CXp6TA/ahZJTLRv0xnqpyue8Poq+b8joHoVo4l
	 H9alvkI92ONM92jn7fo91vJLsF/ylp1KTylNVLLyT2cu3bo9taOPnhuQldRlbg0PN
	 EyotXEQ7dEExAipU6g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1tNHde0oDY-008b8A; Sun, 29
 Dec 2024 01:48:38 +0100
Message-ID: <3acc5097-a1bb-4352-acd9-9f31b35dce91@gmx.de>
Date: Sun, 29 Dec 2024 01:48:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-camera: Use
 SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS
To: Ai Chao <aichao@kylinos.cn>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241227091008.257567-1-aichao@kylinos.cn>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241227091008.257567-1-aichao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2ddRYmwdlLDxmMI4CvhI1MRX5QQIxd6pb+PaMna63ktISHKV5je
 XJ9oAsm9GuRAD67ma7Cf8rD2R6JkDid31GeBgdx+xC/dTV/jLjibhF1cz0CYMJC/GPmUVL1
 BUVoqWpLf2lpBAVIOUNnooktk6A811VGjKA3htP0r5Es8xJbvuLN8pO0/yrEASgqN0h1Maa
 rDdw/a7btuopAKaYUFqow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fKRhzcWAvXI=;GyRTrxOS6vVDxqugcR4JNwcHSZy
 D8GmOZi74aGTHyIkxYvaZLmXhAVTbUk8XvGTDU90sGxAXCGm1tf9/mHoUS/PJcH1VeA9l92qC
 cd/ozelHRElqOr+m7jU1tY+H/N4KiBYPWKXZzjH7dudAG06AS0muiUHe01VFm/4X5NbLgFuTF
 TGz6C1C+F+GARDBRCQUdbJIrHiW2kqTkMVfiweP/tCHRPyUAaWlB+0lZeWP3sXGRYPqk1yrMQ
 l/XMkkZWug51FftGW5F/laegIFZa1aTNELxvzjMZJfIMK11qo1yQjlUpbxlkfzWBgE22WaoLI
 jqqgdNI3gCNRTun1OiA0u2YMhKyPVGt2g8pnfWdVNgJDVUxbJJymN+d1uOu3bAV70IW/lU0vN
 RjxgiRsJSmEHtJ+AVh0aL4aYJ3nt07g6h8Zm49khvW6//tYWCQAgWwz4gJ4YKvM/z8gJD9HqG
 92r/92PFTcP0jKQe19755+d5PrR0NFDzmnikbQBevetYOr5V8C9e09zTPxFq9gRxOdcoTyuCb
 hIYSdAWxjMX1R83hJN88ZzMM3fifqq6kWmo66F9M7/yTB7sbYc+nV+uY1mAlmO3YoJrNObaLF
 bEk4mT0aVG3b3UBfS/koDe89/Nh9PJKls15CVJPxSw7xrARUNPWrOccuoG1IjMQFCOri1RK9J
 GPAAVN3u3kd3RFG3ngcMgkDQELkmLFDZn0fE0MW2phwPbBJbDLlTe1sD++H0ModcYXMVuV0YT
 X5HcA78hSiufmB8aSFBC1vA2u2/NNDaEnE2nbyhQNlUT/4AYRtZpNhPrvoW9f/sueP7M0uvTa
 H976dcIrpW+TYjrtRrV5BgarXj0r3B68ZOY7zRwuXWnPh2TE11vBAPdcUqyumeHLWqTIBfGCq
 JEsKqtg69bKsJmJQ70Ucm/e0m47QhNsg3/U5173idBZMo+I8q0ADhHMJRTvMtgEs2gT3EEh92
 EquOQdhpdCAQSu6+jCltXxBHKKg0EaLX4djx6hzEv2ewvKl6XWtE1cpnIJcQH37Xhs1S09v2M
 vitx2qreV/nB/dNOGdVaYEzjBjaHVbDs5oFvnQlyJfPOIKrT3iiH+OkCG6LYVSMOOq8m2w26O
 MP/Akbpi1nH8YgrfG84Ri1qNFI0qaq

Am 27.12.24 um 10:10 schrieb Ai Chao:

> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> change for v2
> -Only delays the input-device registration and switches to reporting SW_=
CAMERA_LENS_COVER.
>
>   drivers/platform/x86/lenovo-wmi-camera.c | 55 ++++++++++++++----------
>   1 file changed, 32 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform=
/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..ad296acaf562 100644
> --- a/drivers/platform/x86/lenovo-wmi-camera.c
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -26,10 +26,33 @@ enum {
>   	SW_CAMERA_ON	=3D 1,
>   };
>
> +static int camera_shutter_input_setup(struct wmi_device *wdev)
> +{
> +	struct lenovo_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +	int err;
> +
> +	priv->idev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!priv->idev)
> +		return -ENOMEM;
> +
> +	priv->idev->name =3D "Lenovo WMI Camera Button";
> +	priv->idev->phys =3D "wmi/input0";
> +	priv->idev->id.bustype =3D BUS_HOST;
> +	priv->idev->dev.parent =3D &wdev->dev;
> +
> +	__set_bit(EV_SW, priv->idev->evbit);
> +	__set_bit(SW_CAMERA_LENS_COVER, priv->idev->swbit);
> +

Please use input_set_capability() here.

> +	err =3D input_register_device(priv->idev);
> +	if (err)
> +		return err;

Please set priv->idev back to NULL if input_device_register() fails, or el=
se
lenovo_wmi_notify() will assume that a valid input device was registered w=
hen
the next WMI event is received.

Also i suggest that you do not use devm_input_allocate_device() since you =
need
to be able to free the input device should an error occur during registrat=
ion.
Better use input_device_allocate() and remove the input device manually in=
side
lenovo_wmi_remove().

> +
> +	return 0;
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
> @@ -53,13 +76,16 @@ static void lenovo_wmi_notify(struct wmi_device *wde=
v, union acpi_object *obj)
>   		return;
>   	}
>
> +	if (!priv->idev)
> +		if (camera_shutter_input_setup(wdev))
> +			return;

Please move this piece of code below "mutex_lock(&priv->notify_lock)" to m=
ake
sure that only a single thread tries to register a input device at the sam=
e time.

> +
>   	mutex_lock(&priv->notify_lock);
>
> -	keycode =3D camera_mode =3D=3D SW_CAMERA_ON ?
> -		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
> -	input_report_key(priv->idev, keycode, 1);
> -	input_sync(priv->idev);
> -	input_report_key(priv->idev, keycode, 0);
> +	if (camera_mode =3D=3D SW_CAMERA_ON)
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
> +	else if (camera_mode =3D=3D SW_CAMERA_OFF)
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);

The second if statement is necessary, we already validated camera_mode bef=
ore.

Thanks,
Armin Wolf

>   	input_sync(priv->idev);
>
>   	mutex_unlock(&priv->notify_lock);
> @@ -68,29 +94,12 @@ static void lenovo_wmi_notify(struct wmi_device *wde=
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
