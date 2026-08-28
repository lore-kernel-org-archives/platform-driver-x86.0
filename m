Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A75534F270
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 07:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.157.188.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787902230; cv=none; b=fFCNYm5ke4Qc23ublADTuhvSpWi4w2d+Bhf1RGZOe9fXnFqaJ1kO9koD2kzEMtLXHKYenKvxwmmxY7JyrZM8fbAxJroavkLzr6Bv5C0MSbRXdyrD/QAlYB8KjpHZi1LkcZ0+FqCEICa9N0QFxQmj9N48mBqhBU5H/tkwzkg2bII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787902230; c=relaxed/simple;
	bh=zMIeKkaLGhn3fB+KVA62rI3YR0e+y+mJ6aa6xcqLH6U=;
	h=Subject:Message-ID:Date:From:To:References:In-Reply-To:
	 MIME-Version:Content-Type; b=fqDE7MLxUJEFtPYPGOR2HSRLe2T2AXvHNvsmfu/wDthpKU+En2JI4IVR+YKJsUsRs/TrSKkszn2yMFGUMDSCf6JGFbHv6gtH4XjtlXgMIoOmxpueA7hdLcapxKKED3dLCExkpVnMb9BHC4romhOV2RU65e907HT2bje/BVjEGoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gmazzetti.ch; spf=pass smtp.mailfrom=gmazzetti.ch; dkim=pass (1024-bit key) header.d=gmazzetti.ch header.i=@gmazzetti.ch header.b=VrmYSXCY; arc=none smtp.client-ip=45.157.188.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gmazzetti.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmazzetti.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gmazzetti.ch header.i=@gmazzetti.ch header.b="VrmYSXCY"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hWTf26x9Gz38v
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 08:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmazzetti.ch;
	s=20230110; t=1787900090;
	bh=EXPOnMU5XWzk3wNyYJ5VrnpQJ5VT2ocJ/HmT2/sKPEg=;
	h=Subject:Date:From:To:Reply-To:References:In-Reply-To:From;
	b=VrmYSXCYu6otNDdE5GBpDji8SQZORgyNvUNyJhgxy8GwlsZuW/m6N82xUNNk9+Wgo
	 mJoFnJEs27tuGcSsHhvUg48tCf+x0iy8Z/HGeKUxzc3aUdCt53WKA/v/WtHQtkZf4O
	 +a5saFujWUc+9f7Ly9vWf3CFz5N0dLPzmWpgGCDw=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hWTf23ssBz93d
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 08:54:50 +0200 (CEST)
Subject: Lenovo IdeaPad Flex 5 14ALC7 (82R9) AMD Ryzen 5 5500U: s2idle
 enters LPS0 but achieves 0% S0i3 hardware sleep residency
Message-ID: <76b1abc3-9038-485e-8e00-07301226e422@mail.infomaniak.com>
Date: Fri, 28 Aug 2026 08:54:50 +0200
From: Gabriel Mazzetti <info@gmazzetti.ch>
To: platform-driver-x86@vger.kernel.org
Reply-To: Gabriel Mazzetti <info@gmazzetti.ch>
X-WS-Location: eJxzKUpMKykGAAfpAmU-
References: <3303a36e-62ed-4de4-8b1e-0f7f6bb766a3@mail.infomaniak.com>
In-Reply-To: <3303a36e-62ed-4de4-8b1e-0f7f6bb766a3@mail.infomaniak.com>
X-Mailer: Infomaniak Workspace (1.3.1342)
X-WS-User-Origin: eyJpdiI6ImcrM1FHV2ZNU3Fjcy96V1RUUnFCTVE9PSIsInZhbHVlIjoiUGxBZUdDcXN6bnY0VHd5Rkxibmg5Zz09IiwibWFjIjoiMzg2Y2RiYTY4YTY1OGFkMmEzNmVlYTJhNTJlNmYzNjJlN2I1NWUzZGFhNzYzMTM3OTg2NTBhOTcxM2MzZGQ3MiIsInRhZyI6IiJ9
X-WS-User-Mbox: eyJpdiI6ImNUaWhPVmpEaVhIWkJXd2daUDRJZnc9PSIsInZhbHVlIjoiTTAxWWlhdUg1UjNiT0hrR1MwN21udz09IiwibWFjIjoiZjdmNDg3OGY2YzBlZjU3ODhjNWQ4MDA3NGY3NGRkZTRjMTVhNGJkZTlhOTQ3MmExNjZmM2UzMzFjZWZkZmQ2MyIsInRhZyI6IiJ9
X-WS-LOCALE: de_DE
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Infomaniak-Routing: alpha

