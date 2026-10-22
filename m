Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792697246;
	b=fvqHL1ePxd1ffcHLHcddGz1wfcABMQ+o6JfHAxcVwduwQbUE554o0sbxYmkiDpX07uMV
	 tXcUGR58ZzShw68QnBxv89vi24TRl9ZjpdNA75W+mziKthg3y+opgCfAGwX7hP2O3XuLq
	 Ta7Dw6juAszveRPsVKPQKhxbiPVwiprt+A6VASBcSrIf+4jw2gmZHdOGLQWsECi9wUz8f
	 4mkfN1CyEnQR89HE81xrm1ICCeuDq4oAVIOzTyDoqbA6V71DkO1K+hPt8V0K10usTjQ7f
	 zSvsiP4MPfVAlzN210HC8QGpw3E8RkPe2So73Umd6/6CG28uczIuk2wup8QB/rkgOdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792697246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UvQHobgH8Zb4rHJc4CXfEofhf12rBgJ9G+UkmAWeH18=;
	b=RtLmVVc1JGpu1pa4aflHoEDCchD850JUQBe7ZdRvMedSMTZX72JGf7dHZTMGs5DTV4WE
	 WGn5lQFWOzbOd0vUQO+cp74w8F94bQ9nAmp2U4E6GWRpxJi3XHEj7ac3GwjOPln5e95Qw
	 6GI+/Zal+dw+ORN5locTuAlyJnwcKd2LTzfj9TQvICpct372G0yfEAvG70ihELbNtxyOt
	 KB9g0cMM9S4OAQtzM2Wrg+XC6q8HcEcHsUZxoG83aqQxEa4K2RqxnMmr5cCcIJdNbnlvY
	 bYlgZDB0ouvJ2YC3hve20y4LxP8cBxg6viswfta1fCbRZiBZNidYdGCs2jPQbDZA5Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thinkoid.org;
	spf=none smtp.mailfrom=thinkoid.org;
	dkim=pass header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=zhfZQOTK;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C8B606A31D
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 19:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C8B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=zhfZQOTK
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f1e5d7450so10821885a.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 12:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1792697239; x=1793302039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UvQHobgH8Zb4rHJc4CXfEofhf12rBgJ9G+UkmAWeH18=;
        b=zhfZQOTKLhfJXm5LG7URakF+NxBk8bk9htV9atsIWMIUWrU23y7Sfypddxdak+rC3i
         PMYT/8uaey1X82aqk34aRLpVr2lJfr0AV634/gAmPx50zofgvvaTW+QNmNoCja4ZjVaL
         02Nx8Bpbt+v1DsTKhFrexDMQGgpCYQjPIHqvvbCxam1OokDmFvqL2Zf8/2AY3S3aLOUW
         jTRqtHAprU7w3Ia1FulRoOXZLlwn71GzVkf+/kB8LtXmBY1Y6fhfUSWgxlpTFRVIU4xE
         s2NVxm4x4w5wU+lSdKeE4oHSfpC5VkQdC1Lh7ikpJgQbh1u39glIH6sgf/+glyqalNrw
         6qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792697239; x=1793302039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UvQHobgH8Zb4rHJc4CXfEofhf12rBgJ9G+UkmAWeH18=;
        b=zMrZVlOT4Y4F+fbngejlqRJ6BPPnua+jdI2LzKEGr4T1mVIWbK3BQeJrHUWtA8YQY4
         sO39Zqn5esnFPidy0cDQmlotDq7+kGaCAwoZXrVoyftjC1nkXQ1yP/fQgZSSnbOna9at
         AOEClKstmqamAl9VLoZL8dcW9T1ZjjWPUxrK6zKe5tdwLxbZO/joiQKdD8VnL6KZwrM3
         4lsmvEjhumme0V7CWTqcPn982mDALgz1oa6N12M7nGOydyiXRmYKn7tI+82SF/vaYKua
         Yg9DQToAQXjiWhLlKAU+wk+tzKYi8YZY32M6BtflGuvAGtwSVBO/UU5PBOwqtdWw/FwU
         7vLg==
