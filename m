Received: from cs.upt.ro (smtp.cs.upt.ro [193.226.12.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3D31C01;
	Mon,  7 Sep 2026 00:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.226.12.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788739396; cv=none; b=VvKq2pMcqfKgBtSih8zegDUILvXptmQw2nk1RMx+r6PKXWE1PlPUKKcIrPiWSMXnhlVDh+WMMS5VIKWY7sUxeQrBSDzo6P4CZWfLhuN5HK9gMR499ByFWaFiZUVcq4P7lwq6VSrGQzrcSCB/Yube6d87gLVqeEjPxIJWQ40uZtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788739396; c=relaxed/simple;
	bh=jnRVkg2NJw4Wi+Kz19rdNc2kA6hn8OoCKr0MDXsDzm8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IgQp2BVGtffeHrvylaZX3h+XvyXF2VZom3zZKmH/vTn8/xE+ZVjibUZk6P89KemFQjMc/zEgyFL9tRDM4WuCZHg7+ckzHEEVDZIIWeNCPJrrRotLBP759MrrKAJeeOy8OYCIQsz9qtAOmsutTvNYRio34kQGpSKaMLbHCLTs9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.upt.ro; spf=pass smtp.mailfrom=cs.upt.ro; dkim=pass (1024-bit key) header.d=cs.upt.ro header.i=@cs.upt.ro header.b=tPScYgnE; arc=none smtp.client-ip=193.226.12.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cs.upt.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.upt.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.upt.ro header.i=@cs.upt.ro header.b="tPScYgnE"
Received: from localhost (localhost [127.0.0.1])
	by cs.upt.ro (Postfix) with ESMTP id 3B988DFA3D;
	Mon,  7 Sep 2026 02:54:22 +0300 (EEST)
X-Virus-Scanned: Debian amavis at smtp.cs.upt.ro
Received: from cs.upt.ro ([127.0.0.1])
 by localhost (smtp.cs.upt.ro [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMjYZF1ykPA0; Mon,  7 Sep 2026 02:54:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.upt.ro; s=mail;
	t=1788738860; bh=jnRVkg2NJw4Wi+Kz19rdNc2kA6hn8OoCKr0MDXsDzm8=;
	h=From:To:Cc:Subject:Date:From;
	b=tPScYgnE9dPX6wGGI/yLVTjBHM300XJFqaOP5ZPlljaehITQQ6VRh1JrliKhtNhGV
	 vVvKGjfnLMuPPtzLW5zk1pgOqkj0jbLUXRHSgz+jxtgyZIJMj1Gwg0n31ezpdeiqYK
	 mQdZBlhr4rMTbU5GEp8HMLdQA7h/thf/ymDZbFgc=
Received: from kcstation.tailba65d9.ts.net (unknown [5.12.49.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by cs.upt.ro (Postfix) with ESMTPSA id 16376DF947;
	Mon,  7 Sep 2026 02:54:20 +0300 (EEST)
From: Catalin Cereanu <catalin.cereanu@cs.upt.ro>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC] platform/x86: asus-wmi: no kbd backlight on Zenbook S 16 UM5606WA
Date: Mon,  7 Sep 2026 02:53:55 +0300
Message-ID: <20260906235355.13404-1-catalin.cereanu@cs.upt.ro>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On the ASUS Zenbook S 16 UM5606WA (Ryzen AI 9 HX 370), asus-wmi creates
no asus::kbd_backlight LED and the factory Fn+F4 backlight key produces
no input event at all. The keyboard backlight hardware itself works
fine.

I have tracked this to a single firmware flag and have a working
out-of-tree fix, but I do not think the fix belongs in asus-wmi in its
current form. I am sending this as an RFC to ask what shape, if any,
would be acceptable.

Hardware / software
-------------------
  Model        ASUS Zenbook S 16 UM5606WA
  BIOS         UM5606WA.321, 10/14/2025
  Kernel       6.17.0-35-generic (Ubuntu/Linux Mint 22.3)
  asus_wmi     BIOS WMI version 9.4, SFUN 0x21, "Detected ATK, not ASUSWMI"

Symptoms
--------
  * /sys/class/leds/ contains no asus::kbd_backlight (only platform::micmute)
  * UPower exposes no KbdBacklight object
  * The Fn+F4 media key emits nothing: no evdev event on any device, no ACPI
    event, and no "Unknown key" message. The same key in its F4 function-layer
    role emits KEY_F4 normally, so the key and the EC layer logic are fine.

Root cause
----------
Both symptoms come from one flag: bit 7 of KBLC. From the DSDT:

    OperationRegion (AECO, SystemMemory, AECB, 0x1E)
    Field (AECO, AnyAcc, NoLock, Preserve)
    {
        ...
        Offset (0x0F), KBLC, 8,
        Offset (0x10), KBLV, 8,
        ...
    }

    Method (KBLD, 0, NotSerialized)
    {
        If (ATKP)
        {
            Local1 = (KBLC & 0x80)
            If (Local1)
            {
                ^^^^ATKD.IANE (0xC5)
            }
        }
    }                                   /* note: no Else branch */

    Method (KBLU, 0, NotSerialized)     /* same shape, IANE (0xC7) */
    Method (_Q0C, 0, NotSerialized) { KBLD () }
    Method (_Q0D, 0, NotSerialized) { KBLU () }

The EC does fire _Q0C/_Q0D on the media key. With KBLC bit 7 clear the
method falls through both conditionals and returns without notifying
anyone, which is why the key is completely silent rather than producing
an unknown scancode.

The same flag gates the DSTS presence reply that asus-wmi relies on:

    If ((IIA0 == 0x00050021))
    {
        If (^^PCI0.SBRG.EC0.GLKB (One))     /* returns One if (KBLC & 0x80) */
        {
            Local0 = ^^PCI0.SBRG.EC0.GLKB (0x03)
            Local0 <<= 0x08
            Local0 += ^^PCI0.SBRG.EC0.GLKB (0x02)
            Local0 |= 0x00050000
            Local0 |= 0x00200000
            Local0 |= 0x00100000
            Return (Local0)
        }

        Return (0x8000)                     /* no presence bit */
    }

So kbd_led_read() -> asus_wmi_get_devstate_bits() returns -ENODEV,
kbd_led_avail stays false, and no LED is registered.

Measured on this machine:

    \_SB.ATKP                     = 0x1     (INIT ran, gate 1 passes)
    GLKB(1)  i.e. KBLC & 0x80     = 0x0     (gate 2 fails)
    GLKB(2)  current level        = 0x1
    GLKB(3)  base                 = 0x80

Note the DEVS *setter* is not gated:

    If ((IIA0 == 0x00050021))
    {
        ^^PCI0.SBRG.EC0.SLKB (IIA1)
        Return (One)
    }

so the backlight can be driven even while the firmware reports it
absent.

Nothing writes KBLC
-------------------
I dumped and decompiled all 48 ACPI tables on this machine (DSDT, 30
SSDTs and 17 others). KBLC appears exactly four times: once in the field
declaration above, and three times as a read (GLKB, KBLD, KBLU). No
method in any table writes it. By contrast BLCT, the panel-backlight
equivalent, does have a WMI setter at devid 0x00050011.

So the BIOS simply never sets it on this SKU. An earlier ASUS laptop I
owned (Vivobook S14, 2024) worked out of the box, so this looks like a
firmware regression on the AMD SKU rather than an intentional
configuration.

Confirmed fix
-------------
Setting KBLC bit 7 fixes both symptoms. I wrote a small out-of-tree
module that resolves the address two independent ways and sets the bit:

    RAMW @ 0x70265000  ->  AECB @ +0x20  ->  AECO @ *AECB  ->  KBLC @ +0x0F

On this machine AECB = 0x70265300. Cross-check: KBLV read directly from
that mapping matches GLKB(2) evaluated through the ACPI interpreter.

After setting the bit:

    GLKB(1) 0x0 -> 0x1
    asus_wmi: using asus-wmi for asus::kbd_backlight
    /sys/class/leds/asus::kbd_backlight, max_brightness = 3

and the factory Fn+F4 key now cycles the backlight normally.

No "Unknown key" message appeared in testing and no keymap addition was
needed. I have not separately confirmed whether IANE(0xC7) is actually
emitted on this machine, so I cannot say whether the absence of a 0xC7
entry in the asus-nb-wmi keymap matters here.

Questions
---------
1. Would a DMI quirk that force-registers the LED (bypassing the DSTS presence
   check, since the DEVS setter works regardless) be acceptable? That would
   restore sysfs brightness control, but NOT the Fn+F4 key, since KBLD/KBLU
   remain gated in firmware.

2. Is there any appetite for setting KBLC from asus-wmi under a DMI quirk?
   It would fix both, but it means mapping an ACPI NVS address by firmware
   field plus a hardcoded structure offset, which feels out of place in this
   driver. I would understand a no.

3. Or is this purely a firmware bug to push to ASUS, with the out-of-tree
   module as the practical answer for affected owners?

I am happy to write and test whichever option you prefer. I can also
provide the full decompiled DSDT and acpidump output.

Thanks, Catalin Cereanu
