Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059CB2E7BD3
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 22:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774823588; cv=none; b=NhcjIxTjsvNCnpCOUFQRgVucm1gsQ85bVdbolG5Ul0YXr//jQTEHeGsE1XUq9yeot+gvckG05h8s/1om3zlVAli+PJ8ff9G/KPvAixwCVb04Z61u5w3TEoGByELpp2UiB08bd1/+83EObOR3EKwwjp4ajOmTW5Fsg9rSmOF9EXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774823588; c=relaxed/simple;
	bh=NhEyrwJmor993o/6jtOrqJ/ikx3Iy6IqQbM6s2khcho=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=eGQV2QetsSn2wKswdvZ2+4tVtTfwKV4BvHZIOrwN5o1rX7KzApU7BNAJnpR9DMO2i6dzmQ+7wEq0uxdO7D1nVwjtkkXQmCgjeOJp/JLG5KO3Prqx2sfSM6pRVAfyK0Fv2hOi95m1lvggYjtMLyseJfvOKMXnuTSXvqumLw0RoEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCjbveUJ; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCjbveUJ"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba895adfeaso4017508eec.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2026 15:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774823586; x=1775428386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SIV9IXi4mvtJZxNuQdKTIPUNg4zlY4JZcS9JCJnvMQY=;
        b=MCjbveUJt9CScE60QRS+fIf36kl2GN5R4rZSr2D8gAmjzmpWEhY9W7NeBSpNK1MhRU
         wVj8ASMx0pPcJSaPongi5AFpN3HkkXS8qYC27zCJzBmbj2EcnfrYs+Df9BxuZSXlIF6w
         1rz0pydZ2sr4+gBPftPRNgPsCvjt7UXqalKEtBQ4CvC+J25I8FW9cNFx3T+sm4/Ckm+2
         yq3ncjVskU8fWMClTDvzRA1zk8igQyhcpIfUn+jaZOv6WXEBI2MmlQRRp+sKIiJO0mSz
         F8qAnYUEoLXHd3pTUYhBnTfvtYshqOi0FQ2ivhqBKhBNR6FgVLlme/yyWk+NG3THrda7
         D/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774823586; x=1775428386;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SIV9IXi4mvtJZxNuQdKTIPUNg4zlY4JZcS9JCJnvMQY=;
        b=UM6liskq7EqnNjssiW7LMGOD+CVG3hS6UIicdQBmGoIBKvlkkG8OAa+vDz1/kE90t0
         /w7iFCBbrQWBE4PIE+9Sc+w1XTRTeelJH54UUdp5Cp6wBIffsrLL4lMtDPbKazh8Ae7+
         w/kkBtZxUQz5hpDO+39KF4RwIzgR+HkgwwTGCBp5n26KvRg8Bqk0cvous+l1m2GF5eG4
         xUWfhAAqzzvEgelh8jZ2lfwMduEKVq0LcQMjMGrm3ng/f0zj2smRWxWfCLvDrskgxNbE
         Ey5g43ky7oPgzqs1QurqGie1r4bAv69TceJo84JA2wD2qolDakfwJjgNjk1c+GSQD1up
         65lQ==
X-Gm-Message-State: AOJu0YzU0MjcDcbbG4nijQ7LTsak86PwdFzFArLiu4+v6uBVTrFSTxkk
	AVfI8h1OI7NdokOGkRoZUYzN+iYfl/P/CBCdVY08ZksAImLRytgBIW0C