X-Forwarded-Encrypted: i=1; AKwUvBzoFs2Nt3Z52L19LcgS5isR9uyYy9/EZX/eYL00x/CR0RamEP4LcYjV/finZdjCDSt9/fBPQVbkk7hc2wsg9982Cjdw@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3A985+gqeG8LKgXj3+paWhpY+6IipZUzo7qvyy3wpaIGEtUYc
	YldvwOHTbExLN3H7gtmdRcQLM8G0w88v5WV/3LhsQ9YfpJq6jOLMuW3g3hqEF2HMzCg=
X-Gm-Gg: AYBFou1T98YW2rD4tqf8gR/wuXZ1EY5IJ798t+ax3DXsd6+1x9Sxj/eGH8zHHFoKgO2
	GaaUD6C/uj6lc5JjOku6ANmFrPbKdIsRMBJxIMHCT5NkN6IpaskIAM90F6mHvQIRjGzZkCz9Iae
	91WUVSugAsZQ0Cd4rzgZZzp+ECLNGzujIj+bRCM4MG9ZkDVAQogzD7cIxAbtPYK2ZVcx28sIi3E
	PtcxqyEVzp9qsuaDc6G4le0iWusHU0BsRErLc85Bu9VzvmmtDvlXr8OYZlhR5z+d3cosLROP/ua
	aC/oFfaipjzPnF+N3OptN+7Gf0UkKyBDKDRx0S3LONh7PMifL7nEWIa1PoXiX9ZCMrSjkTxYBBK
	otXmCQGEmstTt4VNFpwc0fFgWTn9a1f+jr00hrmu0Ac+k3kWDu7d6Hxs+UbBB/t0+Zgw5lUPYCM
	1aDkyzEIwPyC/LkorGOvMJ3avbxA5O+u2J1TtGhfFsaUhU/7ZD95yrhv210NjWJHJDfcbWiCMOK
	/4EzkyrjRs+NfWGj2RamjM1/iZWunEd9YS0
X-Received: by 2002:a05:620a:44d3:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f6f8c01cemr79549185a.72.1792697238908;
        Thu, 22 Oct 2026 12:27:18 -0700 (PDT)
