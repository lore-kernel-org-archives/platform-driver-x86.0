Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627062;
	b=bybbxNoFFHUEtXJfCJOi+8NNW9+xIQLKn7rjs6vHNXAQqghkEmwlxYB2MUB5h5qNuhVQ
	 pC91Cx/aVRcyvqUgXz1h5t6Zu3kSJNS92hU4ZA7OHFJbCQkHdnWZH9FMNgbUgA+mV/HR+
	 2tJFH5ttL+E2eNtcWtoOk1QG2mjLtb38r9lc3jG32M6+A51PhZBM2OENx1AOko/rnEg5T
	 Gg0TjrriHBHkcjbzXJBaytZHqiNEfohq6mCwcWUdkz+B5wYhk2Pq/snarVGkzfNRAT2Me
	 hedroCQjBQtB2pVz8MilwcXZirjIc7/o+s4nl1DumJ+MIFwHDBvkXWqIofrCQVJosLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Developer-Signature:X-Developer-Key;
	bh=Sf2O7kkceInXjyxfN0wCfCoTnaw1EJRsKC8iLpu8ZEo=;
	b=Bi/rS+RyN7TM79em8LFTZrEyPtvD+XwHpGY9vq79D7Isf/+b1DARGk9oaGtyh6zcw+zJ
	 qTgL1mInhWtEM7fhY4sCb2AaVEV6twVt8sG5rI7L9TCsH3NJimqWXOPE3IF1AZJYzmqBM
	 5wBW4a4BNAMIqr7yHd/PEOTtDb3MYMpy0nezFmQEDlsKaXJ0T6ro/82qxI7XVFLPya3K/
	 B0RYToUPugy/qqJphyzOqlE61Fs2iepn+8SoVzVrD/sKjbO65aZywNh4VmVDivl9w7WUP
	 N3tHowTfFQxLg59jwuPALeHMqSYXhNRy8Cju9F/0LaWbHNHw1iwURcBmtmlPFXKUuRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EuLy3oOe;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C6B606A8B6
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 03:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C6B606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EuLy3oOe
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so360441eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 19:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794627060; x=1795231860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sf2O7kkceInXjyxfN0wCfCoTnaw1EJRsKC8iLpu8ZEo=;
        b=EuLy3oOe7SL5TM27qiH3eRuDTM4sSdUbbDclLxl09yqcGRd9LM7EpcLWvfpoeVV3Kr
         H4NYoWdeHZTYducYu4coUmb1wcLsfSKVIFRFG7vBfPgVzflWQCGPSLYkRzK5aK9HkOWj
         YyCR/wx3j6yeg8RNeORqS+NaDsx0usDPOU3HUrtOUxj+RhLe5X8Gg/wYxl9MDM8smiIr
         TphlUJhg/+oi13tGwRdmTexN3cCAZrfgBULMpFIlKtHebG5uJSSq1AgPNxvUmjT4So+4
         ctSyEgFLpka5nMvYKs8fZzC/D8AHMrNKgEBnX7eMBcJLtAmMlnziisoF1mXgPpDpEe4n
         CACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627060; x=1795231860;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sf2O7kkceInXjyxfN0wCfCoTnaw1EJRsKC8iLpu8ZEo=;
        b=EAbeRKcbsLiDzdZrK7A9mxEq6+/QkdR2atVRGmwBINlzVj1lSzCJh6GiTdNhRNAPU2
         9Zk2k2EIiJbGKvaXO9Azjb5N/U2D2iVsX9v2r+m7EIfmrPdUs8WaTcRkEaB+etDFXDv4
         9CRDIpdcwAr90JX6TzGxVtjCsicnyMsxqDUKbJpHA/in5pV8ng5I2s5YrLeUFcmw5sYq
         5LGjOAu/5HVL9ET+5n1nHCb4srlgiWeGDIGV0RQzaNy3hl//B1DmfubdOwA1k+bmBM93
         PdoSAF8mWKBYJzIsmiFOtLgNmt/Tg6d/Vwb/nlLhT4gOZecc6GTVeH2LT+HeBbW4HnM4
         cK9A==
