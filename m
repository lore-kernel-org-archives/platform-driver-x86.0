Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196058;
	b=tfpd5nxRt5zfvWXQV20jpVJ7KbNXnG93kvy2GimT72ZjxWTcSoO9Ady+c48L9jjR+XiW
	 E9Vjl98bdp1TBWaRM68sNPL9ilUJhRy1LsSG94MukkAyiKHKXv2DngJa7CcsoDLiTAjPC
	 rvX3d74VcWd9KOOXfo5uClSpIUspRx7ImoRjwrnA+5b1CzjBC/xDW88wBLPRdepANY6TD
	 bKwXqd9uzJdqWbRH0PCiYYhzkINqXaEhsjzdhAKTbNqGVplo4ILaXZYu3dQv504tUqpM+
	 qMTF8stVf8EfUKH8mLzD3c/lEbbff7g8DLF5B8Dz3twtt8XUAQG5lADiJHRMmGga6Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=MztEFkjcvew5LHyVcIf8mDwoXrDxGrkgX1401uu/1So=;
	b=YBDJDlyjanmC1F+IcwSgUnDufVV0geROYaCqRWeU5eDjPpmLSpSW6deE63+jO8eEJQ3K
	 bYyj8e8Gkb/YrZ8u+oe+Fcw0aYXRMPGc1Qwq3iesw1zDoQSr6NzbEqyrCmRJLs/gOAn5w
	 6y5JWj6e0FiwtkAMO23tB+X8c4ww1R0BIfx5UhXFKshLViUkiwuBw5pCH8G1tDeZOes9P
	 B5q1ymwbwdHBOP9kHqKgsAWoJO73sLoCTByP6ce1H2fxVdPKUFF3Rh8x1dRnskEn4D8sa
	 zFmCeOHZLGMz0GHZwWqymcm0Z/fHd7Ds5+3xbuu+FPJEMUF9Jbmf14phRiuGwhvjQxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vZfghtxz;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B527606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 03:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B527606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vZfghtxz
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so560257eec.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2026 19:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196057; x=1794800857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MztEFkjcvew5LHyVcIf8mDwoXrDxGrkgX1401uu/1So=;
        b=vZfghtxzuBCMNWl7s/CWEuwpEUdKhmZ+LBBSsvmJ16z3IAT4SxZukT5kqM5nKVEj8d
         SH8ljiNuDTxRTSOzPz6tfN1PSnLUcotJ46n0pgOgPHIl8cr0ioUv+gJYpmZC9Fa9xNvr
         jxDmzY2YUS2YLIGejF9iniUvmeFmCHkEGgnvOgvYb8MFIQwwmzw47SfRhu2Mmuk5ZI3c
         o8UFbEuFhw+MGtdl8Xe524QSkAjpv1iV3TaB/LS3vY9ynS1XDiIErMqA840fWeXd+Km6
         DGQ9cIOdBbySR/O3BNCwSaUcii8iukDVTJUo5j1y5tD+pmePeu3xNVwExFSmZEmpz5mv
         yKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196057; x=1794800857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MztEFkjcvew5LHyVcIf8mDwoXrDxGrkgX1401uu/1So=;
        b=2vGPKgnfB93uyeeyWk0LTtYAqUFR81aQJzXzUSee949rb0Vp1JT5iknDzCpNpJuneA
         Gz6pjt5P9kKpuRlGE19HkoI/dNhG3qHV5xaFpxPyddavNW3I1zG/n5gcmsLirIWN/vc2
         KcwLs5e08kHy8WCgTBNNTikQm74W40VIkbiL7vbs65TLSViL76A93YBXUMRGDfIIc1T5
         8FBg/ZiqqmqMXaizeZChKFkI7CCmYg38iF4zvsT7vVt97CiA2FqzdygvgS4rAVCWdh/1
         IV4hJ1V2cqUyoAScupzYItxNEG9enbX44G32FqcAVHvmOPC8WgOs89/d3VB6fYo9DC6h
         yV+g==
X-Forwarded-Encrypted: i=1; AL+hErE68B/Oa7nVGN49McpvKCDLIiEAAdqaxJMMm3JVH9SmpaigYMYlEr3hMByBFGSYKXC7bi2gr9+5haeEtAMIZFDH4z47@vger.kernel.org
X-Gm-Message-State: APuU4Z+ywZGSHVN84gL3hzSprU/2vrXrC0rB9gZF7rqdVTsdH0Dkyyrr
	ZfWI8RBwLhULFms2Xcoh5QfcByOcfJN522PDahEv2dDaIwN58Sycm4tX
