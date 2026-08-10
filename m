Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB60E3A75BD
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786350929; cv=none; b=L+2n2VwD5dfpZWw5ukGPiWS3AK74lxyDcLadj1p37FiHjU/XUta0cq/+wFRpw/nqpohxkUgDPFABPFhwJMlkUCfPUp7HDdjHPSuGH4LjimeIf7CyCWa33i0heQkOVw5FJcYfkGmVeXecYuboLB4clA7zRIeOOoFWNU+lhOdz8lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786350929; c=relaxed/simple;
	bh=UHHCbcurusZy4Y523Q7T4669vLhobI+gpJ2has1/PiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ShW2QXLWV8vmPekuUjl/8GwBlYXTn4E5mAf9j1mPhcty+DJ8sNQIM3WbuxrbbynpRrTdRPHsuok8lzNWy1FNAWCkMF27gWPfl90hcPnVoeD6kdJLv0Z8w4JkzhFg5kJAHwc+7UkX4g9Ohnc7MOXrL3T2SHKGXYetF1+yw1yGu70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBXDJ4wJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBXDJ4wJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1674418a91.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 01:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786350927; x=1786955727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGBM92czm9YEwobDEuNTbqIYrxD+/Bct4RxHXWVwj0s=;
        b=PBXDJ4wJXkQAPO7cw9JbV3jJUlHzZFVQM8XaxO3ffNNtWF4ndbpZoxVelRKRMV7p5X
         Cm48Vaj17iqnngOzcGhqyudoupRWOKpQt9ir8qiN1xCSxTh/g4jOwHB/jA6WFXeWQrP5
         cP3RIxhtnn1V6c+kzyuL3Nptq1AFjRweo9qUHtfp1f0AOK+vtcgjBuoLNb6FDoieK4s1
         AuYvaKt30QE1rOtSOcvAM+VJCy4EMzpwGuh3PSs/jx9tDfNaLmp/WCEfLjRT18p5ImPL
         syJe2mPohSwUqeKtrDU2N4uIzqkCs4XQOkyxpGPyKCjmGOHjFzo6fH1w/N5SEuX0FgM4
         787g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786350927; x=1786955727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGBM92czm9YEwobDEuNTbqIYrxD+/Bct4RxHXWVwj0s=;
        b=gm2MNL3K1w7rjGbgSciB2u8LulkIKypGHCu+bf0D2mjiqzlbuNgtwhHCwtP6Gk6CGZ
         PF8NEkjk90Y1cwazn8HZK9j+RfHUQyfOe1BL1M12q69hjeYLc7j4im5fwvIiaq2vVtRZ
         zq5kGGS2+h8iOY7OjIw6p9QXR4uvrDlNqZRt0Vbkq3CHgC5hA2DYXHgGKT5iUmJQTOoW
         plWDoycxywrTKaosyUf2qTHxoen499jxrlEg1T7K+6T+R8xMJ0TamxBU8ExaRCH/jraz
         Ln5KaIO9zBa+V919NrQmO3uoX5REMQTulEeU/Og0CNCLEWzd50LbvWVKs3rilbXzTXE4
         kkyg==
X-Gm-Message-State: AOJu0YyQxBd4+tvqKH71TdxIqx0vCEoC4ev6Z/3XVyUjwP1O7I42MZ5z
	ySWfCe4Xs4SQrHyVSItPyKvcrqXTwcdQX4DR4axGDBzoHtuk9oNjvd2XP0Njf7Ka4Qo=
