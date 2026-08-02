Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270C23EAB0
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Aug 2026 01:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785635855; cv=none; b=g9yCzli5HiklwQxyoPKRAneeJcc+nkvwWE6Mf1gYrRHZZHxuZ1Fd18grXJAZktgietM314wuAcyqfoOVft1ZEbeW8fOoPERH9BN4kkqjwosL4XLRb23g/uVVLbFQlEEsxuO4NMfr3R3g0tJWeJwuFhrEYzHhAlEcpj+Z9vZSVJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785635855; c=relaxed/simple;
	bh=7xagtDqRK76q1WIUv81Cmnn1hqLG3d1ub+GS3FJ5fQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6prMMK+iPGw2cOW2A4xm9abtw+YSj6YK3TzY+Go3gfP/ACgMxnjbt02efeVZlP8uVD8TuCp969SxyuBgX/Yv4lnsrFjV+14JYfMJ+r9nKEH+HgG+EVpKAjw+TfCYPVZL0NBtMJIpak/DV/WEpHSyUNuzMdalty2ktM0cI2z+gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XYBaDocM; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XYBaDocM"
Message-ID: <ea9c63d1-4776-49d5-9dc4-6c09498f99c9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785635849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7xagtDqRK76q1WIUv81Cmnn1hqLG3d1ub+GS3FJ5fQQ=;
	b=XYBaDocMDxPtLCkRIOH5Fagr/O0oeP3LngEhvpmQGEB1eFapOuyTBHv6xI2k8ij+pVtNTC
	GhfBZSdlrEjecPfNtuYmpcuuDCA9pQbSOkFub+TvsufaC2HmKmgXEwuEG2nINt6e+uIfL4
	EPG8UnGG14oKrP41tW4lCvznpirlPIY=
Date: Sun, 2 Aug 2026 03:57:27 +0200
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
 luke@ljones.dev
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAOXykpggnwupch416dT4_pPygtb8CHjc7c21FGA+JQ--W7roZA@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <CAOXykpggnwupch416dT4_pPygtb8CHjc7c21FGA+JQ--W7roZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 8/1/26 19:24, Manuel A. R. de Orúe Ríos wrote:
> Hi Denis, Luke,
>
> I'm following up on this patch series (commit 034f5efd362fb87a3970d61eaf982664f84e6c5a,
> merged for kernel 7.0.10) — I believe I've found and confirmed a regression it
> introduces on non-DUO ScreenPad hardware.
>
> Hardware: ASUS ZenBook UX435EG (BIOS UX435EG.315), single ScreenPad model
> (not ScreenPad Plus / DUO).
>
Hello Manuel,

Thanks for the report and additional information. Quite recently there has been
another user with yet another model reporting a regression in this field:
https://lore.kernel.org/all/178362762638.911488.8564892548331679884@eldamar.lan/
and hopefully this is the same bug.

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
> Root cause, as far as I can tell: in update_screenpad_bl_status(), the new
> logic branches on bd->props.power being truthy/falsy, but in the backlight
> framework convention, props.power == 0 means ON (FB_BLANK_UNBLANK) and any
> non-zero value means OFF. The new code appears to have this inverted:
>
I don't think any non-zero value is meant to mean OFF but perhaps the kernel simply
checks in various places !props.power for the status (?) I have found this:

#define BACKLIGHT_POWER_ON              (0)
#define BACKLIGHT_POWER_OFF             (4)

and that clears my question on "why 4 and not 1 if it's a simple bool?".
>     if (ctrl_param >= 0 && bd->props.power) {
>         err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL); // turns ON
>         ...
>     }
>     if (!bd->props.power) {
>         err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL); // turns OFF
>     }
>
> On my hardware, sysfs reports bl_power = 0 (which the kernel considers "ON"),
> but that's exactly the condition that triggers the branch sending
> SCREENPAD_POWER = 0 (off) via WMI — so the panel ends up physically powered
> off as a display, while sysfs still reports it as on at full brightness.
>
> I confirmed this empirically: manually writing bl_power = 4 (which the
> framework considers "off") reliably turns the panel back on as a display on
> my hardware:
>
>     echo 4 > /sys/class/backlight/asus_screenpad/bl_power
>
> I understand from the review thread that this series was tested specifically
> on a ZenBook DUO — it's very possible the DUO's ScreenPad firmware/EC
> behaves differently enough that the polarity works out correctly there, while
> it's inverted on this single-ScreenPad model.
>
Honestly I am not that sure about the inversion: it looks like a mistake
from me simplifying the Luke's original code and I highly hope this is
the case or I will need to branch what gets set depending on the DMI.
> Happy to test any proposed fix on this hardware, or provide more DMI/ACPI/
> debug info if useful. I'm currently working around this with a udev-triggered
> script forcing bl_power=4 on boot, but would obviously prefer a proper fix.
>
Do you want a patch or are you fine with small edits?

My understanding is that switching in the two if:

bd->props.power with (bd->props.power == BACKLIGHT_POWER_ON)

and

!bd->props.power with (bd->props.power == BACKLIGHT_POWER_OFF)

the hardware should return working fine again.

Very likely I assumed "not power" as... "not power" when it was a shorthand
for writing "power on".

> Kernel/hardware details:
> DMI: ASUSTeK COMPUTER INC. ZenBook UX435EG_UX435EG/UX435EG, BIOS UX435EG.315 04/22/2022
> Distro: Fedora Linux 44 (KDE Plasma)
>
> Thanks for the work on this — I know these ScreenPad quirks are a pain to
> get right across the different hardware variants.
>
Worry not, I will make it working again: I just need a few hints on these
mystical objects.

Best regards,
Denis
> Best,
> ___________________________
