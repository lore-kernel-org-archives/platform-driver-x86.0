Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594657;
	b=VJRo65V1sPb7i1e8g6zObk+jCv6B1DwQ++jYy3M+qtkQVoBawbj1xpIBqTMQS+1Y1vpq
	 1DtM1FsEgW1Hnn17KZ30QUyUu2VVu7XlWpvC31D16tyOLayfpkjzhGPo1EIT08gqsn9gg
	 e5Hs2ii5yjZQJ64mxQto3EDSt+mUdhy+RQNFVXUK+PAuDAJLGQUZcPjYnrEWv5zw4Cppc
	 c1XzgSSDeWyJfwukU72PMztbDO/bQhbjn4Ye+BO8+GTpJIqhBegNsQ49E4BpFErwQRTpG
	 v3AOvLVjxVPrgSzd7IjPBIlqLQmZx4w6/WOed1RSIxa92+4fgHNFkH6gSn0SY8w7Uqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594657;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+U6fWq1g8ry70s4OdmI+TV+gBJOABwlcVv7t82zgihU=;
	b=ulqRWjrMwRZxHRWLXRDpz7k+3LMO1dik1kIFB2X8NTy64XnjfoIAt+1/BbjAjAtz/S/S
	 O4XVz03qijcNVr9cK/JwdL5bwJMQcLyESF89RlAxTrJ6dN6CplIdDr4nYJJ4xPPKGeyGa
	 lEZvqBF4u5BS/seAbKiX88NfzzxkXzy7sOYcp1RrkCclGYowJVj6X9vE2cWTYf86HM/nx
	 L8Yho8qdSqMCaTW4opw23VcG5+0R2tkHD0NDXI3c7pliauYmuOE7td4t/Zmo1Phk2k/E1
	 L2TmF77GdFDo1XM/K8im2L0e7bLQXauoW0ji/nAUK/Wneln2XfGp4olFmCVKrUwM10w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b="qF/pfjex";
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854A5606A326;
	Wed, 25 Nov 2026 08:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 854A5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=qF/pfjex
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795594654; x=1795853854;
	bh=+U6fWq1g8ry70s4OdmI+TV+gBJOABwlcVv7t82zgihU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qF/pfjexD4qg9LexDthVH/DshwRFeHTB8B+z7bp4HeewK4Kgkuj16FqKUcyC8cMoL
	 xrOlZy3ZGJ0WYgeJr/oZtidyTwbuU6j3WdLDq21VF5L2F7a73QGFnf+4cP04lPS6CB
	 /SfDhFfErN6O8XGqWQ2NaUKEG/2iKwuArzk0zfUl/ZVjvC3cfGVAs6mAMevValoP39
	 mhAluC44hT3hfkQE5vYQTIaX4YFiZax0yiZp+g5RIPB7kLzsguNJCc/Ggn00OMpaMz
	 roD8AFTn76CXiHeaqxq1Kc8XHLyN2cofa2kJIC0UgpDRt/t0OwTim87YU1PYpHQQBl
	 8m8oZopo6s9jQ==
Date: Wed, 25 Nov 2026 08:17:27 +0000
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Zheng Shuyang <yhshzh0@gmail.com>
Subject: Re: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Message-ID: <Tf4l0QLSFWfEcunMVtUNowKIhzNRJjmjCYJKXUFzo-5xhOXhZpn-sUEN57KHkDgKanu1FrS-JHBYcI3K7Mjv176Tg0kMQ4QPIUoEcsYKQig=@protonmail.com>
In-Reply-To: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
References: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: f24bc313c7d048e8c5cfa7645fbfdf2f0f9f691d
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fuwei,