X-Gm-Gg: AR+sD125jm+SH3/nMGZlAjXbrOJS+7B24COZDbKC0VoXf4hBRzvb2w7YjRgCQmfcEC7
	5i5bF9A5EZG+PGqYZc6+ZuedljR00EvZk7tLNKyExZgXB+YIEYazohNmJGVs7GeVZAqgak83K0X
	w7gXHrHMRZAUaIehZjwYj+RaLmOL/xlFKC/eglLUYaDGok5BO3hkd0eCCaiCfeacxtVSTvUoVQW
	YCkD7vczpgWqnAD2VilrWvMOLL8LetR09iggjsZbfJfGeRpJwR2oVberBr05+OC+y343MLW+ZHE
	FuDasG91KSMudWWAUFV+oVFc8QpeQd1eyW3YPntHTjr8X9nQKMsKF7m5u3PElBb0zZEIj1bPtaT
	ZHtk0jTJCpUT74UmXWtsSoKX328VQXdn2e4VWFN5c4lUsZCUopeP35V+gkFedkWQ6j/brgB6dAf
	QqLad+ew2DGjrrm3GRb7Z5fICXfp37rlAJKu8iRgiisZXOLZtmeAkNdlnt6xfkBxm0bxnjgEkSZ
	Q9gzQZLw7dtHsTc2qv+
X-Received: by 2002:a17:90b:538f:b0:38f:9674:ef61 with SMTP id 98e67ed59e1d1-3903c584291mr41497369a91.13.1786350926920;
        Mon, 10 Aug 2026 01:35:26 -0700 (PDT)
Received: from sahan-i3-12100 (121-45-161-118.tpgi.com.au. [121.45.161.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b30d465csm6156520a91.2.2026.08.10.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 01:35:26 -0700 (PDT)
From: Sahan Nissanka <adee.sahan@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Sahan Nissanka <adee.sahan@gmail.com>,
	dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] platform/x86: int3472: Add TPS68470 board data for Dell 7320 Detachable
Date: Mon, 10 Aug 2026 18:32:54 +1000
Message-ID: <20260810083425.9797-1-adee.sahan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260809042540.15849-2-adee.sahan@gmail.com>
References: <20260809042540.15849-1-adee.sahan@gmail.com> <20260809042540.15849-2-adee.sahan@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please do not apply this patch. The GPIO mapping in it is wrong, and I would
rather say so than have it land.

Charles Drolet, who has the same machine, reported against my out-of-tree
repository [1] that the front sensor probes with no pin assignment at all.
That is why a wrong mapping is invisible here: the real reset line sits
released by default, so the camera comes up either way. Two specifics.

There is no powerdown pin. This part needs no hardware to confirm - ov5675.c
requests only "reset", via devm_gpiod_get_optional(dev, "reset", ...), and no
"powerdown" con_id exists anywhere in that driver. So

	GPIO_LOOKUP("tps68470-gpio", 4, "powerdown", GPIO_ACTIVE_LOW),

is never looked up. It is dead code, and my belief that the pin was needed was
unfounded.

The reset is on tps68470-gpio 5, not 3. Charles held the line with gpioset
against a build with no pin assignment, so nothing else had claimed it, and
reloaded the module: held low the sensor fails to identify with -EIO, released
it identifies correctly. That is consistent with an active-low reset on line
5. I have not reproduced this myself yet.

I should also correct how I arrived at 3 and 4. I took them from the Dell 7212
and 5290 board data as prior art, and treated "the camera works" as
confirmation. It is not. It confirms the sensor runs; it says nothing about
whether the mapping describes this board.

The rail mapping may need revisiting too. Charles has avdd on AUX1 at 2.8 V
where this patch has it on VSIO at 1.8 V, and the part wants roughly 2.8 V
analogue. Both configurations work, which suggests these rails may serve as
enables for regulators further down the line rather than as the supplies
themselves. I would rather resolve that than guess again.

The machine this work was done on was a loan and has gone back. A second 7320
Detachable arrives in the next few days, and I will verify the mapping on it
before sending a v2 - including checking whether the board data generalises
across units or merely described the one I had.

Patches 2/3 and 3/3 are not affected by any of this. Charles independently
arrived at the same ipu-bridge entry and the same ACPI id addition.

My thanks to Charles for finding this and for testing it properly.

[1] https://github.com/githomeserver/latitude-7320-camera/issues/1

--
Sahan Nissanka
