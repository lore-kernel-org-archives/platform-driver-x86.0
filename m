Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD0745D91C
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 11:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373742; cv=pass; b=dAVbirjJmB+UT4GAPOc6OAbXqnnpX33QxbGyfNFteghkCCUxXGqOjbm+Uy9QLIhtR2lC2MV6gTQkbXxiK/TwcFGRRcpF+MhRsF4UUg7N2hFgOnX+B666oEod/5CcrXv96VGNd0IKElwkZZgzLvYSuZvTp+58esjp5RyxT1npYEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373742; c=relaxed/simple;
	bh=7FWLm9S8z3Wn+76Q3KTUuDdHF8VZJmncRNJYgwn122c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LLbSNGfTQ+SqRQ7UtB2a/oF0foKDzFpG43BqbAhWitPUQV+AfWQWIf19+nXhAIYNXPMKpMHLrJbAaVO7w/lE8dX2ZHjGDIJelzTUDacPH3ENW46nRSmuXJSLT/bMiF0smaMJ5iUCsmHoRwv8Ga8KkIwQg2nZomJJibPpuwAHiDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juBweC1V; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juBweC1V"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a98fc80925so12600431fa.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 04:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791373728; cv=none;
        d=google.com; s=arc-20260327;
        b=ejzYJsxqVp5qM5tAQIN6jA2fr2jQC/eK2CI069EjQJTuWzsMUgxpgPDaDoYVgak3OQ
         kv6h3+9f/wtVQdH5rb7PYjWAerAVwU+FAq+kC3kTEejjJUyjNtncwk9709F3lwDEvX/O
         ZqWPD+bG5b8ELIbyS9n43QR3RSGyWSsdArvKIOjCjf/52S/xBqt63s1VAcstAwMKNaP3
         OmPv1hJfTnni82d0PdpVQgCk3KHTHAZ6XJXjEcUVhkyK8ga1YLc7TbZWkyrhP0Valmnk
         rH/cRMYgL3/skLRIs0Qp5kJPKho/BTIF7ECeVkeczxFzaJa0PqngCRT7H+RMcZpdpZu/
         Hg6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=MMp/fB2bF0FOpRT8S3ZoiXJ031erOC0TaJgD5Ref2ZM=;
        fh=ODdS641q4K5WK+tP7ujRszroEJTOeYy+JORkxHQ+PXc=;
        b=aiFk81QM6806vBa0RFo+L8NSCmMKltJdYCOuZu4vRO40bfekHHu490uQify1kma5P1
         YcehfokIr0Zjb0BpMKDazwSapUaJFElkBnPgPbS8rsn5RMLBEl7XrUJeBvHvLQkiDD8a
         pa+IC1M6oQGr/8qOSqRjbTFyRr9EXwsc4Cpr5QIASGCqstOCqLrnnZiHmxRkKzefeUxg
         6vT8O66LtcQQshFHQBPMr23PhwglAuRrIrAjV69e5rwNUetYgYOHVUipzvf0R85s1R9Y
         OXs7NSgO3usNME8DX6qAvZ+mpQgtxBdRvRzTA/LtqKWOsbjJIpR6BdyKtZ0wEhGlPAam
         fmqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791373728; x=1791978528; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MMp/fB2bF0FOpRT8S3ZoiXJ031erOC0TaJgD5Ref2ZM=;
        b=juBweC1VMFQgV2CAyDrq7VuSs857fT2ABY/UsV9+2v6whrWUnGcn1T0W5VwNUXoRVM
         BMvsCaB81jfyGxswRPQrS5nik1szk4QBMO87CgOrhoq5MXjpWJLPzR0iYfEbmCKqUv3q
         nzJiYyLOj2s1KP5/wS3XwYC4wGX6ivy7cHjl4yg8RyqUzOmO5VQE4eXx9EvFplNVb1s3
         rVuVVT6OxFErbh3wUJFId/NY7XyTzF3J97DF0HNuO05HPiUi9qNyGOGpBgwsSIpwAYZg
         qOplbSN6BQI6Bfz7xFHEwDquX1Zby4TdKDOdtnUGGgIEvt3J+YRstDP1KThKjVGH6F8H
         4ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791373728; x=1791978528;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MMp/fB2bF0FOpRT8S3ZoiXJ031erOC0TaJgD5Ref2ZM=;
        b=dBAo7Qk31jmdLo22rIDUV07NbMdCAJbXdgwxb8UwSAhwzNQxIrJnJmGX+k//mhdHC7
         u0njty8kFjF6g1NFBDJUq+j6VPzo/GBjQl6RRtUzMi6KyOnXo9dlxlCp1JiuRXqeGgX2
         RhF0KmMJhrUQfO3lEBxcLNI3reRw05shpq9Csiuz9zzhPTy2P2G+r1pXJrojMP/UirrP
         NIf1LYLbTYZWutW5/YnLPuw/Cjx2Gm4hWk7xanpWUwv89YJ+QrdogzquHzdEyMlcBq4I
         c0pvJ+Bf9tz5HhHfasrA7wfkeyvV8OK1CI8J++0trGExE88R3H4zyCyuNGMyFPl28Qbe
         nG8g==
