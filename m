Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408691;
	b=eeS2DvOzhnYlpy0wD8+D5mg1cZ/AjuBd85Rb9y5AygRcajeLuiqBsnVJbpGEXbXjd4jj
	 /JIxyy9+TV5rGTLYy9127zdaFQ4gwHQuBLvbGYmf/5dD9zAY5IbGMg4ayWuoGG+K/fLaM
	 gssPfG7N0z0LxMv110lkGFF1A74JUGvHJWc/GQ4b0rpRg+vtVuQusJT+5u4o2CdR1MRvH
	 WNE9Wy44nL17FGBq+4gT4HbwVqCpVgK7o5FUpgjmzXsOUyj91nQEA2gz7ebCjLrUdpfhE
	 ahc1MxCaBC8SKpqwbfEHOJ/2gJUBVJr1MCEWTlh1w1VJUrpZvDgWPGqSmWOTtSMqxHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408691;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=e4Dni8Ngou/WlQavPmrEAafYcDA6/vVpn+7YY3ZPoZk=;
	b=fZvBDnb766Tqsn0gmyIPLIYx6zoz0SLW+PJUALXBzKygl/JDw+xp7t/W1VO3pMgOP1Ue
	 OtLzwhKo0XmStXtNQqdiNO5JP+sKuSDAl0uVAfhYXy80wvpZRHF+AHTDb2h4FXu8YGEs3
	 XgDSESczyRjHmgPu+a8ISzX6uR8Nkg+xVIWwyy6w/ROEJUOdas3+vj7sPnOCf+KE0GN1g
	 826rTlHuBzI3qvrLyzF+R118wkGC1Jyxx+zKkwFBoe7rCJu26R1KrLthLL/j9cxFQhRgP
	 vlLzNujZPzkYQ6Lcmn8VNPAl05LVpo/6QYlZK/N7SSP+Sf611Be1cB3wIZr7C0tV31Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=QVlprtbK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ro4CDaWf;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA9606A31C
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 Oct 2026 01:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABA9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm3 header.b=QVlprtbK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ro4CDaWf
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4BA407A0157
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 21:04:50 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 30 Oct 2026 21:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1793408690;
	 x=1793495090; bh=e4Dni8Ngou/WlQavPmrEAafYcDA6/vVpn+7YY3ZPoZk=; b=
	QVlprtbKR5TKxCAYd1oWIeoVwgaQeID7iSgbxUv8s4lDYnWBinJ1EQbn0aWhpdh6
	Ih7N5G1YPofd51QIVqjXObQURbYtjhgcndRp0kvonr9eckLyLfIwkferI6vJCP9m
	YHUdZq9SSgXzptb8JIY0lRgmVIFQPygEWIKETUfO7zMd8M9GDy86Wnh7kOx8QjCe
	XP0KMcilYJHiiC4QqQbV3MfV6bRJnWibvyZiZNLpDbgQYIWXOXCAJ5hp62cTgsHe
	OeqQ546suWSCIF0NsYLJUOd0OmYU+JgL8M8EePUJjnlYNVQJEsB5MXmsWy5BsQPM
	2jJoCbWM14YfioYHU9C7tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793408690; x=
	1793495090; bh=e4Dni8Ngou/WlQavPmrEAafYcDA6/vVpn+7YY3ZPoZk=; b=R
	o4CDaWfZ2nINg3ZAuLx6vNeLRBOu9nqDd8i4RGjZoT0IjkeYcKOh8TJuea3Pe8Nd
	w12Wb9PrnLYAqjHsJsztLyLJTgpHv8gZC+8diWVoHQ79w5nlicbGRn8q/Eqw+Fje
	YwvS9ZVWIu6uZcbGDJNNoVMzEvAoUhHL2uLGLp5SvZHVrTFkzQIdLUfZkZ7c8Vhr
	c9GyOu1H+XiuBgrXmaN6lBKWUbUdr8VPJ2WItyCSBkVXDTw1raahDfJczfPJT3UR
	LWiAt47UintUpwOFogYzpG604EFKpNfkJ1ZD6AroQzSY1QkpJxBV0MQYbHD2EHRx
	1DQS7OEQoqV4tTcL09uhg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793408690; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:R9BzMJmhwmsGW6mZ8nz8WXgo8KbAhv1IcFVZDnMgBl+3GVI
	E5ALniDj9KimoxIKfvwIyR9RJ9JkwXVbDFWf6TdvPdx2qeL26XdgwCKHlSSPe0or
	n9tV2i1AeuCQX+aZx7U2G0R6r/HE6LBOd3mnHLbW/nlmu8ECpA28C396WK+XTKSU
	N5++LNwQOKKRTMFx/7biidkBAiVisn8xyBWSE+m1L3CEaECoh8YItM3gqTElYJs1
	DVizF9WizRpCUMFklivrUX5Fcbi2nSwRlgSek7Ji1OCTEGBUKRfhM557Cd8o+Y6M
	Mh+kIi/dfAEv7mGXAvW1hJmXP6cE3W18FRqoYQg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zF1B2Sh5A6d7cyGVROb/WdsmxVrwGWInJy1E0O8f55w=:jSqRcCsOQPyUHJeUIdGs5AJaR3mnY/BmsXfBUnoN5Dg=;
