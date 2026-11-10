Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794325687;
	b=QsZ/SNaaJkiJs8m46Gsdj+TCko1O4CCUL+exzA9FdMx2PLi89FY8Kr55ez5cxdslAALw
	 E81dw3QoFbY+GeKVVZ3ZD90lqgkf1ob3x9t+wmBglYvznwa6aiv+r2PPBzmj9O+G5qvOj
	 PvU89HQSafUDb4z7YCnD5FxGUxnve7BLKp4gFwCHRQhknH4CQUH3bURDDznbfMguGcnzj
	 igyHgiapIbsrZ/3D165hvWFxfRT+2gYr13VCy2Dh/2f4L4qPXOiN6bgiRigE6K9DIc/56
	 WQr60GHdUcJOExiPu3iVqJx6Ko5XJOB//0w9OG3+TDH9lzkM7szHRtbqHk7eD5k4rWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325687;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=YzeXwuO1UFVa8LAv0s+kyEoQhzEWubMOqH1wrS8xbv8=;
	b=Ueu1IYMJH4KChMLecRe+vxGalIbCXSDSQ2F3Rk5yZCpgO47My3PNRcEGBTbMfeNfB30T
	 LlD24eUmut+baDOFrahu1aScTP/yHFX3cm7/lV+4I5mwYIAMZtdg+CSqpO4sF95maORaR
	 XLhnC4dItatMJrTpUUHqvYZYCenqqS9nMrdJ3PWgtS6IFbrSiVJm20Ki/gGx9skOPZZgY
	 /bSGMuvPFOzoySLem6TyVfa6Unsdi6DweKD3B5GALshAQRVcOcuT4K6BuD2uQr8pC86mW
	 Y4Kdcp+TkVcC7VB2+tVVE0fuc5qetjl30ELTiVGH8zKxYLkeEaRQKtq10bk3n8XGdbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=q+slP7ne;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199960A2614;
	Tue, 10 Nov 2026 15:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C199960A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=q+slP7ne
ARC-Seal: i=1; a=rsa-sha256; t=1794325669; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W62zXUkB3r4eQTQmThdKyvML/KsZl0bMoJZg4FLggml7Or1pAMTj8x0bBeo9otRyzY1YSoWcxBIwDi8xS2PX5u73xDyZ0BjtsEIBHMhZQ2Uw2rztonaazImbmw1tZvNwwG5WQXiJ+W0Lsm8D3l4T0HppqEVefItM2StK21NoUXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794325669; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YzeXwuO1UFVa8LAv0s+kyEoQhzEWubMOqH1wrS8xbv8=; 
	b=ibi7jUBDj5eTomMDPc5CAx7PYj6NDwGNyUUvHSND0D2zkdOiDfafr46oDqv6l/o2jGRH1cwavDESMpUfA+/twpLKLnrBRiqNDAKy5JiAr+s9g7GFuuLgGhrLAVSzk0AqxEF9wNPTaC584n9SJDztOem3ktE2uZR3F3LiK9Lybus=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=q+slP7nen6ses9nkT6n6zmqRkia2+OMbQe30XA2//uuL2KBhn1KKqoI85h40vP2SKUWrPIo7qrLEaGnr0PflfVhgij/FsspBVTdkRVJzwq06JSvewSPhuhGC2ZUjYz4aVXzaHvs06X5nPS+2/WjF3DOu7A0OkNV2deM0SlrZbskk7ubh+paQXDihnT7c3kr+u/tOSObt6wH+gtOzViFG1xRXudBvc+wRyzd4sfxMst/ppQhNvTY3NYuzITXQ2INTU3xJpaRNkxxrFwzJK9HWByMmlDSGf1ItiyhfyNqgAt/jwlOBaNKeiY3mBIm/Q45rnnuvm8j97uVV1fne2RE6/w==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=YzeXwuO1UFVa8LAv0s+kyEoQhzEWubMOqH1wrS8xbv8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794325667947770.1458812156967;
	Tue, 10 Nov 2026 07:47:47 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH v8 0/3] platform/x86: ideapad-laptop: Fully support auto
 keyboard backlight
