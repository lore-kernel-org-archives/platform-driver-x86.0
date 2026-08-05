Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A24447DD69
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946092; cv=none; b=D6Pb6BaImLn/2Fx+RJeDcBSWzdyWo3sO4NqyxiM06yxfmtVBhr2ZccNZv+aIbWHuN6L/+pfDlLg25hMLK05KZv/h7Kwanh1JHvCYkyYaWizID+eh34+vtcPHr2Q7KNSAKsoBEFxz6kvu4rZbQj4xR11ca/enONULYGMLLxg1DJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946092; c=relaxed/simple;
	bh=vfXLgOihSwGGO6KeJIID3alB0htBxwpzF/a3yTq0TPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZP5cA7CZe9D9xT0fuZoyuJ5uueX6wvxmFm47nyMuoLwHx7dH6IPfqoVjzgV/JsdhanMJeT0KGmdxyVpn8OBu39DjpryyJwf1ddWEWbUIHtTvYV4sQuMHUILEJsYLebkMxI5Ti8uW3cg6zcnTqYng7sVUgPTKUDQF+trxuny8sMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cfwK3G/L; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cfwK3G/L"
Message-ID: <f5834aa8-b39d-4260-a5cc-4710ef3d6aa2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785946074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YqiGFdHiAYAvfxf4SfP8/xeGtXku6GeGzHvkw/pCryM=;
	b=cfwK3G/LF/0nxl67fFWfdQzoQxIA6QnGzrTtM+zX2m7BvWwN6OBlSHFZPJVF382IoeLhJa
	ZSqWbMzjTRQ+F2Vrg+6vpu7sRCekjSXtMxOq3AU3DQLknyFsvFJHaxTfIsLufp4ELG59f2
	qHtfTWQob69RidjKBcp1ouB9/x2XxKE=
Date: Wed, 5 Aug 2026 18:07:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: =?UTF-8?Q?Re=3A_=5BPATCH_v3_1/2=5D_platform/x86=3A_asus-wmi=3A_adju?=
 =?UTF-8?Q?st_screenpad_power/brightness_handling_=E2=80=94_regression_on_no?=
 =?UTF-8?Q?n-DUO_ScreenPad_=28ASUS_ZenBook_UX435EG=29?=
To: =?UTF-8?B?TWFudWVsIEEuIFIuIGRlIE9yw7plIFLDrW9z?= <deor001@gmail.com>,
 luke@ljones.dev, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAOXykpiN5v0ET3oPyNkCG72TBArD=+FphRJUySe8GAztDdGLfg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAOXykpiN5v0ET3oPyNkCG72TBArD=+FphRJUySe8GAztDdGLfg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 8/1/26 20:03, Manuel A. R. de Orúe Ríos wrote:
> Hi Denis, Luke,
>
> I'm following up on this patch series (commit 034f5efd362fb87a3970d61eaf982664f84e6c5a,
> merged for kernel 7.0.10) — I believe I've found and confirmed a regression it
> introduces on non-DUO ScreenPad hardware.
>
> Hardware: ASUS ZenBook UX435EG (BIOS UX435EG.315), single ScreenPad model
> (not ScreenPad Plus / DUO).
>
> Symptom: after upgrading past kernel-7.0.9-205 to kernel-7.0.10-200 (and
> confirmed still present in 7.1.5), the ScreenPad stops functioning as a
> secondary display entirely — it still works as a touchpad (separate i2c-hid
> digitizer), but the panel itself never lights up as a screen.
>
> I bisected this cleanly across official Fedora kernel builds:
>   kernel-7.0.9-205.fc44   -> works
>   kernel-7.0.10-200.fc44  -> broken
>   kernel-7.1.5-201.fc44   -> still broken
>
>
> image.png
> I understand from the review thread that this series was tested specifically
> on a ZenBook DUO — it's very possible the DUO's ScreenPad firmware/EC
> behaves differently enough that the polarity works out correctly there, while
> it's inverted on this single-ScreenPad model.
>
> Happy to test any proposed fix on this hardware, or provide more DMI/ACPI/
> debug info if useful. I'm currently working around this with a udev-triggered
> script forcing bl_power=4 on boot, but would obviously prefer a proper fix.
>
> Kernel/hardware details:
> DMI: ASUSTeK COMPUTER INC. ZenBook UX435EG_UX435EG/UX435EG, BIOS UX435EG.315 04/22/2022
> Distro: Fedora Linux 44 (KDE Plasma)
>
> Thanks for the work on this — I know these ScreenPad quirks are a pain to
> get right across the different hardware variants.
>
> Best,
> ___________________________


Please try the below patch and see if it fixes things for you:

From e9f4d0ef00c4f3e1ba26db68a688e523a743e733 Mon Sep 17 00:00:00 2001
From: Denis Benato <denis.benato@linux.dev>
Date: Wed, 5 Aug 2026 16:05:36 +0000
Subject: [PATCH] platform/x86: asus-wmi: fix unclear usage of bd->props.power
The bd->props.power is checked in parts of the driver correctly comparing with
BACKLIGHT_POWER_ON, while in others with a raw usage of bd->props.power
and !bd->props.power, moreover in certain checks the logic has been
inverted due to BACKLIGHT_POWER_ON being defined as 0: fix both the wrong
usage and the inconsistencies by using proper comparisons.
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
drivers/platform/x86/asus-wmi.c | 12 +++++++++---
1 file changed, 9 insertions(+), 3 deletions(-)
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8610663b8269..3600dddd8f36 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4500,7 +4500,8 @@static int update_screenpad_bl_status(struct backlight_device *bd)
u32 ctrl_param = bd->props.brightness;
int err = 0;
- if (bd->props.power) {
+ switch (bd->props.power) {
+ case BACKLIGHT_POWER_ON:
err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
if (err < 0)
return err;
@@ -4508,12 +4509,17 @@static int update_screenpad_bl_status(struct backlight_device *bd)
err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
if (err < 0)
return err;
- }
+ break;
- if (!bd->props.power) {
+ case BACKLIGHT_POWER_OFF:
err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
if (err < 0)
return err;
+ break;
+
+ default:
+ pr_warn("Invalid screenpad backlight power state: %d\n", bd->props.power);
+ return -EINVAL;
}
return err;
-- 
2.47.3


