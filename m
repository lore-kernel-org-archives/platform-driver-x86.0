Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD33DA7CC
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Mar 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844261; cv=none; b=gH+P78atI6/1I2DQrWAAFg16SW8Aeqg4sPvaOIxWWLIkCx1KW9vJukTsaw9itkgK7Rv0UTrj5IXPnqt+hGPjG0OUrHD7aTgePT+fRZh73ZTLOVmv86LOmhkv/tf4xapMyPil107rjSlTzFTbWs+5wUhYg1y1WAa42KSrDkw5eyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844261; c=relaxed/simple;
	bh=H8d/RxAiKVUQfbbgceelr73tNRbQx5gUFSWDZCTzFuQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=de1UR3Y+S0q5Ef0CaXuhDJYle4jNQ6lI1+0LLI2IxiiuVNtiOf2INgLCajKC6mWSaHPmGs1kDHyFcWkPrJtAlaLBFyKs6HhXerr1hpUcnWsmetfHqb8BLJ2nX9DOUQzrVL8uM25FuuajlxXmDErCLTcAnorZ1KfJro3bkL4net0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmJ9rs8M; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmJ9rs8M"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128ebee22caso4970372c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Mar 2026 07:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773844259; x=1774449059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=acOZJoVsEs/p7TYUxlDypVSOaynB0V/dWSWegPD1Js4=;
        b=OmJ9rs8M7yj1h+EnBnpvWSYLvKy2QQl4agZIBnAT0gdHDITF7N1L+lG3W67i4gpVMQ
         E82u65AnMU1aF7bodYbop/ZULhXE+o0oEn6JWZVRHWIES515LyxGZtJUcDRTd8si+BW2
         KB0pzW4dFBD2hOjMnc6byFQmlrDLfvMRva4eTZKG0ZGjkJcD0TFTL+GVLV1Im2Sh0leL
         8oKjKzWIozvdVHKjc/83lLC6TRfz6bJFfrtqnXTw9kTi+ab8xq4aU12ixzL6kPuKI8Dh
         5ZoO6weenkaTCuAUt5PKRZn2R5ZkuQwlfBG3xeHD+OiScrph9bPQ2cuOhXe1/qPn+xJU
         +g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844259; x=1774449059;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acOZJoVsEs/p7TYUxlDypVSOaynB0V/dWSWegPD1Js4=;
        b=Mz+atJA18bjgcWyKDwDAnyxkjR//2Vwu4XxMJoWP7Raw3i3yQExbnd7l6MVh9qd3R0
         NNUzXM+J3ePvbmTT5OJt9IjT6/zGpWORifP1Zpozlgeb5/ha4YaXxjaENSaXTvlDFbAP
         kr8xwC/c8LjnKwA+OQBXPz2Iqaf2W7cwzpiVxpD+255C3eP6AQjKlQbY9OKPMGoBKpBA
         5hnAaBVGBWI+u1qRHsdkdVs/86dXaWFAjYTity6iJi8sxQ2zb5FVblalWauiVqDR/THe
         mY2w/Yue7BGU9aNwTQaF5wVJq+u//bir7M8Py2zTbc3WW8MPJ0x/zYDySwU3KuNtUIJx
         yueg==
X-Gm-Message-State: AOJu0YxC53sk4Nj0HDNUf+5Rw3g+iVs2sXAfT0nvAf59hUeXH9Z4BGmr
	YGUZvnsx44/jbg7bQuUUryYQAXZ4sN8TldS8PeZyHqoduczGYVctEvzBfb1mJA==