X-Gm-Gg: AYBFou2YkZnaXw1IrwrikJPedvAsl0VT98VK9FAfLx/psy8rSMg6hsEyPgMLGkM59IK
	gkIm+UVyn5O8IRfdwRP4c2velGkzBrQHsiUgVp5OPRt3BRE+pgO2nhT+2hs+SkLpC3kYVGAnVsA
	vgHIazlaiYZG0oOpWe+oESkvAgBS6iO/zaBMkBZLbnne4IRSqJB6lOLOm6DqwJ3bLI/MqmCt4nv
	RHWc0DKpbY4FBXEwcs3CuRturXg/rHQcBABRLz+ktfz7TOpBPDs2fUyNThmd21Wea4qKx/TqxXi
	6sOYW9BJf+/9AgB7ual29JLClMvqIWLQUCuWVtZFUD8pdqIBjh4TuQQkBqxUCyocyP7mC9uz5Jp
	HHg/POCwxZ96e5rfRTs/WS/TupMTRQN5/tT3Y8QAxACX86uyXRhpdZUuiv07WG0T9nI8KRV8Afu
	DqRnUufrJPQUTEe6FqwxOzaQPkzoQ3U2zqxHDOlwOSFu93In52TYCCLVD+vV8A2SMYtqodVHk48
	/Cnry9lhuUKboBkLfWuNWZtA5u37NJHbvI1fn8MjFjV5NYy5a1xTf9MPvEpjgdGcBJRfIvR4DtP
	7aDKXwAj05BlgxwULUDOYmTSA08=
X-Received: by 2002:a05:7301:1c01:b0:369:36c9:5848 with SMTP id 5a478bee46e88-3725d77d5aemr5372886eec.12.1794196057289;
        Sun, 08 Nov 2026 19:47:37 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16f9csm9684535eec.12.2026.11.08.19.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:47:36 -0800 (PST)
Date: Mon, 9 Nov 2026 11:47:23 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>, 
	mpearson-lenovo@squebb.ca, Derek John Clark <derekjohn.clark@gmail.com>, hansg@kernel.org, 
	hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, 
	ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vishnuocv@gmail.com, vsankar@lenovo.com
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add Auto mode support
 with dynamic max_brightness
Message-ID: <avEuoeuFSwDUbbgL@ThinkPad>
References: <CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com>
 <a21d1b534d4b7c8cd27811e1c1f5c8be790cbdeb.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a21d1b534d4b7c8cd27811e1c1f5c8be790cbdeb.camel@rong.moe>

Hi Andrea,

Thanks for the detailed report! I actually noticed that the keyboard
backlight OSD started working in KDE after applying my patches,
whereas it hadn't appeared at all before. I didn't look into it
at the time, so thanks for pointing out the likely reason behind
this behavior.



On Sat, Nov 07, 2026 at 11:11:08PM +0800, Rong Zhang wrote:
> Hi Andrea,
> 
> ...
> 
> +CC Qiling
> 
> Oops, this indeed needs a fix patch for backporting.
> 
> Qiling, while you series will fix this, it may be better to add a fix
> patch CC'ing stable@vger.kernel.org to the very beginning of the series,
> so that the fix can be easily backported.
> 

Thanks, Rong. I'll split out a minimal, self-contained bug fix
before the refactoring and feature addition, as you suggested.

I'm still learning the upstream and stable backporting process,
so I'm wondering whether it would be better to submit the fix
separately or keep it as the first patch of the next revision.
Submitting it separately could get the fix merged and backported
sooner, though I'm not sure how urgent this particular fix is.

I'd appreciate your guidance on which approach would be more
appropriate, and I'm happy to follow your suggestion.

> 
> My opinion:
> 
> If auto mode disables keyboard backlight most of the time, it should
> report 0. For example, when the auto mode if backed by an ALS sensor, it
> should disable keyboard backlight most of the time, because most users
> seldom use the laptop in dark environments.
> 
> Same for proximity- or activity-based control, as it only illuminates
> when the user touches the keyboard.
> 
> The ideapad-laptop driver and Qiling's series have already taken this
> strategy.
> 
> Thanks,
> Rong
> 

I agree that mapping Auto mode to 0 makes more sense. Besides
the reasons you mentioned, the Fn+Space cycle on my ThinkPad
is 0 -> 3 -> 1 -> 2 -> 0, as Andrea also observed on the X9.

Mapping Auto (3) to 2 would make the reported brightness jump
from 0 to 2, then back to 1 and up to 2 again, which seems
rather misleading, especially since Auto mode does not represent
the maximum fixed brightness level.

Regards,
Qiling Zhu
