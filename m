Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3832BE043
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880434; cv=none; b=CXLuPA4jdfanDmrLDdI7qpaugXJKncB1X7vpU5nlMeioaD42/t1V0qgckP1xY8NWO5UTDaKeREFmrd+ht5fJf4UV+awT9qgWdVwBNtVdeHehpCz3U51UVLSF00yDyBOaYHnYSMusi4LwwdpgVqi6h7Pymg+SSKbrX9PjsLKHnis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880434; c=relaxed/simple;
	bh=BEmeVYYIt531yB9sjEO4wda5zrTDvA0/l8rj0W/Kp/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLLiTokAu1Q884H7lGJ2K/VRrx/GHfODp0R3XtVltdeFRNOkU8gpXY/hGcpV36fUWoy3P0NOwfWNY6PnKCGJpgI8T2Kw5lut0g/yayXFGrwMomb++/tlaJr0OWwg5CmcmNAa2i0H8QjeLPhnB4PzlzuX7WwkdOZXlxJZwfmaNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHoMraAO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHoMraAO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so5065147b3a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Dec 2025 02:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765880432; x=1766485232; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BEmeVYYIt531yB9sjEO4wda5zrTDvA0/l8rj0W/Kp/0=;
        b=kHoMraAOkrTev+ccD528K/9Dnf1vTv2VmIt5uWY3Ihgl9dnCQtC1vPMQYfBcBNaoRG
         wfi2UcYPEFvlgkJjc5UhA/LebBQ44kP8rlZvOVNgZHwf9Uj6y92UGa5igFwDuvNPC+Y3
         WI8L3RDLJ6iQLgWkO4O5LUkT5ijkoMrTCOQ4sQ+sjFDLP0mVmR5VmiUNLS3PRLKIUFI9
         +ZDWpEpcy0NiDv6ucmmIAQzM4/p+wn9aVp6KE/gKKWTqKJols6DoTX0GtUjYwjfNlHVF
         DoWTudM+0SmRO5Ro/x97wKuc+uOfsWD7RhK/QnFAWiHC3pY8s4Lm0YJ9iuqtZ7TB/aOZ
         EO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880432; x=1766485232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEmeVYYIt531yB9sjEO4wda5zrTDvA0/l8rj0W/Kp/0=;
        b=cdBT3XHSt1UEEaFv2RcS3M/UtW/W69Z6eR3/Sbws6LCUkBJ0NgbBaTujBK0IfOAtDj
         qrOcrYbhM0qJBu3Zb8zeqwaKJxJfdnpvlEJzYyX3zyb5DCe791eNGTnWeNA2X8SPl01X
         cq+USe+bVZsBaumQcZMlOIETq/vTl72YFTiSS+9Meqt43aE9mjcbwo9g1HxPnhRShgvc
         b8g4TUJ5mta1wRfdtdGfbgU4RPR5B4W75CYzbRTEMGE7+V0lzNn6RbCm+e0aMlIDhP7t
         JdJ0cjrob6tS2564HuVSwOQ960u46jcZGhohNVvmuf/EpO/TIJNElEGt3YetDtgvz90e
         VKGA==
X-Forwarded-Encrypted: i=1; AJvYcCVY1ZVSX8m2TQj/ipcVzxMA+4abRWyz4MQtecSfG52yWlfXMHLX3FpSC0XYaJgWABk8cfvNobgVjVF3NbXQOsMR/nF+@vger.kernel.org
X-Gm-Message-State: AOJu0YzPFs+EoPwVEvmcH4Ik3e6pZNubQWmm8QFGzyae+QvACjnd6agF
	ISNJMWKQ3izrNHST9Vo1JlqsqxKPpR/gmUMkUBr9mgnCuGsK4uFjph4TACrjiQt2
X-Gm-Gg: AY/fxX5spiEQ3DBNgNyXeqFBxpw6Zzp1gaC7fXVaewPKCDlAMHKkha+55Xa+ioHW751
	46aviG+tRoKaBhKmcGO7nDOoWOxOL/1iK1vroSJzixRLZh/9enRCkbsaPsa+lDkigM/gwhL6kF/
	Qw3PS2TllBQBPPRIY3vi9C1gtIxSRHXNKnd3Px4MajJwB1lE4cHKoYYhnPgw33GOPEZy3x5yUco
	p6a+zu+QrlAFfWhtCCrw9Qm5RsNab7NjC9MARdDSSsAC1Ci2z+sEZ7e18MF1IHDPK8Q6YmJF4yX
	FbqCL9vhz2c1qYtB+fZteNmh/rpdzIavKF1gl9+zrHdhYNLJaw31pDu5BDfxhE9MT6V4Tir+IIV
	3XzHMFjqc3jjnNUAE+978WHUnU6Yz8FEYyt/ORcpIG79Qb8RRrnTdor9Hez6GTX42622GK9lzUZ
	nbG5IJZX36wHmWk1eaiuZj02U/7VO23Q==
X-Google-Smtp-Source: AGHT+IH4odnvFRVnfVHIXJ0dxSTPX2H4aqjdD+4OmBwymdIXvKqL3rBkgog82uqCKCdNr5MSrxrdtw==
X-Received: by 2002:a05:6a00:6ca1:b0:7a2:6b48:5359 with SMTP id d2e1a72fcca58-7f6679368f6mr14105309b3a.24.1765880431870;
        Tue, 16 Dec 2025 02:20:31 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:bd87:a308:8427:d21d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c566b3e3sm15106964b3a.66.2025.12.16.02.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 02:20:31 -0800 (PST)
Date: Tue, 16 Dec 2025 15:50:27 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: fix platform profile values for
 Omen 16-wf1xxx
Message-ID: <aUEty81BD-FaT0Mj@archlinux>
References: <20251213185107.179130-1-krishna.chomal108@gmail.com>
 <6ae912bf-ceb9-b8cf-5e9b-831c91135a59@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ae912bf-ceb9-b8cf-5e9b-831c91135a59@linux.intel.com>

Hi Ilpo,

On Mon, Dec 15, 2025 at 04:25:17PM +0200, Ilpo Järvinen wrote:
>Thank you for the patch but it looks this approach to add mappings using
>if()s to handle variations should be replaced with something better.

Thank you for the feedback. I agree that stacking if/else statements for
board variations is not a scalable idea.

For V2, I plan to refactor this driver to use DMI system ID table's
driver_data field to handle the profile mapping (at least for
victus_s_thermal_profile_boards in this patch).

The implementation will introduce a `struct thermal_profile_params` to
hold the specific thermal values (Performance/Balanced/Low-Power). Then
I can convert victus_s_thermal_profile_boards from a simple string
array to a `struct dmi_system_id[]` array, where each entry maps a DMI
Board Name to its specific thermal_profile_params via driver_data.

Then platform_profile_victus_s_set_ec can simply retrieve the correct
parameters via dmi_first_match(), removing the need for nested if()s.

I feel this restructuring makes the code much cleaner and makes the
thermal profile choice for new boards explicit. Does this plan look like
the right direction for V2?
