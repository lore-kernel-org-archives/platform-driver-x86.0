Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BCC481FA5
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785329088; cv=pass; b=hxCaigZgWot4BonH9Ilz/jtKo2M3FM4gXYAMwDJiiUgdtpI0ReZgKymx4BRN2biq2OYCJiEu+iORivLKbRA66fYQM6outaT7d6q28/5KVolIuLO4NIPLfQlXPbga3Rgv7RyHpDBw8Z4EyUpsgkVCiTJrcqAk07fOjUyJswofLbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785329088; c=relaxed/simple;
	bh=FZDjz/F55Ie1M0v56bfpoehgRTLCH7hYAH2EKNVwZnY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OdLq+tQ/nSDvf1FoSKvC1yHPHkij5eb+fuQtQ2vRcMlqrpP6niYkr/7h1fmBRA88RNw7zOFenv5AyKfsl+4f+yobfkCeErzrMbH14NavI1JtMO/TF6xyw2jfEarXMsmWoLphU4T0NX+N5Smw7ZBihNyQXmJkHDcuIdWQTjqmUGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHmKnWhX; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHmKnWhX"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a2dcede83so1161123b3a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 05:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785329079; cv=none;
        d=google.com; s=arc-20260327;
        b=ZfYdbaSpGbbrU6HQehzg5yb/rnPa9Onz4GE2bVGHuo8j2Q85aasEaHx2R9V3Yf8ZIR
         UX7O33Twy18XxNGTus3kmsu9J5jIjrGGyD69PoZ6TRmBeyG8Eo3F/HCDt4ScAjcZyXI4
         9wY16Mv4262hjZm7DqKW1ujK3n8lfIcQmrSGulf+o/out0QojTFmChIK2ZPN7Efik3Qj
         tX0NrteMSg7DWOtSCOUCAjYmnfOwGhUXQXEtmMxRoJ971TuMQi3T+/lTKNA6S5UA1/4J
         Y+Zftey/tK7M0GsXTasAiJWboo7v6cEuFEDZDak9YE1oera6pxixA9kZ5jL9VHa0l15q
         tlTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=FZDjz/F55Ie1M0v56bfpoehgRTLCH7hYAH2EKNVwZnY=;
        fh=psi0RrntqxHq2twcnOKcaLMMfoW+4wGJrSrzaYBj0Rs=;
        b=MSiCQ5S92SjrfQl4+gUaYhAinDxSzlcFFCd5VYb8TF84BjwUmxRVdHbP26lJVJyTOv
         shlzHmWtZH2EsYeHX/lc5qfpcFxle7nhz2cdM/CmwZV1A7sUFCFYXO4ToX9y3Lauty02
         aRuJ/PRJjUX1pc8r87Qp3VZYLcsPsR1eNKfjG/xqq1UGy8FBd+Bv13ttfs5LZMmlVHlH
         dK9ZQs/iqGc2jCruxvIvHzDKQV28PJ5AoU4CQTHY+LScgH6bgG8rlQAnccxhHve6lFdB
         T35KQ6VsDbGSMZdz88DVTVLqh2Colmsnabiy9s2FeAQNIYt6N2dDFJ5Gat4QNzARPBWj
         xFlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785329079; x=1785933879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZDjz/F55Ie1M0v56bfpoehgRTLCH7hYAH2EKNVwZnY=;
        b=QHmKnWhXNEhPoaM9N6RX699JMx1ztHLbmma3zlB0OwLWJVf3Q1Oj1FT6eMl7U4aBH/
         uTU8rWN2WB32x3J4IMbmjNUBs3WlIMzgU0ZAPAWpI5van/LikKsEMUj6hg83udsrK9VN
         qo/zCRzOfdxzADXKSEkGo0QXGeS562JrUq0SSnmpdfyfAiPkHBisbp/HXgw80T+MNL+x
         VrhKbVEymuP8F0w/1uJymYFi+nv8BUYGvLPSA8vd0yRvzm/qMxM+o0Q8tk/nqYdZZO08
         lDNr1vAuYeXuxD/P/CRn36vJpQCDGtT5zw+dRqF8HVPGsQhagYjULEZeiKEhqW4ZBgpC
         vE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785329079; x=1785933879;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FZDjz/F55Ie1M0v56bfpoehgRTLCH7hYAH2EKNVwZnY=;
        b=XzOQR+hXPYMT5OXq+nZ/XBAbesH7krKRGkBtsi4Tw8mPoJkQOoz+j4MBuK45ABafIr
         yMvUtQfmnt+D8pRhSxXVLM22utibr0mebvvXjn3lUzCqc+Y+8PwP7j9neyvvREULTD0B
         ONw++7Hb6YkZL47tLTuw0daUeb4F94H/2ZNleaWTXhMRPz1JLoBo7QYRHe8i6reS2rPN
         BJkt7m64EseRQCtLWYKuf+/2ebT49QRHGoeqwCt0zFHzKE2bQE65hPw0/CobYwauEFw0
         cbuUJHfFAvvLxdD0SZcDKtQzeshHIq+INVrBx2A4T6HfW3CyJs99Jwc/0TEwQY48xM9i
         KfsA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/D68hryil/71iemmChsH+F4r6/aDH84B9hgCUBE89/VGLOpVTSrrCd3G2+Qgcu0cn21khHVuk+v6x+NvLuKXuEiTN@vger.kernel.org