Date: Tue, 10 Nov 2026 23:47:01 +0800
Message-Id: <20261110-leds-trigger-hw-changed-v8-0-2717115d612c@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33SwU7EIBAG4FfZcBZDoQzgyfcwHloYuhhtFbpVs
 +m7C1uTNk26x0mG75/JcCUJY8BEnk5XEnEKKQx9LvTDidhz03dIg8s14YwDkwzoO7pExxi6DiM
 9f9Oly1EDDfBKa9s6T/Lrz4g+/Nzkl9elTpf2De1YuNJxDmkc4u8teuKlb0mBSh+mTJwyarm2d
 c2ksF48x6HvHj8GJCVkEiujKnPMiMxI30qpOEcBuGPqldGMHzN1ZrxRyG1jFPg9IzcMr44ZmRm
 BjDmwdWME7BhYGXNvGihLSTDCOqW1UjtGbZh706iyFGakBYdWVhtmXg4Z8euSf8r4f915/gMbQ
 FtlRwIAAA==
X-Change-ID: 20260506-leds-trigger-hw-changed-96a62188cbdf
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ike Panhc <ikepanhc@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

Currently, the auto brightness mode of keyboard backlight maps to
brightness=0 in LED classdev. The only method to switch to such a mode
is by pressing the manufacturer-defined shortcut (Fn+Space). However, 0
is a multiplexed brightness value; writing 0 simply results in the
backlight being turned off.

Decouple brightness processing code from LED classdev, and add full
support for the auto brightness mode. In this mode, the keyboard
backlight is controlled by the EC according to the ambient light sensor
(ALS).

To utilize this, a private hardware control trigger "ideapad-auto" is
added, with the event handling procedure calling the
led_trigger_notify_hw_control_changed() interface to activate/deactivate
the private trigger according to the current LED trigger state. To align
with LEDS_BRIGHTNESS_HW_CHANGED, the driver neither depends on
LEDS_TRIGGERS_HW_CHANGED nor selects it.

Meanwhile, block brightness changes on exit to prevent the side effect
of LED device unregistration when the private trigger is active from
resetting the brightness to zero, so that the state of auto mode can
retain among boots.

Acked-by: Ike Panhc <ikepanhc@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v8:
- Replace unreachable() with an explicit return to work around
  miscompilation under certain combination of toolchains (found by
  kernel test robot, off-list, thanks Ilpo Järvinen)
- Remove applied material
- Link to v7: https://patch.msgid.link/20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe

Changes in v7:
- Add a new patch to the series to collect existing trigger attribute
  stuff together into led-triggers.c (thanks Lee Jones)
- Leave all new attribute stuff at led-triggers.c (ditto)
- Rename the offloaded() callback to hw_offloaded() (ditto)
- Rename the trigger_may_offload attribute to
  trigger_may_offload_to_hw (ditto)
- Use "[foo_trigger]" to represent a selected and offloaded trigger, and
  no longer use a dedicated container to represent selected but not
  offloaded ones (ditto)
- Remove messages mainly for debugging (ditto)
- Inline led_trigger_{init,destroy}_hw_changed() into led-class.c by
  exporting led_trigger_hw_control_changed_worker() (ditto)
- Rephrase some comments and messages (ditto)
- Constify device attribute trigger_may_offload_to_hw
- Address a concern from Sashiko
  - Fix printf format string
  - https://sashiko.dev/#/patchset/20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe?part=11
- Link to v6: https://patch.msgid.link/20260902-leds-trigger-hw-changed-v6-0-55693cd78877@rong.moe

Changes in v6:
- New patch in the series to address a concern from Sashiko
  - [PATCH 1] leds: class: Always protect brightness_show() with led_access
  - https://sashiko.dev/#/patchset/20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe?part=7
- Update Date: and KernelVersion: for the document of
  /sys/class/leds/<led>/trigger_may_offload
- Implement workqueue deferal mechanism
  - Protects ideapad_kbd_bl_led_cdev_brightness_set() with the new mutex
    as well
  - No longer convert last_hw_brightness into atomic_t as it's not
    required now
  - https://msgid.link/e2b081dfd8f96511a73b86ab3ec75e5cd759b79b.camel@rong.moe