I retested v3 on the same HUAWEI MateBook 16 (AMD Ryzen 7 5800H, DMI
product name "CREM-WXX9", BIOS 2.32). I applied all five patches
unmodified on top of c339f4010dea and built the driver as a module with
W=3D1 (no warnings) for Fedora's 7.3.4-300.fc45 kernel. To see what keeps
the cached profile in sync, I traced huawei_wmi_profile_event(),
huawei_wmi_profile_set() and platform_profile_notify() with kprobes,
read the firmware mode through \GTUB and the EC byte it returns (OKTS),
and turned on the ACPI EC query debug messages.

Most of it works:

- huawei-wmi-method and huawei-wmi-events bound their GUIDs.
  huawei-wmi-keyblock bound nothing, as this machine has no
  39142400-... GUID. /sys/devices/platform/huawei-wmi is still there,
  and the charge thresholds and fn_lock_state read the same values as
  with the stock driver. Writing fn_lock_state works, and on/off writes
  to the micmute LED are accepted.
- platform_profile_choices is "balanced performance", and "low-power"
  is refused. Loading the module did not change the firmware mode,
  both in balanced and in performance.
- Writing either value to platform_profile, GNOME's Power Mode menu
  (tuned-ppd), Fn+P and a \STUB call made outside the driver all switch
  the firmware mode, and platform_profile follows (also over 10
  switches in a row through the PowerProfiles D-Bus property that
  GNOME's menu sets). A single Fn+P press raises one event; after 3-4
  presses within about a second, platform_profile still matched the
  firmware (the event count did not always match the presses).
  0x2a0/0x2a1 are not logged as "Unknown key pressed".
- Unplugging the charger in performance mode raises 0x2a0 on this
  machine as well. With tuned and tuned-ppd stopped, nothing else wrote
  platform_profile, and the profile followed the firmware to balanced.
- On battery, writing "performance" returns 0, \STUB raises 0x2a6
  1.5-7 ms later, and platform_profile is back to balanced. \GTUB reads
  0 afterwards; in this machine's DSDT \STUB returns without writing
  OKTS in that case. Fn+P on battery also raises 0x2a6 and the profile
  stays balanced.
- This machine's DSDT never raises 0x2a5 and I never saw it, so I have
  no data for your second question.

I found two cases where the cached profile goes stale.

1. Suspend. If I suspend (s2idle) in performance mode, \GTUB and OKTS
   read 0 after resume, but no WMI event reaches the driver (the kprobe
   on huawei_wmi_profile_event() saw nothing), so platform_profile keeps
   reporting "performance". This happens both when the charger stays
   plugged in and when I unplug it during suspend, and the profile was
   still wrong after plugging back in. With the stock driver, \GTUB read
   0 after each of the six resumes from performance I tried, including
   one after a suspend of only a few seconds.

   After resume the firmware raises no event at all. With the EC query
   debug messages on, a plain resume runs only _Q32 and _QC6. In the
   DSDT, _QC6 reads OKTS and, when the EC's UADP byte is 0, sends ALIB
   the same mode parameters as _Q72/_Q71 (which run after every
   accepted \STUB call and raise 0x2a0/0x2a1), but takes the STAPM,
   fast and slow limits from EC fields, and raises no WMI event.

   Re-reading \GTUB on resume fixes it here: with the change below,
   platform_profile matched the firmware in all six suspend cycles that
   started in performance (one with tuned and tuned-ppd masked, one
   unplugging during suspend), and each trace showed the resume callback
   followed by one platform_profile_notify(). With tuned-ppd running,
   GNOME's menu then follows to Balanced.

   The other option is to write the mode that was active before suspend
   back on resume, which keeps the user's selection. I tried that once
   per case, with tuned and tuned-ppd masked: after a suspend in
   performance, performance came back and _Q71 ran; after a suspend in
   balanced, _Q72 ran; after unplugging during a suspend in performance,
   \STUB refused with 0x2a6 and platform_profile reported balanced, with
   one notification. That is a policy choice (bitland-mifs-wmi restores
   its profile on resume, for example), so I'm suggesting the minimal
   re-read; I can send the restore variant if you prefer it.

   Hibernation is disabled on this machine (lockdown), so I only tested
   s2idle; with DEFINE_SIMPLE_DEV_PM_OPS the callback also runs on thaw
   and restore. Zheng, did your s2idle test on FMB-P start in
   performance mode?

   Something like this, on top of v3, to fold into patch 4:

--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -18,6 +18,7 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
+#include <linux/pm.h>
 #include <linux/power_supply.h>
 #include <linux/sysfs.h>
 #include <linux/wmi.h>
@@ -1074,6 +1075,15 @@ static void huawei_wmi_method_remove(struct wmi_devi=
ce *wdev)
 =09platform_set_drvdata(huawei_pdev, NULL);
 }
