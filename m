Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E59F30F7E8;
	Mon, 24 Aug 2026 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787587259; cv=none; b=JI3gxeVDNA6F+hlb50GXpI++0SrsAQFtUZ0A1Jqcgjk5iR8oR9kQimTzxR40X3IOoklTC0qRK9hMADwNvU2kSQJdzfU/ytwx2itcDPLupt1lRaxMVKa2QASAp3zJSrWf/6V+3jc5iEs5F7leOcw1enzxi/9NgJFGgdp4MtEuBm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787587259; c=relaxed/simple;
	bh=EaCJH7pxQ6HIjeSCLH4taFBViMizm/jYQ6WYBhaTqVs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SkmuwSS6Q5DU5K19S2xsiKd4+4bYlrr9/Crqq6zftdqdCvf31/XLp9BLOFew+J4JYFMAkhZ5IVt74a3EIDF1j+igISBs8ZaI1baBbMfqlm9AYYvyQ4rRLWqVQjiDbmB9YBTBnibK9fBsNkLfGNUoLNLOrhAieSE+lrk3JLU7QZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeoshkTw; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeoshkTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787587257; x=1819123257;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EaCJH7pxQ6HIjeSCLH4taFBViMizm/jYQ6WYBhaTqVs=;
  b=CeoshkTwxCzLBbqpZw7yczMbptdgHWlUrIDR0ZiV/hR7ODd5+peJWvSl
   Tc6/k1+5a7BcecweEEann97J06fkkvPnm81+VG57TtupqfP1AsfMQNePV
   kX82Kk35qNyx1emrVQ8GMARsztPlyQkTN+mN5kj1YVoTLJXyPjm2tnUpW
   ji15eZNwyyWhT2obWb4YpuqKwySqaUlBL5wlT+zifkZBOU2HSArTA3tx8
   z8e0UJVO6cZgQUGcgwgRr9TmwoxM59AytSLf9rgFlSYdiX8pnlXwaLQew
   V2QjecKwFoC458hDApuPGksHo1YrUREGR1s9NhtlvuOSgdIRh7gisb2bh
   w==;
X-CSE-ConnectionGUID: kolQ5+voT8CRk7rhlpuyow==
X-CSE-MsgGUID: Wo6oOaDPSpGAoti23huUdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88058454"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88058454"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:00:56 -0700
X-CSE-ConnectionGUID: Lol19+wzRx28IuNQdiYrtA==
X-CSE-MsgGUID: SU5DN7PPSb6QbceCSxsMQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="263315692"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.154])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 09:00:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 24 Aug 2026 19:00:50 +0300 (EEST)
To: =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>
cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Mingyou Chen <qby140326@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
    Hans de Goede <hansg@kernel.org>, Nabil Danial <nabildanial.93@gmail.com>
Subject: Re: [RESEND PATCH 4/5] platform/x86: bitland-mifs-wmi: drive lid
 switch via EC poll on Xiaomi Book Pro 14
In-Reply-To: <20260728180944.51356-5-wolf109909@outlook.com>
Message-ID: <349da64e-fe09-0778-3b09-3f5edb0eebe4@linux.intel.com>
References: <20260728180944.51356-1-wolf109909@outlook.com> <20260728180944.51356-5-wolf109909@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1421700348-1787587250=:1164"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1421700348-1787587250=:1164
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 28 Jul 2026, =E5=AD=99 =E8=AA=89=E9=93=AD wrote:

> The Xiaomi Book Pro 14 (2026, Panther Lake) ships with broken
> firmware: ECON, referenced by \_SB.PC00.LPCB.Q_EC._STA, is not defined
> in any of the 34 SSDTs the firmware loads (boot log: "Could not
> resolve symbol [\_SB.PC00.LPCB.Q_EC._STA.ECON], AE_NOT_FOUND"). The
> ACPI EC driver therefore never binds and none of the EC query handlers
> execute - including _Q0C/_Q0D which notify the PNP0C0D lid device. As
> a result closing the lid generates no SW_LID event: the screen stays
> on and keys depressed by the closed lid keep typing into the visible
> lock screen, locking the user account after repeated failed logins.
>=20
> The EC itself is alive and its shared-memory window at 0xFE0B0300
> (DSDT region "ERAM") tracks the lid state bit LSTE (offset 0x14, bit
> 0). Poll it from a delayed-work item and, on a change, evaluate the
> very AML methods the EC query would have run (_Q0C/_Q0D), which update
> the GFX CLID field and notify LID0 so the button driver emits SW_LID.
>=20
> Gate the quirk on both the MIFS v2 firmware variant and DMI matching
> so no other machine gets polled. Verified on the affected machine: lid
> close/open now produce proper switch events handled by systemd-logind
> (Lid closed -> suspend -> Lid opened -> resume).

So does this mean it polls it while the machine is supposed to be=20
suspended?

> Signed-off-by: Yuming Sun <wolf109909@outlook.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 94 ++++++++++++++++++++++++-
>  1 file changed, 93 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x=
86/bitland-mifs-wmi.c
> index 5f7c85a8..550ee981 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/dev_printk.h>
>  #include <linux/device.h>
>  #include <linux/device/devres.h>
> +#include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
> @@ -34,6 +35,7 @@
>  #include <linux/unaligned.h>
>  #include <linux/units.h>
>  #include <linux/wmi.h>
> +#include <linux/workqueue.h>
> =20
>  #define DRV_NAME=09=09"bitland-mifs-wmi"
>  #define BITLAND_MIFS_GUID=09"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
> @@ -161,6 +163,11 @@ struct bitland_mifs_output {
>  #define MIFS_V2_EC_MEM_SIZE=090x100
>  #define MIFS_V2_EC_REG_FAN1=090x69
>  #define MIFS_V2_EC_REG_FAN2=090x6B
> +#define MIFS_V2_EC_REG_LID=090x14=09/* bit 0: LSTE, 1 =3D lid open */
> +#define MIFS_V2_EC_LID_OPEN=09BIT(0)
> +
> +/* Interval for the lid-state poll; see bitland_mifs_lid_poll() */
> +#define MIFS_V2_LID_POLL_MS=09250
> =20
>  static u16 mifs_status(const struct bitland_mifs_output *out)
>  {
> @@ -200,6 +207,9 @@ struct bitland_mifs_wmi_data {
>  =09bool profile_valid;
>  =09bool is_v2;=09/* MIFS v2 firmware: QFAN perf-mode codes */
>  =09u8 __iomem *ec_mem;=09/* v2 EC shared-memory window */
> +=09struct delayed_work lid_work;
> +=09u8 last_lid;
> +=09bool lid_quirk;
>  };
> =20
>  static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> @@ -390,6 +400,9 @@ static int bitland_mifs_wmi_suspend(struct device *de=
v)
>  =09if (!data->pp_dev)
>  =09=09return 0;
> =20
> +=09if (data->lid_quirk)
> +=09=09cancel_delayed_work_sync(&data->lid_work);
> +
>  =09/*
>  =09 * Never abort suspend: some firmware revisions answer the perf-mode
>  =09 * query with values this driver cannot map, or fail the call
> @@ -410,6 +423,11 @@ static int bitland_mifs_wmi_resume(struct device *de=
v)
>  =09if (!data->pp_dev)
>  =09=09return 0;
> =20
> +=09if (data->lid_quirk) {
> +=09=09data->last_lid =3D 0xff;

Magic literal.

> +=09=09schedule_delayed_work(&data->lid_work, 0);
> +=09}
> +
>  =09if (!data->profile_valid)
>  =09=09return 0;
> =20
> @@ -549,6 +567,57 @@ static const struct hwmon_chip_info laptop_chip_info=
 =3D {
>  =09.info =3D laptop_hwmon_info,
>  };
> =20
> +/*
> + * Lid switch quirk (Xiaomi Book Pro 14 2026):
> + *
> + * The firmware of this machine never defines ECON, which is referenced
> + * by \_SB.PC00.LPCB.Q_EC._STA, so the ACPI EC driver never binds and
> + * none of the EC query handlers run. This kills the lid events
> + * (_Q0C/_Q0D) as well as every other EC-driven event. Poll the lid
> + * state bit (LSTE) in the EC shared-memory window and, on a change,
> + * evaluate the very AML methods the EC query would have run: they
> + * update the GFX CLID field and notify the PNP0C0D lid device, which
> + * makes the button driver emit the SW_LID event.
> + */
> +#define MIFS_LID_CLOSE_METHOD=09"\\_SB.PC00.LPCB.Q_EC._Q0C"
> +#define MIFS_LID_OPEN_METHOD=09"\\_SB.PC00.LPCB.Q_EC._Q0D"
> +
> +static void bitland_mifs_lid_poll(struct work_struct *work)
> +{
> +=09struct bitland_mifs_wmi_data *data =3D
> +=09=09container_of(to_delayed_work(work), struct bitland_mifs_wmi_data,
> +=09=09=09     lid_work);
> +=09u8 lid;
> +
> +=09lid =3D readb(data->ec_mem + MIFS_V2_EC_REG_LID) & MIFS_V2_EC_LID_OPE=
N;
> +=09if (lid !=3D data->last_lid && data->last_lid !=3D 0xff) {

Please name the literal properly, you're clearly meaning something with=20
it.

> +=09=09acpi_status status;
> +=09=09acpi_string method =3D (acpi_string)(lid ? MIFS_LID_OPEN_METHOD :
> +=09=09=09=09=09=09    MIFS_LID_CLOSE_METHOD);
> +
> +=09=09status =3D acpi_evaluate_object(NULL, method, NULL, NULL);
> +=09=09if (ACPI_FAILURE(status))
> +=09=09=09dev_warn(&data->wdev->dev,
> +=09=09=09=09 "lid %s AML failed: %s\n",
> +=09=09=09=09 lid ? "open" : "close",
> +=09=09=09=09 acpi_format_exception(status));

So if acpi failed, you still write ->last_lid?

> +=09}
> +=09data->last_lid =3D lid;
> +
> +=09schedule_delayed_work(&data->lid_work,
> +=09=09=09      msecs_to_jiffies(MIFS_V2_LID_POLL_MS));
> +}
> +
> +static const struct dmi_system_id bitland_mifs_lid_quirk_table[] =3D {
> +=09{
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "Xiaomi Book Pro 14"),
> +=09=09},
> +=09},
> +=09{ }
> +};
> +
>  static int laptop_kbd_led_set(struct led_classdev *led_cdev,
>  =09=09=09      enum led_brightness value)
>  {
> @@ -843,6 +912,9 @@ static int bitland_mifs_wmi_probe(struct wmi_device *=
wdev, const void *context)
>  =09=09=09if (!drv_data->ec_mem)
>  =09=09=09=09dev_warn(&wdev->dev,
>  =09=09=09=09=09 "cannot map EC window, fan tach unavailable\n");
> +
> +=09=09=09drv_data->lid_quirk =3D drv_data->ec_mem &&
> +=09=09=09=09dmi_check_system(bitland_mifs_lid_quirk_table);
>  =09=09}
>  =09}
> =20
> @@ -897,9 +969,20 @@ static int bitland_mifs_wmi_probe(struct wmi_device =
*wdev, const void *context)
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09return devm_add_action_or_reset(&wdev->dev,
> +=09ret =3D devm_add_action_or_reset(&wdev->dev,
>  =09=09=09=09       bitland_notifier_unregister,
>  =09=09=09=09       &drv_data->notifier);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (drv_data->lid_quirk) {
> +=09=09INIT_DELAYED_WORK(&drv_data->lid_work, bitland_mifs_lid_poll);

devm_delayed_work_autocancel() ?

> +=09=09drv_data->last_lid =3D 0xff;

The literal here as well.

> +=09=09schedule_delayed_work(&drv_data->lid_work,
> +=09=09=09=09      msecs_to_jiffies(MIFS_V2_LID_POLL_MS));

Add include for msecs_to_jiffies().

> +=09}
> +
> +=09return 0;
>  }
> =20
>  static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
> @@ -982,6 +1065,14 @@ static void bitland_mifs_wmi_notify(struct wmi_devi=
ce *wdev,
>  =09}
>  }
> =20
> +static void bitland_mifs_wmi_remove(struct wmi_device *wdev)
> +{
> +=09struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
> +
> +=09if (data->lid_quirk)
> +=09=09cancel_delayed_work_sync(&data->lid_work);
> +}
> +
>  static const struct wmi_device_id bitland_mifs_wmi_id_table[] =3D {
>  =09{ BITLAND_MIFS_GUID, (void *)BITLAND_WMI_CONTROL },
>  =09{ BITLAND_EVENT_GUID, (void *)BITLAND_WMI_EVENT },
> @@ -999,6 +1090,7 @@ static struct wmi_driver bitland_mifs_wmi_driver =3D=
 {
>  =09.id_table =3D bitland_mifs_wmi_id_table,
>  =09.min_event_size =3D sizeof(struct bitland_mifs_event),
>  =09.probe =3D bitland_mifs_wmi_probe,
> +=09.remove =3D bitland_mifs_wmi_remove,
>  =09.notify_new =3D bitland_mifs_wmi_notify,
>  };
> =20
>=20

--=20
 i.

--8323328-1421700348-1787587250=:1164--