X-Gm-Gg: ATEYQzyj46yXoF0C54DdLCq8qIsrjy11uqm9cW+ORFKpcUQN5i06TFPlIblpKE3K9H/
	j3MlnfA2L3Qn+VxQ5xi0rcBk+dvpPO/m7GZ0+uPdQbn2ANhPv90cU4gYE7lHd6fTUCVy7SYmsBh
	1EI3THqV2RwH4GlCCgX0VXVfFBLa+PohPw3MkXTLpIMQ9gPU3pCM/2qf5dn4HD6eaK6k0KWVTtX
	DhVXQT6fBeOEhQ46NVgNhHyHMWMN2sgoUaJexRNtXg8t9Swgsp9koW7azBR6AMHPCQKd7jNCkZZ
	OfMZkEyjjNn7IKoQHcIaH/gzBq07LuFrGzjOluh7Jg7Wn5FVnTe0Ti83zCjra0gjBwRL7sFVmWH
	ESYDam+eBUIRhMDLH8GHX6CXDNzQ0guMNVeKU6yvi5eJD22pOnuCEO3XXipfJ9mVBKxC9AZpBND
	1hcVsTAPgr2KJXkN8pLg53xH1rWIwrwdFVvE6F+hmVR85/AWIJhBJAf9KyQ0a54wD4XXE2ZE6IS
	XEBKm6OmdbXJQEV6DlqZQ==
X-Received: by 2002:a05:7022:4393:b0:128:d494:a1ab with SMTP id a92af1059eb24-12ab286d84dmr4957181c88.15.1774823585853;
        Sun, 29 Mar 2026 15:33:05 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm7830890c88.4.2026.03.29.15.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 15:33:05 -0700 (PDT)
Date: Sun, 29 Mar 2026 15:33:04 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Alexander Egorov <begeebe@gmail.com>, Antheas Kapenekakis <lkml@antheas.dev>,
 =?ISO-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>
CC: platform-driver-x86@vger.kernel.org, ps1x <ps1x@users.noreply.github.com>
Subject: Re: [PATCH] platform/x86: oxpec: add support for OneXPlayer Super X
User-Agent: Thunderbird for Android
In-Reply-To: <20260329215348.56185-1-begeebe@gmail.com>
References: <20260329215348.56185-1-begeebe@gmail.com>
Message-ID: <A5F1B458-20D0-4FC6-90DD-2D1756D8E26F@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 29, 2026 2:53:48 PM PDT, Alexander Egorov <begeebe@gmail=2Ecom> wr=
ote:
>From: ps1x <ps1x@users=2Enoreply=2Egithub=2Ecom>
>
>OneXPlayer Super X identifies itself via DMI as:
>
>  board vendor: ONE-NETBOOK
>  board name:   ONEXPLAYER SUPER X
>  product name: ONEXPLAYER SUPER X
>
>Current mainline oxpec does not contain a matching DMI entry for this
>system, so the in-tree driver is not auto-loaded=2E
>
>On the tested Super X device, the working EC layout matches the
>following handling:
>
>- fan RPM is read from OXP_SENSOR_FAN_REG (0x76)
>- pwm1_enable uses OXP_SENSOR_PWM_ENABLE_REG (0x4A)
>- pwm1 uses OXP_SENSOR_PWM_REG (0x4B) with direct 0-255 writes
>- turbo toggle uses OXP_TURBO_SWITCH_REG (0xF1)
>- charge-limit / charge-behaviour uses the same battery extension path
>  as the X1 family
>
>Add a dedicated oxp_superx board id, a DMI match for OneXPlayer Super X,
>and route the fan, PWM, turbo-toggle, and battery-extension paths
>through the validated Super X handling=2E
>
>Tested-on: OneXPlayer Super X
>Signed-off-by: ps1x <ps1x@users=2Enoreply=2Egithub=2Ecom>

Looks good=2E Thanks for adding this=2E

Reviewed-by: Derek J Clark <derekjohn=2Eclark@gmail=2Ecom>

