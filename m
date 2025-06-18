Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871B522F
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750226344; cv=none; b=fK5gzFSNCNoRp/5b6tlw7gZmMtx3cHuWwG4oU3FOvD9k7utque8h97GCpQkJab3DdCxsd41JRt6wE9sAMnTqGAVmYzeCS/VLV2JbtjlTBkCevr8LOfV2PDhZRUJTkgr25vb+mta2MGFESKybtGjhghpb1Q19+BmoGnoYXob4PP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750226344; c=relaxed/simple;
	bh=ex65vIqPqBITzJT3aqZfDTrMbz7sW8lcoZf3Em/nNrg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=d1jDPboywQeMMlH7THIrnvI8YUBDkVv6Zcyoz0MTH/uY0kG2Df6Ue0TVryO42Kwg0DU3EkneB0xPhqIMYXreVKrEtC+2vjgfKH4Ncsn0rjmaeub8H/aZ2kpi0jzOY94frjjwrps7dEafjOBWp1BzC7HOxu/p16BFckbQBUME188=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=grEn5t7t; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="grEn5t7t"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606a269d440so1351898a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jun 2025 22:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750226340; x=1750831140; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4EYko/Foq2UHISlS2/Iq3bEl239L+KiMoxq1G+MXAw=;
        b=grEn5t7tEHvjflRPB+AUS+0tak1pT0c9T8bH/Dl0EKeoN/pwJhwAlIsUYPqba+wN2F
         G7W/w2dY6iEDdcFKtFA0R1vV0IF7Hb1oar2dvsifiXVpj6aIC8Gah/p2sbUGNWOgdNYq
         USIxZVZQUKhq4llea35QzeY8I61vnz17PAGy2n3JjQ5oRRglj0DiKUgBfP4eiDb2GYTc
         Bm3mRA1OJg+uDCvUAK61mohxPe+mqRj/cIYiMrIaekWft2yMsHvBqYW87eTZFRYJHSbz
         JuLcN5AUSjtCmHd3r9oLFCElJXnLt4mKuYdXpwGp93PtJWdt/pTGPmnSWDpFYbpGatX5
         UPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750226340; x=1750831140;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t4EYko/Foq2UHISlS2/Iq3bEl239L+KiMoxq1G+MXAw=;
        b=npbvhnEnT/Qj8Yoky7qk/55kYXGiy+UDhlYdbTDpDjqnbZxVEbnf21x9weDVdml7Pm
         Plips1A0pt1tcbUKUNz7rckh3/lNxDc4ZYMX/ZD+Ewd1FlKRiLpWadxKAnwSkCsAg3jl
         O9BRPQFjm3L4iYT90VUCYGVFKwNqDv3RtCG4pk6le3OSTfVwlZDCNI6v0801K9L+rXFB
         dGZsPJ/AvEgu8zJVvYURJXqBwDODG7haH1eUYC9gkYFkSF8IcgBu3uGdpMoTd08f6UpI
         fwX/qZq+ZXnb0QwyhK1abzHUa3NsAM8iPVH3FpaBh4s2bRccnYd2wS/LNQeM61TyLcol
         qENA==
X-Gm-Message-State: AOJu0YyABW4wzJsfGZ4bNu7D3xdrqLwV9DJIc0hoQ+nw3eaK4f2n2Zbb
	pHeClz1P4l9zW8VM+Q8XKiLbzkAMEaO1tK5Oh2x+lTnepz3f7b/ASXF6uTcrgZY8
X-Gm-Gg: ASbGnctUJsSOAM6wfKlNfWa5XH5UMWNxqfmOh8DCe9Dtsa1WlvWWo6fj82wYa1PHJz8
	dPvb7giTDOQ6Q79YTBKHqHHEIf54FkDjQ11rvL/8w/DK9cxjXgZvCeLTI69d1kJ9sB1w77MWCVW
	fu7TtcSW/Fa7WJcjj9fpkAbhrvYNBfxro4gZnC5JqFakn5OnH+Z4Hjd688uSanSX/Z7R2zJ4+RH
	tg40sFXoTYrgvMfZ/is1nMCmR/VSfPLxoQCk8rh7AYk0wsN4U+cQiDBOFZmSY8OHTsFdmgbSbHZ
	DYemyCD2QZfBUaMEATXSPHV31MwYJhT4Wt0T9H07wQyk832wVV22ZymGofx7ydjw5UVpeLLKigi
	oNwfeCLr8L3zK
X-Google-Smtp-Source: AGHT+IEFZ1ywlLXDr48SJzla9wSM55ZiQKdt+pytlMry8dSMEXupXyynyfgDbvlA4W03WaL0D+mZWw==
X-Received: by 2002:a17:906:7309:b0:adb:1331:a501 with SMTP id a640c23a62f3a-adfad344a26mr492153366b.4.1750226340302;
        Tue, 17 Jun 2025 22:59:00 -0700 (PDT)
Received: from [100.83.87.62] (ppp079167001132.access.hol.gr. [79.167.1.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88ff5d3sm1004225466b.101.2025.06.17.22.58.59
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 22:58:59 -0700 (PDT)
Message-ID: <2eda8f9b-9421-4068-87ae-ccfd834649bc@gmail.com>
Date: Wed, 18 Jun 2025 08:58:57 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: platform-driver-x86@vger.kernel.org
Content-Language: en-US, ro
From: Andrei Tescula <atescula@gmail.com>
Subject: lenovo_wmi_hotkey_utilities probe failure regression on IdeaPad 5 Pro
 14ACN6 (6.15.x)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hardware: Lenovo IdeaPad 5 Pro 14ACN6 (82L7)
BIOS: GECN39WW(V1.23) 10/30/2024

Regression:
- Working: 6.14.10-arch1-1 and earlier
- Broken: 6.15.x
- Also working: linux-lts

Error message:
lenovo_wmi_hotkey_utilities CE6C0974-0407-4F50-88BA-4FC3B6559AD8: probe 
with driver lenovo_wmi_hotkey_utilities failed with error -5

Impact:
- Error message appears in dmesg/journalctl
- Functionality not affected (hotkeys work via ideapad_laptop driver)
- Purely cosmetic but indicates improper driver probing

Additional info:
- ideapad_laptop module loaded and working correctly
- All hotkeys (Fn+F1-F12) function properly
- WMI GUID CE6C0974-0407-4F50-88BA-4FC3B6559AD8 probe fails with -EIO


