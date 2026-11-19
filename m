Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057315;
	b=uFKXspNTj2WpDiR+uJ7h0kbic2y1BpNZ1LFz4S4tHRbS3NzubDXFPaj9m1H2aF48GeYO
	 KYuAbSe3/SrLsc+g1a8kWGGYprpTaGUNDzjydG+xH//RX/CmN5zEKeoPNaP11VED4V/OB
	 5zLz3iFj1EMWdme2dpLQIM/igefm1xYYCrYGcudVYRORiqDqdKEIr3E1al9UDshT0bnY3
	 PGWVHjtg9/gPquE3OFmVXgyEIlbwv+TqcSrfkg8n32/h3Sy/zYf6iL/lQSweGdVTh9QNZ
	 wB0Na5pXvy+ukniLn+DtS4/42gVMIEO5wWy1YkQ1gTkrmtSpb0eDcFfFt6I1bviVzOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057315;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=A4qIOMHFRxF0E4j+mqXhAcCcDlXHDowh2b5QKsUYxVY=;
	b=xkkjSSNXnK5WBykGUbLzRtHgj/zSrMpOZ41D0iX87M2zJDjywSG0eNsgmUVrz8pvqhGR
	 z8O5dH3NhduncUrks3A5Vf2VTF5MP9CoNgO73uQ54XEgk7KW1aqSm5TC6znuEKNvlL62G
	 7C5GYYcvZqcPjGszIntan35YVi8WPPsx9Ft7ZxyZwYBpVSQhJH9D9oPSfAfyi2ykV3w4u
	 pBeab81uDNN6jgRe7MUTFRH4sOXFhLrGntncx+w1u4MWFo6wqFYdtDyr18kjBu6LdWOWl
	 w447wsaq9DTgGUpoStnd0aZXmf9Ew1w2qVmpadPKY9lPQrPIwGEeYrASwnyWhNydFQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P3/DbGhg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AEA606A339;
	Thu, 19 Nov 2026 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3/DbGhg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ECB1F000C9;
	Thu, 19 Nov 2026 03:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795057315;
	bh=A4qIOMHFRxF0E4j+mqXhAcCcDlXHDowh2b5QKsUYxVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P3/DbGhgIz11JVQBNqZpOWd/x5N39Wnnt9YewfQRLQKDVg+mCbvbMAEuz+ydun6tI
	 yCGIKIoySDsjgvvvhZkawVqG3ndKbsEDGk7VthP0f2Vn6uHkrbGB2sSn4hycFYEADw
	 PyyWkPDF2Ci0Setwgffkyc7MWMBCeHuZUwAX+rqvDwTViIzwySxSSEHSmJvVJLh1un
	 9YFgQcVyQ209JbeteQyrFxlq5IMehr0bNZCuKWYoPLuf+JwJKbrhYbrVI1mPVpqNeL
	 YeJnqMqP7yWWCaALede6773XoyJSLcb7bvH7WDZ3lIvVrb/bKs0b0hKU2ZCBMzPn5n
	 NoR4ELjvXC+xw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	tfiga@chromium.org
Subject: [PATCH v4 3/3] platform/x86/intel/pmc: Disable ACPI PM timer during suspend on Panther Lake
Date: Thu, 19 Nov 2026 03:01:17 +0000
Message-ID: <20261119030117.3943303-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261119030117.3943303-1-tzungbi@kernel.org>
References: <20261119030117.3943303-1-tzungbi@kernel.org>
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

When the ACPI PM timer is enabled by firmware on Panther Lake to drive
wdat_wdt, leaving it running during s2idle prevents S0i2.2 entry
(staying in S0i2.1).

Populate acpi_pm_tmr_ctl_offset (PWRMBASE + 0x18fc) and
acpi_pm_tmr_disable_bit (BIT(1)) in ptl_pcdp_reg_map to disable the
timer during suspend.

Tested on a Panther Lake Android desktop device (coreboot with
CONFIG_USE_PM_ACPI_TIMER=y, kernel 6.18 with CONFIG_X86_PM_TIMER=n,
wdat_wdt not active):

- Without patch:
    S0i2.1: 100.00% (345,382 ms), S0i2.2: 0.00% (0 ms)
- With patch:
    S0i2.1: 0.00% (11 ms), S0i2.2: 99.99% (343,699 ms)

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- Reduce to ptl_pcdp_reg_map opt-in using the common helper from patch 2.
- Add S0i2.1/S0i2.2 residency results to the commit message.
---
 drivers/platform/x86/intel/pmc/ptl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/intel/pmc/ptl.c b/drivers/platform/x86/intel/pmc/ptl.c
index a7d5d4f77934..a38b099679b3 100644
--- a/drivers/platform/x86/intel/pmc/ptl.c
+++ b/drivers/platform/x86/intel/pmc/ptl.c
@@ -529,6 +529,8 @@ static const struct pmc_reg_map ptl_pcdp_reg_map = {
 	.num_s0ix_blocker = PTL_NUM_S0IX_BLOCKER,
 	.blocker_req_offset = PTL_BLK_REQ_OFFSET,
 	.lpm_req_guid = PCDP_LPM_REQ_GUID,
+	.acpi_pm_tmr_ctl_offset = ACPI_TMR_CTL_OFFSET,
+	.acpi_pm_tmr_disable_bit = ACPI_TIM_DIS,
 };
 
 static struct pmc_info ptl_pmc_info_list[] = {
-- 
2.56.1.708.g77570a6a1d-goog

