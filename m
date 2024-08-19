Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B655015B13C
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Aug 2024 16:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086049; cv=none; b=UgO+IA4lmXvJfYN3Oe2sfGUeNdyNCt1Qt1HTkSmBT3oI7et7kNFmGAW6VlpucA/4FNNWTt898PRXYHToQUmVnv4mE/8Ul0u1NyafU8ZYkHbGfATNKFR13GFaNR7v7HHv5a4GGz1QY4i4uLzS712+uYHI6qUmsxYnX4UP6QQPJVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086049; c=relaxed/simple;
	bh=bSzx0LB8ye6yIrKgVXddqKSTzoVIvF+nGeAAVmobv6o=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=cHZAtfMV+UArASTvWyPC+FPqIkPjiKzsWiRQWDZKjIENDPHvOaGb6RejkvnR/oQYa+5evjmaBELUywjgLHxc+MJyJhI4XjC4roHR85zOg2gzDfliEEcJr2SQBt49Zff59V7vrOJ6+ULzDUAHr+m6fGAaUAejSqq6eEl9/nGyG/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=stsichler@web.de header.b=nBCSfxVk; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=stsichler@web.de header.b="nBCSfxVk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724086038; x=1724690838; i=stsichler@web.de;
	bh=3BVsdgRpKtOeLfoctuL18MZ7GldO5yc72ICrC5U7K7o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nBCSfxVkju02OA4kDk7uNwuNdCEHVDcHJxtzBBflz5UcLxRzpG7sdISRkPS8DiRD
	 UHaOVoQGxejH9LmwJW0hGREmuccL/fp2tsErSJtToAZ2xm1FMeKZfQ5AHIX0rO38n
	 NOzMLW/7CzYRBZtjtB9iqoxk4PgF8mndXSaJrKKOkWpd/624FUYiwySzZhB5CX0Tq
	 hS5/TEGnJXuHYBBrVI4sJ6fdhBWrsR8j/ImktNnLUs1R86spS7CE2VVrusrNwniQq
	 UPJ/RwhgwrY8JQQnUbE/wvLpn0OIainJLbEU6DXIV7k2ge+nzXDuf3tkL6yWpPW3f
	 s2IEIdRBOPgkpHH03A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.1.43] ([176.199.210.162]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7QUL-1s5XAT2icf-00uAsq; Mon, 19
 Aug 2024 18:42:00 +0200
Message-ID: <40e05e60-e352-46fa-9b3c-b4fc8d90cedd@web.de>
Date: Mon, 19 Aug 2024 18:41:59 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ilpo.jarvinen@linux.intel.com
Cc: jorgealtxwork@gmail.com, platform-driver-x86@vger.kernel.org
References: <158df220-b282-3da3-0e87-ae7a3c64d056@linux.intel.com>
Subject: Re: [PATCH v5 2/4] Fix SW_TABLET_MODE detection method
Content-Language: en-US
From: Stefan Sichler <stsichler@web.de>
In-Reply-To: <158df220-b282-3da3-0e87-ae7a3c64d056@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6o8io7rOwQOkNjthqmbE8L+m/63Nv1ZjqTLCavaQrxW18+mQQZi
 dp1wef2kQ3ml5Wi4cNWMVpZ5rcBq7FKlAqqkq3M9K+IYFJfOTr/oCATCGTrJUgueftRVO8M
 F30I+fTQbUcZfwmvgdzyhOIDt/WjbXkXon0VHVweRs4kz4bMNWzoReo/FXLKOUIrO8fgAZG
 E4+/uiD9e6sbWJLK+0Cnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y549km1tXmI=;ZpiuYvxhmKoPRB9YRPVXPGKe8R6
 DeIkaQCXevES95NRIIx+zw/vrgH5NpEGi57n/hnqQu+WHMVvkeOAEL2XrGOcG5hd4FIA114jT
 8rMcC7gpFAzOqT6MdbN7Q5dpo9SYNWYFx6VGtmBlOCNgTca2pAxpGPgeCJsCGu0TED1KI2mB0
 Z5LwD+DLQTlVzRnfWp9B91k0Sw8IdaBA5SFqAPdi89NHbmPzB5WSKn8WPwJp7fNBS/g89dzBl
 yUWcpiKz7/B0KFJOF+a1qnEA8TuhWL95tGLXlnmbdA1obg7SVFQfQZ3t/Go6YEC98VjGDfzmS
 jxj7RHXPAX5IfSQ8RMU9KKSvEIMY9PmIOKIX6AKnkAY5qOmApala8ySWTFkE2PWb6QUg0Fg53
 IjdBbsp1vRjZbx1FKRJnkSyuJWy5WOwzOkkmxjc8dls1P2y0Yncg1/Dsnxnt726SXfmTQ2mJR
 wg3UoZyF9QcE1M8xGB2kwiXjFIC0TS1lF11eqU5+al2csptCPtxSeTQdJccmvGTzYg3vYAwUT
 JzTPQROf/7AhtuN95ZD7mhZSljl3jYptovG4nvPVVo96Rz2EXyXynXXDSr5xCrvdbjwQ7Ji0m
 mgS68YbAxj3xsvnBR6gxyfB28aTmkleppvLuq+qUmnT5udRe2vrQGAaI/g3cPZSXRz8qsdUkK
 eIbwPSe5qx36TFdUGmHvYzLZF+yQrmde+pytdPVNVCqt5KJdhfWNzYyrtOd9kk4Iwn4yVgdW+
 Z/lzeK9l/DE/5Ans35800OkMRbeuXlSLbGPjpwY4ND3drl4uVj2EwGJ5GZRetE8SrstaHTefE
 kGJQujUBYCtME1tAdigBqT2+rzeIw7V6DiZLNUy4ZCJ0Y=

Hi Ilpo,

thank you for your comments.
I added some defines for the values of the module param and re-ordered the
logic a bit. I think it is easier to follow now.

I now also use another return variable "ret2" for the result of
hp_wmi_read_int() to not overwrite the result of original
hp_wmi_perform_query() when hp_wmi_read_int() fails. This was actually a
bug in my first implementation.

I still think that re-using the enable_tablet_mode_sw param for that is
a reasonable compromise, because the comment of original
commit 520ee4ea1cc60251a6e3c911cf0336278aa52634 suggests that there was
some problem with hp_wmi_read_int(HPWMI_HARDWARE_QUERY) on newer Tablets.
So, because I cannot test this, I'd prefer to not change current behavior
when the enable_tablet_mode_sw parameter is not set.

Best Regards
Stefan

>>>>>>>>>>>>>>> Actual patch starts here:

From: Stefan Sichler <stsichler@web.de>
Date: Mon, 19 Aug 2024 14:45:57 +0200
Subject: [PATCH] platform/x86: hp-wmi: repair Tablet Mode detection on old
  Convertibles

This fixes a regression introduced by commit
520ee4ea1cc60251a6e3c911cf0336278aa52634
("Fix SW_TABLET_MODE detection method").

Investigation showed that some older Convertibles like HP EliteBook 2760p
do neither report Chassis Type correctly nor report tablet state by
HPWMI_SYSTEM_DEVICE_MODE, so for those, it is still required to fallback
to previous HPWMI_HARDWARE_QUERY method.

Since on pre-5.18 kernels, it was required to set enable_tablet_mode_sw
module param to enable this anyway, we re-add this removed parameter here
and re-use it in the following way:
   - when left at default -1 (auto): no change to current implementation
   - when set to 0 (off): unconditionally disable tablet mode reporting
   - when set to 1 (force on): ignore Chassis type and use old
     hp_wmi_hw_state(HPWMI_TABLET_MASK) query method in addition to new
     hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE...) method