Hi,

I am seeing consistently broken s2idle power consumption on a Lenovo IdeaPa=
d Flex 5 14ALC7 (82R9) with an AMD Ryzen 5 5500U.
The system successfully enters Linux suspend-to-idle/LPS0, but according to=
 amd-s2idle and AMD PMC statistics it spends effectively no time in the har=
dware S0i3 sleep state.

Hardware / software:

System vendor: LENOVO
Product: 82R9
Product family: IdeaPad Flex 5 14ALC7
Board: LNVNB161216

CPU: AMD Ryzen 5 5500U with Radeon Graphics

BIOS: JCCN43WW
BIOS date: 03/07/2025
EC firmware release: 1.32

Kernel:
Linux 7.1.9-arch1-2 x86_64
Distribution: EndeavourOS

amd_pmc:
Program 0
Firmware 55.93.0

/sys/power/mem_sleep:
[s2idle]

A controlled 60-second amd-s2idle test produced:

Duration:        0:01:16
Hardware Sleep:  0.00%
Battery Start:   40.45%
Battery Delta:   -0.23%
Average Power:   -5.21 W
Wake Interrupt:  ACPI SCI

The system was asleep for 76 seconds, but only spent
0.00% of this time in a hardware sleep state.

The kernel logs show successful LPS0 entry:

PM: suspend entry (s2idle)
ACPI: \_SB_.PEP_: Successfully transitioned to state screen off
ACPI: \_SB_.PEP_: Successfully transitioned to state lps0 ms entry
ACPI: \_SB_.PEP_: Successfully transitioned to state lps0 entry
PM: suspend-to-idle
amd_pmc: SMU idlemask s0i3: 0xc02f0eb5

During the latest test:

Timekeeping suspended for 0.484 seconds
Timekeeping suspended for 58.999 seconds
PM: Triggering wakeup from IRQ 9
ACPI: PM: ACPI fixed event wakeup
PM: resume from suspend-to-idle

IRQ 9 is the ACPI SCI. The programmed test wake timer was one minute, so th=
is appears to be the expected final wake rather than an early device wake.
/proc/interrupts showed IRQ7 (pinctrl_amd) unchanged during this test while=
 IRQ9 increased.

Things tested so far:

- Wi-Fi and Bluetooth disabled: no change; hardware sleep remained 0%.
- ELAN touchpad wake disabled: no change.
-Wacom touchscreen/pen wake disabled: no change.
-System can remain in suspend-to-idle for almost the entire controlled test=
 without an early full resume, while still achieving 0% hardware sleep.
-pm_debug_messages did not report any failed LPI/uPEP constraints.
-The kernel IRQ1/i8042 firmware workaround is active:
atkbd serio0: Disabling IRQ1 wakeup source to avoid platform firmware bug

-I also tested:
amd_pmc.delay_suspend=3D1

The kernel confirmed the workaround was active:

amd_pmc AMDI0005:00: Delaying suspend by 2.5s because delay_suspend=3D1.
System Vendor: "LENOVO"
Product Name: "82R9"
Product Family: "IdeaPad Flex 5 14ALC7"
Board Vendor: "LENOVO"
Board Name: "LNVNB161216"

This did not fix the issue. The machine stayed in s2idle for approximately =
56 seconds continuously, but hardware sleep residency was still 0.00%.

Previous AMD PMC smu_fw_info captures also showed S0i3 entry status as succ=
essful but only about 0.16 seconds actually spent in S0i3 over an approxima=
tely 3-minute suspend. The only meaningful timecondition_notmet_lastcapture=
 counter was DF (Data Fabric), around 302 ms; CPU/VDD were around 1 ms and =
the other reported blocks were zero.

I also see similar excessive heat/battery drain while sleeping under Window=
s on this machine, so this may be firmware/platform related rather than Lin=
ux-specific.

I have attached the complete amd-s2idle output, kernel log, PCI/USB informa=
tion, ACPI wake configuration and IRQ state from the reproducer.

Is there any additional AMD PMC / SMU / STB data that would help identify w=
hy the platform reports successful S0i3 entry but accumulates effectively n=
o S0i3 residency?

Thanks and best regards
Gabriel Mazzetti
