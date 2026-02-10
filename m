Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D55311979
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 23:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770767393; cv=none; b=GQBL3roesvKWqUPr+iBhUQrQICAFz7nL/3P7A8YuPaBJCSgJddX80TC+CQ2FjhP41SyJ26vTGjHbzs7NR8Gf2BNcqLh+NtaC7MkT4XxbTowVwENc28JhKdzwHzAXtiAIDJuYLVeh77DaZ2DNpc+S7Erd6LxXZKhHkzmpNw7XKTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770767393; c=relaxed/simple;
	bh=DVyxsOEeTvxswSt+sQzXHW5KmD9yhMogBlB8ZzY0UBo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Si7w/t0alE5NqYQv+AVmEEsq1JUpyrGqK4A92XTGWbhdV/9heeQXGIB26ZBbx6hqcbJ1qSNbNIvk2Bt1FVlAnBfwVkNwZtUQXDmXuFvUuMYzTWylgSnw6oN/B+Y577ek19c13sZzW0NCfvTHNxqqzOAlDBcWXW5VQ6PDiJNgnzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UR/v5rkp; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UR/v5rkp"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso514926eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 15:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770767392; x=1771372192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P+IY8et5FX8tT7f6jNZ9oxllW/bQ2oAsdfX91k7IYLs=;
        b=UR/v5rkpmW1mWI9nEFG+WQtHaAkBHwZplMVTqcv7XibVu6JspQ1fr4EDhWyNP51bxS
         0ngO3G0wbTqUIOQi0+lpPP6pZ3uvvPj45G6T+ERE01Udnqm+fesAWdp6f1f+gusZJXM7
         rYkHJ0qF/hvNxmxu5872mXZQwpF1rbOshd5X+CP4Tjoziu7PGRdesAaYCZETcjomr8s8
         Oz4/NZmlm8yZmU5An+aTeU1XWtCD29onrTgZZx9iUG6gDkVBegLUNG05E/GEMpCE3wP6
         7bmRm7Io2o8E1XFaENOnafgHLHtZ2Arf03HJny3J0JHUhtH2FPPDnMLDF1yBh0t9md86
         9eGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770767392; x=1771372192;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+IY8et5FX8tT7f6jNZ9oxllW/bQ2oAsdfX91k7IYLs=;
        b=lCmvM9QsVIy5rI7qOYHaZ6dgxdNNTlbmvikiZVbBTfIJs8sa86un9VozPVXzj35o8G
         un9+fVcVrwyntJvMSWrGFCwunxBLcJNmRfZkHdAm6BTVIn9K+gwsGf0S9jAfpGivevJD
         M7aeNmB9bVRl/xYkY1kxS4Ut2moyzsOVupgXvc2Qm2zADo1TP5JPu23HrYpnzQ9nn/7O
         +NaC+y+aWlAfx+1Mpr4NUE8MFczadAxcgO97qk9K0Ogq0C094XhINJ06pat6REBxr/Dw
         PeMDu73340swMpLx8aX+Mc9eQRSwJ7BzaXAhIOxvPkVZUOYgH5FvR5yh4nneTgwNk/f6
         5lYA==
X-Gm-Message-State: AOJu0YzNk+QE2nUwEJYSy2qDP2MhwibN9Wnkv2B/rInXIeR7Aca+PjIE
	W/fcrB7EJvjDqJHjw/JNdv2EZAq028dhyyKTZPaqzxj5hCcIGWSwCTFG
X-Gm-Gg: AZuq6aJrkenURswTvJlqupoNxHts11aGI5yG5cb8gBo/K+uy5SSehWUNL4QazU06yiI
	U9q5WTsSwijUqefjLAJBGHAbw2gABYvpp0mUlISacKz6x3LjN4ZQVMzAPDoj+dg+1gxJMNeCHYo
	FCyBlsb1PcIWM6FzqMouwsXT3w91wWNfEZw8ZlK4cy8MCuz33ObN1YM/dmLKnambRiRX1GBiy0p
	H5IYr8g6CfA6jRVsHDbCepW2gHSq08fmr+6jGpCblR7WtHAOdUsqaM/ccamhCuDqPLSX4LVUHAc
	FePs2tLQB2C0vFx582s7hoBOeDSTHC7tv70jsPIUQ6p0HWSqmWVEwpvbf6Mm7K1pujJhPMPEjB4
	uwLQJtsRum39BnD9yTLL2Bm2Cw/128eUKEKyJoryNPxfSNT/iD0Zre/S2lfo+j7AYQGiI71KQRK
	fOJpotB93EZ6unGWUZ7E9La1qVCqZ6/9exvAMGF2784R2zfkqCQEnRoq7pjhotjw9m9q2r1ULTf
	4cw34NC70Dv+5r7v2o/+2gC3r6O7elb
