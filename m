Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542B7377EB2
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781166091; cv=none; b=o8W8P4RFDE2XW3CXzWwvKK8JajxC+U/4ObjY7HTVnBHbVNN6eRFD/WqRZywmqn0E5JT+gNpuambnH9mDRp2+ZC0oh18Wfy3C/IGLxBn8P0Tl842FC+pWABU665kG5Ki/UdN/mtSvYBAD92H6dx4CvuViv2Jna1OoFjboxwrT4yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781166091; c=relaxed/simple;
	bh=bjl8McncNFi+sDXnTjOotH9LYzPT+PrNYRr/t/sDLs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZ4cqUgFJ9Zy3+/V+h6wcyp37l8XEQHP/CbzXcXhmsy9yGtSFWNQXsV/tA+e7048C1HuzWqPinICR1DlmvZwT3s22eLTY3k6ebFbDe+bhezzcuzvC1EH9QrzeMuvAXI+o3fs2wwsId6JMHOWvR7UpxHR2YrOGBVbiWmFqA6z9dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lH8Vs5kD; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH8Vs5kD"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso6733292a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781166090; x=1781770890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjl8McncNFi+sDXnTjOotH9LYzPT+PrNYRr/t/sDLs8=;
        b=lH8Vs5kDw3WsBPrmeSYzAu1C6Li62bTKd3kN1gWzFcGFN7rLTUdqaGNqiAjrSY1oye
         G6rt3y3bgWsc/jEDP8TI66mAUjmDSd5Jr5kAb2s10x7QA8c0+H2gt6iAv5fxaqAZ3Pyt
         wN0zrbzUPOWxEg/gNEj/I6+avSQxk3BJigL0WmIlCXb7y8ljFsPJGWC8QO9Lpb0GfpLc
         G0s65CiZNbNm0+oTIxSEwOnwAjsUxnBqgEMGneSSpXFduYOjiAzVWuVH9LV66GUz+vn8
         8KJ6+GXuhkIzjWYMZmEtnJGDPE2U1GUsizG4llBW9i6ptfW69ZltcufCO5AIqW7qcjWk
         Th9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166090; x=1781770890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjl8McncNFi+sDXnTjOotH9LYzPT+PrNYRr/t/sDLs8=;
        b=PM9VzYWsXd7s93RgS566v8WQ9U7oPqqqUW2lp8jZ7IDNxOQw9dRNWg9Gs38HyuR+S3
         EXsRy1LoiDTo4F6dEl8S1QSDhB3O+cV6XLnLNN/GnvPBNpiJeA0oZxRkOAqyCgOEw2P4
         Cwa9L+IcdJKB+BhTVMbOTL+4MXjI5p6XwsLO1wwkwhxQ8goLhC+kPBhkwev95Egn/CLG
         qZ2bM08nojil4r1a6jEAI1vdEW3x3qf2SpUCZOBV7yKWCgCfY5CzlwYSjd4FB2vfN0CT
         FtrWsup7SHCBWULw5BctDWUdwauf5ZqTwM9jW4vVkMI3w/8DvxSlpLreNnKPtxbTuo0h
         jLvw==
X-Forwarded-Encrypted: i=1; AFNElJ9oJ6MTB1jdcj46p73tWfuvuaf0YTwr5wlf9+Pu1+++fm1ZAbUGzWr2kE7TqFik3cEwMVh7SROs7bMVzJXbEKf91MDn@vger.kernel.org
X-Gm-Message-State: AOJu0YxEZWO4YUJWWNhHRez/tw+Ol3Wbwr93AvLmA1WXzjQVNpo53N9J
	ZJZbgdRTk3DtKjpvPdlhdSPeMO2uN2GH0ZgnMB+Sbz0U2YobjVD0cOUP
X-Gm-Gg: Acq92OHoYX2f9texlX38Rh4icZYQq13pLs3YSVqYQe5M/ar6AUnIiZ3y5GBlBG/qn09
	uF60AMBve5CkfYxFBwheNDsAHSWqaeNDWnb9rCQiI2Gd8rhrX6eF3mdou1BVPhTHlFAXH5xIgEF
	oQNVSIl58tq5JP5kUJQi0+U/YsGj1wat0MxQm3Ma8EirJ1ohZA+E4uw6T83YdFoVBWxaTDAwhOa
	WO2ajtC8+zbNpQi8zCnJwKaF6KhXnrNIRqNb+uefw1VgMAOtL8/wnl6RBkq9eCf9v7KETRXyjJv
	CRBvg+JL9nHfRYTBPgTE9mwGaeHYXwgN3hOdoTho4GQa1WlQnvrDhroWgaci1qoEA1p9j5yj3BB
	UsxL03+FgN11f8GPAD3Trr3I8ORlCQe4kZ+L2355qsT2fyLdd34xM2NWjHEpZZ8qOwlEtT9AIt9
	1CZ8sW2v0WLRoN7SG/FxCH/IEIm48cKPOljXBRBWUZIFWNrHZ5ISWFOUkGFKZTqWf3+2wtur+Aa
	Kn7Bdb4W7S9QpsTgXdbhWohA1MdhoK0frgQgnaUqg==