X-Forwarded-Encrypted: i=1; AKwUvBxsLs32nM0sgdoqdhBTFidpiWcY9BXr7uhLLWyNJdbKGRZ1MgaPk7VXiINOL7vd55ZOZSMcvWoHDZ3q5sP+hSAnrSP6@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ0LZE06jIIUWdG2aCg8mqvmxrQNJkpKOqCrZtkeHAWVCxN3Vn
	KOt7Kf/g+rGtd6y9irvu74rMBKKFxOe+4DlfhrRJhXOV7rPZOfaNrXAKm/CyGFj4VqeLCKHiPcn
	GKGeS51KEiIEbrdvMT3X/wZpDN0n3Au4=
X-Gm-Gg: AYBFou0XC4eBhkoVn0nrspcBufyZu5atriu3XzF9o7R0OjQPDPE93zrklnpyMsmzaj4
	12Cy1uss3m36lfeTo9s5Ckg5/zXWOe4p0DzKbZizI0OfgKARh53wLRxQmID3omUakPEWl9SzvFP
	oXYiwfcx8HtVSd2Bxmo97sqqXtQwGN6S1LZun+in6DhRWZa/bB4+YkAN3zTwz7hPKpa+2OeGoX9
	bHo+869IHmk33MRavqIFDfqzYhlov75rAEnIN8WxSpxSViyRuq1HTeNjxyyEkfDiALxOz7yUQhN
	Wz91ozscjKFhzSe2V7s992zwagADJ5o0c/CA1RmBfPuCGE4SEoIWR2iqyOluYUehbhoV
X-Received: by 2002:a2e:bc1e:0:b0:3a9:7b33:d54c with SMTP id
 38308e7fff4ca-3a9a2d1389amr4848071fa.24.1791373728449; Wed, 07 Oct 2026
 04:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jame Jao <jaojame6@gmail.com>
Date: Wed, 7 Oct 2026 19:48:36 +0800
X-Gm-Features: AclHuK9FZ7fB97lPoua-UMQ-KklzfyfCbsv1Vhg0DHJLajhjUcabWppkw66nqSs
Message-ID: <CAN52AYsyhwGvKnzPEmrONyyBWfkgTN6YhE8VrVLasnDsdGc6HA@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2
 firmware support (Xiaomi Book Pro 14 2026)
To: Yuming Sun <wolf109909@outlook.com>
Cc: "Cc: Mingyou Chen" <qby140326@gmail.com>, 
	"Cc: Ilpo Jarvinen" <ilpo.jarvinen@linux.intel.com>, "Cc: Armin Wolf" <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yuming,

I would like to add a third affected machine to this report: the REDMI
Book Pro 14 2026 (board TM2426, Core Ultra 5 338H, Panther Lake), BIOS
RMAPT4B0P0909 (2026-05-21), EC firmware 1.9, originally running
7.2.8-zen1-2-zen.

It shows the same MIFS v2 firmware behaviour you describe, and your series
addresses the two things that make this laptop unusable for suspend today.

1) Suspend (s2idle) is aborted with -EINVAL by the driver's suspend hook.
   Every attempt ends like this:

     PM: suspend entry (s2idle)
     bitland-mifs-wmi B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM:
