Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873322;
	b=JRUU9ZpfxU5PT8MOzfhdEAih5sDbHZ/pwAahF6TWNkP8a4Di2FZvDlIm0CuYlL3fYIsI
	 mehW55DXHYDNPHdpDhvWyLHTHhprUqx1vF9mcqgrV+KxJ5Jf1jO2n8vGsfSQ+vuf9WU+V
	 lVpoaX4xVvy6TJ/k86133kthOBFZSk+s6Pvd4/Gd3TIU+KM5LC+PpYRPKBBv2gjSHcMJR
	 V8/mLAr9Y4rH1mpN4Xe4D7JDYx/QaUdt7vVQocoPOTk6uPgTpy4OKP8LH36r/olRsQ3UZ
	 sllXNKJYEk92XnrW5oHetTX8otITc0inewssehyPbxS9oB1Nh8LhggUB7jolM4kBtJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E/FbeKmRm7oyAI5xN1frdUXUBjeEa1sGbRPL00RoKXg=;
	b=EI5LhRoCBJwIx9scDHscxDYkEZ4YYdoeUZMAa/P8XaSVXuyrzO54HG9oVAc85OD60EFW
	 OBEcVhLvMirwtbLyQoH8fpT+6ZEIiE+vx6gdSBgNt+FlVSKN8Nn57ReBWEOhRbCep3Sua
	 niqfrY0tugZkVDZBWea/SOlePBEBFi9W93wDtwu5KCEFHcaH+aHh3eeat96Mr12M5rFlU
	 poiRlDPmOfuatfuBzkqivCxXF+SSZBRtLRU1o1ZbxvSoaT9+sGg+nBZX3qr7say7JKFTf
	 u2E6E+okYLkYUmDCTvn3APnsXXbWVy50vNNzkAqP1Tu7jwKHp1r0HaLRb1ZG3OYV34w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mX3/hK1c";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5A606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mX3/hK1c
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3791619605cso7538832eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873321; x=1795478121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/FbeKmRm7oyAI5xN1frdUXUBjeEa1sGbRPL00RoKXg=;
        b=mX3/hK1c5IwevkQCE3Iun6lQB7oW73ZQJXjwloXyYput30bXmvutKaABIZ2y8AAAvu
         hpi3uzUApGhwdUJHmxlppGoozyj2GpoWdwmpFHnZEGbnOmHcFXgKofc6FV2VZ6oKzG0a
         ShC3o1JhqGZFqBsQ8c3qJuTPCVtoqJ0Sn4nrxyLqxFVf7JfGrPfBOn/NA77R54cniWZ4
         RP5hZondNTagfHwUMEUSTgkGgQXljG6inXxLBWSaaTcs3wIXjz45DJC52yiMliaKEogH
         x5D800tx7bHQh7RHBFOMD9FtfYRl/cWbcztOqP3f4U11LOoBPV9X1OOviLMy0zR/kVvP
         ABYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873321; x=1795478121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/FbeKmRm7oyAI5xN1frdUXUBjeEa1sGbRPL00RoKXg=;
        b=L+MVjY+J2kOxtttnHi2hoOaV8KpxUIGov7GlOWhrVs1CWCES/BxSErY/H+0JOcvjEy
         JNp7eX+GZmGdoLhl86ysFwfcbnko+CSbg2gPdL+nnWR1tOhB+RJ5BrX0byDJDjiRKpul
         kHldGaHsEgIFomjuq34DYk/skdnstHMQGAj913GEo4L1W12Kes2NHytmwyQ48TbIxs12
         EE3afx+1XrXrxOdriFLqTg6VQj21x1gfefdFHsf2aljq3jkDcJpk4/Y0JX5RaR8OgR2l
         maPvb6QHJJQl0gNpudGLkELQW51VpuE00eR2NHNZNWuYGUPLBnV6/WnIYcMAzBF5U/mD
         cnEQ==
X-Gm-Message-State: APuU4Z+zlvnF9+X8RiNNnJAzsWb6Jo9mmhAcg4rJn411AR+bpSeozj4E
	OfBw1HW+mwFhEufNGjnNgYcOsyWLwLJ0DiP38nqz0Vd60/lV3QWUnoEq
X-Gm-Gg: AZFdTZcm8I9EUPMoP8q2eYKW5H0Ft0shceui8USBthIjiGZOZFfJt5Btm/gp0gLbKTh
	sNWkZgQOtm+pyXcCF36ghTDXRLVc8pq1dhrohIetlY5UONWf7hfT7wqZnkiwRaSWwSOaohAEs51
	4I5mb/QPsn27e2bD8fjjDW0V5iK3NddPF+Qnan9dkc/N4TsGk+hKPcUSMnaFpCgMMddMN/Wzout
	OvKtuCBVdQdSETdWxvQ0LVqF6/jX9+the54hCVEygiKwov/7W5teVuPvIoFW52YFwPmlFFmMaXw
	EwFPlFCSULjNIr318do/lGNve6jUpv8L+3GDDkCVMQ/Nqo7c8wyiaRii+oykm0DtBaHxdgPb1q5
	ag1htdo+lszsMLl5FevVbFtKwpA2x8Szhc5lmaiUX4VcxIv1QA9HaZC79thCUsdO3icR48eGUu5
	EHVxjm0ivz1Tl4oWH7tipiNcxl5443egu7epUoBcQKV7z/XYzjdu7lT6G51LENW0buYOQfhO8m0
	U8NY8i4a71NVSiIqbZLbPiK8G8rkcZILTkg1CW05SUYKk0b2gnrXisATgV9nyCOHW9QgESFKwr1
	l78obgXBtdUkbQGO44iI+SNb04w0Gbnk+YqiH77BFMUUsfK5U/Otd5/gRut0JYMUr6zHsQ5/0Ed
	lXSB6aoMUlKuB25sVLVlG6Erh6Sarvkw43VfmrNaX0gazo+RdEpQozi++o7NFHs+ZmbXkgdz1GL
	DIDQ==
X-Received: by 2002:a05:7301:d189:b0:36e:e349:f2cb with SMTP id 5a478bee46e88-3796628e28amr12137451eec.19.1794873320107;
        Mon, 16 Nov 2026 15:55:20 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 04/16] platform/x86: dell-smbios: Skip 0xDA structures without tokens
Date: Mon, 16 Nov 2026 15:54:48 -0800
Message-ID: <c9135b1f76f8aa74faa53e07d2a7d0816faad2e5.1794871007.git.rosenp@gmail.com>
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

When a 0xDA structure only holds the terminator and no tokens have been
collected yet, parse_da_table() calls krealloc(NULL, 0). That returns
ZERO_SIZE_PTR, so da_tokens looks valid even though there are no tokens,
and an empty "tokens" sysfs group is created.

Return before reallocating when the structure has no tokens.

Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index be68f6a25b41..4da19f7da81e 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -443,6 +443,9 @@ static void __init parse_da_table(const struct dmi_header *dm)
 
 	da_supported_commands = table->supportedCmds;
 
+	if (tokens <= 0)
+		return;
+
 	new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
 				 sizeof(struct calling_interface_token),
 				 GFP_KERNEL);
-- 
2.56.1