X-Gm-Gg: ATEYQzx/gLgieGs5OI3jFxuMm/HPSz/Y4WqYaHgxs5UlgZjxQ9u67yN13zkSKizuqw+
	tCjG5+JuRPPVnTsJGOBjmDGNxYpsxLRwycveN1srnR3Dt5nxP6X8kkSD6/kBTGq51rIZsrdT+dM
	2F6tWo9bkwcfUxJfYSG8kKs4rMfCrWEMUlHh0dHxHPLKPVFvnicq1WBBeXWOcS+OSZFZ3QgjT3f
	6dck5CX7HEKr8O6abuB+aAjSfnrRPCqf65JpsXSaGFbOACQ1/mMJmpt1ZuRds8NJFjT8K6nnf6q
	776cl4+OTCbEplKNlwmd7arXn9rXdL3gWHeI8bHPobglWs2q4ezj7eel8y7MnI2wq1E47glKZhz
	NWqJzFEx5PGgOwje9ODUyqzECgt/ZxD63Vj+3S2J4XG4w/qgyFWeH4iaLIjAm1n4tz4PwWfQNMn
	MGG3D/Jx9ylCZpYUnyQXKmaaloRJTBuEx5TRmUMu5/LjI=
X-Received: by 2002:a05:7022:226:b0:11b:b179:6e17 with SMTP id a92af1059eb24-129a718e0c7mr1754390c88.34.1773844258924;
        Wed, 18 Mar 2026 07:30:58 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb90:fde3:7e9:ac39:c338:6adb:34bc])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b41271aasm3291754c88.11.2026.03.18.07.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:30:58 -0700 (PDT)
Date: Wed, 18 Mar 2026 07:30:58 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org
CC: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Denis Benato <benato.denis96@gmail.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_platform/x86=3A_asus-wmi=3A_do?=
 =?US-ASCII?Q?_not_enforce_a_battery_charge_threshold?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260304132608.33815-1-denis.benato@linux.dev>
References: <20260304132608.33815-1-denis.benato@linux.dev>
Message-ID: <32995B79-60BD-48AD-83CD-C39FCA3705C7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 4, 2026 5:26:08 AM PST, Denis Benato <denis=2Ebenato@linux=2Edev> =
wrote:
>Users are complaining for the battery limit being reset at 100% during
>the boot process while the general consensus appears to not apply
>unsolecited hardware changes, therefore stop resetting the battery
>charge limit at boot and return -ENODATA on charge_end_threshold to
>signal for an unknown limit=2E
>
>Suggested-by: Antheas Kapenekakis <lkml@antheas=2Edev>
>Suggested-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>Signed-off-by: Denis Benato <denis=2Ebenato@linux=2Edev>

Hi Denis,

LGTM=2E

Reviewed-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>

- Derek
>---
> drivers/platform/x86/asus-wmi=2Ec | 13 ++++++++-----
> 1 file changed, 8 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/platform/x86/asus-wmi=2Ec b/drivers/platform/x86/asu=
s-wmi=2Ec
>index 6ba49bd375df=2E=2Edc330a8ee2f2 100644
>--- a/drivers/platform/x86/asus-wmi=2Ec
>+++ b/drivers/platform/x86/asus-wmi=2Ec
>@@ -1557,7 +1557,10 @@ static ssize_t charge_control_end_threshold_show(s=
truct device *device,
> 						 struct device_attribute *attr,
> 						 char *buf)
> {
>-	return sysfs_emit(buf, "%d\n", charge_end_threshold);
>+	if ((charge_end_threshold >=3D 0) && (charge_end_threshold <=3D 100))
>+		return sysfs_emit(buf, "%d\n", charge_end_threshold);
>+
>+	return -ENODATA;
> }
>=20
> static DEVICE_ATTR_RW(charge_control_end_threshold);
>@@ -1580,11 +1583,11 @@ static int asus_wmi_battery_add(struct power_supp=
ly *battery, struct acpi_batter
> 		return -ENODEV;
>=20
> 	/* The charge threshold is only reset when the system is power cycled,
>-	 * and we can't get the current threshold so let set it to 100% when
>-	 * a battery is added=2E
>+	 * and we can't read the current threshold, however the majority of
>+	 * platforms retains it, therefore signal the threshold as unknown
>+	 * until user explicitly sets it to a new value=2E
> 	 */
>-	asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
>-	charge_end_threshold =3D 100;
>+	charge_end_threshold =3D -1;
>=20
> 	return 0;
> }