=20
+/* CREM-WXX9 clears its Turbo flag across s2idle without raising an event.=
 */
+static int huawei_wmi_method_resume(struct device *dev)
+{
+=09huawei_wmi_profile_sync(dev_get_drvdata(dev));
+=09return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(huawei_wmi_method_pm, NULL, huawei_wmi_met=
hod_resume);
+
 static const struct wmi_device_id huawei_wmi_method_ids[] =3D {
 =09{ HWMI_METHOD_GUID },
 =09{}
@@ -1082,6 +1092,7 @@ MODULE_DEVICE_TABLE(wmi, huawei_wmi_method_ids);
=20
 static struct wmi_driver huawei_wmi_method_driver =3D {
 =09.driver.name =3D "huawei-wmi-method",
+=09.driver.pm =3D pm_sleep_ptr(&huawei_wmi_method_pm),
 =09.id_table =3D huawei_wmi_method_ids,
 =09.probe =3D huawei_wmi_method_probe,
 =09.remove =3D huawei_wmi_method_remove,

2. Fast writes. After 50 quick balanced/performance write pairs (v3's
   event handling, tuned and tuned-ppd masked), platform_profile ended
   on the wrong value in 4 of 6 rounds, in both directions (for example
   "performance" while \GTUB read 0). I did not see this with normal
   GNOME or Fn+P switching, although one GNOME switch already makes
   tuned write platform_profile twice about 40 ms apart (it first
   writes back the value it saved before the previous profile, then
   applies the new one).

   On this machine \STUB raises one event, and the EC's _Q71/_Q72 raises
   the same code again 17-51 ms later (the EC query debug messages show
   one _Q71 or _Q72 per write), even when the mode does not change.
   _WED returns \_SB.PCI0.LPC0.EC0.WMEN, one AML variable that \STUB and
   the EC query handlers that raise WMI events (_Q71, _Q72, _Q74, ...)
   overwrite, so the code a handler reads can belong to a different
   switch. ACPI notifications also run on the unordered kacpi_notify
   workqueue (the two events of one write landed on different CPUs
   here), so two handlers can take wmi_lock in a different order than
   they read _WED.

   Re-reading the mode for 0x2a0/0x2a1 as well, as v3 already does for
   0x2a5/0x2a6, fixed it: 0 of 6 rounds stale. It also stops the
   duplicate notifications: v3 sends two platform_profile_notify() calls
   per write, and with the change none are needed because the cache
   already holds the written value. Fn+P, unplug and resume still worked
   with both changes applied.

   Two side effects: if the \GTUB read fails, the cache now stays as it
   was (with a ratelimited warning) instead of following the event code,
   and it assumes \GTUB is already updated when 0x2a0/0x2a1 arrives. I
   could only test this on CREM-WXX9, so it would be good to check it on
   FMB-P and NbF-XX.

   And on top of that:

--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -281,7 +281,7 @@ static const struct platform_profile_ops huawei_profile=
_ops =3D {
 =09.profile_set =3D huawei_wmi_profile_set,
 };
=20
-/* Refresh once when the event does not carry a known mode. */
+/* Re-read the firmware mode; notify only if the cached profile changed. *=
/
 static bool huawei_wmi_profile_sync(struct huawei_wmi *huawei)
 {
 =09enum platform_profile_option profile;
@@ -928,21 +928,16 @@ static struct wmi_driver huawei_wmi_keyblock_driver =
=3D {
 static int huawei_wmi_profile_event(struct notifier_block *nb, unsigned lo=
ng code, void *data)
 {
 =09struct huawei_wmi *huawei =3D container_of(nb, struct huawei_wmi, profi=
le_notifier);
-=09struct device *profile_dev;
=20
 =09switch (code) {
+=09/*
+=09 * Do not trust the code: on CREM-WXX9, _WED returns one AML variable
+=09 * that \STUB and the EC query handlers overwrite, the EC raises
+=09 * 0x2a0/0x2a1 again some time after each \STUB, and notifications
+=09 * can be handled out of order. Re-read the mode instead.
+=09 */
 =09case 0x2a0: /* Firmware disabled Turbo. */
 =09case 0x2a1: /* Firmware enabled Turbo. */
-=09=09scoped_guard(mutex, &huawei->wmi_lock) {
-=09=09=09if (huawei->reported_profile =3D=3D PLATFORM_PROFILE_LAST)
-=09=09=09=09return NOTIFY_DONE;
-=09=09=09huawei->reported_profile =3D code =3D=3D 0x2a0 ?
-=09=09=09=09PLATFORM_PROFILE_BALANCED : PLATFORM_PROFILE_PERFORMANCE;
-=09=09=09profile_dev =3D huawei->profile_dev;
-=09=09}
-=09=09if (profile_dev)
-=09=09=09platform_profile_notify(profile_dev);
-=09=09return NOTIFY_STOP;
 =09case 0x2a5: /* TBF2-restricted transition; re-read the firmware mode. *=
/
 =09case 0x2a6: /* Firmware rejected the request without reporting a mode. =
*/
 =09=09if (huawei_wmi_profile_sync(huawei))

Two more things I saw, both on the tuned side:

- On battery, selecting Performance leaves GNOME's menu on Performance
  while the firmware and platform_profile stay balanced. tuned writes
  "performance", the write returns 0, and 0x2a6 restores balanced
  1.5-7 ms later, but tuned-ppd ignores platform_profile changes while
  the file is open or within 100 ms after a write closes it
  (CLOSE_MODIFY_BUFFER in tuned 2.28.0's ppd/controller.py). Failing
  the write would not help: \STUB returns status 0 when it refuses, and
  tuned's acpi plugin ignores the write result. I think this belongs in
  tuned-ppd.
- Choosing Power Saver in GNOME while in performance leaves the
  firmware in performance: tuned's powersave profile asks for
  "low-power|quiet", which this driver does not offer, so it leaves
  platform_profile alone (tuned logs "Requested platform_profile
  'low-power' unavailable").

Thanks for looking into tuned-ppd. What I reported for v1 and v2 came
from my test setup: tuned-ppd  only checks at startup whether
/sys/firmware/acpi/platform_profile exists, and I loaded the RFC module
after boot, so it was not watching the file. After restarting tuned-ppd
with v3 loaded (tuned-ppd 2.28.0, sysfs_acpi_monitor=3Dtrue, Fedora's
default), the PowerProfiles ActiveProfile that GNOME's menu shows
followed Fn+P in both directions.

Feel free to rework the two changes however you prefer. If you fold them
into patch 4 (only that patch), you can add my=20
Co-developed-by and Signed-off-by: Eren =C3=96zen <erenozen@protonmail.com>

I'll retest the next version and send a Tested-by then; everything else
works on CREM-WXX9 with v3 as posted. I'll send the rebased charge-mode
diff in the other subthread.

Claude helped write the test scripts, the two changes above
and this report (please keep that noted if you fold the changes in); I
ran all tests on the laptop and checked the results.

Thanks,
Eren