X-Gm-Message-State: AOJu0YxZdJuYaFEKxZyog+qdgIiN9psbtwaJLp6TjBo5ZOKjd8qV4C+3
	FgeR4538FHe6yvzjJzAcOZLH1kX6bnbrcMOoRGWCBxA4GVBe89ddCP+IkvB/nzSgdUbfp2kDNxh
	36u06upVzgT9qOHiaMVBLwZ4H3QHcE1g=
X-Gm-Gg: AR+sD11Wy6HqlOQfJxlOEnN8n7kbHwnfuUueysx0dHyNt6bPhBru71giyJeSZ759Gcx
	1s/AY07stHplF8Xd5lOCOI1AtHzCcv2rmsxm+fpbYA8O3fnEIaqKAuTo1orHlk4inN7OQp/oW/w
	6CnM+3grW/VWnu5ijDe6S9aqCbCudtYMJHS552KxUzdX4BQUtIpEXHOuedsUXnrYSiHkkGMeAwX
	pNdZJsWs4+jbdK7BVrCO6nE2ES7p0KMG2xtdu25DOQ+sOltUpAZrCxQlIKsiXPPAO545p99xxGn
	R+MQsoCrDgpCBykwUTgUnWa1WkF3R+ILVJtSeo5yFbE=
X-Received: by 2002:a05:6a00:35c4:b0:845:e432:e93 with SMTP id
 d2e1a72fcca58-84e9331e5eamr7041497b3a.48.1785329079445; Wed, 29 Jul 2026
 05:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pengyu Ma <mapengyu@gmail.com>
Date: Wed, 29 Jul 2026 20:44:27 +0800
X-Gm-Features: AUfX_mxA4etvlqMH1AkG8JNXFGenrt_C92n1wg3pKM4Nj8bFnD6JmwEU7iPTaME
Message-ID: <CALSz7m1iW_hZbkL56+OMLXm5wE2s+ytxT_oGEU+DHyvYEMx8jQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ALSA: hda/realtek: enable AW88399 on Lenovo Legion Pro
To: marco_giunta@outlook.it
Cc: broonie@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	imitoy@imitoy.top, lenb@kernel.org, lgirdwood@gmail.com, 
	linux-acpi@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linux-sound@vger.kernel.org, munzirtaha@gmail.com, nadim@symbolic.software, 
	perex@perex.cz, platform-driver-x86@vger.kernel.org, rafael@kernel.org, 
	tiwai@suse.com, wangweidong.a@awinic.com, yakov.till@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marco,

This breaks 4-channel playback on SSID 17aa:3906 (Y9000P) and
bugzilla 218329#c31 reports silent woofers on 17aa:3928.

override_conn_list(0x17, {0x02}) forces both speaker pins (0x14
tweeters, 0x17 woofers) onto DAC 0x02. For a 4-ch stream the parser
needs a second DAC, grabs DAC 0x03 from headphone pin (0x21), and
assigns FL/FR to the higher-priority headphone (muted). Result:
FL/FR lost, RL/RR played on all speakers.

Pin 0x17's hardware default conn list {0x02, 0x03*, 0x06, 0x08}
selects DAC 0x03* which has full volume control. Without the override
the routing is correct: FL/FR =E2=86=92 DAC 0x02 (tweeters), RL/RR =E2=86=
=92 DAC 0x03
(woofers).

Does this affect other 4 SSIDs (3906/3927/3938/3939)?
Please drop the override_conn_list if it is the same on these 4 SSIDs.

Pin 0x1d is already 0x40600001 ([N/A]) in hardware defaults on both
3906 and 3928. The override is redundant.

Aaron