Received: from behemoth ([2605:a601:9b7d:cc00::c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f6fb82b87sm30290185a.13.2026.10.22.12.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:27:18 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Michael Burch <me@michaelburch.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Tobias Heider <tobias.heider@canonical.com>,
	Val Packett <val@packett.cool>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-hardening@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC
Date: Thu, 22 Oct 2026 15:27:09 -0400
Message-ID: <20261022192709.12149-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <NCQ5O8k2_GpmJZBjDzgZL67uwdiYmmuSudO9VmdRaFTDq0u7aec6at00VYbzdwwSVvgJnLnGxewwp_TVO9oTjM2pAjP_LoiURf9JCIKXB-w=@vinarskis.com>
References: <NCQ5O8k2_GpmJZBjDzgZL67uwdiYmmuSudO9VmdRaFTDq0u7aec6at00VYbzdwwSVvgJnLnGxewwp_TVO9oTjM2pAjP_LoiURf9JCIKXB-w=@vinarskis.com>
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

On Thu, 22 Oct 2026 17:07:25 +0000, Aleksandrs Vinarskis wrote:
> I do not think the left charger you identified is correct - how did
> you arrive to that conclusion? Curious to compare to my method.

I am afraid my method was simpler and coarser than yours: one run per
port, nineteen samples ten seconds apart, the charger feeding the
system only (battery at 96 % and not charging), on a 7.2.6 kernel
with all four GPIO channels in one DTB. The deltas over three minutes:

Channel                Left charger   Right charger
0x14b  AMUX2_GPIO          +1.6           -0.9
0x145  AMUX2_THM           +0.1           +3.4
0x146  AMUX3_THM           +0.8           -0.1
0x14a  AMUX1_GPIO          -0.2           +1.3
0x144  AMUX1_THM           -0.1           +0.2
0x148  AMUX5_THM           -0.2           +1.2
0x147  AMUX4_THM           +0.1           +1.8
0x14d  AMUX4_GPIO          +0.0           -0.0

The other channels fell or held while 0x14b rose, so it was not the
board warming as a whole. But 1.6 C in three minutes, against your
2.3 C in ten seconds on the right, might mean that 0x14b is a sensor
somewhere on the left side of the board, not necessarily on the left
port's power path. Under SSD load it moved with 0x146 and fell with
it in cool-down, which puts it close to the SSD. "Left charger" was
my reading of the sign pattern. Your ten-second test is probably the
better discriminator for a sensor on a power path. If nothing answers
the left charger in ten seconds, the simpler reading is that the left
port has no thermistor of its own among these seven.

> pm8550_gpio_02 does NOT clearly follow. In your test you have
> waited multiple minutes, which is enough to heat up a larger
> area on the motherboard.

Agreed. In your left run it was the only channel with a positive
delta while the board drifted down, which is the same weak signal I
had, and no more than that.

On the two AMUX3/AMUX4 GPIO channels: neither carries a thermistor
on this unit, and your tables say the same for yours. 0x14c reads
130.048 C on every sample, the last row of the conversion table,
where the driver clamps a voltage at or below the lowest it knows.
Its input sits near 0 V. Windows' ADC configuration sets up only
PM8550 GPIO3 and GPIO4 as analog inputs, for AMUX1 and AMUX2, so the
pin behind AMUX3 is in its digital default, and PM8550's low GPIOs
read back here as inputs with a 10 uA pull-down. 0x14d held 34.7 C
within 0.1 C through both chargers and two load runs on this unit,
and 35.8 to 36.0 C through every one of your tests, the hairdryer
included. That is a biased pin, not a sensor. Both nodes can go.

> ADC5_GEN3_AMUX1_GPIO_100K_PU - Likely "lpddr5_therm"

I cannot separate 0x14a from 0x144 and 0x148 by heating. Under a
one-core load reading a file from /dev/shm they rose 14.0, 14.4 and
14.2 C in lockstep, while the SoC's mem TSENS zone rose 20 C. Your
RAM stress warmed every PMIC die by 1 to 4 C as well, so it does not
single out 0x14a either. The three sit with the SoC; which one is the
memory I cannot tell.

> Looks more like "sys_therm5" is the actual keyboard thermistor.

Consistent with what I see. 0x147 is the coolest of the seven, 29 C
at idle, and nearly indifferent to board loads: it gained 2.0 C where
0x144 gained 9.2 under SSD I/O, and 2.5 C where 0x144 gained 14.4
under the CPU load. A sensor away from the board, on the skin side,
fits.

On 0x146: under four minutes of direct-I/O reads it rose 8.2 C
against 10.0 C on the NVMe's own sensor, the largest share of any
channel, and it fell at once when the load stopped while the
SoC-side channels kept rising. Under the CPU-only control its share
halved. I would keep "ssd_conn_therm" on it with partial confidence,
but I will not argue if it goes with the others.

> Alternatively, I am leaning to drop the labels for anything we are
> not sure about...

Or just give them pirate names. Jk.

Agreed. 0x145 as the right charger is what both of us measured.
Everything else is a guess until the teardown. Numbering sys_therm
from 1 matches Windows' SYS_THERM1 to 7, so that helps too.

One consequence on my side: the 9345 thermal-zones patch
(20261006185557.23016-1-lnicoara@thinkoid.org) names its zones
chg-left on 0x14b and ssd on 0x146. I will respin it with neutral
names for the zones that are not settled, so the two patches agree.

Happy to test a v7, including a lid close on the EC interrupt line,
which my v6 run did not cover.

I love this laptop, but I will not open it up just to pinpoint the
right thermistors' locations.

Liviu
