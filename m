Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0592EDD62
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391486; cv=none; b=BH/CQnYq3r1jgwHY6AEtUhda/Q3O7j5xMu9N0ZPevR1FjGN7zQ28Ye9zDVkkr6rQs6g0sLxUAlBVNMI127yIcPuu7dWFICFA4GZHTCnGTEuF0pH2fizaXxBSYEXHI5OJ7N0y8LL3dbqZ+g80JlaQXoaj+fSDDoZPiyxovm9tLzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391486; c=relaxed/simple;
	bh=UGDjerQhB4cJl2kHEjbphreT7hEHKKPY6+LIM6votyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=livvJSqeS558Gcw5hVsMQNuz+ol+KLphgidctHkhcAPSU1c/oXYDg9DTiLrK3I6KfEg8VSqc+8ydbfMxe2RX2qEEO73/vYJ6sxBRWFBTDlYYWzpzoxhm47JAUBFSrGKQr0UNb1Kjo9jWk4gbTRBzxlfhfdt2rrXLzphSik1PCH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZt6UBJf; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZt6UBJf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-362e30526f8so2296186a91.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2026 08:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777391485; x=1777996285; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6dJgKbTYxQ5drlPXxiAxtJ5UWmR5TCfv/76Sli0z+WU=;
        b=JZt6UBJfXjxVZ1IqpQONSYxzo6pk1cUy9ua2RdXlx0macWXfjO0M0EtrLMlkEd4jry
         ZuwWg5yUF0RGy9olIL1SbAnqhx7u2SsLqfFcME1IDX26/D/nMGtmgJxd1jkpyiTQNWZB
         p8QeO9K8URruXLkGMtj8piePYi5azviCsz8fx66BvLjar8kCuETKlWZNRQ69nnjCxC3q
         5Jk4yhlKre65lHWkMiIKhDMUWjCYhlZxIZN6Cv/ViASiVim6+IzWqiv4QlBSDtIH08I1
         gazYLHSwP45O8yWjWFZ4qDAYO5DV+ew1u3FQYssfNAfE090YY6S4DbgoOZRnhZivbX8u
         Wh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777391485; x=1777996285;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dJgKbTYxQ5drlPXxiAxtJ5UWmR5TCfv/76Sli0z+WU=;
        b=Pku8wXkvnOiiSH2EPk977wKOaGUa59Vzz1ctaw7JZ0NdErrMqseKDr1J55bhJR7j9S
         LoDWOSoHMHx/wWelLuJc6xNv3cmWmrkZ617fIUmyhz+mt+u+6DDAiXq4XP4zgmh6C4/b
         4p5VCLagrCj93KTlo4IVEVxTSryy7afPdS46OwfRBLEd1M7QZwa5qL36MC+ZrsSVr6Qw
         qEJspH12m//471/XFKxE5Skzb10gRdW10TJsF2QEjrsNUOpSG0r0IhR8QXPuelQtq2C9
         pJDWldcXspTKAcWOdTxlCSxRoLgTs6OZLZmrWDuGzQqTsANFdKFniZwMvOhzbtZTYJ+6
         oQ0Q==
X-Forwarded-Encrypted: i=1; AFNElJ97/qB3O5OcM159uO8tlZDqThsk6bkAzoYsqz266A+1KyHpvpbgb3wURFjpsjIEZj1iFWjkhItVHEA20PK4dWKoLSs4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mhN/mcBNiw+Ddl3RvIhug49RhD4vUrKRCAIk8Ea9mtMTARiP
	dUvPhakZ4po4xj/gCGwtbFpSS6AEYuKw/1uqgZmrFktwk3cTRtQznw1G4xMZaF8o