X-ME-Sender: <xms:sD7lamTVCTEJ5MI2IM8DMOZcoyc-8a3vaUJO_N6i2WYDGoAve2GGOw>
    <xme:sD7lammHpgKQOhXAWX4wn39WgSOJjFuXPsddHIgnseOIsMhLQOsnx9AZNV-8A8prz
    LMib4ogoBRddAYJbKp4kcLyG5U6GUGngNhuBFQky4r07bd-EKC6LC8>
X-ME-Proxy-Cause: dmFkZTF4aLbpB2xkeAnYb+1y1fpKVL4XVKKArzCdRG0M0neciSlUSi8YGJFwY4BJ2DTq1I
    q/GHS7qps3+/O6S5BrDH9MydczKffGCUsuuNOGtGNnNlROh2FAPM+wDvqmv/+qF0lszXLJ
    ibxTm+ahWGAZs55IOL/cZn3i/u8C4uVk20DGMtBopALZNIsA6AK1gvWP53cdzvnPt67H2n
    J6UuTX0yQJufAAygSak9wIDoO1NVSv/py8/2BCLOwvy9u1BdyTmvfr8L+XDJ54PtqNPsSN
    d3Hd5puXJi3GRF9ejaweC4/tIzWodOUfCPlfoAEm8FzWwsewnctgxZq822DplgNduhfbj4
    lpEUfA3ZcwFXPB39+pe0X2fuYAmv3gVC59Ha5XNP50nqLm3ZvPGUQXJM+vligANsCQKJtO
    w2bsR7v1wzKiDnzCr9Oxo2sGkvaL07ZC/GuNXJoUjls99Ys2Nq8bdtlkn2qDkJ7p5vsQB3
    lt54NAN8smoOUByZ1ufoxdR83EZEWr8lfZagKiA6y6bVdlUaw2Sz5ZnH4Sb7F1KkjsXGHy
    GWVtJXV5On9FUfDCshjX+FYxtxOxKxDRCRy1YMf+jrCHUJ6DUuHS0CKsweBOBuQ2jZA7B3
    68VP30eArcSnKNrRkAjf3Rp4gsh6SPDH5zLnxkGJcj8LO3fnpuqZcBWMNBiA
X-ME-Proxy: <xmx:sD7lahz9LRbrl6d3Qu3izvJqarO7GcYn6Yc4_IcQF0jNVlj1M-IR0A>
    <xmx:sD7lakXuQJElfTnNgVEizEZ3mlW6u5hEQ6wlg-kPMmwBpi0tGnVCsw>
    <xmx:sD7lal9JcQg-ljC56vnU4td08sL5hscuPIbHB3Ckv9plm8Th4_uGAA>
    <xmx:sD7lavsOvj6znF2GzIZswcVhbzNbzc0G4mfhrkTbF9bPphCf_8PhIg>
    <xmx:sj7larl4-Ygqdt0-TDXixJkqDaH6Meyr1L8z-nXsONfzqBs-kdVRezm9>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 78A4E2C00082; Fri, 30 Oct 2026 21:04:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: ALnJWhZBkwXc
Date: Fri, 30 Oct 2026 21:04:28 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 surirajat@gmail.com
Cc: "Hans de Goede" <hansg@kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net,
 "Mark Pearson" <markpearson@lenovo.com>,
 "Hans de Goede" <hdegoede@redhat.com>, rajat.suri@dell.com
Message-Id: <43dd4cfa-9fae-4450-a583-2d6e07ac9b49@app.fastmail.com>
In-Reply-To: <1df64b2f-dc28-963a-0fd5-a3e77ade9e27@linux.intel.com>
References: <20261030135435.308058-1-surirajat@gmail.com>
 <1df64b2f-dc28-963a-0fd5-a3e77ade9e27@linux.intel.com>
Subject: Re: [PATCH] platform/x86: lenovo: convert mutex_init() users to
 devm_mutex_init()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Rajat,

