Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975952;
	b=K/LIRJCJFFiKEltwzFQgIWzeV0kwRHpkdyVa8IsVsoFD8d4UCHJoQGmYcVzJdSbnmSCR
	 JdSpWjRaa8dFWQ+vdilJzYFS0LA7nRk9cRA3EY1Gb1kiEOz0gKhDN7ElLwF8+VGHHWWja
	 Ux77nX50va6mbEPpSOZ0a/EejA3dxVLEfaxQY6zPYRKR8JsJZqHbJ/mzgPcW33WT1pflw
	 Lh0QlZngoCnFLaFYEKECpXpP6eU3PJ3eBqjMlPQOUI2/gzFC3joJMMNhktQD2gQ+iY3QJ
	 F6nI85ZL7WvJb78BBIZMfgMR1sjbilDUvaZ8vjOCMykTfzaO9/UxZ/uGlS8BEVKbR0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NKdGCcolbuPZw9pvVPO3Sg+7463rN4cHGXjb4geYW2k=;
	b=E7GfxMIBaZRyYtNE49Z6+2I6QBLYgoOItTVOSOY1KPeY+WSKtyyq2X+ANWX+PBO2IKyf
	 MqO6LQjliL/nir4YxJ+90DpzprB+bRDzifZ2qKMLCegrdBQUoxjI8yQJcvYDdl7+sPIbV
	 wx6TbZ7niJFIktXo6JsxvIj9eCorXmeMy3ZCoNUiVgXDMVsx+NLRg/8yOuYVfksuscg7n
	 hzLEmG8KPYsy7jmql4LVI0JS3jtPMYf0bTWUGhBWATkHiuF//uqwyiBqPNnYlEsCdd1zo
	 SZhgM+C60e9zkFFKfUsTOh7qaaaTtDowxpUVFWpNiiD8keWzNrihFAQfZn1J5bhBQyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0QYyIBs;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6075E606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6075E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0QYyIBs
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9995ce866so4191035ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975952; x=1795580752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKdGCcolbuPZw9pvVPO3Sg+7463rN4cHGXjb4geYW2k=;
        b=V0QYyIBsK29ttffFJX1xBH1kFD0NNqBK/wFc50VB6Geh3/OGJIR/AyQ6NHaxa5oT+D
         yudTLNVrFJoxknpDTnfxHlRxHWFlzKjJKhWa9RMjUznVkYkkKahQqHKi+PJKKaCGuaG9
         Z/vVLuyaUEu+qGYmAGZriThmmxuBh2nlA6f7/ZSdna69WUG5j35ETPnJE9JOFGqitvjo
         OgRwnWGTnEesK1MglQ2nTlBNcvOXMdLx2L/Enh3NwM7/xfppGABhS8RWTPKZh8aCz9dg
         Dbq9EwgnawiHleqzf1MuIhQ6Hb7PEExLyAishzkdCAgJxjNbtNcqI4VcgIGbWAnXkpej
         gn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975952; x=1795580752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKdGCcolbuPZw9pvVPO3Sg+7463rN4cHGXjb4geYW2k=;
        b=DcYZRlMBWGoPEhih1I+yWoTxbmx3DVcQ7BjS+mvDhDMpKQ7UlCkWUA+ekYGWpAZzQr
         WXTq9OPW9Db7a6uqq/rsfluMXNmQnXbGdcMHlX34so4BvdgqLYBeqCF+ce5YQgUqlNjx
         TyT3ssbj7BbTltxX2wLWvGem3oi2ZzNxg46P6rHKHR/Z4UonG1C1kekXU30aseqs9fsR
         Y7NvyvGmscJwuGjcN2QUYDhHaeQLU7pQRMs9nAx/CB1v5U6XAU4ivReJMfFzxxk1Hx0W
         HTWsYGK93subvbZsZ85eBr3F1fgwCQJC6XFC9UoDnwgZ5HTCXdBT6qEMOu7W37Fdoxio
         fZ1g==
X-Gm-Message-State: APuU4Z8wC5Y3tm4K+/5ROmQEasCHIoRQ5y2BTA7i0DjFyw0g/tqy2/Ra
	Cd0PX18IGC+LtF/pumxlpTgSQ4hnkxqK0JWBtWsIhJlOsz+oc8/5VOcd
X-Gm-Gg: AZFdTZebgQ3EXYv+yB9sO9skOUnkxkcHVcgFZgXBMUEqDhJ6oyl2eKVPvpA484EoVZZ
	kjA8prIHJxiX+kgqu6SZifGgTcLsgyVA3Das6HW9hGm1zQ6ld9XyG6af4o4MGoCx+pi3ZZsPMZ5
	Jf09STx49LQf75kdtXiNh9YEQXrxj0lRl9Gpd4CeLg4x8thxUhQCesRQsKGlcetxNaw0hpKmNWq
	aIBTvrQa4+mvATLeF5f5yqAwUrkgNf/ctXSWiv9tB9NczlqRk4uk2/bUjEYnb0yl4CD1hDIzBTp
	kbrIcfG+0pSTQ4XZ5Gu1Wv7P2pa/PQw9yjymkHyPOOr9eySTvcVM6ddA9egdc06dq+hui97lv6c
	1hHH/Inq4AlAr3a2tYUMLKHzvw4MY2iNxUUPXhdcgPy9lDGXjIufTmHZMfbPl2hXVoueaNrTfMM
	40I4MocA/OnuCdbaX9YOcUf/HuH9TiQS0wzEv6kdt9YfjCvThcr8TW2xQR+nKJskvlO+MnDLC9G
	rlC/IrfzTfNsiio+KUmNItj+lMYqxIKtADV+iKPjVPBg4/RciaDYzOfwhZ+ANk9lp3R1zgZW35h
	rDgLFn9Wa+fvKi7y3/sGkKPrNBaPvLVamnd7CcdNEFoYf8NUPeVahCAhYXIFE1ySgMEHgL3nQEk
	zqayKI/raQ9Dk293tH1piwWLMoB8H8oyBLqUHSC1yeZPGIll2srXIiklKRf59gfjLttvhOmuWM5
	CJNw==
X-Received: by 2002:a17:902:ec91:b0:2ed:352d:c619 with SMTP id d9443c01a7336-2eff7560df6mr14192815ad.46.1794975951796;
        Tue, 17 Nov 2026 20:25:51 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 06/16] platform/x86: dell-smbios-smm: Use the first 0xDA structure with an SMI port
Date: Tue, 17 Nov 2026 20:25:28 -0800
Message-ID: <c2e25b2b4990965412035a249d3cc079b5bc0235.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
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