X-Received: by 2002:a17:90b:498c:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-377a03ba95emr2271060a91.7.1781166089532;
        Thu, 11 Jun 2026 01:21:29 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-377540fb80csm2052639a91.16.2026.06.11.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:21:29 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:51:24 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Linux kernel regressions list <regressions@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, moravec@ukf.sk, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [regression] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kernel
Message-ID: <aiprVEqP_VdmMfGJ@archlinux>
References: <4fb7bbf1-466e-438c-a301-e118e7e2a225@leemhuis.info>
 <b00ba475-fc58-4be3-82f8-5fdfdfe70303@leemhuis.info>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <b00ba475-fc58-4be3-82f8-5fdfdfe70303@leemhuis.info>

On Tue, Jun 02, 2026 at 10:36:29AM +0200, Thorsten Leemhuis wrote:
>Resending below mail to the platform maintainers & list, maybe someone
>here might have an idea (I had miss-read MAINTAINERS file earlier and
>sent the mail to the HP WMI Sensor maintainer -- uuphs, sorry!), Ciao,
>Thorsten
>
>On 6/1/26 17:58, Thorsten Leemhuis wrote:
>> Hi James! I noticed a regression report that might or might not be
>> related to hp-wmi; to quote
>> https://bugzilla.kernel.org/show_bug.cgi?id=221569 :
>>
>> """
>>> Hello, I'm testing 7.1 kernel tree end seeing much louder fan on my laptop even when system is idling. CPU fan is spinning nearly all the time even CPU reported temperatures are low. Currently:
>>>
>>> migo@migo-HP:~$ uname -a
>>> Linux migo-HP 7.1.0-rc4-00685-g4cbfe4502e3d #45 SMP PREEMPT_DYNAMIC Sun May 24 12:47:18 CEST 2026 x86_64 GNU/Linux
>>>
>>>
>>> In 7.0 kernel tree is my laptop much quieter, fan spins only sometimes and with lower RPM.
>>>
>>> Machine is: HP OmniBook X Flip Laptop 16-ar0xx, with Arch Linux installed.
>>>
>>> Is there any way I can make more exact/useful report or debug this issue?
>> """
>>
>> See the ticket for details and kernel logs, I asked a few questions to
>> hopefully make things a bit easier for you.
>>
>> Maybe you might have an idea what's wrong here; if not, I guess Milan,
>> the reporter (CCed), must bisect this to find the change that causes the
>> problem.

Hi all,

I tried to look into this but unfortunately I can't think of what might
be going wrong here. Based on your dmesg logs in the ticket, I believe
its best if Milan could bisect between v7.0.8 and v7.1-rc4 tags (there
would be roughly 13 steps).

If you believe it is because of hp-wmi then you can limit to just these
16 commits:

$ git log --oneline v7.0.8..v7.1-rc4 -- drivers/platform/x86/hp/hp-wmi.c
a59e45221df8 platform/x86: hp-wmi: Add support for Victus 16-r0xxx (8BC2)
c2d4b76458c9 platform/x86: hp-wmi: silence unknown board warning for 8D41
da6b5aae84be Merge tag 'platform-drivers-x86-v7.1-1' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86
344bf523d441 platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)
899225257e78 platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
5badf5ebcd14 platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
9d317a54e46d platform/x86: hp-wmi: fix fan table parsing
92c36b634b45 platform/x86: hp-wmi: add Omen 14-fb0xxx (board 8C58) support
2fb9ec386fa1 Merge branch 'acpi-driver'
e8c597368b85 platform/x86: hp-wmi: Ignore backlight and FnLock events
5969c55e2145 platform/x86: hp-wmi: add locking for concurrent hwmon access
cb4daa450f05 platform/x86: hp-wmi: fix u8 underflow in gpu_delta calculation
6297443beb0c platform/x86: hp-wmi: use mod_delayed_work to reset keep-alive timer
249ddba9c0ba platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
7265b57fbc32 platform/x86: hp-wmi: fix ignored return values in fan settings
236ad358166c ACPI: AC: Define ACPI_AC_CLASS in one place

However, I personally don't believe hp-wmi is the issue, since most of
these commits are hardware support addition and fixes for old bugs.
Moreover, your board (8DA8) isn't officially supported in hp-wmi in
either of the trees, which means the fan and thermal control falls back
to the default firmware behaviour, so it should have been consistent,
unless another module is somehow interfering with it.

That being said, I don't want to be biased, let's bisect and see the
results.

Thanks

>>
>> Ciao, Thorsten
>>
>
