Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C340BCB8
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790367922; cv=none; b=Q0ltKmSgrx/cvQdgOGwENa5JmTUrE5sgmYqxrYBjJRG6l+lK4KY273MULa5M51gbFsHvZiuj+iRzsYJ9MJYhM1DNXxsYRQ9RVnU0pDoGuZwkmyD5fRtStUmJzCbq9PajnW5uZu3c0t7wgLSrp0g82LUBnQzX1X997kumx/ibh0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790367922; c=relaxed/simple;
	bh=g0hVY7HOFVV23IEgOnRtUk6IT6oLr3dTzb/jFdwAcuk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TmKbkJ1ELvi3NXdI54FXpsjpkGvYtxzfTG+pcbM5izNjrWlpmVGHR72dH5s5iFHQIFINH9av1Yqp6ROYxk3ynOpi0YwFbgVSs1m9msdFH1ZvyIVWgXHYDrenIQ4eeST2vJf9IJpIyUVPmtynqARw5KTurOedVpErVl6eaElD5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R540Njkg; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R540Njkg"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so9797425e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 13:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790367918; x=1790972718; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+EhjDRqgMFuOqk3fKJz4pK2LGkkC9j6uC32F2tKgXCY=;
        b=R540NjkgeNbkpc9c9U4kPjyO3+/PUKQdesIjGrJj+jQ+h/sLZTiVvokQyZwq7cxBXl
         11XoYlhUoPLE8OUBUnzujCnDIblYzhePct3DC5LrroBGOFkmAm4fpBPIAjmEEmsJCzmi
         1uqLFbYroUJ7NX7ngJC2nwdZ1fQDszXq9vfv7K/IfZslNTYTpRIQpF+b+b+qBBeI4D9c
         pi0lPE3Xbc8D8RH86ZUrt71x3hK/GtghCRdBUMzXP08oEBZLX0Z5vYNez+Nrjm7X8/Hq
         ljYYibjezmxEJ/U9KLCXOWC0FX0tGJWPRHxZhlVYXPbs/av0nNe0B9Khiqgtqrfy38/D
         +nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790367918; x=1790972718;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EhjDRqgMFuOqk3fKJz4pK2LGkkC9j6uC32F2tKgXCY=;
        b=RtKs+PCcWG34QDIoByZlj+Gjy8T5v5HULp3Qz7BvDA5r47NJv5D3cJuu5o4mxu8Bsy
         iRPfng6S8Hz7QZ5Pp1fBNci2pBgTn5FQKs9D3v3LPVhkMMZMijqxBfG1YtxEniARfStr
         j1E4D+ftHLxfbrUZwus6v7RkVt/bHLqo8MBFgXEyk2XRJ7s5ksGwQ/n55fIjS+KW5pCn
         gSULnbBtRixn3QqMky1Vkuj4aY1wqith2XvNBy320SOmbZOYdHAHgU8kipGULYdRxVPa
         2A8Gz81phrA15Uih7iMHInwhs7hRpLu9t05ie8e34ooGHRGJAbupJB1PGCRzzjunutvF
         HyTQ==
X-Gm-Message-State: AFuF++n+XxEmK6YI9V7Zl/BeyY9nYdCSGZV0vWsa78/yJ+4LzYdX9cn3
	hyBaOfFJ3V3C5vMOaMke6UuciRORPIvykrdcw8NoE//k1ryTfNcgwwd1
X-Gm-Gg: AYBFou11y0XNUv5qQaQk0ccLHE/kVB67ROqSSEQUVqMnaIajf8tlmwgM9B86lBoXrjj
	KCIXg2gJHUno66+r1fTtM0ZyjlHAngrcI8pod6ETf6nG5ZJB5syo8K7wM0NMTGNVQm6ryXQe9Ff
	xA1q8PjmTzUzPs0JiR63VrKNworiRLb+KIANLac5aIXsAUHDit7leNbKMXekT6lY8GgKOZTgej6
	5+V8h9S1Xkw5MajJtfS7MOXYKgT/n9Wtpehg6F+H7fLpgk6ooYqF4gVCchR9xrJVOBI9yEl6l1Q
	S9TDkQFp14M0Sm6KarvkeqJaj+SFvNFWpMal6S+f8j3IHImzOSPn4MAXTCufwny7UGJezZNCmk1
	WsJKKUmq7vTlDDzNSG4COmz0J0mPGLZYzqXf9QR4wGHN2xnu8HummcNnPlMo+HFoOeIxF/nweSj
	W+tpXQl5iF2dcCbhMYD7eYXcbVhRWwrFh9SDgajAg6blVdjwWt5lAzBe2SDGcEAANp6dcbvdWMu
	BLP/1UcyoH+vDmYSDtjrX1+MqREqw==