X-Forwarded-Encrypted: i=1; AL+hErGwLoaSCp1jywfIOaYm4nwEcOeoPn5ny2atJiscfUIJY+wbxrtpQ+SOJwh+q+gBFNN5rq4iKL+GaApQERvCs+0HMXMg@vger.kernel.org
X-Gm-Message-State: APuU4Z+h+SGbcTZiUsLLDk/w3B1qYNSdFQRXmuY5+VOx65zNT+1oE8oZ
	ZMNavkRvbvgZpQ0WiCEuM/HDyrZhuwrT63zwLkVlSeHFdnRCwvGUNPg8VRMmtr9/UD6LWA==
X-Gm-Gg: AYBFou3qBcnCgkfSbeIhbjIwdimr76tAGCD3jjUH9s2JEJQMWhJKHlbty+O6r28SEww
	1Qvr+MkI34UXLjbDsQcHYRQbc4zkp1NHnwRtNA10oxXeNS+2EEpnSAWrapc7pZBsprBHwFKoI7c
	uJVIfmUOOKwW9ElaDVVaUF14reu6Twp6+2JJxxUbWyDts2XqEeBhRXmmLALmvGKiwOmsH4vlAiK
	a7wI/eYWLaHqz9Gmgy0BW7aBZjo7wd1I2CpEIGc5FyyDUTx/emgWWn65LtSqnuT4hYXVB/nKMM+
	f9HZbwprlr0ROecoDaexKUssczpowmgnO7WRp7D8j0sYzzkBWzT3Bl22XsYnZqtI4i4fHSzft7P
	qet5GsgmsryiCLOeAA1RjkQptRW+fP7Lg/61LXX1kHpqQqqhXBP7e5bPrYaWaPQP32y6A5+ugwo
	3lZdAOsgChc4mb+x6l0Fc0k8rRJ3OWCAcKUYBe5sutz+AW+kV4/2qZDQ74s/OevyJAEMFkUW/f9
	7vcSxU4vxC0/6wHyMLmUqCkDM/rD0uSki3djKOrEG1/XA7/IdXMwBNjg2GyB6vjgkOh9+ULejYo
	i3hUgXv4gOcwTvJKlU+oL+Tui7bNNAw946o=
X-Received: by 2002:a05:693c:4152:10b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-379659c6839mr4321817eec.8.1794627059312;
        Fri, 13 Nov 2026 19:30:59 -0800 (PST)
