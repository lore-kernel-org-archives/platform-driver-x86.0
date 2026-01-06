Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E633A9D9
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Jan 2026 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767706435; cv=none; b=VkiR3DQDujqzfutZNYfuZRq9Gpe9JS2UG9UqzEnbUY/Xbzk6ooFmqW2eNo7DLpBZoPTT6rPqikXShsNGJRo/48mQeRlCH+NQf6hYfCXoWXtz3srqBHD5nTB6bh6rETh96XGcKI11gk/rDvdj6h52vEKmqT9FYJYILfNfRYRkf8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767706435; c=relaxed/simple;
	bh=5mcY739T045NAHEANe9VY8XRMEqY+Lj6DUo/z41JVL0=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=OYB3KS9+vKOBHoPlzumTG2dZgFE5lVhXy6EI/wrwDOkXhvR7+1rjLfEHrF9wLY0cGcHkrbCul6E7HTBbW5iWq+/JOx9hZDhFaFoLzkV0+xTCbbHORKFwULXpgl2nY312nJxAtOsS5Grdg9xCs8VAuUu1uN3OQgS2RDShboDSfL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LnXchcfs; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LnXchcfs"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dlsZP53zmz9tjn;
	Tue,  6 Jan 2026 14:33:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767706429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=38Tk8IMhGQJezyHYwrG8dhxhzj74HYbDZTa1pxV6VRE=;
	b=LnXchcfslPg2Jdsf75ALMU2+ZK9BKeeDsOsQ24wMyRitO3is9RELqUDTAywxYe5wp2oApo
	ux2S/Hl4wOqfvf8Ecc4JcrwgcoHc2DERMOuSMDR0YHKRM/slVx+LnbsgmOnxfIt2nuj5sf
	0azRymSgmALIHo/zAqznjHvbivFnIyfzB8aRqWusnYB5ojDxjzWjPljDXwlUpcwVWqkJoX
	s9FyET1mq+5QtFBway/wQ5Pa64zreTC4eY211tYhgALiu5Zw6D+XIZnw7HqGRZXrKEkNgo
	wTW/SC+lf4XRptozz4SDu2qBJ7fyjXkbmmryJw7dDXJEjEnKnOBL5eN7bnJlYw==
Message-ID: <232673a8-8856-4233-a7f5-cb0fb17c4e90@mailbox.org>
Date: Tue, 6 Jan 2026 14:33:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: platform-driver-x86@vger.kernel.org
Content-Language: en-US
From: Christian Lorig <lorig.it@mailbox.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH REQUEST] ideapad_laptop: Keyboard backlight not functional on
 Lenovo Yoga 7 14ARP8 (82YM)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a222dc35d44489db9bc
X-MBO-RS-META: p45b8zoe67p88u48mq697zowwy8nycmd

Hello,

I'm reporting a keyboard backlight issue on the Lenovo Yoga 7 14ARP8 
that appears to be a driver bug in ideapad_laptop.

SYSTEM INFORMATION:
- Model: Lenovo Yoga 7 14ARP8 (Product: 82YM)
- BIOS: LENOVO
- Distribution: Fedora Silverblue 43
- Kernel: 6.17.12-300.fc43.x86_64
- ideapad_laptop module version: rhelversion 10.99

SYMPTOMS:
The keyboard backlight hardware is present and functional (confirmed 
working under Windows), but does not respond to any controls under 
Linux. The GNOME settings toggle and Fn+Space hotkey register state 
changes, but the physical LEDs never illuminate.

DEBUGGING PERFORMED:
1. The backlight device is correctly detected:
    - /sys/class/leds/platform::kbd_backlight/ exists
    - max_brightness: 2
    - Device links to VPC2004:00

2. Writing to brightness works without errors, but has no effect:
    echo 2 > /sys/class/leds/platform::kbd_backlight/brightness
    (no errors, but LEDs remain off)

3. Events are registered correctly:
    - brightness_hw_changed increments when using Fn+Space
    - brightness value updates in sync with brightness_hw_changed

4. Debug output from /sys/kernel/debug/ideapad/status shows:
    Backlight max:  16
    Backlight now:  0
    BL power value: off (0)

The critical issue is "BL power value: off (0)" - the backlight power 
remains disabled regardless of all attempts to enable it.

5. Tested module parameters with no effect:
    - ymc_ec_trigger=1
    - set_fn_lock_led=1
    - ctrl_ps2_aux_port=1
    - touchpad_ctrl_via_ec=1
    All combinations failed to change "BL power value" from off to on.

6. Kernel parameters tested:
    - acpi_backlight=native (made events register, but LEDs still off)
    - acpi_osi="!Windows 2020" (no effect)

ACPI ANALYSIS:
I decompiled the DSDT and identified the keyboard backlight control method:

Method: \_SB.PCI0.LPC0.EC0.VPC0.KBLC

This method takes a single argument with the following structure:
- Bits 0-3: Command (1=Get, 2=Query, 3=Set)
- Bits 4-15: Mode (1=On/Off, 2=Manual brightness, 3=Auto+brightness)
- Bits 16-31: Value (brightness level or on/off state)

Example valid calls:
- Set Auto mode, brightness 2: 0x00020033
- Set Manual mode, brightness 2: 0x00020023
- Set On/Off mode, on: 0x00010013

The ACPI method writes to EC registers KBLM and KBLS, which control the 
keyboard backlight state and brightness.

ROOT CAUSE:
The ideapad_laptop driver recognizes the keyboard backlight capability 
and creates the sysfs interface, but does not call the KBLC ACPI method 
to actually enable the backlight power. The driver needs to:

1. Call KBLC with appropriate parameters when brightness is set
2. Ensure "BL power value" transitions from off to on
3. Handle the specific requirements of the 82YM model

ADDITIONAL HARDWARE INFO:
 From /sys/kernel/debug/ideapad/cfg:
_CFG: 0xfe0d0014
Capabilities: bluetooth wifi camera

 From dmidecode:
Manufacturer: LENOVO
Product Name: 82YM
Version: Yoga 7 14ARP8

REQUEST:
Could you please add support for keyboard backlight control on this 
model? I can provide additional debugging information, test patches, or 
perform any requested diagnostics.

The ACPI method structure is already documented above. The main 
requirement appears to be calling \_SB.PCI0.LPC0.EC0.VPC0.KBLC with the 
correct parameters when the user changes brightness settings.

Thank you for your time and consideration.

Best regards,
Chris


**Disclaimer**: I am no kernel module expert. This analysis was done 
with the help of Claude.ai and specifically conclusions in the "ACPI 
Analysis" section are not mine.