X-Received: by 2002:a05:600c:4745:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49fe66abd7fmr126919825e9.1.1790367918415;
        Fri, 25 Sep 2026 13:25:18 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a02:b027:8010:c8cb:8c00:ceff:fe09:4e05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef6186a6sm73781625e9.4.2026.09.25.13.25.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 13:25:17 -0700 (PDT)
Date: Fri, 25 Sep 2026 22:25:13 +0200
From: Denis Benato <benato.denis96@gmail.com>
To: Bartu Alev <bartualev@gmail.com>, linux-kernel@vger.kernel.org
CC: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1=5D_platform/x86=3A_asus-wmi=3A?=
 =?US-ASCII?Q?_add_TUF_keyboard_RGB_readback_support?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260925200744.129714-1-bartualev@gmail.com>
References: <20260925200744.129714-1-bartualev@gmail.com>
Message-ID: <27BF6C3B-C341-4122-B1E9-F540345C29F6@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Il 25 settembre 2026 22:07:44 CEST, Bartu Alev <bartualev@gmail=2Ecom> ha s=
critto:
>TUF Gaming laptops support setting keyboard RGB lighting modes and
>power states via kbd_rgb_mode and kbd_rgb_state, but both attributes
>are currently write-only (DEVICE_ATTR_WO)=2E Consequently, userspace
>utilities have no way to query the active hardware configuration=2E
>
>Add readback support by querying the TUF status device ID 0x0010005B
>through the WMI DSTS method=2E On supported platforms, this evaluates the
>ACPI DSDT method EC0=2EKBLS(), which returns a 16-byte status buffer
>containing the active lighting mode, RGB color channels, effect speed,
>and power-state bitmask=2E
>
>Introduce kbd_rgb_read_status() to retrieve and validate the KBLS
>buffer=2E Convert kbd_rgb_mode and kbd_rgb_state to DEVICE_ATTR_RW=2E Map=
 the
>hardware speed codes (0xe1, 0xeb, 0xf5) to their sysfs indices (0, 1, 2)=
=2E
>Since the status buffer reports the active state rather than an action
>command, emit a synthetic leading '1' to maintain format symmetry with
>the input format expected by userspace=2E
>

1 or 0 is for immediate vs save to flash=2E=2E=2E Which one of the two is =
the reported one?

>Additionally, relabel the fourth field in kbd_rgb_state_index from
>"keyboard" to "shutdown"=2E When the interface was originally introduced,
>the purpose of BIT(7) was unknown and noted as having no effect=2E In
>hardware, this bit gates whether the keyboard LED remains powered during
>the ACPI S5 sequence=2E Relabeling it accurately reflects its
>actual hardware behavior=2E
>

Good finding=2E

This however goes in its own=2Epatch with an appropriate Fixes tag=2E