X-Received: by 2002:a05:7301:1008:b0:2b7:f522:992f with SMTP id 5a478bee46e88-2ba8a73eb74mr1264938eec.10.1770767391649;
        Tue, 10 Feb 2026 15:49:51 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dcead76sm42004eec.27.2026.02.10.15.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 15:49:51 -0800 (PST)
Date: Tue, 10 Feb 2026 15:49:51 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Rong Zhang <i@rong.moe>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/2=5D_platform/x86=3A_lenovo-wmi-ca?=
 =?US-ASCII?Q?pdata=3A_Add_debugfs_file_for_dumping_capdata?=
User-Agent: Thunderbird for Android
In-Reply-To: <DGBOH3NPCWFS.5SUAX6FZNZZ8@gmail.com>
References: <20260210191938.137234-1-i@rong.moe> <DGBOH3NPCWFS.5SUAX6FZNZZ8@gmail.com>
Message-ID: <2A78CD4B-9D1D-4E7E-BEC9-E567A1DBE089@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 10, 2026 3:41:31 PM PST, Kurt Borja <kuurtb@gmail=2Ecom> wrote:
>On Tue Feb 10, 2026 at 2:19 PM -05, Rong Zhang wrote:
>> The Lenovo GameZone/Other interfaces have some delicate divergences
>> among different devices=2E When making a bug report or adding support f=
or
>> new devices/interfaces, capdata is the most important information to
>> cross-check with=2E
>>
>> Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users ca=
n
>> dump capdata and include it in their reports=2E
>>
>> The output is like:
>>
>>   LENOVO_CAPABILITY_DATA_00[0]:
>>     id:             0x00010000 [dev:  0, feat:  1, mode:  0, type:  0]
>>     supported:      0x00000007 [ RWV]
>>     default_value:  0
>>
>>   LENOVO_CAPABILITY_DATA_01[0]:
>>     id:             0x00000000 [dev:  0, feat:  0, mode:  0, type:  0]
>>     supported:      0x00000000 [    ]
>>     default_value:  0
>>     step:           0
>>     min_value:      0
>>     max_value:      0
>>
>>   LENOVO_FAN_TEST_DATA[0]:
>>     id:             1
>>     min_rpm:        2200
>>     max_rpm:        5000
>>
>> A helper function for creating per-devcie debugfs directories is also
>> introduced into lenovo-wmi-helpers in order that we can maintain a tidy
>> directory structure in debugfs=2E
>>
>> The series is based on platform-drivers-x86/review-ilpo-next since it
>> depends on a commit there=2E I am OK to wait until the next cycle=2E
>>
>> Rong Zhang (2):
>>   platform/x86: lenovo-wmi-helpers: Add helper for creating per-device
>>     debugfs dir
>>   platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdat=
a
>>
>>  drivers/platform/x86/lenovo/Kconfig       |   1 +
>>  drivers/platform/x86/lenovo/wmi-capdata=2Ec | 121 ++++++++++++++++++++=
++
>>  drivers/platform/x86/lenovo/wmi-capdata=2Eh |   4 +-
>>  drivers/platform/x86/lenovo/wmi-helpers=2Ec |  34 ++++++
>>  drivers/platform/x86/lenovo/wmi-helpers=2Eh |   2 +
>>  5 files changed, 159 insertions(+), 3 deletions(-)
>>
>>
>> base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
>
>Hi Rong,
>
>This is indeed very useful debug information=2E
>
>Once you and Derek agree on the approach for this series, I'll add my
>Tested-by tag=2E
>
>One more thing though=2E Can you please explain the "supported" byte? Wha=
t
>is `+` and `V` supposed to mean?
>

Kurt,

It's enumerated in the patch:

+       seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->suppo=
rted,
+                  extra ? '+' : ' ',
+                  get   ? 'R' : ' ',
+                  set   ? 'W' : ' ',
+                  valid ? 'V' : ' ');


From=20the documentation:
uint32 Capability //7:by project=20
bit 2:  0: not support SetFeatureValue(),  1: support SetFeatureValue()=20
bit 1:  0: not support GetFeatureValue(),  1: support GetFeatureValue()
bit 0:  0: not support feature,  1: support feature=20

I don't see any examples of the "extra" bit in the docs=2E

Thanks,
Derek