Received: from [10.54.241.192] ([108.241.87.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm10864283eec.4.2026.11.13.19.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:30:59 -0800 (PST)
From: Ziqiang Xia <xiazq123666@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] platform/x86: Add Emdoor Intel EWMI platform
 driver
Date: Fri, 13 Nov 2026 19:30:54 -0800
Message-Id: <20261113-emdoor-intel-wmi-rfc-reply1-5d510eff323f@gmail.com>
In-Reply-To: <739e089d-fab1-4ade-9373-fe4c5b3924ad@gmx.de>
References: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
 <739e089d-fab1-4ade-9373-fe4c5b3924ad@gmx.de>
X-Mailer: b4 0.16.0
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
Content-Transfer-Encoding: 7bit
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794627056; l=4109;
 i=xiazq123666@gmail.com; s=20261113; h=from:subject:message-id;
 bh=Ep7apa0xtzYtZjgZiLOq+ddP8sE5laBmFrfwZawgZDk=;
 b=s6CyG4cIYK9pm1Ez44ffORRcwEZm4xv355+QGE44wN/Ik7bksui+l3UHnXKRkrs3+1sKNn9jE
 VLD2t4EVWujC0zXDRajTHOsN2DTrHEwoOwmnCFIAwaJQ2U7Rq9iUdtc
X-Developer-Key: i=xiazq123666@gmail.com; a=ed25519;
 pk=mrJQOUoyemvqamFAwqXZF59Z8eZnI11ZI+BEtDNxq7Q=

Hi Armin,

Thank you for taking a look at this!

On Fri, Nov 13, 2026 at 09:37:44PM +0100, Armin Wolf wrote:
> Interesting.
> 
> IMHO using direct EC addresses will eventually turn into a
> maintainability nightmare. I am aware of the issue with CreateField(),
> AFAIK you can workaround this issue by simply submitting an oversized
> buffer to wmidev_invoke_method().
> 
> Can you share the output of acpidump please?
> 
> Thanks,
> Armin Wolf

1. CreateField() bug in legacy WMAA-WMCB methods
------------------------------------------------
On this DSDT (all 13 legacy methods WMAA through WMCB under \_SB.EWMI),
the out-of-bounds CreateField() is not applied to the input buffer
(Arg2). Instead, the AML allocates a hardcoded 8-byte local return
buffer (Local0) and defines fields past bit 63 on Local0 itself, e.g.
in WMAA:

    Local0 = Buffer (0x08){}
    CreateWordField (Local0, Zero, RTNC)
    CreateWordField (Local0, 0x02, ALID)
    CreateField (Local0, 0x20, 0x3F, RES3)

Because bit offset 0x20 (32) + length 0x3f (63) = 95 bits exceeds the
64-bit Local0 buffer allocated inside the method, passing a larger
input buffer to wmidev_invoke_method() does not enlarge Local0 and
ACPICA still aborts with AE_AML_BUFFER_LIMIT before entering the switch.
Fortunately WMCD, WMCC, and _WED(0xD0) do not have this bug.

2. Eliminating direct EC addresses (ec_read()) in v2
----------------------------------------------------
I agree completely regarding maintainability. RFC v1 has zero ec_write()
calls and uses ec_read() in three places:

- Temperatures (temp_regs {0x70, 0x73, 0x72, 0x62}, i.e. TSR1..TSR4):
  Checking SSDT5 (\_SB.IETM) and /sys/class/thermal on this machine,
  TSR2 (0x73), TSR3 (0x72), and TSR4 (0x62) are already exposed via
  standard ACPI DPTF thermal zones (SEN2, SEN3, and SEN4 under
  int3403_thermal), and CPU temperature (TSR1 / 0x70) is already covered
  by coretemp / x86_pkg_temp / DPTF TCPU. Meanwhile both fan tachometers
  (fan1_input, fan2_input) come purely from WMCD GFNS (0x02/0x01) with
  no direct EC access. I will drop temp_regs completely in v2 so hwmon
  is 100% pure WMI for the two fans.

- auto_power_on (0xf5 / H_EC.ATPU):
  WMCC (C75665A3-4382-4646-ADC8-C81AE146E455) only implements the setter
  (Arg1 == 1, Arg2 == 0/1 writing 0x00/0xA0 to ATPU) and has no WMI
  getter.

- win_lock / fn_lock (0x5d / H_EC.EC5D):
  WMCD GWLS (0x03/0x01) and GFLS (0x03/0x03) write ZZTT=0xD0 and
  TIZZ=0xD3/0xD2, wait only Sleep(0x14) (20 ms), and read EC5D before the
  EC finishes populating the shared mailbox. Calling the same WMI method
  twice under a mutex with 25-100 ms delays (550 reads per step) reduced
  win_lock -EIO errors from 26/550 to 1/550, but fn_lock still returned
  occasional stale values because the second WMI call immediately
  rewrites ZZTT/TIZZ before the settled EC5D byte is read (and _QF6/_QF9
  hotkeys also overwrite EC5D).

Note that platform_profile (GPFM/SPFM), dual-fan hwmon (GFNS),
touchpad_enabled (GTPS/STPS), and the 0xD0 WMI hotkeys all work 100%
via pure WMI without any ec_read() or per-BIOS register offsets.

For v2, would you prefer dropping all direct ec_read() calls completely
so the driver is strictly pure WMI (dropping temp_regs, auto_power_on,
and fn_lock/win_lock unless a reliable pure-WMI path works), or keeping
DMI-gated EC5D readback only for fn_lock/win_lock?

3. acpidump output
------------------
The sanitized ACPI tables (DSDT and SSDT1..SSDT28, Windows licensing
table omitted) and decoded ewmi.mof are uploaded here:

  https://gist.github.com/winddd666/8f739d1cab5beb503f606093ade10d65

Direct raw URLs:
  acpidump.txt:
    https://gist.githubusercontent.com/winddd666/8f739d1cab5beb503f606093ade10d65/raw/15e1f0d4c98096674f9a958e431096b1b49d1a40/acpidump.txt
  ewmi.mof:
    https://gist.githubusercontent.com/winddd666/8f739d1cab5beb503f606093ade10d65/raw/8eff35b93fee7ed6e2d8aab47fd1ad4137bb13cd/ewmi.mof

Individual tables can be extracted with "acpixtract -a acpidump.txt".

Best regards,
Ziqiang Xia

