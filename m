Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873324;
	b=VA1Klnd4PIVfjZDB4rGEDmhRSPK7qcoU6LtuWEnAmfzJe/mz8SgJDzr6QcqiyZq2yI0r
	 aRD/JNhltmtg/hDUaXY01Zn9D1K9GrTYmX6L2S6OApmTM0QudBfKbXbA2NtUXH/U59NL6
	 gHMm/3CXCvDOA2IPEnvENiBvtkkpewLWBu2uMzZrjJKfO0dmYn+mul9TELm9Fu09jF9Vj
	 LvtV3Yu2LS0FZ7DULY4P0Akiuuy14BET0a/qfO528kHAvcFjQCrP7O7tlxEg7TYGwQuZm
	 HxJJfFqtN8U6Y28LiwlZSD36+p5ET/RxyVEC8hNqdpNpWtlTPkE8qA/g35sEfXeub/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NKdGCcolbuPZw9pvVPO3Sg+7463rN4cHGXjb4geYW2k=;
	b=I/Qb8lcs1mu/0qJ5iMuDsmOJij4PgiXim/h2WngGOIdsiuSOZwiBjJhJo9sfv9vH8woe
	 uJN1xE7khZiCXUxaKDS4jMX/jVmOuPZ9cImrPDgWEUmEtmHEQDs5i31WVMJfbwY9VGFcK
	 zVaH8ufjwjDhk5w4QqzrtQAO7/c2YUHrz1imoNlhVCW7nD/rQkaxdldZhe2iS0G1WPkr+
	 LsMMtAprcPnCqQX2PcTI5EJlsqGy3PqyPU3x7L+/opa6YpPjAbqwE2+jJYG0pp6ht4/gv
	 4e+JwQoD46tv3518xb1+VYXTmjiATZvffPYkeoQJpMvtVkl0RpD5fTb0txLLt0BttXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=omjhaYoT;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94AB606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A94AB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=omjhaYoT
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3791619605cso7538869eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873323; x=1795478123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKdGCcolbuPZw9pvVPO3Sg+7463rN4cHGXjb4geYW2k=;
        b=omjhaYoTrsyRLvbW5tsHBIOP/5mrpZAuY1kyq6iuerA67XKIz4ZFKpPQEpS+Q9xjKy
         GQfj3ipEiNJjZJra4ZzWeluVCi4DFSfTsHjYMvZ6oTbBqrzZMox85QUSWiq5NEIKKNhA
         UuPw8Vg5Gu3v58pnya4XsQfHin8k+H7BNTenYF71cxi81tA15Myk1NIX6cN0GpYyijQB
         APsQJyrPFrCV/DYAuBLW1RdkPz/KaKjbCcHUfuBQ5Qb+NjuYgH35woshYyQarPKdh0SQ
         n96Bpw7ce33tQe9FgfB2XE93+LcHpWUv/f3LVpvwIJ9LQe1uq0Ko4aoUrjUbUv4tMYj3
         IhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873323; x=1795478123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKdGCcolbuPZw9pvVPO3Sg+7463rN4cHGXjb4geYW2k=;
        b=UW2q1cYR+V8F9DK3vqq6UMY+ULyvGpqhk4OL8ISH5bl9zcOtlVha9W3c6JNHRW4FQZ
         PtmCcdaXl7Yqfkt5bF4xk4Y9Z8kBzZ5P/Jk48D/XBan/KtIKrHb6ozsttvGeUxivjOPF
         OVl/mgsa9R4bhGPOdp++kLfhuZZO0a4BJ9Yp6fJdT4MxIEPvl5xL03mrwPuC16QAr/EH
         E/mQx94j0+3JU/iGfeJlaFREfxmBB7dkB73m5c8Mk7a/jeedKxDvXUEm11fQJ9Qvx/em
         fiM6RAH4NbbQdl+0Jx1KbpF8529HiRiLbFM24KLPXrgh6zFmYV+eri1MayKUnPwwgLDe
         59Ig==
X-Gm-Message-State: APuU4Z+SlwIH+FAQp+pBuwtA1V9v53yl1owvVfDAR/ln/ZT52mp1/hm/
	HM56Oo/P+zV+lSXELVIKayr1D9Gz/5JWoXhNdO3TogTC6B0WhB2r2mLl