>Assisted-by: GLM-5=2E3
>Signed-off-by: Bartu Alev <bartualev@gmail=2Ecom>
>---
>- Tested on ASUS TUF Gaming A15 (FA507NV) running Linux 7=2E2=2E6
>
> drivers/platform/x86/asus-wmi=2Ec            | 87 ++++++++++++++++++++--
> include/linux/platform_data/x86/asus-wmi=2Eh |  3 +
> 2 files changed, 84 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/platform/x86/asus-wmi=2Ec b/drivers/platform/x86/asu=
s-wmi=2Ec
>index a65090429ca7=2E=2E36eff5adac52 100644
>--- a/drivers/platform/x86/asus-wmi=2Ec
>+++ b/drivers/platform/x86/asus-wmi=2Ec
>@@ -1046,7 +1046,58 @@ static ssize_t gpu_mux_mode_store(struct device *d=
ev,
> static DEVICE_ATTR_RW(gpu_mux_mode);
> #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>=20
>+static int kbd_rgb_read_status(u8 data[16])
>+{
>+	int err;
>+
>+	err =3D asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
>+					   ASUS_WMI_DEVID_TUF_RGB_STATUS,
>+					   0, data, 16);
>+
>+	if (err)
>+		return err < 0 ? err : -ENODEV;
>+
>+	/* DUBF[0] is a constant 1 set by the AML: anything else is not KBLS */
>+	if (data[0] !=3D 1)
>+		return -ENODEV;
>+
>+	return 0;
>+}
>+
> /* TUF Laptop Keyboard RGB Modes ***************************************=
*******/
>+static ssize_t kbd_rgb_mode_show(struct device *dev,
>+				 struct device_attribute *attr,
>+				 char *buf)
>+{
>+	u8 data[16] =3D {};
>+	u32 speed;
>+	int err;
>+
>+	err =3D kbd_rgb_read_status(data);
>+	if (err)
>+		return err;
>+
>+	/* Map hardware speed codes back to sysfs index:
>+	 * 0xe1 -> 0 (slow), 0xeb -> 1 (normal), 0xf5 -> 2 (fast)
>+	 */
>+	switch (data[5]) {
>+	case 0xe1:
>+		speed =3D 0;
>+		break;
>+	case 0xeb:
>+		speed =3D 1;
>+		break;
>+	case 0xf5:
>+		speed =3D 2;
>+		break;
>+	default:
>+		speed =3D 1;
>+		break;
>+	}
>+
>+	return sysfs_emit(buf, "1 %d %d %d %d %d\n",
>+			  data[1], data[2], data[3], data[4], speed);
>+}
> static ssize_t kbd_rgb_mode_store(struct device *dev,
> 				 struct device_attribute *attr,
> 				 const char *buf, size_t count)
>@@ -1099,7 +1150,7 @@ static ssize_t kbd_rgb_mode_store(struct device *de=
v,
>=20
> 	return count;
> }
>-static DEVICE_ATTR_WO(kbd_rgb_mode);
>+static DEVICE_ATTR_RW(kbd_rgb_mode);
>=20
> static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
> 			     "cmd mode red green blue speed");
>@@ -1115,14 +1166,38 @@ static const struct attribute_group kbd_rgb_mode_=
group =3D {
> };
>=20
> /* TUF Laptop Keyboard RGB State ***************************************=
*******/
>+static ssize_t kbd_rgb_state_show(struct device *dev,
>+				  struct device_attribute *attr,
>+				  char *buf)
>+{
>+	u8 data[16] =3D {};
>+	u8 flags;
>+	int err;
>+
>+	err =3D kbd_rgb_read_status(data);
>+	if (err)
>+		return err;
>+
>+	/*
>+	 * data[6] power-state bitmask:
>+	 * BIT(1) boot, BIT(3) awake, BIT(5) sleep, BIT(7) shutdown
>+	 */
>+	flags =3D data[6];
>+
>+	return sysfs_emit(buf, "1 %d %d %d %d\n",
>+			  !!(flags & BIT(1)),
>+			  !!(flags & BIT(3)),
>+			  !!(flags & BIT(5)),
>+			  !!(flags & BIT(7)));
>+}
> static ssize_t kbd_rgb_state_store(struct device *dev,
> 				 struct device_attribute *attr,
> 				 const char *buf, size_t count)
> {
>-	u32 flags, cmd, boot, awake, sleep, keyboard;
>+	u32 flags, cmd, boot, awake, sleep, shutdown;
> 	int err;
>=20
>-	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboar=
d) !=3D 5)
>+	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &shutdow=
n) !=3D 5)
> 		return -EINVAL;
>=20
> 	if (cmd)
>@@ -1135,7 +1210,7 @@ static ssize_t kbd_rgb_state_store(struct device *d=
ev,
> 		flags |=3D BIT(3);
> 	if (sleep)
> 		flags |=3D BIT(5);
>-	if (keyboard)
>+	if (shutdown)
> 		flags |=3D BIT(7);
>=20
> 	/* 0xbd is the required default arg0 for the method=2E Nothing happens =
otherwise */
>@@ -1146,10 +1221,10 @@ static ssize_t kbd_rgb_state_store(struct device =
*dev,
>=20
> 	return count;
> }
>-static DEVICE_ATTR_WO(kbd_rgb_state);
>+static DEVICE_ATTR_RW(kbd_rgb_state);
>=20
> static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
>-			     "cmd boot awake sleep keyboard");
>+			     "cmd boot awake sleep shutdown");
>=20
> static struct attribute *kbd_rgb_state_attrs[] =3D {
> 	&dev_attr_kbd_rgb_state=2Eattr,
>diff --git a/include/linux/platform_data/x86/asus-wmi=2Eh b/include/linux=
/platform_data/x86/asus-wmi=2Eh
>index b5ed8c83ace1=2E=2Ea6eb8f8cf159 100644
>--- a/include/linux/platform_data/x86/asus-wmi=2Eh
>+++ b/include/linux/platform_data/x86/asus-wmi=2Eh
>@@ -161,6 +161,9 @@
> /* TUF laptop RGB power/state */
> #define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
>=20
>+/* TUF laptop RGB keyboard status */
>+#define ASUS_WMI_DEVID_TUF_RGB_STATUS	0x0010005B

State versus status=2E=2E=2E Uhm=2E=2E=2E

>+
> /* Bootup sound control */
> #define ASUS_WMI_DEVID_BOOT_SOUND	0x00130022
>=20

Hi,

Thanks for this!
