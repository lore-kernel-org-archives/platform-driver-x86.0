Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D15199B4
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714334; cv=none; b=VC7RxaNhdFTIwehogbloekAoWg7fwcTW5RaoVrEd6gj8f1AmXjcmqykQZFjMJsr9mTZ7XSM32pB1zQIivsTCr2S1u2U6F5FXDmany/ga9lNzWFzrtx60aSLgSVe6Y3OlP/9H6TszmW1wvs2Xpzc/tQZZdmybEhwySSuBrPZrTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714334; c=relaxed/simple;
	bh=+xmNJ5bI5lAzqXafWsPy8XiJQuBS3Mjki9nJvH+c7vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d80Z6OTexPZXaIQE8zxFh7jkQtxkJ5sxVfA4zJ0f6YDZE5/chQFtFQ+wSfGBpnY/tWNySYgZBupNIvphFRLuGZt5A5l20A54f+Y27HY+1i0dRLEpuLif4Gf3T5D3gzUA0tIteDW2EbV+cWI2+iMtWvs4WzxDyk/dR67RNOR2bR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BRPDvVLt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BRPDvVLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1S/AJXq0rQrlD6I8rI07rKpBMasUHTiTmcxpdMUwm3E=;
	b=BRPDvVLtz4f94PbroBBuJoveKmwD+pZ8ZG63e9lt69I7NDbO6I62Vf2R6OYdHXLTsDCeXa
	0UCpTzmebos5n6tuMP4iUecIWhAyf7zvl1hv1v0jvLGLv6znRoThrGEmRNuMgeiQMcJp0F
	3pIqlB9FRvvKzR9t318GbP8TE/HbSSQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-ttgP8wMNMjaluszo_2QV7g-1; Sun,
 21 Apr 2024 11:45:27 -0400
X-MC-Unique: ttgP8wMNMjaluszo_2QV7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 486C0380450A;
	Sun, 21 Apr 2024 15:45:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4B2A402482D;
	Sun, 21 Apr 2024 15:45:25 +0000 (UTC)
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
Subject: [PATCH 00/24] platform/x86: thinkpad_acpi: Refactor hotkey handling and add support for some new hotkeys
Date: Sun, 21 Apr 2024 17:44:56 +0200
Message-ID: <20240421154520.37089-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Hi All,

My reply in the "[PATCH v2 1/4] platform/x86: thinkpad_acpi:
simplify known_ev handling" handling where I indicated that I would work
on converting the thinkpad_acpi hotkey handling to use sparse-keymaps
underestimated the work this required quite a bit.

The hotkey code is quite old and crufty and full of special cases to
support many generations of ThinkPads, so I ended up doing some
significant refactoring and cleanup before doing the actual conversion
to sparse-keymaps.

I have been vary careful to not introduce any changes wrt support for
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

Mark if you can make some time to review patches 1-20 that would be great.

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

 drivers/platform/x86/thinkpad_acpi.c | 849 +++++++++++----------------
 1 file changed, 348 insertions(+), 501 deletions(-)

-- 
2.44.0