X-Gm-Gg: AeBDiesOtkirK+oOW30J0TUVsk+4xmmnivWnmetBTi8GuF1sstMsU73NJMWy/rTg8sJ
	DZT91myndKaL8J8Yz1GbOxEfMcJkt35ziJqFi8yyRRtXblkyHV2T2QhN1PuHfvpldN7zKTAYcMu
	sr8k0465r6fy6ogVwaB5vKhSvCy+gtJW4B0aSSynEf7XjgXPq2GxuW2fhM6StEZYK2R2p9dJsk5
	sLR5br5+Z1PErXvoqwGlNoBzx2MRlXHODLZdEo5WIkmQ7IqbmonKf5igA1n4pHswC7RhEcZg72W
	YVC6y/YzYCdzYXIgXH8w/98Tvxkg2Qfry4mwOK37V5pB6QxwJZCx8wzl9uRvPMnrYnFJuMpMWya
	R9EY6OcUEHavCz+qhF5Ul1CgZHZ4TITzov8zdCrij8taWd8yd2b5x+PVYVtR7E6xR5OlcEx7kb2
	IbFOgYWrVN445EC5NAzPsX+7fak+s8Mbi5/o5LJ7WPCsSYd+eLEBdqcjW/IjjpPpRZ/x6APKH1e
	aRTNWQofsYNi/AD4rOPP2f3+8H18YU=
X-Received: by 2002:a17:90a:742:b0:35f:c46f:2b0 with SMTP id 98e67ed59e1d1-36492030b5dmr2596111a91.14.1777391484868;
        Tue, 28 Apr 2026 08:51:24 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:bfac:abd3:86cf:47a3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aabaecfsm28937185ad.36.2026.04.28.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 08:51:24 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:21:21 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Ben Young <benj.n.yng@gmail.com>, platform-driver-x86@vger.kernel.org
Subject: Re: hp-wmi: Fix thermal profile board classification for HP Omen Max
 16 (8D41)
Message-ID: <afDTImx7bAcjU8Sp@archlinux>
References: <4ae4d7f9-f1db-4394-b0d9-c75dc39afcf8@gmail.com>
 <F31E9DCA-7E18-42D9-AB70-EC6256188187@gmail.com>
 <44b67685-ab94-ebca-e241-02b0a8d19562@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44b67685-ab94-ebca-e241-02b0a8d19562@linux.intel.com>

Hi Ilpo,

Sorry for the delay in response, I forgot to update you but I was
working with Benjamin Young to get more information about this issue. It
turns out this is related to a failure in fan table parsing. Luckily this
was detected for a similar HP Omen Max device earlier and I had submitted
a fix for it [1]. It has been merged into the mainline kernel in 7.1-rc1,
so the issue should be automatically resolved for Benjamin whenever the
said kernel is released.

Meanwhile I have taken this opportunity to determine EC offsets for
board 8D41 in order to remove the "Unknown EC layout for board 8D41.
Thermal profile readback will be disabled. Please report this to
platform-driver-x86@vger.kernel.org" warning in their dmesg. I will send
a fix patch for this soon.

[1] https://lore.kernel.org/all/20260410191039.125659-2-krishna.chomal108@gmail.com/

On Fri, Apr 24, 2026 at 02:58:43PM +0300, Ilpo Järvinen wrote:
>Hi Krishna,
>
>Could please take a look what's going on here. It seems 8D41 was in
>victus_s_thermal_profile_boards[] even before the dmi_system_id
>conversion in the commit 8ca7515d3c76 ("platform/x86: hp-wmi: fix
>platform profile values for Omen 16-wf1xxx").
>
>On Wed, 22 Apr 2026, Ben Young wrote:
>
>> Unfortunately - the fans do not change speed upon terminal commands. The
>> HP-WMI is properly loaded and recognizes the board, but appears to not
>> allow any level of fan change. Do you have any recommendations? This is
>> important to HP laptop owners.
>>
>> Thank you!
>>
>> Sent from my iPhone
>>
>> > On Apr 21, 2026, at 8:18 PM, Benjamin Young <benj.n.yng@gmail.com> wrote:
>> >
>> > ﻿Subject: hp-wmi: Fix thermal profile board classification for HP Omen Max 16 (8D41)
>> >
>> > Board 8D41 (HP Omen MAX Gaming Laptop 16t-ah000) was incorrectly added
>> > to victus_s_thermal_profile_boards in kernel 7.0, causing hp-wmi probe
>> > to fail with -EINVAL.
>> >
>> > The fix is to remove 8D41 from victus_s_thermal_profile_boards and add
>> > it to omen_thermal_profile_boards whitelist instead.
>> >
>> > Tested on HP Omen MAX Gaming Laptop 16t-ah000, BIOS F.21, kernel
>> > 7.0.0-1-cachyos-bore. After the fix, hp_wmi registers successfully as
>> > a platform profile handler.
>> >
>>
>
>-- 
> i.

