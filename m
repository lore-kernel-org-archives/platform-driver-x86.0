Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.165.48.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770148;
	b=jjfW5RGb/S84UuoCjjAfEWYuF549JZ01SigCCa7LBfn+qN/ND6wAdwGfZsIJcQYVKxz7
	 C9PusD9tjQQdleKSkQI7xWc0izQXXHRRGLGp2gS5bEFStCeTvHpQ4dByEzXMD97vpuNK/
	 Bk3hDu75cLcvpnbD34bN+Djjr/3FG2jsYSGWiUuYcH7bHjxNCZy7C4NtFn+X+fPgh/xHs
	 4pqYjsy98foIHYFpT18wBu94hrrNviF7ObURKwSHRQDj6EZdipA+8BfKBh208mI18yPPx
	 nVUpCpHpLBmTD8rlnE+Pbfj8gSKyXGifXPYW9j0TL/Mfsfx9+g7DoxjfJ7mvBtTOLDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770148;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=7CLOBYbNi1X6W8t+viisTSOz4Vl/AACkz0yRw2Y7JRU=;
	b=R5NdHkryaL1Qagg4Ihl9G4zQ5aoev1o8oUyUAlZ2QzdLIbCALCnvbvuBUmYqxBJXoaXV
	 bupzZ2r2c8Cb0kgPt2gkNsjUr2DV/NKwTiTCOtXEDIXVuEhA69OiiQtGwnXKh2YXsaqWI
	 pFr3iD1/yy9Bj94vzMCwHrARE5A0kExr/6n3Z4po53DhEqJVe3+tbVqVYlD5RM2IS94tL
	 5a3RgCMJzIB262r+VQ1v6Snpkq9YGsZrcHt53TS70huIfWOnis60IKsxQ6kiM0Mqhu16C
	 LTn/dTFWS36Mmd891cbtKRgrPtOjPTBJssEFUZ8FK2MYW3UuKcYeqinnZvnvRp7/MMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=mNMbRpsj;
	arc=none smtp.remote-ip=188.165.48.182
Received: from 7.mo560.mail-out.ovh.net (7.mo560.mail-out.ovh.net [188.165.48.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8149D606A321
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 09:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8149D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=mNMbRpsj
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.254.29])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4jbS982QM4zBThn
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 09:02:20 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-qgh79 (unknown [10.109.249.183])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B17C181D82;
	Fri, 27 Nov 2026 09:02:19 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
	by ghost-submission-7ccd8bbbb6-qgh79 with ESMTPSA
	id wBV3JBtHCWvG7hQA11hrdg
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 09:02:19 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S0086ebe963c-11e6-4064-90d7-40b8bccae90e,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: michal.kopec@3mdeb.com
Cc: filip.golas@3mdeb.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Date: Fri, 27 Nov 2026 10:02:17 +0100
Message-ID: <20261127090219.3366764-1-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126165506.2793034-1-michal.kopec@3mdeb.com>
References: <20261126165506.2793034-1-michal.kopec@3mdeb.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 5123970479740088070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFr33H5/GZ57e8zOAjy4AbQhwCa71Igc6rICZvEgYy22LsZUcJYgngSL2TZA7w4Ee4abVHmx2CVSiPYNMyD1rmsOTDiAFMtT5hRzkjbQGdazAvQlyBCtPZdJge747x9Epl1I25W76Q0ncVJti4mrg6zoaE7wtpXDPb0Q2i1I2x+T7d14P6v9zzrDBTDIAqMM6IU9GAj5fA9M61FlNTKIaxauqoRaPenq0pb5efhKPlASLxbounT/dORk0yy0kVCOFKPxsQidMqVJHCsQlZPyrdlIkjQbPF0zzYp0Gju+mNOWSH4j0Di5Bsa9G03a1ZJAQq3SVvbh+aYgzZpXZtGaiITQyOi7nbSO7WXcudQNa4npaYP4kGBo2pVWYT/AXCfwhJEc/+TTA9KjJnd1FZA2h0XbnqH8ICYYyBF9v0tBf53pBxVoHQSapMOg1bFWxyU2NluPJdy7/sfAIq5dk/F36KPB8uFfbTl/aoh3hczTEyCodASj/qvM0o81byyxjncvABXIF5G5QhXhxz98Nx+3lo/6rQaTB0NUuOU7A72+wS9gdNK0jDJxVDJAYOPpttuDeSRs/j6BY4aKGJLsHj2NBzHRiCUDG4PRym92+k8Xk8/NAG+gmQR/jZsA4jAYFy3G6eug6WqI1wglY6s2QQIjYLYOttyB8ErINaGDNYEVD2kjg
DKIM-Signature: a=rsa-sha256; bh=7CLOBYbNi1X6W8t+viisTSOz4Vl/AACkz0yRw2Y7JRU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795770140; v=1;
 b=mNMbRpsj9J3U8fieD55axxz3YD74v7f+H91p08Nj5uMeigZRI5pK1JDkckS3MSaj54ZMlx4j
 HqazIVs9D7KKHU35RnxNGDQuKHPDvD69I0uvj+4iouXXTnH/cT4jNin6dc4vFgx8asD7Ss8EZXl
 aPhz299onHj6Rvwm0s1D9ZqlsnO4jMRQ14kSOpG1su/7/GTNPllXz8C7PKvpzslH02kU+BRbij+
 Z4exVkETWzIB9xUvlDwCN9itRScTNjHefTbIt0xzdlWeQcF34R4R7R7mpWehK6aMB7iJNne/HdT
 7eB5VlxfxaFoHNKbRagpVB+eeVYE9njsDn5UXTCY2c8Vg==

Hi Michał,

thanks for the review. I've addressed your comments in v3
followed by a v4 fixing some problems it introduced.

Link to v4: https://lore.kernel.org/all/20261127084910.3355833-1-filip.golas@3mdeb.com/

Thanks,
Filip
