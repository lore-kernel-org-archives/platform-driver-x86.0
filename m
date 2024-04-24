Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508E3158DD6
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961721; cv=none; b=WNANx8oJVO+mV0mFuV7Tyuz0O5ejq8shOJB+5P1uK89WXZV6qFeeAo+HKT+84U4f64MYPDRSrx+oyYXY5/0vm7AVxxI68MIumYejy01qQfOmuvyf8+B/4bO7oN8p86L/iNnnFPkYUiWiI2ihfEYzOZ1IzLc9pmE09awm1ShmStU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961721; c=relaxed/simple;
	bh=K758PGdA4Ngy7h1cLyKwbzBiS7cpny7plCelBH5h/4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Jg4putbs8ThIDOMjqKUd/iOqcFpGKqBXXfrqaxMSyA9NVrh7BmDGf5lFZkIqMtbw5LjTj6ossg28PVzdma7YeaUDfdaNXc6x1EmndOpGs/ouaMnOUX/AVZDlS6cSXhhmi+eOew664cssTInc8KVAFOcqXIEEGwl+OTqafu94n3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eRkewd+y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eRkewd+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0xvBzDNRJJ9jSclY1XJJLLiBrhthst3ZLwuU0+xsuAw=;
	b=eRkewd+yHZ/E/CjcwawSTMcP2i1OaG4LcuaEzVbA7UHp4euPtUP2GwrxDgCzJSwCsZCVzT
	7v9L4H4dxm8gxxhJ+kEDB7LH+Oa9DdAJgNKLa29zFSN1qQtGi2FjKfY3Fg9SitnqYWevwE
	HVvBjaVePGqwNOHxqsmUBYYwNlAPKHk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-PgxBR5aYPay2iegg55eLrA-1; Wed, 24 Apr 2024 08:28:36 -0400
X-MC-Unique: PgxBR5aYPay2iegg55eLrA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4687A8DCFC3;
	Wed, 24 Apr 2024 12:28:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9D70C15771;
	Wed, 24 Apr 2024 12:28:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Nitin Joshi <njoshi1@lenovo.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 00/24] platform/x86: thinkpad_acpi: Refactor hotkey handling and add support for some new hotkeys
Date: Wed, 24 Apr 2024 14:28:10 +0200
Message-ID: <20240424122834.19801-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Hi All,

Here is v2 of my patch-series to refactor thinkpad_acpi's hotkey handling
and to add support for some new hotkeys on new models.

Changes in v2:
- Some small code style tweaks in response to reviews
- Add various Reviewed-by and Tested-by tags

Relevant parts of v1 cover-letter:

I have been very careful to not introduce any changes wrt support for
the original ThinkPad models / hotkeys which use the hotkey_*_mask
related code.

I've also done my best to avoid any *significant* functional change but
there are still some functional changes, which should all not impact
userspace compatibility:

1. Adaptive keyboard special keys will now also send EV_MSC events with
   the scancode, just like all the other hotkeys.

2. Rely on the input core for KEY_RESERVED suppression. This means that
   keys marked as KEY_RESERVED will still send EV_MSC evdev events when
   pressed (which helps users with mapping them to non reserved KEY_FOO
   values if desired).

3. Align the keycodes for volume up/down/mute and brightness up/down with
   those set by userspace through udev upstream's hwdb. Note these are all
   for keys which are suppressed by hotkey_reserved_mask by default.
   So this is only a functional change for users who override the default
   hotkey-mask *and* who do not have udev's default hwdb installed.

4. Suppress ACPI netlink event generation for unknown 0x1xxx hkey events to
   avoid userspace starting to rely on the netlink events for new hotkeys
   before these have been added to the keymap, only to have the netlink
   events get disabled by the adding of the new hotkeys to the keymap.

   This should not cause a behavior change for existing models since all
   currently known 0x1xxx events have a mapping.

Here is a quick breakdown of the patches in this series:

Patch 1 - 2: Fix a small locking issue on rmmod the only problem here
   really is a lockdep warning, so I plan to route these fixes through
   for-next together with the rest to keep things simple.

Patch 3 - 14: Do a bunch of cleanups and refactoring

Patch 15: Implements functional change no 4. I really kinda want to just
   completely disable ACPI netlink event generation when also sending evdev
   events instead of reporting these twice. But for the 0x11xx / 0x13xx
   hkey events the kernel has send ACPI netlink events for years now. So
   this disables ACPI netlink events for any new hotkeys going forward.

Patch 16 - 18: Refactor / cleanup reserved key handling

Patch 19: Actually move to sparse-keymaps

Patch 20: Update the keymap for 2 adaptive kbd Fn row keys

Patch 21 - 24: Mark's original patches adding support for the new Fn + N
   key combo and for trackpoint doubletap slightly reworked to use
   the new sparse-keymap.

Regards,

Hans


Hans de Goede (20):
  platform/x86: thinkpad_acpi: Take hotkey_mutex during hotkey_exit()
  platform/x86: thinkpad_acpi: Provide hotkey_poll_stop_sync() dummy
  platform/x86: thinkpad_acpi: Drop setting send_/ignore_acpi_ev
    defaults twice
  platform/x86: thinkpad_acpi: Drop ignore_acpi_ev
  platform/x86: thinkpad_acpi: Use tpacpi_input_send_key() in adaptive
    kbd code
  platform/x86: thinkpad_acpi: Do hkey to scancode translation later
  platform/x86: thinkpad_acpi: Make tpacpi_driver_event() return if it
    handled the event
  platform/x86: thinkpad_acpi: Move adaptive kbd event handling to
    tpacpi_driver_event()
  platform/x86: thinkpad_acpi: Move special original hotkeys handling
    out of switch-case
  platform/x86: thinkpad_acpi: Move hotkey_user_mask check to
    tpacpi_input_send_key()
  platform/x86: thinkpad_acpi: Always call tpacpi_driver_event() for
    hotkeys
  platform/x86: thinkpad_acpi: Drop tpacpi_input_send_key_masked() and
    hotkey_driver_event()
  platform/x86: thinkpad_acpi: Move hkey > scancode mapping to
    tpacpi_input_send_key()
  platform/x86: thinkpad_acpi: Move tpacpi_driver_event() call to
    tpacpi_input_send_key()
  platform/x86: thinkpad_acpi: Do not send ACPI netlink events for
    unknown hotkeys
  platform/x86: thinkpad_acpi: Change hotkey_reserved_mask
    initialization
  platform/x86: thinkpad_acpi: Use correct keycodes for volume and
    brightness keys
  platform/x86: thinkpad_acpi: Drop KEY_RESERVED special handling
  platform/x86: thinkpad_acpi: Switch to using sparse-keymap helpers
  platform/x86: thinkpad_acpi: Add mappings for adaptive kbd
    clipping-tool and cloud keys

Mark Pearson (4):
  platform/x86: thinkpad_acpi: Simplify known_ev handling
  platform/x86: thinkpad_acpi: Support for trackpoint doubletap
  platform/x86: thinkpad_acpi: Support for system debug info hotkey
  platform/x86: thinkpad_acpi: Support hotkey to disable trackpoint
    doubletap

 drivers/platform/x86/thinkpad_acpi.c | 854 +++++++++++----------------
 1 file changed, 353 insertions(+), 501 deletions(-)

-- 
2.44.0