X-Gm-Gg: AZFdTZc0ygAmLnvZd6S7hdw/jxO1XKh8/j3hjDm3u/NfzAr4+NL0sIYtQYGWSatJpeu
	v3t1aEybD0NJAqTUnQmpsbNYUdH0/3Ms18Bc8WLKzHK0gLV4+DgD4iYC7dmrdcNRaF8t+9iMVWg
	epqPNGB3A/ehEfvLtDH0kAZzFNH9B+BALIOlWAMRmQk9iBVmnA1DMRL2qkCRZvvpWmgSDY+bi6H
	P4Dli/SZogoYcDEJy3bhYcimfHISULZfcjZeDiPXFLrRkiZFlq+cH6FpQeoNcdLXonYFglrM9QM
	cwwEcxuldYEnOaYRjzV8vWqRj41oDxaxZVR7B3d8hVN45uqheCdiFbj71ez4yeKHU4Q0N7YptER
	LCDM9sKznSOkPBRSoppqvwkRFbmqZvYYZFD23qvreF4d5lYuTA2rlG7uRGfl4XK51QmPjaPhSwD
	U7MMqgQimxdUMtZ8j4yVYPtOuqIEqo9zki1oDjTuL08xBYfrpZdFtvQSJS/RIKVfVhDbGctDAKM
	JZR48q672LW/hqe/Plv5SiFes8Wqt+hLSzA5WPEq9a6XekLqNMR8hvY1ujBNPmWgxixKzjtYll7
	pW5fMWriYWx3R5yW6V/MXE6XVY8Ipzs0So3Ze/BTUjQYsaWsyuLjT0XUmgiAYdQ49Gh/RkO9epH
	mrIDHBaG3/avMYyuZP45ZC5k9Q61eq4Iwjl4NGWn6bz8KMH8SnX1trE1PUrv6Jn3lnIo1ejuqu9
	hHEG8=
X-Received: by 2002:a05:693c:820d:b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-379676f8641mr11597086eec.36.1794873322787;
        Mon, 16 Nov 2026 15:55:22 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 06/16] platform/x86: dell-smbios-smm: Use the first 0xDA structure with an SMI port
Date: Mon, 16 Nov 2026 15:54:50 -0800
Message-ID: <824c43a74c0d6695edbc5e15127fd8af87bb1fb2.1794871007.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794871007.git.rosenp@gmail.com>
References: <cover.1794871007.git.rosenp@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

parse_da_table() runs for every SMBIOS 0xDA structure and overwrites the
SMI command port and code each time, so the last structure wins. Systems
can expose several 0xDA structures, and they are not all filled in the
same way: on a Dell Precision M4800 all seven report port 0xb2, but the
last one reports zero for its supported commands.

If the last structure has no SMI port, every SMM call writes the command
code to I/O port 0, which on x86 is the legacy DMA controller.

Take the port and code from the first structure that has a non-zero
port, and fail to initialize the SMM backend if none has one.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-smm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/x86/dell/dell-smbios-smm.c
index fc4a674c692e..843e379b2286 100644
--- a/drivers/platform/x86/dell/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell/dell-smbios-smm.c
@@ -36,6 +36,13 @@ static void parse_da_table(const struct dmi_header *dm)
 	if (dm->length < 17)
 		return;
 
+	/*
+	 * Systems may expose several 0xDA structures and not all of them fill
+	 * in the SMI port, so use the first one that does.
+	 */
+	if (da_command_address || !table->cmdIOAddress)
+		return;
+
 	da_command_address = table->cmdIOAddress;
 	da_command_code = table->cmdIOCode;
 }
@@ -108,6 +115,11 @@ int init_dell_smbios_smm(void)
 	buffer = (void *)smi_buf.virt;
 
 	dmi_walk(find_cmd_address, NULL);
+	if (!da_command_address) {
+		pr_debug("No SMI command address found\n");
+		ret = -ENODEV;
+		goto fail_wsmt;
+	}
 
 	if (test_wsmt_enabled(&platform_device->dev)) {
 		pr_debug("Disabling due to WSMT enabled\n");
-- 
2.56.1