dpm_run_callback(): bitland_mifs_wmi_suspend [bitland_mifs_wmi]
returns -22
     bitland-mifs-wmi B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM:
failed to suspend: error -22
     PM: Some devices failed to suspend, or early wake event detected
     systemd-sleep: Failed to put system to sleep. System resumed
again: Invalid argument

   /sys/power/suspend_stats on this machine:

     failed_suspend   4
     last_failed_dev  B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4
     last_failed_errno -22
     last_failed_step suspend
     success          0

   Since then I set up a disk swap file and verified all three sleep paths
   locally with a minimal one-file change that follows the approach of your
   patch 1/5 (never propagate the perf-mode query error from the suspend
   hook), applied on top of a 7.2.9 tree (Arch linux-zen packaging of 7.2.9:
   vanilla 7.2.9 plus the zen patchset):

     * s2idle works again:

         PM: suspend entry (s2idle)   18:13:51
         PM: suspend exit             18:13:57
         /sys/power/suspend_stats: success=1, failed_suspend=0

     * hibernation works and the session is restored (same boot id before
       and after; ~63-94 s offline including firmware POST):

         systemd-hibernate.service: Finished System Hibernate
         systemd-sleep: Successfully thawed unit 'user.slice'

     * closing the lid does the right thing as well, with logind configured
       for HandleLidSwitch=suspend-then-hibernate and HibernateDelaySec=1h:

         Lid closed                                 18:31:00
         PM: suspend entry (s2idle)                 18:31:00
         PM: suspend exit                           18:32:01
         sleep operation 'hibernate'                18:32:02
         PM: hibernation: hibernation exit          18:33:47
         (same boot id before and after the whole sequence)

   I am happy to send the one-file diff, the full logs and the /sys/power
   settings, or to test a revised version of this series.

2) platform_profile registration fails, exactly as in your report:

     platform_profile: Failed to get profile for handler bitland-mifs-wmi
     platform_profile: Failed to get profile for handler bitland-mifs-wmi
     platform_profile: Failed to get profile for handler bitland-mifs-wmi

   /sys/class/platform_profile does not exist, so power-profiles-daemon
   cannot read or set any profile.

The firmware side matches your analysis as well - the missing ECON symbol
shows up 40 times during a single boot:

  ACPI BIOS Error (bug): Could not resolve symbol
[\_SB.PC00.LPCB.Q_EC._STA.ECON], AE_NOT_FOUND
  ACPI Error: Aborting method \_SB.PC00.LPCB.Q_EC._STA due to previous
error (AE_NOT_FOUND)

Both bitland_mifs_wmi and redmi_wmi are loaded on this machine, as in [1].

One difference to the unit you tested: TM2426 does expose an ACPI lid
device (PNP0C0D:00) and an input device "Lid Switch" with the SW_LID bit
set (capabilities/sw = 1), so patch 4/5 may not be needed on this model.
I have now verified that lid events do arrive here: logind logs "Lid closed."
and performs the configured sleep action (see the sequence above). The
firmware still reports a bogus lid state once per resume ("ACPI: button:
[Firmware Bug]: Unexpected lid state reported by firmware"), which does not
prevent the lid action from working.

For completeness, one more observation from this board (possibly
unrelated to MIFS): ACPI init takes about 6 seconds here. initcall_debug
attributes it to ACPI object evaluation - e.g. 0.4-0.6 s per power
resource, ~2.7 s in acpi_processor_driver_init and ~4.1 s in acpi_init.
If the ECON/_STA problem is involved in that as well, I am happy to
collect whatever data helps.

I can provide further evidence (acpidump, full dmesg, DSDT disassembly of
the WMAA method and the QFAN-related objects, longer suspend_stats) or run
any test instructions you have. I can build and test kernels locally (the
verification above was done with a hand-built 7.2.9 plus a 10-line diff),
so I am also happy to test revised versions of this series, including on
mainline, and report back.

Thanks a lot for working on this - suspend being blocked was the biggest
usability problem on this laptop.

Note: the local testing and the preparation of this report were done with
the assistance of a local AI assistant (DeepSeek Harness WebUI, deepseek-flash
model); every command, log and result quoted above was actually executed on
this machine and reviewed by me.

Eason