Signed-off-by: Stefan Sichler <stsichler@web.de>

=2D--
  drivers/platform/x86/hp/hp-wmi.c | 32 ++++++++++++++++++++++++++++----
  1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp=
-wmi.c
index 876e0a97c..cab01308d 100644
=2D-- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -38,6 +38,13 @@ MODULE_LICENSE("GPL");
  MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
  MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");

+static int enable_tablet_mode_sw =3D -1;
+module_param(enable_tablet_mode_sw, int, 0444);
+MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting =
(-1=3Dauto, 0=3Dno, 1=3Dyes)");
+#define HPWMI_TABLET_MODE_SW_AUTO -1
+#define HPWMI_TABLET_MODE_SW_OFF 0
+#define HPWMI_TABLET_MODE_SW_FORCE_ON 1
+
  #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
  #define HPWMI_BIOS_GUID "5FB7F034-2C63-45E9-BE91-3D44E2C707E4"

@@ -459,23 +466,40 @@ static int hp_wmi_get_tablet_mode(void)
  	bool tablet_found;
  	int ret;

+	if (enable_tablet_mode_sw =3D=3D HPWMI_TABLET_MODE_SW_OFF)
+		return -ENODEV;
+
  	chassis_type =3D dmi_get_system_info(DMI_CHASSIS_TYPE);
  	if (!chassis_type)
  		return -ENODEV;

-	tablet_found =3D match_string(tablet_chassis_types,
+	tablet_found =3D
+		(enable_tablet_mode_sw =3D=3D HPWMI_TABLET_MODE_SW_FORCE_ON)
+		|| (match_string(tablet_chassis_types,
  				    ARRAY_SIZE(tablet_chassis_types),
-				    chassis_type) >=3D 0;
+				    chassis_type) >=3D 0);
  	if (!tablet_found)
  		return -ENODEV;

  	ret =3D hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
  				   system_device_mode, zero_if_sup(system_device_mode),
  				   sizeof(system_device_mode));
-	if (ret < 0)
+	if (ret < 0 && enable_tablet_mode_sw !=3D HPWMI_TABLET_MODE_SW_FORCE_ON)
  		return ret;

-	return system_device_mode[0] =3D=3D DEVICE_MODE_TABLET;
+	if (ret >=3D 0)
+		ret =3D (system_device_mode[0] =3D=3D DEVICE_MODE_TABLET);
+
+	/* workaround for older convertibles. needs to be actively switched on
+	 * and is only executed when HPWMI_SYSTEM_DEVICE_MODE query failed or
+	 * did not report tablet state, i.e. (ret < 0) or (ret =3D=3D 0) */
+	if (ret <=3D 0 && enable_tablet_mode_sw =3D=3D HPWMI_TABLET_MODE_SW_FORC=
E_ON) {
+		int ret2 =3D hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
+		if (ret2 >=3D 0)
+			ret =3D !!(ret2 & HPWMI_TABLET_MASK);
+	}
+
+	return ret;
  }

  static int omen_thermal_profile_set(int mode)
=2D-
2.43.0
