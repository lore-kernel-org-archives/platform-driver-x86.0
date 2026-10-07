Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAA1471D0F
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370476; cv=none; b=suHh0ub7hnKvqCIrSZdVD/tEgalyDtBVAMk7CnxkSrrPFxw9CzsY4v+vyNh9twsY8dNxDJ/h3vTNbpf6nsdSx/LmaM8UWH1b17NR+zD4hmXMyuCJinfGuXcQg5NA7r8L28fqBaTJxsjjaSkXvv5PQ3svwcxzzinzNfGz2Dt+8dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370476; c=relaxed/simple;
	bh=lVL1sa32L2WhhG2u4wL0bheAxTpUNxznhSq1jWbfwhE=;
	h=Message-ID:Date:From:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:
	 References:MIME-Version:Content-Type; b=aXBmVpDgD/6D7RMyZO9Pk9o7a1Nxo60VMpVagM3tAkLqpy8781YihgE2OSQ3+FZb5Zq5N1ttsvTkfZrCIMU8A8Z+3hrZ5zkZJk9B7kb0GTC5aZlPKkPMmA9E9olhTZjxiZvx9b7d195L1klqnDXqAybuE9uxqTHTZvwEBu6lVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=GtVNTqot; arc=none smtp.client-ip=43.163.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="GtVNTqot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791370439; bh=g24TrHG4vSFzqgRrypcxpgt4JUs+URbBEdgt9SFzlyc=;
	h=Date:From:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:In-Reply-To:References;
	b=GtVNTqot6HLc/JxvsicDTE1XOya8aup8yZT4NZl/9beZu2r0Hq4LJ8tj/ho2tE7/Y
	 aqJxigZ6arWo/Tpp4Eqy8WsZoB3V1SsD1NDqoQh40LxFVl7tLS5XGEQ58Sz9IbMIZ4
	 4W+afUEgcsGfiulxVwRg9iyXZ+A/vzX8OFXZxWGQ=
Received: from localhost ([39.144.128.134])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id D78096AA; Wed, 07 Oct 2026 18:53:56 +0800
X-QQ-mid: xmsmtpt1791370436txn28ooh7
Message-ID: <tencent_D96ED693B9D664B3CDD8943D920571929406@qq.com>
X-QQ-XMAILINFO: NFhlv/8JdUU2fDPb69o/wz5iFm097WiZEaDlDy5XZ5MJRtskPuLk4IwWnLzu54
	 L33Jfj/Eq/fEUiHbV3apQvAjNa/MQj4ApOvkvgrv4h9oTVQFSTJgWjRYacSAHez66uMKHlsFJswF
	 iB2PFlLAOzqLXDvRN/sV1HaDdJu2V341Vs4TCjPtAmuA2ZdfaAgknaqFAyOXP0+zrSxFs85uRfBK
	 0XrPW8Z1fLiO7voVwmogUMP86Pt/FUJfaZZnXuh5Kp1orURqMoyv2VSQ7DRzgfEna6CFe5xRJxBX
	 dMvDMfHmVPELD8DsFkJrwaZztpgjfdAM0e+uyYq7JBBBMTzYV+BdKh7OmGVW6VX2f8iTAuCIgHhu
	 zy/y863WTp5Ele5LZvVH/eHE6zutMiddbTQGrznALM6+YsxIgxJvCV7EqVO6bNrCIrYvLBCbNUkd
	 kkQQ4KKStcHHJbyW4cDOgKNwWEgejFUhm1DNlEpZbl6F07zCp+ksGw2o+8kfz2EfpLNzq0oBRdEE
	 RdRQCBp82eJcPYEJEzEswfknZrMJx+5dJbkDuW1I6qxoDY73saG1HzNug4BpFFb7MB0/oddEGepx
	 PXJKErNAhgnMEq8NIl/mlPQ1oJFXmSlY6IklNmUqw3vG0Vd9z3C8a/USuFxX0VWHEBgpIatAiEF9
	 DTbdrcHDW/UK/zlROBmM6O6O2Nuba09ySNeBj4sRduNGk8Qj1a3RtVv61HgfU5y0kbb8pxW050PK
	 /ieR00NjVW5o+z9tF4TvRYa4BaEL8+cDzopD22G4oYfIba0HTguBC87qLjRSUknpOExvC3QkqOdo
	 YH/HTfPb2C4LSheB/+xiat2VWX5Q4TkxTm+2whijB7/iX93TIESLMPSIK26AaryWZpCE+UNV3GdD
	 yk9zFQYccWJeLT5L89kVlwlyvSu+ubWaY/lq3yYLt7Tpm+76NsT7TUQZF87vPrTriHw3Fktn743Z
	 K8d6Vbz3S+4MVZ/N8fLOyVQRATmEQv7GC52/c8CKumV/1M5vD8/U6x0XZ0HnyuhV93VDVZlXHxqn
	 Sg5T0eIQ==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
Date: Wed, 07 Oct 2026 18:53:55 +0800
X-OQ-MSGID: <89a3f484dd6c50d8d1026665039026ea@qq.com>
From: Eason <1836949523@qq.com>
To: Yuming Sun <wolf109909@outlook.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>
Subject: Re: [RESEND PATCH 0/5] platform/x86: bitland-mifs-wmi: MIFS v2 firmware support (Xiaomi Book Pro 14 2026)
In-Reply-To: <20260728180944.51356-1-wolf109909@outlook.com>
References: <20260728180944.51356-1-wolf109909@outlook.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
     bitland-mifs-wmi B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM: dpm_run_callback(): bitland_mifs_wmi_suspend [bitland_mifs_wmi] returns -22
     bitland-mifs-wmi B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM: failed to suspend: error -22
     PM: Some devices failed to suspend, or early wake event detected
     systemd-sleep: Failed to put system to sleep. System resumed again: Invalid argument

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

  ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PC00.LPCB.Q_EC._STA.ECON], AE_NOT_FOUND
  ACPI Error: Aborting method \_SB.PC00.LPCB.Q_EC._STA due to previous error (AE_NOT_FOUND)

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
1836949523@qq.com