>---
> drivers/platform/x86/oxpec=2Ec | 17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
>
>diff --git a/drivers/platform/x86/oxpec=2Ec b/drivers/platform/x86/oxpec=
=2Ec
>index 6d4a53a2e=2E=2Ed366c398d 100644
>--- a/drivers/platform/x86/oxpec=2Ec
>+++ b/drivers/platform/x86/oxpec=2Ec
>@@ -48,6 +48,7 @@ enum oxp_board {
> 	oxp_mini_amd_a07,
> 	oxp_mini_amd_pro,
> 	oxp_x1,
>+	oxp_superx,

As an aside, I'm not sure how the order on all these tables got so messed =
up=2E Don't worry about it for your patch, this is just a note for myself t=
o go back and sort everything better later=2E

Thanks,=20
Derek

> 	oxp_g1_i,
> 	oxp_g1_a,
> };
>@@ -282,6 +283,13 @@ static const struct dmi_system_id dmi_table[] =3D {
> 		},
> 		=2Edriver_data =3D (void *)oxp_x1,
> 	},
>+	{
>+		=2Ematches =3D {
>+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER SUPER X"),
>+		},
>+		=2Edriver_data =3D (void *)oxp_superx,
>+	},
> 	{},
> };
>=20
>@@ -336,6 +344,7 @@ static umode_t tt_toggle_is_visible(struct kobject *k=
obj,
> 	case oxp_mini_amd_a07:
> 	case oxp_mini_amd_pro:
> 	case oxp_x1:
>+	case oxp_superx:
> 	case oxp_g1_i:
> 	case oxp_g1_a:
> 		return attr->mode;
>@@ -366,6 +375,7 @@ static ssize_t tt_toggle_store(struct device *dev,
> 	case aok_zoe_a1:
> 	case oxp_fly:
> 	case oxp_mini_amd_pro:
>+	case oxp_superx:
> 	case oxp_g1_a:
> 		reg =3D OXP_TURBO_SWITCH_REG;
> 		mask =3D OXP_TURBO_TAKE_VAL;
>@@ -412,6 +422,7 @@ static ssize_t tt_toggle_show(struct device *dev,
> 	case aok_zoe_a1:
> 	case oxp_fly:
> 	case oxp_mini_amd_pro:
>+	case oxp_superx:
> 	case oxp_g1_a:
> 		reg =3D OXP_TURBO_SWITCH_REG;
> 		mask =3D OXP_TURBO_TAKE_VAL;
>@@ -507,6 +518,7 @@ static bool oxp_psy_ext_supported(void)
> {
> 	switch (board) {
> 	case oxp_x1:
>+	case oxp_superx:
> 	case oxp_g1_i:
> 	case oxp_g1_a:
> 	case oxp_fly:
>@@ -640,6 +652,7 @@ static int oxp_pwm_enable(void)
> 	case oxp_mini_amd_a07:
> 	case oxp_mini_amd_pro:
> 	case oxp_x1:
>+	case oxp_superx:
> 	case oxp_g1_i:
> 	case oxp_g1_a:
> 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_MANUAL);
>@@ -660,6 +673,7 @@ static int oxp_pwm_disable(void)
> 	case oxp_mini_amd_a07:
> 	case oxp_mini_amd_pro:
> 	case oxp_x1:
>+	case oxp_superx:
> 	case oxp_g1_i:
> 	case oxp_g1_a:
> 		return write_to_ec(OXP_SENSOR_PWM_ENABLE_REG, PWM_MODE_AUTO);
>@@ -717,6 +731,7 @@ static int oxp_pwm_fan_speed(long *val)
> 	case oxp_mini_amd:
> 	case oxp_mini_amd_a07:
> 	case oxp_mini_amd_pro:
>+	case oxp_superx:
> 	case oxp_g1_a:
> 		return read_from_ec(OXP_SENSOR_FAN_REG, 2, val);
> 	default:
>@@ -749,6 +764,7 @@ static int oxp_pwm_input_write(long val)
> 	case aok_zoe_a1:
> 	case oxp_fly:
> 	case oxp_mini_amd_pro:
>+	case oxp_superx:
> 	case oxp_g1_a:
> 		return write_to_ec(OXP_SENSOR_PWM_REG, val);
> 	default:
>@@ -788,6 +804,7 @@ static int oxp_pwm_input_read(long *val)
> 	case aok_zoe_a1:
> 	case oxp_fly:
> 	case oxp_mini_amd_pro:
>+	case oxp_superx:
> 	case oxp_g1_a:
> 	default:
> 		ret =3D read_from_ec(OXP_SENSOR_PWM_REG, 1, val);