- Simplify the auto mode state preservation logic by converting
  `priv->kbd_bl.initialized' into a tristate integer
- Link to v5: https://patch.msgid.link/20260821-leds-trigger-hw-changed-v5-0-3e00d6c4a936@rong.moe

Changes in v5:
- Address a concern from Sashiko:
  - Non-atomic update of led_cdev->flags causes a data race that can
    drop the LED_UNREGISTERING flag
  - Fix it by synchronize the update with trigger_lock
  - https://sashiko.dev/#/patchset/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=8
- Address a concern from Sashiko:
  - led_trigger_notify_hw_control_changed() might sleep, but without any
    internal deferral mechanism or annotation
  - Annotate the method with might_sleep(), since the very first users
    of the interface, i.e., ideapad-laptop and (supposedly)
    thinkpad_acpi, will call the interface from work contexts. It does
    not deserve the overhead of internal deferral mechanism
  - https://sashiko.dev/#/patchset/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe?part=9
- Update "Changes in v4" to include more details
- Link to v4: https://patch.msgid.link/20260802-leds-trigger-hw-changed-v4-0-f97e2ca976fe@rong.moe

Changes in v4:
- Drop the RFC prefix
- Add a new patch in the series to address a concern from Sashiko
  - [PATCH v4 08/12] leds: trigger: Do not attach trigger to a removing LED
  - Without it, the following patch may expose a race condition if a
    future LED driver synchronizes led_classdev_unregister() and
    led_trigger_notify_hw_control_changed() poorly. The ideapad-laptop
    patches in the series doesn't expose the race condition though
  - In theory, the race condition can also be triggered by a userspace
    program writing to the "trigger" attribute right before
    device_unregister() is called
  - https://sashiko.dev/#/patchset/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe
- Address other concerns from Sashiko
  - Reject insane hardware brightness
  - Do not notify the LED trigger core when the registration of the
    private trigger has failed
- Enable LEDS_TRIGGERS_HW_CHANGED by default when
  LEDS_BRIGHTNESS_HW_CHANGED is enabled
- Add missing #include (Thanks Ilpo Järvinen)
- Remove needless #include (ditto)
- Remove needless code alignment (ditto)
- Link to v3: https://patch.msgid.link/20260719-leds-trigger-hw-changed-v3-0-5fb55722e36e@rong.moe

Changes in v3:
- Integrate https://lore.kernel.org/all/20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe/
  into the series
  - Adopt __led_trigger_is_hw_controlled() in the rest of the series
- Rearrange the series so that the code using the offloaded() callback is
  introduced before the driver implementation (thanks Thomas Weißschuh)
- Reword documentations and commit messages (ditto)
- Adopt guard() and lockdep (ditto)
- Address concerns from Sashiko
  - Fix a race condition in ideapad_kbd_bl_led_cdev_brightness_set()
  - Fix trigger re-registration of ideapad_kbd_bl_auto_trigger
  - https://sashiko.dev/#/patchset/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3%40rong.moe
- Make registration failures of ideapad_kbd_bl_auto_trigger non-fatal
- Link to v2: https://patch.msgid.link/20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe

Changes in v2:
- Restrict the led_trigger_notify_hw_control_changed() interface to
  private triggers only
  - Drop PATCH v1 1/9 ("leds: Load trigger modules on-demand if used as
    hw control trigger"), not relavant any more
- Gate the led_trigger_notify_hw_control_changed() interface behind
  Kconfig LEDS_TRIGGERS_HW_CHANGED and LED device flag
  LED_TRIG_HW_CHANGED
- Fix lock ordering inversion
- ideapad-laptop:
  - Only call led_trigger_notify_hw_control_changed() when needed
  - Serialize keyboard backlight notifications
- Reword commit messages and documentations
- Link to v1: https://patch.msgid.link/20260227190617.271388-1-i@rong.moe

---
Rong Zhang (3):
      platform/x86: ideapad-laptop: Serialize keyboard backlight tracking
      platform/x86: ideapad-laptop: Decouple hardware & classdev brightness for keyboard backlight
      platform/x86: ideapad-laptop: Fully support auto keyboard backlight

 drivers/platform/x86/lenovo/Kconfig          |   1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c | 279 +++++++++++++++++++++------
 2 files changed, 225 insertions(+), 55 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20260506-leds-trigger-hw-changed-96a62188cbdf

Thanks,
Rong