On Fri, Oct 30, 2026, at 10:03 AM, Ilpo J=C3=A4rvinen wrote:
> On Fri, 30 Oct 2026, surirajat@gmail.com wrote:
>
>> From: Rajat Suri <rajat.suri@dell.com>
>>=20
>> Convert the mutex_init() calls under drivers/platform/x86/lenovo/
>> to devm_mutex_init() so that the mutex lifecycle is managed by devres.
>>=20
>> This removes the need for manual mutex_destroy() calls in wmi-camera =
and
>> ideapad-laptop, and fixes thinkpad_acpi, which never destroyed the
>> hotkey, brightness, volume and fan mutexes on its teardown path.
>>=20
>> Details per driver:
>>=20
>>  - wmi-camera: bind notify_lock to the WMI device and drop the
>>    mutex_destroy() from remove().
>>=20
>>  - ideapad-laptop: allocate the DYTC private data with devm_kzalloc()=
 and
>>    bind its mutex to the platform device. Calling mutex_destroy() on a
>>    manually freed object is not possible with devres, so the kfree() =
and
>>    ideapad_dytc_profile_exit() helper are removed as well. The memory=
 now
>>    outlives the platform profile registration, which is also devm man=
aged
>>    and therefore released in reverse order.
>
> Lets do this per driver.
>
> Clearly you when beyond the scope of devm_mutex_init() here (the summa=
ry=20
> in the shortlog on Subject). It's easier to write a focused changelog =
when=20
> you don't try to combine many things into one.
>
> Whenever you need to start to use bullet lists like this to describe=20
> variations, you almost always want to split things into multiple patch=
es=20
> instead.
>
>>  - thinkpad_acpi: bind the hotkey, hotkey thread data, brightness, vo=
lume
>>    and fan mutexes to tpacpi_pdev, which is registered before any
>>    subdriver init runs, and propagate a possible failure from
>>    devm_mutex_init().
>>=20
>> No functional change intended.
>
> Not true, in thinkpad_acpi case you wanted to add the missing=20
> mutex_destroy() which surely is a function change.
>
>> Signed-off-by: Rajat Suri <rajat.suri@dell.com>
>> ---
>>  drivers/platform/x86/lenovo/ideapad-laptop.c | 23 ++++--------------=
--
>>  drivers/platform/x86/lenovo/thinkpad_acpi.c  | 21 +++++++++++++-----
>>  drivers/platform/x86/lenovo/wmi-camera.c     |  6 +----
>>  3 files changed, 21 insertions(+), 29 deletions(-)
>>=20
>> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/p=
latform/x86/lenovo/ideapad-laptop.c
>> index fcb5ed7035f5..ee8e00bdaf6b 100644
>> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
>> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
>> @@ -1172,11 +1172,13 @@ static int ideapad_dytc_profile_init(struct i=
deapad_private *priv)
>>  		return -ENODEV;
>>  	}
>> =20
>> -	priv->dytc =3D kzalloc_obj(*priv->dytc);
>> +	priv->dytc =3D devm_kzalloc(&priv->platform_device->dev, sizeof(*pr=
iv->dytc), GFP_KERNEL);
>>  	if (!priv->dytc)
>>  		return -ENOMEM;
>> =20
>> -	mutex_init(&priv->dytc->mutex);
>> +	err =3D devm_mutex_init(&priv->platform_device->dev, &priv->dytc->m=
utex);
>> +	if (err)
>> +		goto pp_reg_failed;
>> =20
>>  	priv->dytc->priv =3D priv;
>> =20
>> @@ -1195,24 +1197,11 @@ static int ideapad_dytc_profile_init(struct i=
deapad_private *priv)
>>  	return 0;
>> =20
>>  pp_reg_failed:
>> -	mutex_destroy(&priv->dytc->mutex);
>> -	kfree(priv->dytc);
>>  	priv->dytc =3D NULL;
>> =20
>>  	return err;
>>  }
>> =20
>> -static void ideapad_dytc_profile_exit(struct ideapad_private *priv)
>> -{
>> -	if (!priv->dytc)
>> -		return;
>> -
>> -	mutex_destroy(&priv->dytc->mutex);
>> -	kfree(priv->dytc);
>> -
>> -	priv->dytc =3D NULL;
>> -}
>> -
>>  /*
>>   * Rfkill
>>   */
>> @@ -2487,8 +2476,6 @@ static int ideapad_acpi_add(struct platform_dev=
ice *pdev)
>>  	ideapad_backlight_exit(priv);
>> =20
>>  backlight_failed:
>> -	ideapad_dytc_profile_exit(priv);
>> -
>>  	for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>>  		ideapad_unregister_rfkill(priv, i);
>> =20
>> @@ -2516,8 +2503,6 @@ static void ideapad_acpi_remove(struct platform=
_device *pdev)
>>  				   ideapad_acpi_notify);
>> =20
>>  	ideapad_backlight_exit(priv);
>> -	ideapad_dytc_profile_exit(priv);
>> -
>>  	for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>>  		ideapad_unregister_rfkill(priv, i);
>> =20
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/pl=
atform/x86/lenovo/thinkpad_acpi.c
>> index 4f81855ad721..8c7d6f281ae3 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -3381,10 +3381,14 @@ static int __init hotkey_init(struct ibm_init=
_struct *iibm)
>>  	       tpacpi_inputdev->close !=3D NULL);
>> =20
>>  	TPACPI_ACPIHANDLE_INIT(hkey);
>> -	mutex_init(&hotkey_mutex);
>> +	res =3D devm_mutex_init(&tpacpi_pdev->dev, &hotkey_mutex);
>> +	if (res)
>> +		return res;
>> =20
>>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
>> -	mutex_init(&hotkey_thread_data_mutex);
>> +	res =3D devm_mutex_init(&tpacpi_pdev->dev, &hotkey_thread_data_mute=
x);
>> +	if (res)
>> +		return res;
>>  #endif
>> =20
>>  	/* hotkey not supported on 570 */
>> @@ -6834,7 +6838,9 @@ static int __init brightness_init(struct ibm_in=
it_struct *iibm)
>> =20
>>  	vdbg_printk(TPACPI_DBG_INIT, "initializing brightness subdriver\n");
>> =20
>> -	mutex_init(&brightness_mutex);
>> +	b =3D devm_mutex_init(&tpacpi_pdev->dev, &brightness_mutex);
>> +	if (b)
>
> b ?
>
>> +		return b;
>> =20
>>  	quirks =3D tpacpi_check_quirks(brightness_quirk_table,
>>  				ARRAY_SIZE(brightness_quirk_table));
>> @@ -7575,7 +7581,9 @@ static int __init volume_init(struct ibm_init_s=
truct *iibm)
>> =20
>>  	vdbg_printk(TPACPI_DBG_INIT, "initializing volume subdriver\n");
>> =20
>> -	mutex_init(&volume_mutex);
>> +	rc =3D devm_mutex_init(&tpacpi_pdev->dev, &volume_mutex);
>> +	if (rc)
>> +		return rc;
>> =20
>>  	/*
>>  	 * Check for module parameter bogosity, note that we
>> @@ -8913,11 +8921,14 @@ static const struct tpacpi_quirk fan_quirk_ta=
ble[] __initconst =3D {
>>  static int __init fan_init(struct ibm_init_struct *iibm)
>>  {
>>  	unsigned long quirks;
>> +	int rc;
>> =20
>>  	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
>>  			"initializing fan subdriver\n");
>> =20
>> -	mutex_init(&fan_mutex);
>> +	rc =3D devm_mutex_init(&tpacpi_pdev->dev, &fan_mutex);
>> +	if (rc)
>> +		return rc;
>>  	fan_status_access_mode =3D TPACPI_FAN_NONE;
>>  	fan_control_access_mode =3D TPACPI_FAN_WR_NONE;
>>  	fan_control_commands =3D 0;
>> diff --git a/drivers/platform/x86/lenovo/wmi-camera.c b/drivers/platf=
orm/x86/lenovo/wmi-camera.c
>> index 89ecbce60bf4..de4596686d2a 100644
>> --- a/drivers/platform/x86/lenovo/wmi-camera.c
>> +++ b/drivers/platform/x86/lenovo/wmi-camera.c
>> @@ -107,9 +107,7 @@ static int lenovo_wmi_probe(struct wmi_device *wd=
ev, const void *context)
>> =20
>>  	dev_set_drvdata(&wdev->dev, priv);
>> =20
>> -	mutex_init(&priv->notify_lock);
>> -
>> -	return 0;
>> +	return devm_mutex_init(&wdev->dev, &priv->notify_lock);
>>  }
>> =20
>>  static void lenovo_wmi_remove(struct wmi_device *wdev)
>> @@ -118,8 +116,6 @@ static void lenovo_wmi_remove(struct wmi_device *=
wdev)
>> =20
>>  	if (priv->idev)
>>  		input_unregister_device(priv->idev);
>> -
>> -	mutex_destroy(&priv->notify_lock);
>>  }
>> =20
>>  static const struct wmi_device_id lenovo_wmi_id_table[] =3D {
>>=20
>
> --=20
>  i.

I'm slightly hesitant as we've had a few of these cleanup changes go in =
recently that then broke things by changing behaviour unintentionally; b=
ut the changes look fine to me.

I'm assuming with the Dell email address that you've not tested on any L=
enovo hardware :)=20
I did run a quick test on an X1 Carbon G14 and didn't see any issues (co=
vers thinkpad_acpi).
I'll confirm on some other HW when the next version comes out but I'm no=
t able to cover the ideapad or wmi-camera changes unfortunately as I don=
't have that HW.

Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
