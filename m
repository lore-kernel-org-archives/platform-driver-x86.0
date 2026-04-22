Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30508189F43
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2026 00:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776817068; cv=none; b=XzgtiFAAdk0G3PYEeRBDUNgIaEiET0pL7yLQIHGNp23Xb9WwqwPtX3lPoM45NsLH1v7WqdmaX1gbc8UVzhb8NUbX4fSgL4rn2L0OhfJWDc8cZ0jsBBShpysE2EbvrqyGKMrQjgJ6oB4eAU5Bac/TwoCfT+kUMWAy8tuoDHtArV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776817068; c=relaxed/simple;
	bh=nnXw8QZislCT2G5pnomxZOomHC9rAEa9AhUhFGY0s0g=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qWLtuiizWNMdkRd6yBwkm8iDpnXBDvJRtr5xaJReevn3iG0wb3KFj10+lySf0I2VVvocoP+rssx+lVpabjlbq5/Q9u167iVP70AmQz9OwRxc3TbJ2V+RWk9m/yvC8S8l3Fesc+mvPVC4ipJpTt5PihoT4zi76Sp2p/8Rua3rgAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNYByaMw; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNYByaMw"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a15ebb3abbso71017046d6.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2026 17:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776817066; x=1777421866; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7j1SGizETjJbUCJ+cSmIPq+9pLZFWcm1bZkZC1Nmmeo=;
        b=aNYByaMwHuy1x2hPNqGc5wPC1DUJAqTStL1jgKVf+J7xqsuBko+/m6G3CR3KTdS+QD
         BEpUz9y/Kq7HLTxjUHodrJQP+OC/m3hCfiBD0VJ7/Lvd3cEPPHQeI+rBdhFJkHNHuw5t
         iNoaH0ZfjcgEQsRK59oXY7F29pQFN0fNrEZfN8aDyu99Cqhh6rO35o/tyomHRJ7ut5hW
         xKiy0M3r+CAqG4U5j6rCOCIPBykT01KR9S0Y2Oz7fSJl0L9NQ+Dza2A/+4px/mejrrf1
         OLigmJRi5zRecKQ9P9poBfUw45qej8ZnPzpibpaVV0xVY5p+xam5vT5+LkwEnZF6ZNQS
         kcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776817066; x=1777421866;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7j1SGizETjJbUCJ+cSmIPq+9pLZFWcm1bZkZC1Nmmeo=;
        b=Qnh0xEpeVEfnDATXBQl9PZKh5c32hg+nd/B+VVqdQrcSTXdUY/nE6oGYHOHsLMbMnd
         bpyQgaBNQwo19HtxqA8myI+L/AefRdXhpbvxK5TSNXlYhSLoERlmLVluemMRpmZGliSh
         vO75yf/dEPgqdPPnBctwBMEnO4LcIhagvNqfvRLgqfriZ+cDLvZOnGTqXBwlD+NDZmmB
         boFZ1PAN+TlYwVYhMJAcl/ZdtLrNTwhzeLSv7YmALic6CFYczhaX1yyCr97s/BNFbDwZ
         szaVwNbUZyl4e1u/aqjVIaZ0wsqhpYKuyC1SFQjuW7De+gp1LdVDuBS6x5H/0Y7IoFM3
         KiZw==
X-Gm-Message-State: AOJu0YzEopzRSU2XccVtKNeHJsR24MAubo5D26WVKxHAgko1oE6aMVrL
	tZX91g15prBRNiwfr4kP6LKK7KfhcGZrt8JaLJi54bgMDnhPt8f9bu/1fZSRTJ3M6Po=
X-Gm-Gg: AeBDievWwZ3udBKPIfa+QgvEVd+eEP3NiQh2bxumuRwtRwVQ3kYjO9Gs4JlcBlECyN0
	kMyoRlNmCVqGpGJhv93tEMq1xpDv1WM2mAWRG8UsHIVkRgdVOG0GtCEj6dJKXuKro+k44cH1QmX
	3mLI1ga/EAOAK0d4kmaXLcxVacTyvSneoG+8MzKaRAnLmB+Y3UzcZ11H0jy9ZwAVhdE2dPMHFJL
	Q/7NBbEnCONWNNT50z+PMlZz4pvtadR7WPwmxZK7RTpKRYyaYogPyilifLaI6yDfhl7v+cGWt6s
	BW0dOcATB/PCJv5cmyF9FeYpZitnRpcdXFduIDTSZSUkhimXGoyiMx/08vxuD2GBX+ovjWQLuhb
	ELvGZ84+QS1+e6Xl8JlZ5zqgCJXCFTh/k2zUmjvt8GboLYBlLam71Wwe76jh/XWtnmYJzTgvmZ1
	KsR+ofgV/BFeNhJNyZViQEya2f/Uyd3bNGXV2SxWKdPjgQdvOcKHzBHbjdoyOp7UEe3YnAxd0Y8
	EaPZLZ3G6kxojuFQl0=
X-Received: by 2002:a05:6214:3d0e:b0:8a1:34df:bbe3 with SMTP id 6a1803df08f44-8b0280cdd65mr361866956d6.28.1776817065804;
        Tue, 21 Apr 2026 17:17:45 -0700 (PDT)
Received: from ?IPV6:2601:154:8300:ee0:1853:44ea:a4d0:a8a5? ([2601:154:8300:ee0:1853:44ea:a4d0:a8a5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae5eaf1sm118890706d6.30.2026.04.21.17.17.44
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 17:17:44 -0700 (PDT)
Message-ID: <f3761c58-08bd-4730-baa9-b6f6cb716271@gmail.com>
Date: Tue, 21 Apr 2026 20:17:44 -0400
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
From: Benjamin Young <benj.n.yng@gmail.com>
Subject: HP_WMI Board Mismatch
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Omen board 8D41 is improperly placed in the Victus S area. It needs to 
be removed from there and added to the Omen whitelist. When I rebuilt 
it, I removed it from the Victus area completely and added it to the 
Omen whitelist and it worked. Thanks!

