Received: from mail-oo2-f34.google.com (mail-oo2-f34.google.com [74.125.231.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691B31F9AC
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2026 02:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.162
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789095015; cv=pass; b=Xc1DPmnRe+amoEBA0+faaVLCXuGmnUPTt9OUeLFV1Yv5PlFfDuwFG18685DCOtk3uC2nhGRx+YPaJ5X+SrlqmGU8pCsWEJrGlUQPBKT/6ImvBocc19So9PZpsgzRS8W453nriWcHCzRcfaQrQuMUzXHgAersgk03fEV9DLeKZik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789095015; c=relaxed/simple;
	bh=uL7tRssw35QC6S+eiMEYZtF2VU6pETvKwnKaNeqZMHk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bzKIgFAYgJ/SEh0qwvUOXZU890vAfcgx034LFHrm9gVd8DyKwCFnqR0MNjs9wd4mNcaWBUpdvKErXiroEXFU2On0F5eeZ8HGMkuR2aG/sTZesh99Ig5sNAYkTlzthcglEZ3BD0tHE1vrvXcEw5sl+oVV/b6dD8CFw79zaCYfl0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXjOrUmh; arc=pass smtp.client-ip=74.125.231.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXjOrUmh"
Received: by mail-oo2-f34.google.com with SMTP id 46e09a7af769-80032c08611so352249a34.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 19:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789095012; cv=none;
        d=google.com; s=arc-20260327;
        b=DYcJzT6fMu8v2jHYX563J2fvoTyYJf9wquYg9WWp7NVc8rX/3djYYBzGDsyl+jD845
         vRyk6CBDX5homdhOT4u0jqXvrSQ272OdxGPsbdXWPnxgBKtl/zw3lqgKR5AV9zq5gqSU
         ccT+7DOBM4fjS24KaysdrQFyHxtkKjDdSX2mxV1es6+5vpq5EwN7HCDq+RpJ48p51yXY
         lDIwiEcrTqAHylVA9y00KnJTvkJW8kp7jYMPUBso24RPmdLlYSgQn1TIWQEMWa0zoF8D
         ct1QKSWaMwbHjDDYzxEuN5Dgi+pCugnspw4sRF/3oA5DH6480+cn4CZaEtzZdJ4h11JM
         e/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Zee39qrEDcpE+vIrggL8aer84BmS8nFgUuYLXiEk+go=;
        fh=PWKxEU66zfXSEj/XaiPSOqBzqWCt0dBchFmgjc0Oe/Q=;
        b=k8UY2LpW0urBkz4Ek5q0xYnUs+tWKw2CE6zTLchr9erSZCJJ4CZne/lUUe8P08flyA
         rFMlh5qgU1zAgUPyUUSf3thjTSbT6cirMrJxJaqdVKqXqTzlaRlzPrOVVX7trbaukoHo
         7wCwWKdWH7F5serrvHGHJEOuiMCno0gBFwkxKc2YiKZi2DQHIyUyfmO+n1zeFlHvYRvh
         ltLqQMym5PAR64zijZWVyX9w+TopVDs9VO2rlm3Jgps27Zedxx4/dQD4qDgfVk+xY8IT
         Hj0XdyKhaAOTajMGpNe/gniSwYXonk4VXU2wHKhJI/zYQwQxpVNP5uDaNTPD8AShb9lw
         Oltg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095012; x=1789699812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zee39qrEDcpE+vIrggL8aer84BmS8nFgUuYLXiEk+go=;
        b=dXjOrUmho36l5JWciWChQRo8SD+lrSU53YyrcD0w1+wrYXwbSj4qmsXJCtG4iBSHeW
         M1OG/mYhf1k87qBYrqbcVEi4iEsmfgVrNxTaEN3nZdoU+BHo4bcXU2cP3nRdKftIO0wy
         Ert/0IVTfWwDUaO/b5DYWz7YtEeGV+C4hCXrJzonSHKA4+5vdEPv2B6T06deNbjDC5qH
         jrH3MyEIjb2XeQZZJZjrN8gkkq0/nuCnUrGIRYuw/T/n7lFAd4sJOkCafaM2DNulOTUQ
         PKNerCcRPAX/c4nKAVJ5ciwl7Tx32r9X/41bXiHoYgeLaT6dBtP0XRO3JatM1gj9uFQN
         ZDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095012; x=1789699812;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zee39qrEDcpE+vIrggL8aer84BmS8nFgUuYLXiEk+go=;
        b=EzV97QjOoEFl7gbiUA5UYlIXfLixTbhmJV/XQ7fTcGi3nHeN8zABn2ICX6iF4OHG3j
         GQOowB6d7Zyke/RUH0WORfyo54CYxaMh5L/VgZ/vmgrkdkDRsp8u0L7aR/ya5E1Z+wab
         i8j1Z+qgh43VK622H4e2tH2KyFYVce8yL/Zsd3Px1xhIN3KnowJt3Y76GLGuVkzIEJoi
         S5zWxTAuawNJ5dY6cTQ7+o1L90aAKX72NeqwCuihL8ZwbA5G4j8lA4wQcDXq9Cvc1h0r
         LGThKjiooKcNdt/KWIxvFDWcCgSc1TCxWYDfm4wtn8gWwfVL7Oz4vw4WxgtT1GA+ZpyJ
         jTaQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3ekcwe+j1Q/CqAojz1RT0Zz8bHelgVJbjJObTg8PrtuvWcMHhAd5+mZdEEl3SFYFsidqcWkDXD5C9pEcK5dMwvuFl@vger.kernel.org
X-Gm-Message-State: AFuF++kepRXS1Ct2s8LCBfG1fIuSRR08S9KswYMffOwPv9jOo9hlwSJI
	nJpyxyILgxh/U/sHFox/Qc8dLVRsHI8eeK7EoctyM+0GcONDI6VXtPxCZxawN7d0qN3ItuyQ1Ge
	Q5CWQoVkqZ7CDrEVYR7lqSEpX0UF7+8c=
X-Gm-Gg: AYBFou1QWmOOPJBzSAdeL1OY/W4Y8EAYlRGMmC5PUrRvcUW9lZ2tNVk2wmycUJrFzas
	ZrIOsqIqUcbh6xC3iUBHu5u9WiBn7u2dx6uaxkP5mXAQY7yxh5w3v3ySMczWXkORNliL2ADCWFy
	6f6QUOCZR0EARjsNVz/cxzdlK5uTHE5h48zOv2rcKfbM2ZishL5tkkXqDtjmJPVGRdcFShBpYAD
	hatX7guFloyiDPAb6UIFiSamGdSwev8nRzoY4dYO7zMsEVaHAEBaisLsEm/D0LRbIVX1LIx8UT5
	kFZrxEWujQPxo7Q6xWgkWcbNQ2GV1SJv+uz/a58Fv/RAFVkOfAyDjcB3jg==
X-Received: by 2002:a05:6830:67e4:b0:7f4:eb9e:77aa with SMTP id
 46e09a7af769-803ffb9b3cfmr3127818a34.15.1789095012153; Thu, 10 Sep 2026
 19:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kevin Charpentier <kevinccharpentier@gmail.com>
Date: Thu, 10 Sep 2026 23:49:36 -0300
X-Gm-Features: AcwNN1UCOjtxAB4IDelHM-nPvr7JrVR3aLcu7D_-mZxMcdTOBDo4g_UYesNZqrM
Message-ID: <CAH4z8xHUrb3nHM7SS9s_3h9qo_Bu7Susf8ug5E==nFbHQMPCJg@mail.gmail.com>
Subject: ideapad-laptop: duplicate KEY_MICMUTE events on ThinkBook 14 G7 ARP
 (ACPI and WMI both report)
To: "r." <maxtram95@gmail.com>
Cc: hansg@kernel.org, markgross@kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a bug where the mic-mute key (Fn+F4) is reported twice by
ideapad-laptop on a Lenovo ThinkBook 14 G7 ARP, which makes the key appear
not to work at all under GNOME.

This is my first report to this list, so please let me know if anything is
missing or should be sent differently.

System
------
Machine:  Lenovo ThinkBook 14 G7 ARP (21MV)
BIOS:     P6CN34WW, 03/10/2026 (EC 1.37, BIOS release 1.34)
Kernel:   7.2.4-200.fc44.x86_64 (Fedora 44)
Module:   drivers/platform/x86/lenovo/ideapad-laptop.ko

DMI modalias:
dmi:bvnLENOVO:bvrP6CN34WW:bd03/10/2026:br1.34:efr1.37:svnLENOVO:pn21MV:pvrThinkBook14G7ARP:rvnLENOVO:rnLNVNB161216:rvrNODPK:cvnLENOVO:ct10:cvrThinkBook14G7ARP:skuLENOVO_MT_21MV_BU_idea_FM_ThinkBook14G7ARP:pfaThinkBook14G7ARP:

Symptom
-------
Pressing Fn+F4 appears to do nothing. The GNOME on-screen indicator does
appear and the mic-mute LED blinks, but the microphone mute state is
unchanged. Roughly one press out of several does take effect, which I
believe happens when the firmware drops one of the two notifications.

The key is not unmapped: KEY_MICMUTE is emitted correctly. It is emitted
twice per physical keypress, 1-7 ms apart, so the userspace toggle is
applied an even number of times and the state returns to its original
value before anything can observe it.

Note that polling the mute state does not reveal this. Both toggles happen
within ~7 ms, so a 100 ms poll of the PipeWire source sees no change at all
and the key looks completely dead.

Evidence
--------
Three physical keypresses, via `sudo libinput debug-events --show-keycodes`.
Note the millisecond-apart pairs, which cannot be produced by a finger:

-event12  KEYBOARD_KEY   +0.860s    KEY_MICMUTE (248) pressed
 event12  KEYBOARD_KEY   +0.860s    KEY_MICMUTE (248) released
 event12  KEYBOARD_KEY   +0.867s    KEY_MICMUTE (248) pressed
 event12  KEYBOARD_KEY   +0.868s    KEY_MICMUTE (248) released
 event12  KEYBOARD_KEY   +3.137s    KEY_MICMUTE (248) pressed
 event12  KEYBOARD_KEY   +3.137s    KEY_MICMUTE (248) released
 event12  KEYBOARD_KEY   +3.140s    KEY_MICMUTE (248) pressed
 event12  KEYBOARD_KEY   +3.140s    KEY_MICMUTE (248) released
 event12  KEYBOARD_KEY   +4.886s    KEY_MICMUTE (248) pressed
 event12  KEYBOARD_KEY   +4.886s    KEY_MICMUTE (248) released
 event12  KEYBOARD_KEY   +4.891s    KEY_MICMUTE (248) pressed
 event12  KEYBOARD_KEY   +4.891s    KEY_MICMUTE (248) released

All events come from the same input device, "Ideapad extra buttons"
(phys=ideapad/input0), created by ideapad-laptop.

Analysis
--------
On this machine ideapad-laptop is bound to two devices at the same time,
and both report this key into the same input device:

  1. ACPI: platform device VPC2004:00 (driver ideapad_acpi)
  2. WMI:  8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17 (driver ideapad_wmi),
           notify_id D0, instance_count 1

Unbinding the WMI device removes the duplicate completely:

  echo 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294-17 > \
       /sys/bus/wmi/drivers/ideapad_wmi/unbind

After the unbind, the same three keypresses produce single events, with
human-scale gaps instead of millisecond pairs:

 event12  KEYBOARD_KEY   +0.298s    KEY_MICMUTE (248) pressed/released
 event12  KEYBOARD_KEY   +1.043s    KEY_MICMUTE (248) pressed/released
 event12  KEYBOARD_KEY   +2.880s    KEY_MICMUTE (248) pressed/released

The key then works correctly in GNOME, and so does the mic-mute LED.

I also verified that unbinding the WMI device does not regress anything
else exposed by the driver: fn_lock, conservation_mode, camera_power,
usb_charging and fan_mode still respond, the platform::fnlock,
platform::kbd_backlight, platform::mute and platform::micmute LEDs are
still present, and the kernel logs no errors.

Questions
---------
I am not sure where the fix belongs, so I am reporting rather than
proposing a patch:

  - Is the firmware expected to notify this key on both the ACPI and the
    WMI path, with the driver responsible for reporting it only once?
  - Or should ideapad-laptop not register the WMI hotkey path on models
    where the ACPI path already reports these keys?

I am happy to test patches or gather any further information. I can also
provide the full acpidump, the WMI BMOF dump, or udev debug logs if that
helps.

Workaround for other users of this model
----------------------------------------
A udev rule that unbinds the WMI device at boot:

ACTION=="bind", SUBSYSTEM=="wmi",
ATTR{guid}=="8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", RUN+="/bin/sh -c
'grep -qx 21MV /sys/class/dmi/id/product_name && echo %k >
/sys/bus/wmi/drivers/ideapad_wmi/unbind'"

Thanks,
Kevin Christian Charpentier
